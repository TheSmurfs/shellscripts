#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.0
#Function:ssh密码错误的访问次数

echo "按用户分类:"
cat /var/log/secure |cut -d " " -f 6-|sort|grep Failed|grep  "for invalid"|cut -d" " -f 6|uniq -c
cat /var/log/secure |cut -d " " -f 6-|sort|grep Failed|grep from|grep -v "for invalid"|cut -d" " -f 4 |uniq -c
echo "按ip地址分类："
cat /var/log/secure |cut -d " " -f 6-|sort|grep Failed|grep "for invalid"|cut -d" " -f 8 >ipgrep.txt
cat /var/log/secure |cut -d " " -f 6-|sort|grep Failed|grep -v "for invalid"|cut -d" " -f6 >>ipgrep.txt
cat ipgrep.txt|sort |uniq -c