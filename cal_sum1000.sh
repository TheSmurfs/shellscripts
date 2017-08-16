#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:
sum=0
for i in {1..1000}
    do
        sum=$(($i+$sum))
    done
echo "1000以内总和$sum"