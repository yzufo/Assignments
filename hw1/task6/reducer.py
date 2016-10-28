#!/usr/bin/python
from __future__ import division  
import sys
import math


prev_word = ""
i = 0
tmp = ""
value = []
log2 = math.log(2)

def entropy(key,vlude):
	tot = 0
	coc = []
	l = len(value)
	for t in value:
		tot += t
	for t in value:
		coc.append(t / tot)
	tot = 0.0
	for i in range(l):
		tot -= coc[i] * (math.log(coc[i])/log2)
	#print("%s %f"%(key,tot))
	print "{0} {1}".format(key,tot)



for line in sys.stdin:
	line = line.strip()
	t1,t2,t3 = line.split('\t')
	line = t1 + ' ' + t2 + '\t' + t3
	k,v = line.split('\t')
	token = k.split()
	tmp = token[0]+" "+token[1]
	if prev_word == tmp:
		value.append(int(v))
 	else :
		if prev_word:
			entropy(prev_word,value)
		prev_word = tmp
		value = []
		value.append(int(v))
if prev_word == tmp:
		entropy(prev_word,value)
