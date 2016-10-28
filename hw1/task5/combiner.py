#!/usr/bin/python

import sys

i = 0

for line in sys.stdin:
	i = i + 1
	line = line.strip()
	if(i <= 20):
		print line
