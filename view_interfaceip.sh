#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-18
#Version 1.0
#Function:

num=0
dev=(`ifconfig | grep -E -o "eth[0-9]{1,}"`)

for i in ${dev[@]}
do
    ip=`ifconfig |grep -A 1 "${i}" | grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" |grep -E -v "^(127|255)|(255)$" |head -n 1 `
    echo "$i ---- $ip"
done

gateway=`(cat /etc/sysconfig/network |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" |grep -E -v "^(127|255)|(255)$" )`
[  -z  $gateway  ] && echo "gareway ---- null "|| echo "gareway ---- $gateway"
