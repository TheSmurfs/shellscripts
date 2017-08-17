#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

check_service()
{

for i in $@
do
    
    if service $i status &>/dev/null
    then
        echo "$i状态正常" 
    else
        service $i restart &>/dev/null
        (($?==0)) && echo "$i重启后已经ok" || echo "$i服务有问题"
    fi
done
}

check_service $@　