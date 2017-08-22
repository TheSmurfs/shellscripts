#!/bin/bash
export i

warn=10
 ip=(172.16.22.66)
for i in "${ip[@]}"
do
expect <<EOF
    expect {
spawn ssh root@$i     
expect "yes/no"
send "yes\r"
expect "password:"
send "123456\r"

interact
}
EOF
    # expect test.sh
 df -Ph | tr -s " "|awk -v w=$warn -F "[ %]" '/^\/dev/{if($5>w) print  $1,$5"% useage is over 10%"}'>alert

   if [ -s alert ]
   then
    echo 123 > /tmp/test
       sed -i "1i $i" alert &&  mail -s "$i hd usage" root < alert
   fi
done
