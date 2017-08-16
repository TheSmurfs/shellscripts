#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.0
#Function:ssh密码错误的访问次数

echo "ssh密码错误的访问次数"
echo "按照用户分类"
grep failure /var/log/secure |grep -o "user=.*" |awk -F'=' '{print $4}'|sort -n |uniq -c
echo "按照IP地址分类"
grep failure /var/log/secure |grep -o "user=.*" |awk -F'[= ]' '{print $4}'|sort -n |uniq -c
