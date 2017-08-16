#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-15
#Version 1.0
#Function:

echo "$PATH"|tr ':' '\n' >dirs.txt
for line in `cat dirs.txt`
do
    [ ! -d $line ]&&echo "$line目录不存在"&&continue
    echo   "$line - `ls  $line|wc -l`"
done