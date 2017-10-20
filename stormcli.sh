#!/usr/bin/env bash

token_="351460214:AAHEXlncjPyhF22zlKToJa6fAGQlnJU8D6E" 

function print_logo() {

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
