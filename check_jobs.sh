#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.5
#Function:检查进程是否运行

ps_out=`ps -ef | grep $1 | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]]
    then
        echo "Running"
    else
        echo "Not Running"
fi
