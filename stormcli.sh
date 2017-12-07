#!/usr/bin/env bash

cd $HOME/DEVSTORM
token=""
install() {
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
  wget https://valtman.name/files/telegram-cli-1222
  mv telegram-cli-1222 tgcli
  chmod +x tgcli
  cd ..
  chmod +x tg
  lua ./bot/bot.lua
  chmod +x stormcli.sh
  ./stormcli.sh

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
	echo -e " "
}

function logo_play() {
    declare -A txtlogo
    seconds=" "
    txtlogo[1]=" "
    txtlogo[2]=" "
    txtlogo[3]=" "
    txtlogo[4]=" "
    printf "\033[38;5;600m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
}

if [ "$1" = "install" ]; then
  install
  else
if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
fi
if [ $token == "" ]; then
    echo "token not found"
    echo "Run install again"
    exit 1
fi
 
COUNTER=1
while(true) do

curl "https://api.telegram.org/bot"$token"/sendmessage" -F
./tg/tgcli -s ./bot/bot.lua $@ --bot=$token

if
