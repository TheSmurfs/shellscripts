#bin/bash

awk '/Failed password for root/{print $(NF-3)}' /var/log/secure|sort -nr|uniq -c >test
NUM=10
IP=$(awk -v num=$NUM '$1>num{print $2}' test)

for i in $IP
do
    DENY=$(awk '$2==var {print $2}'var=$i/etc/hosts.deny)
    if [[ -z $DENY ]]
        then
            awk '$2==var {print "sshd:"$2}' var=$i test>> /etc/hosts.deny
            awk '$2==var {print "错误数"$1,"拒绝"$2"访问"}' var=$i test
        else
            awk '$2==var {print 已经拒绝"$2"访问"}' var=$i test
    fi
done
