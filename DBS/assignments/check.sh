#!/bin/bash
for i in $(seq 1 2)
do
	psql -h pgteach -1 -f /afs/inf.ed.ac.uk/group/teaching/dbs/assignment1/data/db${i}.sql
	for k in $( seq 1 9)
	do
		echo "checking:"${k}
		python check.py -h pgteach ~/Desktop/DBS/db${i}/0${k}.csv 0${k}.sql
	done
	echo "checking:10"
	python check.py -h pgteach ~/Desktop/DBS/db${i}/10.csv 10.sql
done