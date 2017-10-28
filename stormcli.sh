#!/usr/bin/env bash

cd $HOME/devtaha
token="342647859:AAHUtvmjo4GgI9zLOyFFYCCICGgeKkt3rps"
function print_logo() {
	echo -e "\033[38;5;600m"
	echo -e "          bottabchi"
	echo -e "          Api Bot"
	echo -e "\n\e[36m"
}

if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi
if [ ! $token ]; then
  echo -e "\e[1;36mToken Not found\e[0m"
 exit 1
 fi


  print_logo
   echo -e "\033[38;5;208m"
   echo -e "                        Mehr Server                           "
   echo -e "\033[0;00m"
   echo -e "\e[36m"
curl "https://api.telegram.org/bot342647859:AAHUtvmjo4GgI9zLOyFFYCCICGgeKkt3rps/sendmessage" -F 
    ./tg/tgcli -s ./bot/bot.lua -p PROFILE --bot=$token
