#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-13
#Version 1.0
#Function:lottery

read -p "欢迎购买福彩双色球，按回车键机选一注" 
echo -e "\E[31;1m红球:`(seq 1 32|tr "\n" " ")`\E[0m \n\E[34;1m蓝球:`(seq 1 16|tr "\n" " ")`\E[0m"
while true
do

RED=($(($RANDOM % 33 +1)) $(($RANDOM % 33 +1)) $(($RANDOM % 33 +1)) $(($RANDOM % 33 +1)) $(($RANDOM % 33 +1)) $(($RANDOM % 33 +1)))
BLUE=$(($RANDOM % 16 +1))
STRING=`(for J in "${RED[@]}";do echo $J;done) |sort |uniq -d`

	if  [[ -z "${STRING}" ]]
    
    then
	
        echo -e "本期中奖号码\E[31;1m ${RED[@]}\E[0m || \E[34;1m ${BLUE}\E[0m"  && break 

	fi

done
echo -e "你的幸运号码是:********\E[31;1m红球:${RED[@]}\E[0m \E[34;1m蓝球:${BLUE[@]}\E[0m********"
