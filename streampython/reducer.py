#!/usr/bin/python
"""reducer.py"""

import sys

curent_y = None
curent_count = 0
y = None

for line in sys.stdin:
    line = line.strip()
    y, count = line.split('\t', 1)
    count = int(count)
    if curent_y == y:
        curent_count += count
    else:
        if curent_y:
            print(str(curent_y) + '\t' + str(curent_count))
        curent_count = count
        curent_y = y

if curent_y == y:
    print(str(curent_y) + '\t' + str(curent_count))