#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

auser=`cat /etc/passwd|wc -l`
read -p "请输入用户名前缀" prefix
read -p "请输入用户名数量" num
if ((num>10))
    then 
    echo "最多只能同时新建10个"
    exit
fi
for ((i=1;i<=$num;i++))
do
    newname=`echo "${prefix}${i}"`
    useradd $newname &>/dev/null
if (($?!=0))
    then       
        echo "$newname创建失败,请检查$newname是否存在，或者当前权限不够"
        continue
fi
    echo "123" |passwd --stdin $newname &>/dev/null
if (($?==0))
    then
        echo "$newname创建成功"
    else
        echo "$创建失败,请检查$newname是否存在，或者当前权限"
fi
    # echo    $newname
done
buser=`cat /etc/passwd|wc -l`
adduser=$(($buser-$auser))
echo "一共新建的用户数：$adduser"
