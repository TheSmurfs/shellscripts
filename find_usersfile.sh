#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function
num=0
cat -n /etc/passwd |awk -F '[:]' '{print $3}'|sort -n -k1>data.txt
tempuid=(`cat data.txt`)
for i in ${tempuid[@]}
    do
if [ "$i" -lt 60000 -a "$i" -gt 500 ]
    then
    uid[$num]=$i    
    num=$(($num+1))
fi
    done
for i in ${uid[@]}
    do
    users=`cat /etc/passwd |  awk -F '[:]' '{print $1,$3}'|grep $i| awk '{print $1}'`
    num=`find /tmp -mindepth 1 -user "$users"  -exec ls {} \; |wc -l`
    if ((num>10))
    then
        echo "$user have $num files"
    fi
    done
    