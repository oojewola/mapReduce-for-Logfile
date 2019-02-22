#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -cp /logstat2/output/part-00000 /logstat3/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-D mapred.reduce.tasks=0 \
-input /logstat3/input/* -output /logstat3/output/ \
-file ../../mapreduce-test-python/logstat3/mapper.py -mapper ../../mapreduce-test-python/logstat3/mapper.py
/usr/local/hadoop/bin/hdfs dfs -cat /logstat3/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat3/output/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
../../stop.sh