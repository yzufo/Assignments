#!/usr/bin/python
import sys
import re
d = dict()

for line in sys.stdin:
	line = line.strip()
	tokens = line.split()
	t = len(tokens)
	for i in range(t):
		if (i+3 <= t):
			token = [4]
			tmp = []
			for j in range(3):
				token.append(tokens[i+j])
			tmp = token[1]+ " " + token[2] + " " + token[3]
			print "LongValueSum:" + tmp + "\t" + "1"

