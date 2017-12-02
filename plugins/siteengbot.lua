--ممنوع الخمط اطلبه مني ماعزه عليك 
---by TAHAJ20
local function STORM(msg, STORM)
redis:incr("allmsg")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not redis:sismember("su",msg.chat_id_) then
redis:sadd("su",msg.chat_id_)
end
elseif id:match('-(%d+)') then
if not redis:sismember("gp",msg.chat_id_) then
redis:sadd("gp",msg.chat_id_)
end
elseif id:match('') then
if not redis:sismember("user",msg.chat_id_) then
redis:sadd("user",msg.chat_id_)
end
end
end
if STORM[1] == 'stephbot' or STORM[1] == 'اعدادات البوت' and is_sudo(msg) then
local allmsg = redis:get("allmsg")
local gps = redis:scard("su")
local gp = redis:scard("gp")
local user = redis:scard("user")
---------------------------------------------------
       tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '`⚜• معلومات البوت •⚜`\n\n•~~•⚜•~~•💠•~~•⚜•~~• \n\n👁‍🗨￤» عدد رسائل المجموعه '..allmsg..'\n\n👁‍🗨￤» عدد المجموعات الخارقه '..gps..'\n\n👁‍🗨￤» عدد المجموعات العاديه '..gp..'\n\n👁‍🗨￤» عدد الاعضاء في الخاص '..user..'\n\n•~~•⚜•~~•💠•~~•⚜•~~•\n👁‍🗨￤» تابع @TEAMSTORM', 1, 'md')
end
if STORM[1] == 'reset' or STORM[1] == 'ریست' and is_sudo(msg) then
redis:del("allmsg")
redis:del("su")
redis:del("gp")
redis:del("user")
tdcli.sendMessage(msg.chat_id_, msg.id_,1,' 👁‍🗨￤» تم تحديث البوت 🚸 ',1,'md')
end
end
return {
patterns ={ 
"^(stephbot)$",
"^(reset)$",
"(.*)",
"^(اعدادات البوت)$",
"^(ریست)$",
"(.*)",
},
  run = STORM
}
---by TAHAJ20