#!/bin/bash  
  
echo -n Count:  
tput sc  #存储光标位置
  
count=0  
while true;  
do  
        if [ $count -lt 40 ];then  
                let count++;  
                sleep 1;  
                tput rc  #存储光标位置
                tput ed  #清除光标位置，到行尾的内容。
                echo -n $count;  
        else  
                exit 0;  
        fi  
done  