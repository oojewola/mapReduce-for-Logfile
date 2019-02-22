#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat4/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat4/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat4/input/
/usr/local/hadoop/bin/hdfs dfs -cp /logstat2/output/part-00000 /logstat4/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-D mapred.reduce.tasks=0 \
-input /logstat4/input/* -output /logstat4/output/ \
-file ../../mapreduce-test-python/logstat4/mapper.py \
-mapper '../../mapreduce-test-python/logstat4/mapper.py 3 6'
/usr/local/hadoop/bin/hdfs dfs -cat /logstat4/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat4/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat4/output/
../../stop.sh