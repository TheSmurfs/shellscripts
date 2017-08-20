#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-19
#Version 1.0
#Function:

config()
{
 /etc/sysconfig/network-scripts/ifcfg-$dev

sed -i 's/IPADDR=.*/IPADDR=$newip/g'  /etc/sysconfig/network-scripts/ifcfg-$dev
sed -i 's/NETMASK.*/NETMASK=$newnetmask/g'  /etc/sysconfig/network-scripts/ifcfg-$dev

}

while true
do
    read -p "请输入要修改的网口：" dev
    ifconfig |grep "$dev" >/dev/null || (echo "设备不存在" && exit)

    cp /etc/sysconfig/network-scripts/ifcfg-$dev /etc/sysconfig/network-scripts/ifcfg-$dev.bak
    
    anowip=(`ifconfig |grep -A 1 "$dev"|grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" |grep -E -v "^(127|255)|(255)$" |head -n 1 `)

    read -p "请输入当前ip($anowip)：" nowip
    [[ "$nowip" != "$anowip" ]] && echo "与当前ip不符,请重新输入" && continue

    read -p "请输入新的ip:" newip
    verify=`echo  $newip |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" `
    [  -z  $verify  ] && echo "非法格式，请重新输入" && continue

      
    
    read -p "请输入新的netmask:" newnetmask
    verify=`echo  $newip |grep -E -o  --color  "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}" `
    [  -z  $verify  ] && echo "非法格式，请重新输入" && continue
    # echo -e "\t\t****Menu****"

    # echo -e "\t1.       立即生效
            # \n\t2.      永久生效
            # \n\t3.      退出"

    # read -p  "Enter option:" -n 1 num
    # case "$num" in
    # 1)
        # ifconfig $dev $newip && echo "修改成功"
        # ;;
    # 2)
        # config   
        # ;;
    # 3)
        # exit
        # ;;
    # *) 
        # echo "Sorry,wrong selection"
        # exit
    # esac
    ifconfig $dev $newip netmask $newnetmask && echo "临时ip修改成功" ||"临时ip修改失败"
 
    config   
    if ifdown $dev; ifup $dev &>/dev/null
    then 
        echo  "配置文件修改成功" 
    else
        echo  "配置文件修改失败，正在复原"
        cp /etc/sysconfig/network-scripts/ifcfg-$dev.bak /etc/sysconfig/network-scripts/ifcfg-$dev && echo "复原成功"
    fi
    exit    
done