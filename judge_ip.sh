#!/bin/bash
#Author:Poirot	Email:752105005@qq.com		Date:2017-08-18
#Version 1.0
#Function:


cat $1 | egrep --color  '^([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$' 