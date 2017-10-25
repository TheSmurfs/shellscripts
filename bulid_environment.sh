#!/bin/bash
#function:config
#author:Poirot
#version:2.0
#department:主要是新装Centos一键配置，yum selinux iptables ip hw

#mount cdrom to /yum
[ -d /yum ]||mkdir /yum
mount /dev/cdrom /yum

 #create local.repo file and backup another repo files to bak directory
cd /etc/yum.repos.d
[ -d bak ]||mkdir bak
mv *.repo bak
cat >local.repo <<EOF
[local_yum]
name=local yum
baseurl=file:///yum
enabled=1
gpgcheck=0
EOF
yum clean all
echo "mount /dev/cdrom /yum" >>/etc/rc.local

setenforce 0

sed -i 's/enforcing/disabled/g' /etc/selinux/config

iptables -F

chkconfig iptables off

rm -rf /etc/udev/rules.d/70-persistent-net.rules

cat >/etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF
DEVICE="eth0"
BOOTPROTO="static"
IPV6INIT="yes"
NM_CONTROLLED="yes"
ONBOOT="yes"
TYPE="Ethernet"
IPADDR=172.16.25.$1
NETMASK=255.255.0.0
EOF

service network restart

sleep 10

init 6