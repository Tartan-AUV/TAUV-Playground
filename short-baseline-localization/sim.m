function [] = sim()
sample_freq = 500000;
t = (0 : 0.001 * sample_freq + 1)' / sample_freq;
n = size(t);

carrier_freq = 60000;
phase_deviation = pi;

x = sin(2 * pi * carrier_freq * t);
y = sin(2 * pi * carrier_freq * t + pi);

tx_sig = zeros(size(t));
tx_sig(1 : n / 2) = x(1 : n / 2);
tx_sig(n / 2 : end) = y(n / 2 : n);

rx_sig = awgn(tx_sig, 10, 'measured');

figure()
plot(t, [tx_sig, rx_sig]);
end