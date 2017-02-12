#!/bin/bash
 
IP=192.168.89.1
HOST=vpn.bangladesh.an.com.bd
PPTPUSER=vpn
PPTPPASS=n
 
DATE=`date`
PINGRES=`ping -c 2 $IP`
PLOSS=`echo $PINGRES : | grep -oP '\d+(?=% packet loss)'`
echo "$DATE : Loss Result : $PLOSS"
 
if [ "100" -eq "$PLOSS" ];
then
    echo "$DATE : Creating connection to : $HOST"
    pptpsetup --create pptp --server $HOST --username $PPTPUSER --password $PPTPPASS --encrypt --start
    echo "$DATE : Connected to the PPTP VPN Server : $HOST"
else
    echo "$DATE : Already running : $HOST"
fi
