#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function
num=0
while true
do
unit=$(($RANDOM%10))

while true
    do
        decade=$(($RANDOM%10))
        # echo $decade
        # read -p abc
if [[ 0 != $decade ]] 
    then
        break
fi
    done

if [ "$decade" -eq "$unit" ]
    then
        echo "连续成功$num次"
        exit
    else
        echo "$decade$unit"
        ((num++))
fi

done

