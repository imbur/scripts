#!/usr/bin/python3

import os
import subprocess

subprocess.Popen('python3 uf2conv.py "../timerintegration/.pio/build/latest_stable/firmware.bin"', cwd = os.path.dirname(os.path.realpath(__file__)), shell = True )
