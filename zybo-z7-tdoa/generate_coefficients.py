import numpy as np
from math import pi

lo_freq = 50e3
hi_freq = 55555
sample_freq = 200e3
N = 100
r = 0.99
n_digits = 16
scaling_factor_15 = 2 ** 15
scaling_factor_12 = 2 ** 12
scaling_factor_7 = 2 ** 7


def main():
   a_re = r ** N

   k_lo = (lo_freq * N) / sample_freq
   b_lo = r * np.exp((2j * pi * k_lo) / N)
   b_lo_re = np.real(b_lo)
   b_lo_im = np.imag(b_lo)

   k_hi = (hi_freq * N) / sample_freq
   b_hi = r * np.exp((2j * pi * k_hi) / N)
   b_hi_re = np.real(b_hi)
   b_hi_im = np.imag(b_hi)

   print('a_re:', a_re, int(a_re * scaling_factor_15))
   print('b_lo_re:', b_lo_re, int(b_lo_re * scaling_factor_15))
   print('b_lo_im:', b_lo_im, int(b_lo_im * scaling_factor_15))
   print('b_hi_re:', b_hi_re, int(b_hi_re * scaling_factor_15))
   print('b_hi_im:', b_hi_im, int(b_hi_im * scaling_factor_15))

if __name__ == '__main__':
    main()