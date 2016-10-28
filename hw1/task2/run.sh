#!/bin/bash
hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
 -input /user/s1502508/hw1/task2/task1.out \
 -output /user/s1502508/assignment1/task2 \
 -mapper mapper.py \
 -file mapper.py \
 -reducer cat 
