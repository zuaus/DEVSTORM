#!/usr/bin/env bash

token_="351460214:AAHEXlncjPyhF22zlKToJa6fAGQlnJU8D6E" 

function print_logo() {
   cd tg
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
		sudo service redis-server restart
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd ..
		chmod +x bot
		chmod +x tg
}

function print_logo() {
	echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo

 echo -e "\e[38;5;77m" 

echo -e "  "
echo -e "  "
echo -e "  "
echo -e "  "

echo -e "  \e[38;5;88m"

echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e " "

echo -e " "

echo -e " "

echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e " "

echo -e " "

echo -e " "

echo -e " "

}


if [ ! -f ./tg/tgcli ]; then

echo -e ""

echo -e " "

echo -e " "

echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e " "

echo -e "  "

echo -e " "

    echo " "

    echo "Run $0 install"

    exit 1

 fi

if [ ! $token_ ]; then

echo -e ""

echo -e ""

  echo -e "\e[31;1mToken Not found\e"

 exit 1

 fi



  print_logo

   echo -e ""

echo -e ""

echo -e " "

echo -e "  "

echo -e "  "

echo -e "
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
"

echo -e "  "

echo -e "  "

echo -e "  "

echo -e ""

echo -e " "

echo -e " "


curl "https://api.telegram.org/bot"$token_"/sendmessage" -F

./tg/tgcli -s ./bot/bot.lua $@ --bot=$token_
