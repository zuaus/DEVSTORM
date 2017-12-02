--[[
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
--]]

local function get_variables_hash(msg) 
  if gp_type(msg.chat_id_) == 'chat' or gp_type(msg.chat_id_) == 'channel' then 
    return 'chat:bot:variables' 
  end 
end 

local function get_value(msg, var_name) 
  local hash = get_variables_hash(msg) 
  if hash then 
    local value = redis:hget(hash, var_name) 
    if not value then 
      return 
    else 
      return value 
    end 
  end 
end 

local function list_chats(msg) 
  local hash = get_variables_hash(msg) 

  if hash then 
    local names = redis:hkeys(hash) 
    local text = '👁‍🗨￤» الردود هي : ️\n•~~•🔸️•~~•♦•~~•🔸•~~•\n\n'
    for i=1, #names do 
      text = text..'👁‍🗨￤» الكلمه { `'..names[i]..'` }\n' 
    end 
       tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md') 
   else 
   return 
  end 
end 

local function save_value(msg, name, value) 
  if (not name or not value) then 
    return "Usage: !set var_name value" 
  end 
  local hash = nil 
  if msg.to.type == 'chat' or msg.to.type == 'channel'  then 
    hash = 'chat:bot:variables' 
  end 
  if hash then 
    redis:hset(hash, name, value) 
   tdcli.sendMessage(msg.chat_id_, 0, 1, '👁‍🗨￤» الكلمه { '..name..' }\n✔￤» تم اضافتها مع الردود', 'md') 
  end 
end 
local function del_value(msg, name) 
  if not name then 
    return 
  end 
  local hash = nil 
  if gp_type(msg.chat_id_) == 'chat' or gp_type(msg.chat_id_) == 'channel'  then 
    hash = 'chat:bot:variables' 
  end 
  if hash then 
    redis:hdel(hash, name) 
      tdcli.sendMessage(msg.chat_id_, 0, 1, '👁‍🗨￤» الكلمه { `'..name..'` }\n❌￤» تم حذف الرد', 'md') 
  end 
end 

local function delallchats(msg) 
  local hash = 'chat:bot:variables' 

  if hash then 
    local names = redis:hkeys(hash) 
    for i=1, #names do 
      redis:hdel(hash,names[i]) 
    end 
    return "👁‍🗨￤» تم حذف الردود جميعها" 
   else 
   return 
  end 
end 

local function run(msg, matches) 
 if is_sudo(msg) then 
    local name = matches[3] 
  local value = matches[4] 
  if matches[2] == 'مسح الكل' then 
    local output = delallchats(msg) 
    return output 
  end 
  if matches[2] == 'اضف' then 
  local text = save_value(msg, name, value) 
   tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md') 
    elseif matches[2] == 'حذف' then 
    local text = del_value(msg,name) 
   tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md') 
    end 
 end 
  if matches[1] == 'الردود' then 
    local output = list_chats(msg) 
    return output 
  else 
local text = get_value(msg, matches[1]) 
   tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md') 
  end 
end 

return { 
  patterns = { 
    "^(الردود)$", 
    "^(رد) (اضف) ([^%s]+) (.+)$", 
    "^(رد) (مسح الكل)$", 
    "^(رد) (حذف) (.*)$", 
    "^(.+)$", 
  }, 
  run = run 
} 

