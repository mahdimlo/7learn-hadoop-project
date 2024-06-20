FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

RUN sed -i 's/stretch/buster/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y python 

COPY . /opt/hadoop/application/streampython/

RUN awk '{ sub("\r$", ""); print }' /opt/hadoop/application/streampython/mapper_month.py > /opt/hadoop/application/streampython/mapper_month_unix.py
RUN awk '{ sub("\r$", ""); print }' /opt/hadoop/application/streampython/reducer_month.py > /opt/hadoop/application/streampython/reducer_month_unix.py

RUN chmod +x /opt/hadoop/application/streampython/mapper_month_unix.py
RUN chmod +x /opt/hadoop/application/streampython/reducer_month_unix.py

ENV INPUT="/user/root/inputbankfull"
ENV OUTPUT="/user/root/output12345"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]