#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

a=1
echo "脚本有个$#参数"
for i in  $*
    do
        echo "\$$a is $i "
        ((++a))
    done
