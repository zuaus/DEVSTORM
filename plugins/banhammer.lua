--[[
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
--]]
local function pre_process(msg) 
   if msg.to.type ~= 'pv' then 
chat = msg.to.id 
user = msg.from.id 
   local function check_newmember(arg, data) 
      test = load_data(_config.moderation.data) 
      lock_bots = test[arg.chat_id]['settings']['lock_bots'] 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    if data.type_.ID == "UserTypeBot" then 
      if not is_owner(arg.msg) and lock_bots == 'yes' then 
kick_user(data.id_, arg.chat_id) 
end 
end 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
if is_banned(data.id_, arg.chat_id) then 
   if not lang then 
      tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
   else 
       tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
end 
kick_user(data.id_, arg.chat_id) 
end 
if is_gbanned(data.id_) then 
     if not lang then 
       tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
    else 
       tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
   end 
kick_user(data.id_, arg.chat_id) 
     end 
   end 
   if msg.adduser then 
         tdcli_function ({ 
         ID = "GetUser", 
         user_id_ = msg.adduser 
       }, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg}) 
   end 
   if msg.joinuser then 
         tdcli_function ({ 
         ID = "GetUser", 
         user_id_ = msg.joinuser 
       }, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg}) 
      end 
 if is_silent_user(msg.from.id, msg.to.id) then 
 del_msg(msg.to.id, msg.id) 
    return false 
 end 
 if is_banned(msg.from.id, msg.to.id) then 
 del_msg(msg.to.id, tonumber(msg.id)) 
     kick_user(msg.from.id, msg.to.id) 
    return false 
    end 
 if is_gbanned(msg.from.id) then 
 del_msg(msg.to.id, tonumber(msg.id)) 
     kick_user(msg.from.id, msg.to.id) 
    return false 
   end 
 end 
   return msg 
end 
local function action_by_reply(arg, data) 
local hash = "gp_lang:"..data.chat_id_ 
local lang = redis:get(hash) 
  local cmd = arg.cmd 
if not tonumber(data.sender_user_id_) then return false end 
if data.sender_user_id_ then 
  if cmd == "ban" then 
local function ban_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
   if is_mod1(arg.chat_id, data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't ban_ *mods,owners and bot admins*", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء*", 0, "md") 
         end 
     end 
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
   if cmd == "unban" then 
local function unban_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
  if cmd == "silent" then 
local function silent_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
   if is_mod1(arg.chat_id, data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md") 
    else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع كتم الادمنيه والمدراء*", 0, "md") 
       end 
     end 
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
     end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
  if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
  if cmd == "unsilent" then 
local function unsilent_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return  tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
  if cmd == "banall" then 
local function gban_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
  if not administration['gban_users'] then 
    administration['gban_users'] = {} 
    save_data(_config.moderation.data, administration) 
    end 
   if is_admin1(data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't_ *globally ban* _other admins_", 0, "md") 
  else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء*", 0, "md") 
        end 
     end 
if is_gbanned(data.id_) then 
   if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
    else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
  if cmd == "unbanall" then 
local function ungban_cb(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
    local administration = load_data(_config.moderation.data) 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
  if not administration['gban_users'] then 
    administration['gban_users'] = {} 
    save_data(_config.moderation.data, administration) 
    end 
if not is_gbanned(data.id_) then 
   if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return  tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغآإء العامٍٰ  •  • ✨*", 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغآإء العامٍٰ  •  • ✨*", 0, "md") 
   end 
end 
tdcli_function ({ 
    ID = "GetUser", 
    user_id_ = data.sender_user_id_ 
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_}) 
  end 
  if cmd == "kick" then 
   if is_mod1(data.chat_id_, data.sender_user_id_) then 
   if not lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md") 
    elseif lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع طرد الادمنيه والمدراء *", 0, "md") 
   end 
  else 
     kick_user(data.sender_user_id_, data.chat_id_) 
     end 
  end 
  if cmd == "delall" then 
   if is_mod1(data.chat_id_, data.sender_user_id_) then 
   if not lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "_You can't delete messages_ *mods,owners and bot admins*", 0, "md") 
   elseif lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🚸 ليسـت مـن صـلآحيهہ‏‏ آلبوت حذف رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
   end 
  else 
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil) 
   if not lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "_All_ *messages* _of_ *[ "..data.sender_user_id_.." ]* _has been_ *deleted*", 0, "md") 
      elseif lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسائل العضو**[ "..data.sender_user_id_.." ]* *تم مـسـهہ‏‏آ بنجآح 💯✔🚽*", 0, "md") 
       end 
    end 
  end 
else 
    if lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*لم يتم آلعثور على هہ‏‏آذآ آلعضـو*", 0, "md") 
   else 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User Not Found*", 0, "md") 
      end 
   end 
end 
local function action_by_username(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
  local cmd = arg.cmd 
    local administration = load_data(_config.moderation.data) 
if not arg.username then return false end 
    if data.id_ then 
if data.type_.user_.username_ then 
user_name = '@'..check_markdown(data.type_.user_.username_) 
else 
user_name = check_markdown(data.title_) 
end 
  if cmd == "ban" then 
   if is_mod1(arg.chat_id, data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't ban_ *mods,owners and bot admins*", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء *", 0, "md") 
         end 
     end 
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ  حٌٰـضـرِٰه*", 0, "md")
   end 
end 
   if cmd == "unban" then 
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return  tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   end 
end 
  if cmd == "silent" then 
   if is_mod1(arg.chat_id, data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md") 
    else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع كتم الادمنيه والمدراء *", 0, "md") 
       end 
     end 
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
     end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
  if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
   end 
end 
  if cmd == "unsilent" then 
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤»  *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
   end 
end 
  if cmd == "banall" then 
  if not administration['gban_users'] then 
    administration['gban_users'] = {} 
    save_data(_config.moderation.data, administration) 
    end 
   if is_admin1(data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't_ *globally ban* _other admins_", 0, "md") 
  else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء *", 0, "md") 
        end 
     end 
if is_gbanned(data.id_) then 
   if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
    else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
   end 
end 
  if cmd == "unbanall" then 
  if not administration['gban_users'] then 
    administration['gban_users'] = {} 
    save_data(_config.moderation.data, administration) 
    end 
if not is_gbanned(data.id_) then 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   end 
end 
  if cmd == "kick" then 
   if is_mod1(arg.chat_id, data.id_) then 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md") 
    elseif lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع طرد الادمنيه والمدراء *", 0, "md") 
   end 
  else 
     kick_user(data.id_, arg.chat_id) 
     end 
  end 
  if cmd == "delall" then 
   if is_mod1(arg.chat_id, data.id_) then 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't delete messages_ *mods,owners and bot admins*", 0, "md") 
   elseif lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🚸 ليسـت مـن صـلآحيهہ‏‏ آلبوت حذف رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
   end 
  else 
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil) 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_All_ *messages* _of_ "..user_name.." *[ "..data.id_.." ]* _has been_ *deleted*", 0, "md") 
      elseif lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسائل العضو* \n*[ "..data.sender_user_id_.." ]* *تم تمـ مـسـح بنجآح 💯✔🚽*", 0, "md") 
       end 
    end 
  end 
else 
    if lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_المــستخدم لا يوجـــد 💻_", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md") 
      end 
   end 
end 

local function run(msg, STORM) 
if is_banned(msg.from.id, msg.to.id) or is_gbanned(msg.from.id, msg.to.id) or is_silent_user(msg.from.id, msg.to.id) then 
return false 
end 
local userid = tonumber(STORM[2]) 
local hash = "gp_lang:"..msg.to.id 
local lang = redis:get(hash) 
local data = load_data(_config.moderation.data) 
chat = msg.to.id 
user = msg.from.id 
   if msg.to.type ~= 'pv' then 
 if (STORM[1]:lower() == "kick" or STORM[1] == "طرد") and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
     tdcli.sendMessage(msg.to.id, "", 0, "_You can't kick mods,owners or bot admins_", 0, "md") 
   elseif lang then 
     tdcli.sendMessage(msg.chat_id_, "", 0, "*🚸 ليسـت مـن صـلآحبهہ‏‏ آلبوت طـرد آلمـدرآء وآلآدمـنيهہ‏‏*", 0, "md") 
         end 
     else 
kick_user(STORM[2], msg.to.id) 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="kick"}) 
         end 
      end 
 if (STORM[1]:lower() == "delall" or STORM[1] == "مسح الكل") and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't delete messages mods,owners or bot admins_", 0, "md") 
     elseif lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, "*🚸 ليسـت مـن صـلآحيهہ‏‏ آلبوت مـسـح رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
   end 
     else 
tdcli.deleteMessagesFromUser(msg.to.id, STORM[2], dl_cb, nil) 
    if not lang then 
  return tdcli.sendMessage(msg.to.id, "", 0, "_All_ *messages* _of_ *[ "..STORM[2].." ]* _has been_ *deleted*", 0, "md") 
   elseif lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسائل العضو* \n*[ "..data.sender_user_id_.." ]* *تم تم مـسـح بنجآح 💯✔🚽*", 0, "md") 
         end 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="delall"}) 
         end 
      end 
   end 
 if (STORM[1]:lower() == "banall" or STORM[1] == "حظر عام") and is_admin(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="banall"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if is_admin1(userid) then 
   if not lang then 
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't globally ban other admins_", 0, "md") 
else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء *", 0, "md") 
        end 
     end 
   if is_gbanned(STORM[2]) then 
   if not lang then 
  return  tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
    else 
  return  tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
        end 
     end 
  data['gban_users'][tostring(STORM[2])] = "" 
    save_data(_config.moderation.data, data) 
kick_user(STORM[2], msg.to.id) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
    else 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه عامٍٰ  •  • ✨*", 0, "md") 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="banall"}) 
      end 
   end 
 if (STORM[1]:lower() == "unbanall" or STORM[1] == "الغاء العام") and is_admin(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unbanall"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if not is_gbanned(STORM[2]) then 
     if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
    else 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه عامٍٰ  •  •*", 0, "md") 
        end 
     end 
  data['gban_users'][tostring(STORM[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغآإء العامٍٰ  •  • ✨*", 0, "md") 
   else 
return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغآإء العامٍٰ  •  • ✨*", 0, "md") 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="unbanall"}) 
      end 
   end 
   if msg.to.type ~= 'pv' then 
 if STORM[1]:lower() == "ban" or STORM[1] == "حظر" and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="ban"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
     if not lang then 
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't ban mods,owners or bot admins_", 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء *", 0, "md") 
        end 
     end 
   if is_banned(STORM[2], msg.to.id) then 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
  else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md") 
        end 
     end 
data[tostring(chat)]['banned'][tostring(STORM[2])] = "" 
    save_data(_config.moderation.data, data) 
kick_user(STORM[2], msg.to.id) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
  else 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ حٌٰـضـرِٰه*", 0, "md")  
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
     tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="ban"}) 
      end 
   end 
 if (STORM[1]:lower() == "unban" or STORM[1] == "الغاء الحظر") and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unban"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if not is_banned(STORM[2], msg.to.id) then 
   if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
  else 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md") 
        end 
     end 
data[tostring(chat)]['banned'][tostring(STORM[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
   else 
return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء حٌٰـضـرِٰه*", 0, "md")
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="unban"}) 
      end 
   end 
 if (STORM[1]:lower() == "silent" or STORM[1] == "كتم") and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="silent"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't silent mods,leaders or bot admins_", 0, "md") 
 else 
   return tdcli.sendMessage(arg.chat_id, "", 0, "*👁‍🗨￤» لا تستطيع حظر الادمنيه والمدراء *", 0, "md") 
        end 
     end 
   if is_silent_user(STORM[2], chat) then 
   if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
   else 
   return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
        end 
     end 
data[tostring(chat)]['is_silent_users'][tostring(STORM[2])] = "" 
    save_data(_config.moderation.data, data) 
    if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
         else 
            return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="silent"}) 
      end 
   end 
 if (STORM[1]:lower() == "unsilent" or STORM[1] == "الغاء الكتم") and is_mod(msg) then 
if not STORM[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unsilent"}) 
end 
  if STORM[2] and string.match(STORM[2], '^%d+$') then 
   if not is_silent_user(STORM[2], chat) then 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
            else 
               return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *بٌِٰـالْٰفِٰـعلْٰ ┊تّٰـمٍٰ كٍٰتّٰـمٍٰه*", 0, "md") 
        end 
     end 
data[tostring(chat)]['is_silent_users'][tostring(STORM[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
         else 
            return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» العضو  : "..user_name.."\n👁‍🗨￤» الايدي : "..data.id_.."\n👁‍🗨￤» *تّٰـمٍٰ الغاآإء كٍٰتّٰـمٍٰه*", 0, "md") 
      end 
   end 
  if STORM[2] and not string.match(STORM[2], '^%d+$') then 
   tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = STORM[2] 
    }, action_by_username, {chat_id=msg.to.id,username=STORM[2],cmd="unsilent"}) 
      end 
   end 
      if (STORM[1]:lower() == 'مسح' or STORM[1] == "مسح") and is_owner(msg) then 
      if not lang then 
         if STORM[2]:lower() == 'bans' then 
            if next(data[tostring(chat)]['banned']) == nil then 

               return "`👁‍🗨￤» لا يوجد محظورين ❌`" 
            end 
            for k,v in pairs(data[tostring(chat)]['banned']) do 
               data[tostring(chat)]['banned'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "`👁‍🗨￤» تم مسح المحظورين`" 
         end 
         if STORM[2]:lower() == 'silentlist' then 
            if next(data[tostring(chat)]['is_silent_users']) == nil then 
               return "`👁‍🗨￤» لا يوجد مكتومين ❌`"
            end 
            for k,v in pairs(data[tostring(chat)]['is_silent_users']) do 
               data[tostring(chat)]['is_silent_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
                end 
            return "`👁‍🗨￤» تم مسح المكتومين`" 
             end 
            else 
         if STORM[2] == 'المحظورين' then 
            if next(data[tostring(chat)]['banned']) == nil then 
               return "`👁‍🗨￤» لا يوجد محظورين ❌`" 
            end 
            for k,v in pairs(data[tostring(chat)]['banned']) do 
               data[tostring(chat)]['banned'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "`👁‍🗨￤» تم مسح المحظورين`" 
         end 
         if STORM[2] == 'المكتومين' then 
            if next(data[tostring(chat)]['is_silent_users']) == nil then 
               return "`👁‍🗨￤» لا يوجد مكتومين ❌`"
            end 
            for k,v in pairs(data[tostring(chat)]['is_silent_users']) do 
               data[tostring(chat)]['is_silent_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
                end 
            return "`👁‍🗨￤» تم مسح المكتومين`" 
             end 
        end 
      end 
     end 
      if (STORM[1]:lower() == 'مسح' or STORM[1]:lower() == 'مسح') and is_sudo(msg) then 
      if not lang then 
         if STORM[2]:lower() == 'gbans' then 
            if next(data['gban_users']) == nil then 
               return "👁‍🗨￤» لا يوجد محظورين عام في البوت"
            end 
            for k,v in pairs(data['gban_users']) do 
               data['gban_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "`👁‍🗨￤» تم مسح قائمه العام`" 
         end 
         else 
      if STORM[2] == 'قائمه العام' then 
            if next(data['gban_users']) == nil then 
               return "👁‍🗨￤» لا يوجد محظورين عام في البوت"
            end 
            for k,v in pairs(data['gban_users']) do 
               data['gban_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "`👁‍🗨￤» تم مسح قائمه العام`" 
         end 
         end 
     end 
if STORM[1]:lower() == "قائمه العام" and is_admin(msg) or STORM[1] == "قائمه العام" and is_admin(msg) then 
  return gbanned_list(msg) 
 end 
   if msg.to.type ~= 'pv' then 
if STORM[1]:lower() == "المكتومين" and is_mod(msg) or STORM[1] == "المكتومين" and is_mod(msg) then 
  return silent_users_list(chat) 
 end 
if STORM[1]:lower() == "المحظورين" and is_mod(msg) or STORM[1] == "المحظورين" and is_mod(msg) then 
  return banned_list(chat) 
     end 
  end 
end 
return { 
   patterns = { 
 "^(حظر عام)$", 
 "^(حظر عام) (.*)$", 
 "^(الغاء العام)$", 
 "^(الغاء العام) (.*)$", 
 "^(الغاء العام)$", 
 "^(حظر)$", 
 "^(حظر) (.*)$", 
 "^(الغاء الحظر)$", 
 "^(الغاء الحظر) (.*)$", 
 "^(المحظورين)$", 
 "^(كتم)$", 
 "^(كتم) (.*)$", 
 "^(الغاء الكتم)$", 
 "^(الغاء الكتم) (.*)$", 
 "^(المكتومين)$", 
 "^(طرد)$", 
 "^(طرد) (.*)$", 
 "^(قائمه العام)$", 
 "^(` ``) (.*)$", 
 "^(مسح) (.*)$", 
}, 
   run = run, 
pre_process = pre_process 
} 

--[[
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
--]]