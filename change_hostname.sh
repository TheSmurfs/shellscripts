#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-20
#Version 1.0
#Function:


Old_Hostname=`hostname`
#echo ${Old_Hostname}
cp /etc/hosts /etc/hosts.bak
cp /etc/sysconfig/network /etc/sysconfig/network.bak

name=$1
hostname ${name}

sed -i "s/${Old_Hostname}/${name}/g" /etc/hosts
sed -i "s/${Old_Hostname}/${name}/g" /etc/sysconfig/network

