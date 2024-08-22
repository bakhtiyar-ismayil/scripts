#!/bin/bash

a=$(sudo chage -l test)
b=$(echo "$a" | grep 'Password expires')
c=$(echo "$b" | awk -F': ' '{print $2}')
d=$(date -d "$c" +%Y%m%d)
e=$(date +%Y%m%d)
f=$(date -d "$e" +%s)
g=$(date -d "$d" +%s)
h=$((g - f))
l=$((h / (60*60*24)))

{
echo $l
} > /root/output


#or  echo $l | sudo tee   /root/output
