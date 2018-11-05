#!/usr/bin/env bash

R1=`cat /sys/class/net/eno16777736/statistics/rx_bytes`
T1=`cat /sys/class/net/eno16777736/statistics/tx_bytes`

sleep 10

R2=`cat /sys/class/net/eno16777736/statistics/rx_bytes`
T2=`cat /sys/class/net/eno16777736/statistics/tx_bytes`

TBPS=`expr $T2 - $T1`
RBPS=`expr $R2 - $R1`

TKBPS=`expr $TBPS / 10240`
RKBPS=`expr $RBPS / 10240`

echo "上传速率 eth0: $TKBPS kb/s 下载速率 eth1: $RKBPS kb/s at $(date +%Y%m%d%H:%M:%S)" >> /home/data/logs/net/network_$(date +%Y%m%d).log