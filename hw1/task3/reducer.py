#!/usr/bin/python
import sys
import re

prev_line = ""
total = 0
maxlength = 0
maxtoken = 0
for line in sys.stdin:
	line = line.strip()
	if (prev_line == line):
		total = 1
	else:
		if(total == 0):
			if prev_line:
				tmpl = len(prev_line)
				if (tmpl >maxlength):
					maxlength = tmpl
				word = re.split('\s',prev_line)
				for tmp in word:
					tmpl = len(tmp)
					if (tmpl > maxtoken):
						maxtoken = tmpl
		total = 0
		prev_line = line 

if(total == 0):
	if prev_line:
		tmpl = len(prev_line)
		if (tmpl >maxlength):
			maxlength = tmpl
		word = re.split('\s',prev_line)
		for tmp in word:
			tmpl = len(tmp)
			if (tmpl > maxtoken):
				maxtoken = tmpl
print('{0} {1}'.format(maxtoken, maxlength))