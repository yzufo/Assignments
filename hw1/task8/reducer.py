#!/usr/bin/python
from __future__ import division  
import sys

ans = []
max_aver = 0;
tot = 0
num = 0
name = ""

for line in sys.stdin:
	line = line.strip()
	table,detail = line.split('.')
	number,col = table.split('|')
	tokens = detail.split()
	if (col == "student"):
			if (tot != 0 and tot/num >= max_aver and num > 3):
				if(tot/num > max_aver):
					ans = []
					ans.append(name)
				else:
					ans.append(name)
				max_aver = tot/num
			name = tokens[0]
			tot = 0
			num = 0
			continue
	tot += int(tokens[1])
	num = num + 1
if (tot != 0 and tot/num > max_aver and num > 3):
	if(tot/num > max_aver):
		ans = []
		ans.append(name)
	else:
		ans.append(name)
for tmp in ans:
	print tmp
