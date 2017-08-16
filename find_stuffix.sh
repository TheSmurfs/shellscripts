#!/bin/bash
read -p "请输入要查找的后缀名" suffix
read -p "请输入要查找的目录" dir
find $dir -mindepth 1 -name *.$suffix  |wc -l