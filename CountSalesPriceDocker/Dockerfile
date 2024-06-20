FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

RUN sed -i 's/stretch/buster/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget
WORKDIR /tmp
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN mkdir -p /root/.conda
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN mkdir -p /home

COPY CountSalesPrice /home/CountSalesPrice
COPY DataReader /home/DataReader
ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD SalesJan2009.csv /tmp/SalesJan2009.csv

ENV CLASSPATH="$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-3.2.1.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-common-3.2.1.jar:$HADOOP_HOME/share/hadoop/common/hadoop-common-3.2.1.jar:/tmp/CountSales/*:$HADOOP_HOME/lib/*:$HADOOP_HOME/share/hadoop/common/lib/commons-cli-1.2.jar"
WORKDIR /home/CountSalesPrice

RUN javac -d . CountSalesDriver.java CountSalesMapper.java CountSalesReducer.java

RUN jar cfm CountSalesPrice.jar Manifest.txt CountSalesPrice/*.class

RUN hdfs dfs -mkdir -p /user/root/salesdata

RUN hdfs dfs -put /tmp/SalesJan2009.csv /user/root/salesdata

CMD ["/tmp/run.sh"]

