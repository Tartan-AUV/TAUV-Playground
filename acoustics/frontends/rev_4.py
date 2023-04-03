import numpy as np
import RPi.GPIO as gpio


class Rev4Frontend:

    def __init__(self):
        self._gpio_0 = 17
        self._gpio_1 = 27
        self._gpio_2 = 22

    def open(self):
        gpio.setmode(gpio.BCM)
        gpio.setup(self._gpio_0, gpio.OUT, initial=gpio.LOW)
        gpio.setup(self._gpio_1, gpio.OUT, initial=gpio.LOW)
        gpio.setup(self._gpio_2, gpio.OUT, initial=gpio.LOW)

    def close(self):
        gpio.cleanup()

    def set_gain(self, gain):
        assert(0 <= gain <= 7)

        bits = [bool(int(bit)) for bit in format(gain, '03b')]
        print(bits)

        gpio.output(self._gpio_2, bits[0])
        gpio.output(self._gpio_1, bits[1])
        gpio.output(self._gpio_0, bits[2])

