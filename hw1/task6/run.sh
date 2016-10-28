hadoop jar /opt/hadoop/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
 -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapreduce.lib.partition.KeyFieldBasedComparator \
 -D mapreduce.map.output.key.field.separator='\t'\
 -D stream.map.output.field.separator=' ' \
 -D stream.num.map.output.key.fields=2 \
 -D mapreduce.partition.keycomparator.options=-k1,1 \
-input /user/s1502508/hw1/task6/task4.out \
-output /user/s1502508/assignment1/task6 \
-mapper cat \
-reducer reducer.py \
-file reducer.py \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner