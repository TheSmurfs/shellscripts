#!/bin/bash

read -p "请输入要查看的磁盘" diskview
use=`df -lh |grep $diskview |awk '{print $5}'|tr -d "%"`
(( $use<=10 ))&&echo "一切正常" ||echo "当前磁盘空间是$use%警告"