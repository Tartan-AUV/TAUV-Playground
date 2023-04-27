import numpy as np
from math import ceil, log
import scipy as sp
import matplotlib.pyplot as plt
import os

PLOT = False

def get_ping_frequency(times, samples, sample_period):
    return sp.fft.rfftfreq(samples.shape[1], sample_period)[
        np.argmax(np.abs(sp.fft.rfft(samples[0])))
    ]

def get_cleaned_samples(times, samples, ping_frequency, sample_period):
    reference_times = times[0]
    aligned_samples = np.array([
        samples[0],
        np.interp(reference_times, times[1], samples[1]),
        np.interp(reference_times, times[2], samples[2]),
        np.interp(reference_times, times[3], samples[3]),
    ])

    sos = sp.signal.butter(2, np.array([max(ping_frequency - 1000, 1), min(ping_frequency + 1000, 1 / sample_period)]), 'bandpass', output='sos', fs=1 / sample_period)
    filtered_signals = sp.signal.sosfilt(sos, aligned_samples, axis=1)

    cropped_times = reference_times[-100:]
    cropped_signals = filtered_signals[:, -100:]
    # cropped_signals = np.array([
    #     filtered_signals[0, -110:-10],
    #     filtered_signals[0, -111:-11],
    #     filtered_signals[0, -112:-12],
    #     filtered_signals[0, -113:-13],
    # ])

    amplitude_normalized_signals = cropped_signals / np.max(np.abs(cropped_signals), axis=1)[...,None]
    mean_normalized_signals = amplitude_normalized_signals - np.mean(amplitude_normalized_signals, axis=1)[...,None]

    return cropped_times, mean_normalized_signals

# https://github.com/xiongyihui/tdoa/blob/master/gcc_phat.py

def get_delays_xcorr(reference_times, samples, sample_period, max_delay):

    cross_correlations = np.array([
        sp.signal.correlate(samples[0], samples[1]),
        sp.signal.correlate(samples[0], samples[2]),
        sp.signal.correlate(samples[0], samples[3]),
    ])

    max_delay_samples = ceil(max_delay / sample_period)

    valid_cross_correlations = cross_correlations[:, (cross_correlations.shape[1] // 2) - max_delay_samples:(cross_correlations.shape[1] // 2) + max_delay_samples]

    delays_samples = -np.argmax(valid_cross_correlations, axis=1) + max_delay_samples
    delays = delays_samples * sample_period

    if PLOT:
        plt.figure()
        plt.title('Cross Correlations')
        plt.plot([])
        for channel_i in range(3):
            plt.plot(sp.signal.correlation_lags(samples.shape[1], samples.shape[1]),
                cross_correlations[channel_i], label=channel_i + 1)
        plt.xlabel('Delay (index)')
        plt.ylabel('Amplitude')
        plt.grid()
        plt.legend()

    if PLOT:
        plt.figure()
        plt.title('Valid Cross Correlations')
        plt.plot([])
        for channel_i in range(3):
            plt.plot(np.arange(-max_delay_samples, max_delay_samples), valid_cross_correlations[channel_i], label=channel_i + 1)
        plt.xlabel('Delay (index)')
        plt.ylabel('Amplitude')
        plt.grid()
        plt.legend()

    return delays

def get_delays(reference_times, samples, sample_period, max_delay):
    n_samples = samples.shape[1]
    interp = 1

    n_fft = 2 ** ceil(log(2 * n_samples - 1) / log(2))
    # n_fft = 2 * n_samples

    ffts = sp.fft.rfft(samples, n=n_fft, axis=1)
    fft_frequencies = sp.fft.rfftfreq(n_fft, d=sample_period)

    cross_spectrums = ffts[0] * np.conj(ffts[1:])
    norm_cross_spectrums = np.exp(1j * np.angle(cross_spectrums))
    # norm_cross_spectrums = cross_spectrums / np.abs(cross_spectrums)
    cross_correlations = np.real(sp.fft.irfft(norm_cross_spectrums, n=n_fft * interp, axis=1))

    max_delay_samples = min(int(interp * max_delay / sample_period), int(interp * n_fft / 2))

    valid_cross_correlations = np.abs(np.concatenate((
        cross_correlations[:, -max_delay_samples:],
        cross_correlations[:, :max_delay_samples+1]
    ), axis=1))

    delays_samples = np.argmax(valid_cross_correlations, axis=1) - max_delay_samples
    delays = delays_samples / float(interp / sample_period)

    if PLOT:
        plt.figure()
        plt.title('FFTs')
        for channel_i in range(4):
            plt.plot(fft_frequencies[:n_samples//2], (2 / n_samples) * np.abs(ffts[channel_i, :n_samples//2]), label=channel_i)
        plt.xlabel('Frequency (Hz)')
        plt.ylabel('Power')
        plt.grid()
        plt.legend()

    if PLOT:
        plt.figure()
        plt.title('Cross Correlations')
        plt.plot([])
        for channel_i in range(3):
            plt.plot(cross_correlations[channel_i], label=channel_i + 1)
        plt.xlabel('Delay (index)')
        plt.ylabel('Amplitude')
        plt.grid()
    plt.legend()

    if PLOT:
        plt.figure()
        plt.title('Valid Cross Correlations')
        plt.plot([])
        for channel_i in range(3):
            plt.plot(np.arange(-max_delay_samples, max_delay_samples + 1), valid_cross_correlations[channel_i], label=channel_i + 1)
        plt.xlabel('Delay (index)')
        plt.ylabel('Amplitude')
        plt.grid()
        plt.legend()

    return delays

def get_direction(delays, positions):
    pass

def get_angles(direction):
    pass

def process(times, samples):
    if PLOT:
        plt.figure()
        plt.title('Samples')
        for channel_i in range(4):
            plt.plot(times[channel_i] * 1e6, samples[channel_i], label=channel_i)
        plt.xlabel('Time (us)')
        plt.ylabel('Amplitude (v)')
        plt.grid()
        plt.legend()

    sample_period = np.average(np.diff(times[0]))

    ping_frequency = get_ping_frequency(times, samples, sample_period)

    reference_times, cleaned_samples = get_cleaned_samples(times, samples, ping_frequency, sample_period)

    if PLOT:
        plt.figure()
        plt.title('Cleaned Samples')
        for channel_i in range(4):
            plt.plot(reference_times * 1e6, cleaned_samples[channel_i], label=channel_i)
        plt.xlabel('Time (us)')
        plt.ylabel('Amplitude')
        plt.grid()
        plt.legend()

    delays = get_delays_xcorr(reference_times, cleaned_samples, sample_period, 12.5e-6)
    # delays = get_delays(reference_times, cleaned_samples, sample_period, 12.5e-6)

    return ping_frequency, delays

def main():
    file_paths = ['data/' + file for file in os.listdir('data') if os.path.isfile('data/' + file)]

    uuid_length = 36
    file_ids = [os.path.split(path)[1][:uuid_length] for path in file_paths if 'samples' in path]

    accumulated_delays = np.zeros((len(file_ids), 3))
    accumulated_ping_frequencies = np.zeros((len(file_ids)))

    for i, file_id in enumerate(file_ids):
        times_path = f'data/{file_id}-times.npy'
        samples_path = f'data/{file_id}-samples.npy'

        times = np.load(times_path)
        samples = np.load(samples_path)

        if times.shape[0] != 4 or times.shape[1] < 1000 or times.ndim != 2 or samples.shape[0] != 4 or samples.shape[1] < 1000 or samples.ndim != 2:
            continue

        times = times[:, :1000]
        samples = samples[:, :1000]

        print(f'Processing {file_id}. {i + 1}/{len(file_ids)}')
        ping_frequency, delays = process(times, samples)
        accumulated_ping_frequencies[i] = ping_frequency
        accumulated_delays[i, :] = delays

        if PLOT:
            plt.show()

            input('Press any key to continue')

    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    ax.scatter(accumulated_delays[:, 0], accumulated_delays[:, 1], accumulated_delays[:, 2])

    plt.figure()
    plt.hist((accumulated_delays[:, 0], accumulated_delays[:, 1], accumulated_delays[:, 2]))
    plt.xlabel('Delay (s)')
    plt.ylabel('Count')
    plt.title('Delay Distributions')
    plt.legend(['1', '2', '3'])

    plt.figure()
    plt.hist(accumulated_ping_frequencies, bins=100)
    plt.xlabel('Frequency (Hz)')
    plt.title('Ping Frequency Distribution')
    plt.ylabel('Count')

    plt.show()

if __name__ == '__main__':
    main()
