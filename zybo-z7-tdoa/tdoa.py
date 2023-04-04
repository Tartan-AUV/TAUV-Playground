import numpy as np
import matplotlib.pyplot as plt
from math import sin, pi
import scipy as sp

bit_rate = 5e2
n_bits = 10
lo_freq = 50e3
hi_freq = 51e3
propagation_speed = 1500
sample_rate = 0.5e6
dft_N = 100
dft_r = 0.999
noise_stddev = 0.1
bandpass_order = 4
bandpass_low_freq = 45e3
bandpass_high_freq = 55e3
sink_positions = np.array([
    [0.15, 0.15, 0.15],
    [0.15, -0.15, -0.15],
    [-0.15, -0.15, 0.15],
    [-0.15, 0.15, -0.15]
])
source_positions = np.array([
    [10, 0, 0],
    [0, 10, 0],
    [0, 0, 10],
    [1, 2, 3],
])
n_sinks = sink_positions.shape[0]

def get_samples(source_position, bits):
    sink_delays = np.zeros(n_sinks)
    for i in range(n_sinks):
        sink_delays[i] = np.linalg.norm(source_position - sink_positions[i]) / propagation_speed

    duration = n_bits / bit_rate + np.max(sink_delays)

    sample_times = np.tile(np.arange(0, duration, 1 / sample_rate)[:, np.newaxis], (1, n_sinks))
    n_samples = sample_times.shape[0]

    samples = np.zeros((n_samples, n_sinks))

    bit_times = np.arange(0, n_bits / bit_rate, 1 / bit_rate)

    for i in range(n_sinks):
        delayed_bit_times = bit_times + sink_delays[i]

        for t_i in range(n_samples):
            t = sample_times[t_i, i]

            if t < delayed_bit_times[0]:
                continue

            bit_i = np.searchsorted(delayed_bit_times, t, 'right') - 1

            freq = hi_freq if bits[bit_i] else lo_freq
            samples[t_i, i] = sin(2 * pi * freq * (t - delayed_bit_times[bit_i]))

    samples = samples + np.random.normal(0, noise_stddev, samples.shape)

    sos = sp.signal.butter(bandpass_order, (bandpass_low_freq, bandpass_high_freq), fs=sample_rate, btype='bandpass', output='sos')
    samples = sp.signal.sosfilt(sos, samples, axis=0)

    return sample_times, samples

def sliding_dft(samples, freq):
    n_samples = samples.shape[0]

    k = (freq * dft_N) / sample_rate
    coeff = 0.99 * np.exp((2j * pi * k) / dft_N)
    print(coeff)

    x_buf = np.zeros((dft_N, n_sinks), np.cdouble)
    X = np.zeros((n_samples, n_sinks), np.cdouble)

    for i in range(1, n_samples):
        x_buf[:] = np.roll(x_buf[:], -1, axis=0)
        x_buf[-1] = samples[i]

        X[i] = (x_buf[-1] - x_buf[0] * (dft_r ** dft_N)) + (X[i - 1] * dft_r * coeff)

    out = np.zeros((n_samples, n_sinks), np.cdouble)

    for i in range(1, n_samples - 1):
        out[i] = 0.5 * X[i] - 0.25 * X[i - 1] - 0.25 * X[i + 1]

    return out

def get_tdoas(sample_times, samples):
    lo_dfts = sliding_dft(samples, lo_freq)
    hi_dfts = sliding_dft(samples, hi_freq)

    plt.figure()
    for i in range(n_sinks):
        plt.plot(sample_times[:, i], np.abs(lo_dfts[:, i]))
        plt.plot(sample_times[:, i], np.abs(hi_dfts[:, i]))

    plt.figure()
    for i in range(n_sinks):
        plt.plot(sample_times[:, i], np.abs(hi_dfts[:, i]) > np.abs(lo_dfts[:, i]))

    # TODO: Use transition points to calculate tdoas
    return np.zeros((1, 3))

def main():
    bits = np.random.randint(0, 2, n_bits)
    print(bits)

    for source_position in source_positions:
        sample_times, samples = get_samples(source_position, bits)
        tdoas = get_tdoas(sample_times, samples)

        plt.figure()
        for i in range(n_sinks):
            plt.plot(sample_times[:, i], samples[:, i])

        plt.figure()
        plt.show()

if __name__ == '__main__':
    main()