#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.1
#Function:检查服务状态

if service vsftpd status &>/dev/null
then
    pid=$(ps -ef |grep "vsftpd"|grep -v "grep" |awk '{print $2}'|head -n 1)
    addr=$(netstat -atunlp|grep -w $pid|awk '{print $4}')
    echo "监听地址: $addr" 
    echo "进程PID: ${pid}"
else   
    echo "警告:vsftpd服务没有启动，准备启动"
    service vsftpd start &>/dev/null
    
if service vsftpd status &>/dev/null
then
    echo "启动成功" 
else    
    echo "启动失败请检查服务是否安装成功"
fi
fi
