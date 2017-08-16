#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.5
#Function:指定端口三秒内包的总数
touch packages.txt
        "(tcpdump -v -i eth0 -nn port $1 > packages.txt)&" &>/dev/null
        sleep 3
if (( "$SECONDS"== 3))
then

        pid=(`ps -ef | grep "tcpdump" | grep -v grep | awk '{print $2}'`)
        for i in ${!pid[@]}
do
        kill -9 ${pid[i]}&>/dev/null
        #echo "$SECONDS"
done
fi
Packages=(`cat packages.txt |wc -l`)
echo "Packages:" $Packages 