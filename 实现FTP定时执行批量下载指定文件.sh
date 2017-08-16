#!/bin/bash
#获取性能系统小时粒度的指标数据
u=账号
p=密码
ip=10.195.15.23
T=`date -d yesterday +%Y%m%d`            #获取日期，根据日期抓取xdr文件
#写入日志
echo "(`date`) get data start...." >> /home/XXX/getdata.log
echo "===================================================" >> /homeXXX/getdata.log
    ftp -n <<EOF
      open $ip
      user $u $p
      binary
      cd /hour            #远程服务器文件目录
      lcd /home/Comparisor/XN_data/hour   #本地存放的文件目录
      hash
      prompt off
      mget *$T*
      cd ../day
      mget *$T*
      close
      bye
EOF