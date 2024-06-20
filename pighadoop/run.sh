#!/bin/bash

pig -x maoreduce /home/app/filter_and_store_data.pig
hdfs dfs -get /user/root/pigoutput110/
python /home/app/analyse_uber_data.py