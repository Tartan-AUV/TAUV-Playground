import numpy as np
from math import pi

lo_freq = 50e3
hi_freq = 55e3
# hi_freq = 55555
sample_freq = 192307
# sample_freq = 200000
N = 500
r = 0.999
scaling_factor = 2 ** 10


def main():
   a_re = r ** N

   k_lo = (lo_freq * N) / sample_freq
   b_lo_0 = r * np.exp((2j * pi * (k_lo - 1)) / N)
   b_lo_1 = r * np.exp((2j * pi * k_lo) / N)
   b_lo_2 = r * np.exp((2j * pi * (k_lo + 1)) / N)
   b_lo_re_0 = np.real(b_lo_0)
   b_lo_im_0 = np.imag(b_lo_0)
   b_lo_re_1 = np.real(b_lo_1)
   b_lo_im_1 = np.imag(b_lo_1)
   b_lo_re_2 = np.real(b_lo_2)
   b_lo_im_2 = np.imag(b_lo_2)

   k_hi = (hi_freq * N) / sample_freq
   b_hi_0 = r * np.exp((2j * pi * (k_hi - 1)) / N)
   b_hi_1 = r * np.exp((2j * pi * k_hi) / N)
   b_hi_2 = r * np.exp((2j * pi * (k_hi + 1)) / N)
   b_hi_re_0 = np.real(b_hi_0)
   b_hi_im_0 = np.imag(b_hi_0)
   b_hi_re_1 = np.real(b_hi_1)
   b_hi_im_1 = np.imag(b_hi_1)
   b_hi_re_2 = np.real(b_hi_2)
   b_hi_im_2 = np.imag(b_hi_2)

   print('a_re:', a_re, int(a_re * scaling_factor))
   print('b_lo_re_0:', b_lo_re_0, int(b_lo_re_0 * scaling_factor))
   print('b_lo_im_0:', b_lo_im_0, int(b_lo_im_0 * scaling_factor))
   print('b_lo_re_1:', b_lo_re_1, int(b_lo_re_1 * scaling_factor))
   print('b_lo_im_1:', b_lo_im_1, int(b_lo_im_1 * scaling_factor))
   print('b_lo_re_2:', b_lo_re_2, int(b_lo_re_2 * scaling_factor))
   print('b_lo_im_2:', b_lo_im_2, int(b_lo_im_2 * scaling_factor))
   print('b_hi_re_0:', b_hi_re_0, int(b_hi_re_0 * scaling_factor))
   print('b_hi_im_0:', b_hi_im_0, int(b_hi_im_0 * scaling_factor))
   print('b_hi_re_1:', b_hi_re_1, int(b_hi_re_1 * scaling_factor))
   print('b_hi_im_1:', b_hi_im_1, int(b_hi_im_1 * scaling_factor))
   print('b_hi_re_2:', b_hi_re_2, int(b_hi_re_2 * scaling_factor))
   print('b_hi_im_2:', b_hi_im_2, int(b_hi_im_2 * scaling_factor))

if __name__ == '__main__':
    main()