#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-16
#Version 1.1
#Function:
change=3
random=$(($RANDOM%11))
echo "大家猜猜0-9的随机数，你一共有3次机会"

while true
do
        read -p "请输入一个0-9的数字:" num
        ((--change))
if  (($num!=$random))
    then
        if   (($num>$random))
            then
                echo "太高啦，"
        elif (($num<$random))
            then
                echo "太低啦，"
                
        fi

    else
        echo "你答对了就是:$random,你一共猜了$((3-$change))次"&&exit
fi        
(($change==0))&&echo "你猜了3次没机会了"&&exit
echo "你还有$change次机会"        
        
done        

