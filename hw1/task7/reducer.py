#!/usr/bin/python
import sys

ans = ""

for line in sys.stdin:
	line = line.strip()
	table,detail = line.split('.')
	num,col = table.split('|')
	tokens = detail.split()
	if (col == "student"):
		if ans:
			ans = ans.strip()
			print ans
		ans = tokens[0] + " -->"
		continue
	ans += " (" + tokens[0] + "," + tokens[1] + ") \t"
if ans:
	print ans