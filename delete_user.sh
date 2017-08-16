#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function
read -p "请输入需要删除的用户名前缀" pre
unamearray=($(cat /etc/passwd|cut -d: -f1,3|tr -s ":" " "|grep ^"$pre"))
n=0
x=0
test "$pre" = '' &>/dev/null&&space=yes;
if [[ $space == 'yes' ]]
then
echo 请不要输入空白
exit
fi



if ((${#unamearray[@]}==0))
then
echo 不存在
else
    ((var=${#unamearray[@]}/2))
    for i in  $(seq 1 $var)
    do
    if   [ "${unamearray[x+1]}" -gt 60000 -o "${unamearray[x+1]}" -lt 500 ]
    then
        echo "${unamearray[x]}是系统用户不能删除"
        ((x=x+2))
    else 
        userdel -r ${unamearray[x]}
        ((x=x+2))
        ((n++)) 
    fi
    done
echo 删除用户$n个
fi