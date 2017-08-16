#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.5
#Function:计算百分比
read -p "请输入任意数字:" dividend
read -p "请输入一个百分比数字:" percentage
percent=` echo "scale=2;$percentage/100" |bc`
answer=`echo "$dividend*$percent" |bc | awk '{printf "%.2f", $0}'`
echo "$dividend的$percentage%是:$answer"