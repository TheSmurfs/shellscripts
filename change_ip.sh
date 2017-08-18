#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-18
#Version 1.0
#Function:

cp /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0.bak

config()
{
cat << EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
IPADDR=$newip
NETMASK=$newnetmask
EOF

}

while true
do

nowip=(`ifconfig |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" |grep -E -v "^(127|255)|(255)$" |head -n 1 `)

read -p "请输入当前ip($nowip)" nowip
verify=`echo  $nowip |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" `
[  -z  $verify  ] && echo "非法格式,请重新输入" && continue

read -p "请输入新的ip" newip
verify=`echo  $newip |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" `
[  -z  $verify  ] && echo "非法格式，请重新输入" && continue
read -p "请输入新的netmask" newnetmask

echo -e "\t\t****Menu****"

echo -e "\t1.       立即生效
        \n\t2.      永久生效
        \n\t3.      退出"

read -p  "Enter option:" -n 1 num
case "$num" in
1)
    ifconfig eth0 $newip && echo "修改成功"
    ;;
2)
    config   
    ;;
3)
    exit
    ;;
*) 
    echo "Sorry,wrong selection"
    exit
esac

if service network restart &>/dev/null
then 
    echo -e "\n修改成功" 
else
    echo -e "\n修改失败，正在复原"
    cp /etc/sysconfig/network-scripts/ifcfg-eth0.bak /etc/sysconfig/network-scripts/ifcfg-eth0 && echo "复原成功"
fi
exit    
done