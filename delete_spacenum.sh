#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-19
#Version 1.0
#Function:


# 要求去掉每行前面的空格和数字
    # 9  sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    # 10  tcpdump:x:72:72::/:/sbin/nologin
    # 11  hello:x:500:500::/home/hello:/bin/bash
sed   -r   s/[[:space:]]*//g test  |sed -r  s/^[0-9]{1,}//g
cat -n /etc/passwd | sed -nr 's/^\s+[0-9]+\s+//p'
# 要求将文件中的网络路径换成本地路径
# http://www.sina.com/news/23543.html
# http://www.163.com/bbs/23524.html
# http://www.sina.com/music/345435.html
sed    -nr 's#^http://www\.[0-z]+\.[0-z]+#/var/www/html#p' url.txt 
#sed去掉接在命令行后面的注释
sed -nr '/^#/p;s/#.*//p' a.sh 
#sed取出/etc/passwd文件的第一列
sed -nr 's/(^[^:]+)(.*)/\1/p' /etc/passwd
#sed将PATH环境变量中的冒号换成换行
echo $PATH | sed -nr 's/:/\n/gp'
#sed将PATH环境变量斜杠/换成斜杠'\'
echo $PATH | sed -nr 's#/#\\#gp'
#sed修改SELINUX配置文件从开启变成禁用
sed -nr '/^SELINUX=/c SELINUX=disabled' /etc/selinux/config 
#去掉/etc/passwd文件中第二个字段的x
sed -nr 's/(^[^:]+:)([^:]*)(:.*)/\1\3/p' /etc/passwd
#只显示ifconfig的ip地址
ifconfig | sed -nr 's/(^\s+inet addr:)(\S+)(.*)/\2/p'
 