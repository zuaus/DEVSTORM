#!/usr/bin/env bash

cd $HOME/DEVSTORM
token="237899845:AAHgSF_8FarQtNR_QfY0mge3V5wdqeNs5BI"
install() {
	    cd tg
		sudo add-apt-repository ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 c++-4.7
		sudo apt-get update		
        sudo apt-get upgrade
		sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
		sudo apt-get install lua-lgi
		sudo apt-get install libnotify-dev
		sudo apt-get install screen
		sudo apt-get install tmux
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd ..
		chmod +x bot
		chmod +x tg
}

if [ "$1" = "install" ]; then
  install
  else

if [ ! -f ./tg/tgcli ]; then
echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e "  "
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi
if [ ! $token ]; then
echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e "  "
  echo -e "\e[1;36m THE TOKEN NOT FAIND \e[0m"
 exit 1
 fi
   curl "https://api.telegram.org/bot"$token_"/sendmessage" -F
    ./tg/tgcli -s ./bot/bot.lua -p PROFILE --bot=$token

fi

