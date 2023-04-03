from math import atan2, sqrt
import numpy as np
import scipy.signal as signal
from backends.adalm_serial import AdalmSerialBackend
from frontends.rev_4 import Rev4Frontend
import matplotlib.pyplot as plt
import uuid
import time

def get_delays(times, samples):
    frequency = 20000.0
    sample_rate = 1000000.0

    reference_times = times[0]
    reference_samples = samples[0]

    aligned_samples = np.array([
        np.interp(reference_times, times[1], samples[1]),
        np.interp(reference_times, times[2], samples[2]),
        np.interp(reference_times, times[3], samples[3]),
    ])

    correlations = np.array([
        signal.correlate(aligned_samples[0], reference_samples, "full"),
        signal.correlate(aligned_samples[1], reference_samples, "full"),
        signal.correlate(aligned_samples[2], reference_samples, "full"),
    ])

    lags = signal.correlation_lags(reference_samples.shape[0], reference_samples.shape[0], mode="full")

    delays = lags[np.argmax(correlations, axis=1)] / sample_rate

    plt.figure()
    plt.plot(correlations[0, :])
    plt.plot(correlations[1, :])
    plt.plot(correlations[2, :])

    return delays

def main():
    fnd = Rev4Frontend()
    fnd.open()
    fnd.set_gain(7)

    bnd = AdalmSerialBackend()
    bnd.open()

    psis = []
    thetas = []

    while True:
        try:
            times, samples = bnd.sample()

            times = np.vstack((
                times[2, :],
                times[1, :],
                times[3, :],
                times[0, :]
            ))
            samples = np.vstack((
                samples[2, :],
                samples[1, :],
                samples[3, :],
                samples[0, :]
            ))

            delays = get_delays(times, samples)
            print(delays)

            hydrophone_positions = np.array([
                [0.0086, 0.0, 0.0],
                [0.0, 0.0086, 0.0121],
                [-0.0086, 0.0, 0.0],
                [0.0, -0.0086, 0.0121],
            ])
            # Positions of 2, 3, 4 relative to 1
            relative_hydrophone_positions = hydrophone_positions[1:, :] - hydrophone_positions[0, :]
            print(relative_hydrophone_positions)

            direction = np.linalg.inv(relative_hydrophone_positions) @ (1500 * delays)
            print(direction)
            psi = atan2(direction[1], direction[0])
            theta = atan2(direction[2], sqrt(direction[0] ** 2 + direction[1] ** 2))
            print(psi, theta)

            psis.append(psi)
            thetas.append(theta)

            plt.figure()
            plt.plot(times[0, :], samples[0, :])
            plt.plot(times[1, :], samples[1, :])
            plt.plot(times[2, :], samples[2, :])
            plt.plot(times[3, :], samples[3, :])
            plt.legend(['0', '1', '2', '3'])

            plt.figure()
            plt.plot(psis)
            plt.plot(thetas)
            plt.legend(['psi', 'theta'])

            plt.show()

            file_id = uuid.uuid4()
            np.save(f'/home/tartanauv/TAUV-Playground/acoustics/data/{file_id}-times.npy', times)
            np.save(f'/home/tartanauv/TAUV-Playground/acoustics/data/{file_id}-samples.npy', samples)
        except Exception as e:
            print(e)

if __name__ == "__main__":
    main()

    # Physical 1 is recording as 2
    # Physical 2 is recording as 1
    # Physical 3 is recording as 3
    # Physical 4 is recording as 0