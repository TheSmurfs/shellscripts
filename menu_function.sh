#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-16
#Version 1.1
#Function:
while true
do
echo -e "\t\t****Menu****"

echo -e "\t1.      Display disk space
        \n\t2.      Display interface information
        \n\t3.      Display memory usage
        \n\t0.      Exit menu"


read -p  "Enter option:" -n 1 num

case "$num" in
1)
    df -l
    ;;
2)
    ifconfig
    ;;
3)
    free
    ;;
0)
    exit
    ;;
*) 
    echo "Sorry,wrong selection"
esac
read -p   "Press any key to continue" -s -n 1 any
done
