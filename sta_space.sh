#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 1.1
#Function:统计空间
addspace=0

#find $1 -mindepth 1 -size +10M ! -type d -exec ls -hl {} \; >data.txt
#num=`cat data.txt|wc -l`

find $1 -mindepth 1 -size +10M  ! -type d  -exec ls -hl {} \; |awk '{print $5}'|tr -d "M" >space.txt

space=(`cat space.txt`)
num=`cat space.txt|wc -l`

for i in ${space[@]}
    do
        addspace=$((addspace + $i))
    done

echo "超过十兆的文件总数:`cat data.txt|wc -l`"
echo "这些文件的总大小是${addspace}M"