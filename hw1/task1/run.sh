#!/bin/bash
hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
 -input /data/assignments/ex1/webLarge.txt \
 -output /user/s1502508/assignment1/task1 \
 -mapper mapper.py \
 -file mapper.py \
 -reducer cat

