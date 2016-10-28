
hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
 -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapreduce.lib.partition.KeyFieldBasedComparator \
 -D mapred.reduce.tasks=1 \
 -D stream.map.output.field.separator='\t' \
 -D stream.num.map.output.key.fields=-2 \
 -D map.output.key.field.separator='\t' \
 -D mapreduce.partition.keycomparator.options=-k1,1nr \
-input /user/s1502508/hw1/task5/task4.out \
-output /user/s1502508/assignment1/task5 \
-mapper mapper.py \
-file mapper.py \
-combiner combiner.py \
-file combiner.py \
-reducer reducer.py \
-file reducer.py \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner

