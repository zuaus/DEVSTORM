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
      tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is banned ☑️_', 0, "md") 
   else 
       tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
end 
kick_user(data.id_, arg.chat_id) 
end 
if is_gbanned(data.id_) then 
     if not lang then 
       tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is globally banned ☑️_', 0, "md") 
    else 
       tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حظـر آلمـدرآء وآلآدمـنيهہ‏‏*", 0, "md") 
         end 
     end 
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been banned ☑️_', 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not banned ☑️_', 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been unbanned ☑️_', 0, "md") 
   else 
    return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت گتم آلمـدرآء وآلآدمـنيهہ‏‏ 🚫💯🚷*", 0, "md") 
       end 
     end 
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already silent ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
     end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
  if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_added to silent users list ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already silent ☑️_', 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ_', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not silent ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـتم مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ 💯✔🚹*", 0, "md") 
        end 
     end 
if is_gbanned(data.id_) then 
   if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already globally banned ☑️_', 0, "md") 
    else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْــرِٰهَٰہۧ عٍِّـــاَٰمٍٰ _', 0, "md") 
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
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not globally banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ ـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally unbanned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت طـرد آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حذف رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
         end 
     end 
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ ', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been banned ☑️_', 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
   end 
end 
   if cmd == "unban" then 
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not banned ☑️_', 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been unbanned ☑️_', 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
   end 
end 
  if cmd == "silent" then 
   if is_mod1(arg.chat_id, data.id_) then 
  if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md") 
    else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت گتم آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
       end 
     end 
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already silent ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
     end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
  if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_added to silent users list ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
   end 
end 
  if cmd == "unsilent" then 
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not silent ☑️_', 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ_', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_removed from silent users list ☑️_', 0, "md") 
  else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
        end 
     end 
if is_gbanned(data.id_) then 
   if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already globally banned ☑️_', 0, "md") 
    else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   kick_user(data.id_, arg.chat_id) 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْــرِٰهَٰہۧ عٍِّـــاَٰمٍٰ _', 0, "md") 
   end 
end 
  if cmd == "unbanall" then 
  if not administration['gban_users'] then 
    administration['gban_users'] = {} 
    save_data(_config.moderation.data, administration) 
    end 
if not is_gbanned(data.id_) then 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not globally banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ_', 0, "md") 
      end 
   end 
  administration['gban_users'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
    if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally banned ☑️_', 0, "md") 
   else 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
   end 
end 
  if cmd == "kick" then 
   if is_mod1(arg.chat_id, data.id_) then 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md") 
    elseif lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت طـرد آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حذف رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
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
  return tdcli.sendMessage(arg.chat_id, "", 0, "_لم يتم آلعثور على هہ‏‏آذآ آلشـخص_", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md") 
      end 
   end 
end 

local function run(msg, matches) 
if is_banned(msg.from.id, msg.to.id) or is_gbanned(msg.from.id, msg.to.id) or is_silent_user(msg.from.id, msg.to.id) then 
return false 
end 
local userid = tonumber(matches[2]) 
local hash = "gp_lang:"..msg.to.id 
local lang = redis:get(hash) 
local data = load_data(_config.moderation.data) 
chat = msg.to.id 
user = msg.from.id 
   if msg.to.type ~= 'pv' then 
 if (matches[1]:lower() == "kick" or matches[1] == "طرد") and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
     tdcli.sendMessage(msg.to.id, "", 0, "_You can't kick mods,owners or bot admins_", 0, "md") 
   elseif lang then 
     tdcli.sendMessage(msg.chat_id_, "", 0, "*🎐 ليسـت مـن صـلآحبهہ‏‏ آلبوت طـرد آلمـدرآء وآلآدمـنيهہ‏‏*", 0, "md") 
         end 
     else 
kick_user(matches[2], msg.to.id) 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="kick"}) 
         end 
      end 
 if (matches[1]:lower() == "delall" or matches[1] == "مسح الكل") and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't delete messages mods,owners or bot admins_", 0, "md") 
     elseif lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت مـسـح رسـآئل آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
   end 
     else 
tdcli.deleteMessagesFromUser(msg.to.id, matches[2], dl_cb, nil) 
    if not lang then 
  return tdcli.sendMessage(msg.to.id, "", 0, "_All_ *messages* _of_ *[ "..matches[2].." ]* _has been_ *deleted*", 0, "md") 
   elseif lang then 
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسائل العضو* \n*[ "..data.sender_user_id_.." ]* *تم تم مـسـح بنجآح 💯✔🚽*", 0, "md") 
         end 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="delall"}) 
         end 
      end 
   end 
 if (matches[1]:lower() == "banall" or matches[1] == "حظر عام") and is_admin(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="banall"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if is_admin1(userid) then 
   if not lang then 
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't globally ban other admins_", 0, "md") 
else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
        end 
     end 
   if is_gbanned(matches[2]) then 
   if not lang then 
  return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already globally banned ☑️_', 0, "md") 
    else 
  return  tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
        end 
     end 
  data['gban_users'][tostring(matches[2])] = "" 
    save_data(_config.moderation.data, data) 
kick_user(matches[2], msg.to.id) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally banned ☑️_', 0, "md") 
    else 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْــرِٰهَٰہۧ عٍِّـــاَٰمٍٰ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="banall"}) 
      end 
   end 
 if (matches[1]:lower() == "unbanall" or matches[1] == "الغاء العام") and is_admin(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unbanall"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if not is_gbanned(matches[2]) then 
     if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not globally banned ☑️_', 0, "md") 
    else 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ ـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
        end 
     end 
  data['gban_users'][tostring(matches[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been globally unbanned ☑️_', 0, "md") 
   else 
return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ عٍِّــاَٰمٍٰ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unbanall"}) 
      end 
   end 
   if msg.to.type ~= 'pv' then 
 if matches[1]:lower() == "ban" or matches[1] == "حظر" and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="ban"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
     if not lang then 
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't ban mods,owners or bot admins_", 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
        end 
     end 
   if is_banned(matches[2], msg.to.id) then 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is globally banned ☑️_', 0, "md") 
  else 
  return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
        end 
     end 
data[tostring(chat)]['banned'][tostring(matches[2])] = "" 
    save_data(_config.moderation.data, data) 
kick_user(matches[2], msg.to.id) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is banned ☑️_', 0, "md") 
  else 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
     tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="ban"}) 
      end 
   end 
 if (matches[1]:lower() == "unban" or matches[1] == "الغاء الحظر") and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unban"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if not is_banned(matches[2], msg.to.id) then 
   if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not banned ☑️_', 0, "md") 
  else 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
        end 
     end 
data[tostring(chat)]['banned'][tostring(matches[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_has been banned ☑️_', 0, "md") 
   else 
return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء حٌٰظَِْـــرِٰهَٰہۧ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unban"}) 
      end 
   end 
 if (matches[1]:lower() == "silent" or matches[1] == "كتم") and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="silent"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if is_mod1(msg.to.id, userid) then 
   if not lang then 
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't silent mods,leaders or bot admins_", 0, "md") 
 else 
   return tdcli.sendMessage(arg.chat_id, "", 0, "*🎐 ليسـت مـن صـلآحيهہ‏‏ آلبوت حضـر آلمـدرآء وآلآدمـنيهہ‏‏ *", 0, "md") 
        end 
     end 
   if is_silent_user(matches[2], chat) then 
   if not lang then 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is already silent ☑️_', 0, "md") 
   else 
   return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_ بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
        end 
     end 
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = "" 
    save_data(_config.moderation.data, data) 
    if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_added to silent users list ☑️_', 0, "md") 
         else 
            return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
    tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="silent"}) 
      end 
   end 
 if (matches[1]:lower() == "unsilent" or matches[1] == "الغاء الكتم") and is_mod(msg) then 
if not matches[2] and msg.reply_id then 
    tdcli_function ({ 
      ID = "GetMessage", 
      chat_id_ = msg.to.id, 
      message_id_ = msg.reply_id 
    }, action_by_reply, {chat_id=msg.to.id,cmd="unsilent"}) 
end 
  if matches[2] and string.match(matches[2], '^%d+$') then 
   if not is_silent_user(matches[2], chat) then 
     if not lang then 
     return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_is not silent ☑️_', 0, "md") 
            else 
               return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_بٌِٰـاَٰلْٰفِٰعٍِّــلْٰ تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ_', 0, "md") 
        end 
     end 
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil 
    save_data(_config.moderation.data, data) 
   if not lang then 
 return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _User_ ['..user_name..'] \n📝| _ID_ *['..data.id_..']*\n📛|_removed from silent users list ☑️_', 0, "md") 
         else 
            return tdcli.sendMessage(arg.chat_id, "", 0, '🎐| _المستخدم 👤_ ['..user_name..'] \n📝| _الايدي 💫_ *['..data.id_..']*\n📛|_تّٰــمٍٰ اَٰلْٰغِِٰـــاَٰء كٍٰتّٰمٍٰــهَٰہۧ _', 0, "md") 
      end 
   end 
  if matches[2] and not string.match(matches[2], '^%d+$') then 
   tdcli_function ({ 
      ID = "SearchPublicChat", 
      username_ = matches[2] 
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unsilent"}) 
      end 
   end 
      if (matches[1]:lower() == 'clean' or matches[1] == "مسح") and is_owner(msg) then 
      if not lang then 
         if matches[2]:lower() == 'bans' then 
            if next(data[tostring(chat)]['banned']) == nil then 

               return "_No_ *banned* _users in this group_" 
            end 
            for k,v in pairs(data[tostring(chat)]['banned']) do 
               data[tostring(chat)]['banned'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "_All_ *banned* _users has been unbanned_" 
         end 
         if matches[2]:lower() == 'silentlist' then 
            if next(data[tostring(chat)]['is_silent_users']) == nil then 
               return "_No_ *silent* _users in this group_" 
            end 
            for k,v in pairs(data[tostring(chat)]['is_silent_users']) do 
               data[tostring(chat)]['is_silent_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
                end 
            return "*Silent list* _has been cleaned_" 
             end 
            else 
         if matches[2] == 'المحظورين' then 
            if next(data[tostring(chat)]['banned']) == nil then 
               return "*🎐¦ لم يتم آلعثور على مـسـتخدمـين مـحضـورين في آلمـجمـوعهہ‏‏*" 
            end 
            for k,v in pairs(data[tostring(chat)]['banned']) do 
               data[tostring(chat)]['banned'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "*🎐¦ تم الغآء آلحضـر بنجآح عن جمـيع مـسـتخدمـين في آلمـجمـوعهہ‏‏ *" 
         end 
         if matches[2] == 'المكتومين' then 
            if next(data[tostring(chat)]['is_silent_users']) == nil then 
               return "*🎐¦ لم يتم آلعثور على مـسـتخدمـين مـگتومـين في آلمـجمـوعهہ‏‏ *" 
            end 
            for k,v in pairs(data[tostring(chat)]['is_silent_users']) do 
               data[tostring(chat)]['is_silent_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
                end 
            return "*🎐¦ تم حذف قآئمـهہ‏‏ آلمـگتومـين*" 
             end 
        end 
      end 
     end 
      if (matches[1]:lower() == 'clean' or matches[1]:lower() == 'مسح') and is_sudo(msg) then 
      if not lang then 
         if matches[2]:lower() == 'gbans' then 
            if next(data['gban_users']) == nil then 
               return "_No_ *globally banned* _users available_" 
            end 
            for k,v in pairs(data['gban_users']) do 
               data['gban_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "_All_ *globally banned* _users has been unbanned_" 
         end 
         else 
      if matches[2] == 'قائمه العام' then 
            if next(data['gban_users']) == nil then 
               return "*🎐¦ لمـ يتمـ آلعثور على مـسـتخدمـين مـحضـورين عآمـ في آلمـجمـوعهہ‏‏ *" 
            end 
            for k,v in pairs(data['gban_users']) do 
               data['gban_users'][tostring(k)] = nil 
               save_data(_config.moderation.data, data) 
            end 
            return "*🎐¦ تم الغآء آلحضـر عآمـ عن جمـيهہ‏ع مـسـتخدمـين في آلمـجمـوعهہ‏‏ *" 
         end 
         end 
     end 
if matches[1]:lower() == "gbanlist" and is_admin(msg) or matches[1] == "قائمه العام" and is_admin(msg) then 
  return gbanned_list(msg) 
 end 
   if msg.to.type ~= 'pv' then 
if matches[1]:lower() == "silentlist" and is_mod(msg) or matches[1] == "المكتومين" and is_mod(msg) then 
  return silent_users_list(chat) 
 end 
if matches[1]:lower() == "banlist" and is_mod(msg) or matches[1] == "المحظورين" and is_mod(msg) then 
  return banned_list(chat) 
     end 
  end 
end 
return { 
   patterns = { 
"^([Bb]anall)$", 
"^([Bb]anall) (.*)$", 
"^([Uu]nbanall)$", 
"^([Uu]nbanall) (.*)$", 
"^([Gg]banlist)$", 
"^([Bb]an)$", 
"^([Bb]an) (.*)$", 
"^([Uu]nban)$", 
"^([Uu]nban) (.*)$", 
"^([Bb]anlist)$", 
"^([Ss]ilent)$", 
"^([Ss]ilent) (.*)$", 
"^([Uu]nsilent)$", 
"^([Uu]nsilent) (.*)$", 
"^([Ss]ilentlist)$", 
"^([Kk]ick)$", 
"^([Kk]ick) (.*)$", 
"^([Dd]elall)$", 
"^([Dd]elall) (.*)$", 
"^([Cc]lean) (.*)$", 
 "^(حظر عام)$", 
 "^(حظر عام) (.*)$", 
 "^(الغاء العام)$", 
 "^(الغاء العام) (.*)$", 
 "^(الغاء العام)$", 
 "^(قائمه العام)", 
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
 "^(مسح الكل)$", 
 "^(مسح الكل) (.*)$", 
 "^(مسح) (.*)$", 
}, 
   run = run, 
pre_process = pre_process 
} 
