do
local function tahastorm(msg, matches) 
if  matches[1] == 'مطور' or matches[1] == 'المطور' then 
function get_id(arg, data) 
if data.last_name_ then 
    tdcli.sendContact(arg.chat_id, msg.id_, 0, 1, nil, data.phone_number_, data.first_name_, data.last_name_ , data.id_, dl_cb, nil ) 
else 
tdcli.sendContact(msg.chat_id_, msg.id_, 0, 1, nil, 9647829702645, "زَُعَــــيّــِٰم آلْٰآمٰ̲ہٍٰــٰ̲ه" , "| خٌہۣۗڵـہـۑجَہ̶ۣۗــَ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜۧۚۚۧؔٛٚؔـَ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜؔٛٚؔـۑےۧۚۚۧ ۧۚ صَ۪ٜ۪ٜ۪ٜ۪ٜ۪ٜ۪ؔٛٚؔـاڪ😻", data.id_, dl_cb, nil ) 
end 
end 
tdcli_function({ ID = 'GetMe'}, get_id, {chat_id=msg.chat_id_}) 
end 
end
return { 
patterns ={ 

"^(المطور)$",
"^(مطور)$",

}, 
run = tahastorm 
} 
end
