#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

time_new() 
{
nowtime=`date +%s`
}

time_goal()
{
goaltime_1=`date --d=08:45:00 +%s`
goaltime_2=`date --d=11:45:00 +%s`
goaltime_3=`date --d=14:00:00 +%s`
goaltime_4=`date --d=17:30:00 +%s`
}

shijiancha()
{
hour=$((($1-$nowtime)/60/60))
min=$((($1-$nowtime)/60%60))
}

time_new
time_goal
shijiancha

if  ((nowtime==goaltime_1))
then
   echo "上午上课时间到，躁起来，娭毑们"
elif ((nowtime<goaltime_1))
then
    shijiancha goaltime_1
    echo "距离上午上课还有$hour小时$min分钟"
    
elif ((nowtime==goaltime_2))
then
    echo "开饭喽，同志们冲啊"

elif ((nowtime<goaltime_2))
then
    shijiancha goaltime_2
    echo "距离吃饭还有$hour小时$min分钟"

elif ((nowtime==goaltime_3))
then
    echo "下午上课时间到，躁起来，娭毑们"

elif ((nowtime<goaltime_3))
then
    shijiancha goaltime_3
     echo "午休，离下午上课时间还有$hour小时$min分钟"
     
elif ((nowtime==goaltime_4))
then
    echo "放学时间到，躁起来，娭毑们"

elif ((nowtime<goaltime_4))
then
    shijiancha goaltime_4
     echo "离放学时间还有$hour小时$min分钟" 
else
    echo "来打联盟"
     
     
fi