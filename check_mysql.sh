#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.5
#Function:检查mysql是否运行
while true
do
ps -ef | grep "mysql" |grep -v "grep" ||service mysqld start
sleep 60
done