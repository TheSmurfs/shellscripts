#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-13
#Version 1.0
#Function:judge_garde

read -p "请输入成绩:" garde
if (( garde<=100&&garde>89 ))
    then
        echo "成绩优秀"
elif (( garde<90&&garde>60 ))
    then
        echo "成绩合格"
elif (( garde==60 ))
    then
        echo "及格万岁"
elif ((garde<60 ))
    then
        echo "早点回来补考"
    else
        echo "别录成绩了，来玩联盟"
fi