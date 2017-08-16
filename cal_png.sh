#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

#awk实现
#find /usr/share/doc -name *.png -exec ls -l {} \; >data.txt
#sum=`cat data.txt | awk 'BEGIN{sum=0}{sum+=$5}END{print sum}'` 

#for实现
sum=0
find /usr/share/doc -name *.png -exec ls -l {} \;|cut -d" " -f5 >data.txt
for i in `cat data.txt`
    do
        #sum+=$i
        sum=$(($i+$sum))
    done

echo "all png files total size is ${sum}k"