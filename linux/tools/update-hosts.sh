#!/bin/bash

curl -L https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -o hosts
startLine="$(grep -n "googlehosts members" /etc/hosts | cut -d: -f1)"
if [[ -z $startLine ]]; then
    echo "no googlehosts members in hosts"
    sudo sh -c "cat hosts >> /etc/hosts"
else
    echo startLine is: $startLine
    cp -f /etc/hosts ~/hosts-bak
    cat /etc/hosts | sed "$startLine,\$d" > tempHosts
    cat tempHosts hosts | sudo tee /etc/hosts
    rm tempHosts hosts
    #sudo sh -c "echo $originHosts > /etc/hosts"
    #sudo sh -c "cat hosts >> /etc/hosts"
fi
