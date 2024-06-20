$HADOOP_HOME/bin/hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar -file /opt/hadoop/application/streampython/mapper_month_unix.py -mapper mapper_month_unix.py -file /opt/hadoop/application/streampython/reducer_month_unix.py -reducer reducer_month_unix.py -input $INPUT -output $OUTPUT
touch /tmp/s.txt
tail -f /tmp/s.txt