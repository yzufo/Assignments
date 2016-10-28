#!/usr/bin/python
import sys

for line in sys.stdin:
	line.strip()
	tokens = line.split()
	if(len(tokens) == 4):
		print(tokens[1] + "|" + tokens[0] + "." + tokens[2]+ "\t"+tokens[3])
	else:
		print(tokens[1] + "|" + tokens[0] + "." + tokens[2])