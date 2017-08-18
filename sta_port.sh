#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.1
#Function:

sta_port () 
{
service=`lsof -i:$1|sed -n '2p' |cut -d" " -f1`
protocol=(`lsof -i:$1|tail -n +2|awk '{print $8}'|sort |uniq`)
# echo "${protocol[@]}"
if ((${#protocol[@]}==0))
then
    echo "没有程序监听$1端口"
    exit
fi    
for i in ${protocol[@]}
do
echo "$service正在侦听:$i$1端口"
done
}

sta_port $1