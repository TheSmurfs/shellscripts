#!/bin/bash
nowtime=`date +%s`
goaltime=`date --d=17:30:00 +%s`
if (( nowtime > goaltime ))
then
		echo "已经放学了"
	else
		hour=$((($goaltime-$nowtime)/60/60))
		min=$((($goaltime-$nowtime)/60%60))
		echo "距离放学还有$hour小时$min分钟"
fi