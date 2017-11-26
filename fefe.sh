#!/bin/bash 
 COUNTER=0
while [  $COUNTER -lt 5 ]; do
kill $(pgrep telegram-cli)
echo -e "\e[38;5;77m"   
echo -e "        \e[38;5;40m"
sleep 2
   ./tg/tgcli -s ./taha.lua
sleep 3
done
