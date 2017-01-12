#!/bin/bah

mac_all=`ifconfig | grep -v "lo" | grep -E -v "^[[:blank:]]" | tr -s "\n" | awk '{print $1}'`
for mac in $mac_all
do
	echo "网卡 : $mac"
	mac_addr=`ifconfig $mac | head -n 1 | awk '{print $5}'`
	ip_all=`ifconfig $mac | grep -E "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" | tr -s " " | awk '{print $2 " " $3 " " $4}' | tr -d 'A-Z' | tr -d 'a-z' | tr -d ':'`
	ip_addr=`echo $ip_all | awk '{print $1}'`
	ip_bcast=`echo $ip_all | awk '{print $2}'`
	ip_mask=`echo $ip_all | awk '{print $3}'`
	echo "    Mac 地址 : "$mac_addr
	echo "    IP  地址 : "$ip_addr
	echo "    广播地址 : "$ip_bcast
	echo "    子网掩码 : "$ip_mask
	echo "-----------------------------"
done