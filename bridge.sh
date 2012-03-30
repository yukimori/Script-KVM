#!/bin/sh

IP="enter IP Address"
GATEWAY="enter Gateway Address"

echo "change IP address : $IP"
ifconfig eth0 0.0.0.0 promisc up #promiscas mode
brctl addbr br0 #create bridge
brctl addif br0 eth0 #connect bridge to eth0
ifconfig br0 up #start bridge
ifconfig br0 $IP netmask 255.255.255.0 #set ipaddress for bridge
route add default gw $GATEWAY #set gateway