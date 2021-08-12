#!/bin/python3

import sys
import os
import random
import time

wallpapers_dir = sys.argv[1]
wallpapers = list()

for filename in os.listdir(wallpapers_dir):
    wallpaper_path = os.path.join(wallpapers_dir, filename)
    wallpapers.append(wallpaper_path)

random.shuffle(wallpapers)

delay = 120
if len(sys.argv) > 2:
    delay = int(sys.argv[2])

while True:
    for wallpaper in wallpapers:
        os.system(f'feh --bg-fill {wallpaper}')
        time.sleep(delay)
