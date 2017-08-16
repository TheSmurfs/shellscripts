#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-14
#Version 2.5
#Function:select singer

if [ ! -e /lianxi/sh/singer.txt ]
    then
        echo "请先录入歌手名单";cp singer.txt.bak singer.txt ;exit 
fi
if ((`cat /lianxi/sh/singer.txt|wc -w` == 0 ))
   then
        echo "请先录入歌手名单";cp singer.txt.bak singer.txt;exit
fi
if ((`cat /lianxi/sh/singer.txt|wc -w` == 1 ))
   then
        singer=(`cat singer.txt`)
        echo "没得选了，就是有歌坛赵本山之称的${singer[@]}啦,我是歌手下季将重新开始哦"
        unset singer[number]
        echo ${singer[@]} >singer.txt
        exit
fi

singer=(`cat singer.txt`)

read   -n 1 -p   "欢迎来到我是歌手第二季，还有${#singer[@]}位参赛选手，请按任意键开始" -s anykey
echo  
echo -n "让我们倒数三秒:3"
for i in {3..1}
    do
        echo -e  -n "\b$i"
        sleep 1
    done
echo -e  "\b0 会是谁呢？"
number=$RANDOM%${#singer[@]}
echo "有请歌手${singer[number]}"
unset singer[number]
echo ${singer[@]} >singer.txt
if ((`cat /lianxi/sh/singer.txt|wc -w` == 1 ))
   then
        echo "只剩下1位压轴歌手啦，万众瞩目的一天就要来到了，(*^__^*) 嘻嘻……"
fi


#cat singer.txt |tr ' '  '\n' | >singer.txt
