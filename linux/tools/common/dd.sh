#!/bin/bash

MAINIP=$(ip route get 1 | awk -F 'src ' '{print $2}' | awk '{print $1}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}' | head -1)
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

echo "--ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK"
