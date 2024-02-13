#!/bin/sh
start-dfs.sh
start-yarn.sh

/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat2/input/

hadoop jar ~/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
-input /sample.log \
-mapper /logstat/mapper.py \
-reducer /logstat/reducer.py \
-output /logstat/output/

/usr/local/hadoop/bin/hdfs dfs -cat /logstat2/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
../../stop-dfs.sh
