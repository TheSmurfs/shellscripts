#!bin/bash
team=(丝丝 坤坤 花花 涛涛 标标 龙龙 蔡蔡)
echo "名单共有七名成员:${team[@]}"
echo -n "让我们倒数三秒:3"
sleep 1
echo -e  -n "\b2"
sleep 1
echo -e  -n "\b1"
sleep 1
echo -e  "\b0"
echo "我们选出的队员是:${team[(( $RANDOM%7 ))]} "