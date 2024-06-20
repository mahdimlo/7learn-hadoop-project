FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

RUN sed -i 's/stretch/buster/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget

RUN mkdir -p /home/pig

WORKDIR /home/pig

RUN  wget --no-check-certificate https://dlcdn.apache.org/pig/latest/pig-0.17.0-src.tar.gz
RUN  wget --no-check-certificate https://dlcdn.apache.org/pig/latest/pig-0.17.0.tar.gz

RUN tar zxvf pig-0.17.0.tar.gz
RUN tar zxvf pig-0.17.0-src.tar.gz

RUN mkdir -p /home

WORKDIR /tmp
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN mkdir -p /root/.conda
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH="/root/miniconda3/bin:${PATH}"

COPY ./app /home/app
ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ENV PATH=${PATH}:/home/pig/pig-0.17.0/bin
ENV PIG_HOME=/home/pig/pig-0.17.0
ENV PIG_CLASSPATH=${HADOOP_HOME}/etc/hadoop

CMD [ "run.sh" ]