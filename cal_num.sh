#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.5
#Function:计算两个数
read -p "请输入两个整数用空格分开:" a b
echo "a+b=$(($a+$b))"
echo "a-b=$(($a-$b))"
echo "a*b=$(($a*$b))"
echo "a%b=$(($a%$b))"
ans=` echo "scale=2;$a/$b "|bc| awk '{printf "%.2f", $0}'`
echo "a/b=$ans"
ans=`echo "$a^$b" |bc`
echo "a**b=$ans"
 