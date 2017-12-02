
local function faeder(msg, matches) 
if matches[1]:lower() == 'معلوماتي' then 
function get_id(arg, data) 
local username 
if data.first_name_ then 
if data.username_ then 
username = '@'..data.username_ 
else 
username = 'No Username!' 
end 
local telNum 
if data.phone_number_ then 
telNum = '+'..data.phone_number_ 
else 
telNum = '----' 
end 
local lastName 
if data.last_name_ then 
lastName = data.last_name_ 
else 
lastName = '----' 
end 
local rank 
if is_sudo(msg) then 
rank = 'مطور البوت 💠' 
elseif is_owner(msg) then 
rank = 'مدير الكروب 👮' 
elseif is_admin(msg) then 
rank = 'ادمن الكروب 💂' 
elseif is_mod(msg) then 
rank = 'اداري الكروب 📌' 
else 
rank = 'عضو في الكروب 👲' 
end 
local text = '•°♦️°•  اهـلا بـك معلوماتك  •°♦️°•\n\n•~°~•🗯•~°~•🚸•~°~•🗯•~°~•\n\n🚸￤»  الاسم الاول : '..data.first_name_..'\n\n🚸￤»  الاسم الثاني : '..lastName..'\n\n🚸￤»  المعرف: '..username..'\n\n🚸￤»  الايدي : [ '..data.id_..' ]\n\n🚸￤»  ايدي الكروب : [ '..arg.chat_id..' ]\n\n🚸￤»  موقعك : '..rank..'\n\n•~°~•🗯•~°~•🚸•~°~•🗯•~°~•\n\n 👁‍🗨￤»  مـطـور الـسـورس : @TAHAJ20\n\n 👁‍🗨￤»  قـنـاه الـسـورس : @TEAMSTORM' 
tdcli.sendMessage(arg.chat_id, msg.id_, 1, text, 1, 'html') 
end 
end 
tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_}) 
end 
end 
return { patterns = 
 { "^(معلوماتي)$" }, 
 run = faeder 
 } 
