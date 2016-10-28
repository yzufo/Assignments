#!/bin/bash
hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
 -D mapred.reduce.tasks=1 \
 -input /user/s1502508/hw1/task3/task2.out \
 -output /user/s1502508/assignment1/task3 \
 -mapper cat \
 -reducer reducer.py \
 -file reducer.py
