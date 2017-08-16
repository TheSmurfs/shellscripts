#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-16
#Version 1.1
#Function:

tty=(`who|awk '{print $2}'`)
for i in ${tty[@]}
    do
        user=(`who|grep $i|awk '{print $1}'`)
        echo "$user : Hi , I'm Root!"> /dev/$i
    done