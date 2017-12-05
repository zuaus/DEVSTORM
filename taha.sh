token="472266761:AAFbpl-MPVcZEgKnyPPh2qjhKK6P5AHVwZQ"
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

let COUNTER=COUNTER+1 
done


