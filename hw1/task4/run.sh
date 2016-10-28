#!/bin/sh 
hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
-D mapred.reduce.tasks=9 \
-input /user/s1502508/hw1/task4/task2.out \
-output /user/s1502508/assignment1/task4 \
-mapper mapper.py \
-file mapper.py \
-reducer aggregate 

