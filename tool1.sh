#!/bin/bash
current_ip=`ifconfig |grep -A1 "bond"|tail -1|awk -F: '{print $2}'|awk '{print $1}'`
current_user=`who am i |awk '{print $1}'`
while read host_ip host_user host_passwd
do
if ping -c2 $host_ip &>/dev/null
then
expect <<EOF
    set timeout -1
    spawn ssh ${host_user}@${host_ip}
    expect {
        "*yes/no" { send "yes\r";exp_continue}
        "*password:" { send "${host_passwd}\r"}
    }
    expect "*#" 
    send "mkdir -p /tmp/${host_ip}\r"
    expect "*#"
    send "cat /etc/issue > /tmp/${host_ip}/os_info ;ifconfig > /tmp/${host_ip}/network_info;hostname >/tmp/${host_ip}/host_info;route -n >/tmp/${host_ip}/route_info;cat /proc/cpuinfo>/tmp/${host_ip}/cpu_info;free >/tmp/${host_ip}/memory_info;fdisk -l>/tmp/${host_ip}/disk_info;df -lhT >/tmp/${host_ip}/file_system_info;ps aux >/tmp/${host_ip}/progress_info\r"
    send "exit\r"
    expect eof
EOF
if ! [ -e backup_info ]
then
    mkdir -p ./backup_info
fi
expect <<EOF
    set timeout -1
    spawn scp -r ${host_user}@${host_ip}:/tmp/${host_ip} ./backup_info
    expect {
        "*yes/no" { send "yes\r"  ;  exp_continue}
        "*password:" { send "${host_passwd}\r"}
    }
    expect eof
EOF
else
    continue
fi
done <host 