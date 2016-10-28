#!/usr/bin/python
import sys

d = dict()

for line in sys.stdin:
	line = line.strip()
	if( d.get(line)):
	  d[line] = 2
	else:
	  d[line] = 1
for s,v in d.items():
	if( v==1):
		print(s)