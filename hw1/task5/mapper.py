#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	k,v = line.split('\t')
	print v + "\t" + k