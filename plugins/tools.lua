--[[
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
--]]

local SUDO = 373906612--  اديك هنا  --  ===>  
local function index_function(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end

local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 

local function already_sudo(user_id)
  for k,v in pairs(_config.sudo_users) do
    if user_id == v then
      return k
    end
  end
  -- If not found
  return false
end

local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end

local function sudolist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = '\n `👁‍🗨￤» قائمه المطورين`\n\n`•~~•⚜•~~•♦️•~~•⚜•~~•`\n\n'
   else
 text = '\n `👁‍🗨￤» قائمه المطورين`\n\n`•~~•⚜•~~•♦️•~~•⚜•~~•`\n\n'
  end
for i=1,#sudo_users do
    text = text..i.." - "..sudo_users[i].."\n"
end
return text
end

local function adminlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 text = '\n `👁‍🗨￤» قائمه الاداريين`\n\n`•~~•⚜•~~•♦️•~~•⚜•~~•`\n\n'
   else
 text = '\n `👁‍🗨￤» قائمه الاداريين`\n\n`•~~•⚜•~~•♦️•~~•⚜•~~•`\n\n'
  end
		  	local compare = text
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    text = text..i..'- '..(user[2] or '')..' 〰('..user[1]..')\n'
		  	i = i +1
		  	end
		  	if compare == text then
   if not lang then
		  		text = '👁‍🗨￤» لا يوجد اداريين في المجموعه'
      else
		  		text = '👁‍🗨￤» لا يوجد اداريين في المجموعه'
           end
		  	end
		  	return text
    end
    
local function chat_num(msg)
i = 1
local data = load_data(_config.moderation.data)
local groups = 'groups'
if not data[tostring(groups)] then
return '👁‍🗨￤» ماكو مجموعات مفعله 🚸'
end
local message = '👁‍🗨￤» المجموعات ⭐\n\n'
for k,v in pairsByKeys(data[tostring(groups)]) do
local group_id = v
if data[tostring(group_id)] then
settings = data[tostring(group_id)]['settings']
end
for m,n in pairsByKeys(settings) do
if m == 'set_name' then
name = n:gsub("", "")
i = i + 1
end
end
end
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» عدد المجموعات المفعله هي 🔻\n👁‍🗨￤» {*'..i..'*} مجموعه'
end



local function action_by_reply(arg, data)
    local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
    if cmd == "addmod" then
local function addmod_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, addmod_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "remadmin" then
local function remadmin_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
	local nameid = index_function(tonumber(data.id_))
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remadmin_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "addsudo" then
local function addsudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, addsudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "remsudo" then
local function remsudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remsudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User Not Found*", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "👁‍🗨￤»  العضو لا يوجد", "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local cmd = arg.cmd
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
    if cmd == "addmod" then
if is_admin1(tonumber(data.id_)) then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   end
end
    if cmd == "remadmin" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   end
end
    if cmd == "addsudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   end
end
    if cmd == "remsudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤»  العضو لا يوجد", "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤»  العضو لا يوجد", "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local cmd = arg.cmd
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
    if cmd == "addmod" then
if is_admin1(tonumber(data.id_)) then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ _', 0, "md") 
   end
end
    if cmd == "remadmin" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  _', 0, "md") 
   end
end
    if cmd == "addsudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   end
end
    if cmd == "remsudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ {'..user_name..'}\n👁‍🗨￤»  _الايدي_ *{'..data.id_..'}*\n👁‍🗨￤» _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  _', 0, "md") 
      end
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤»  العضو لا يوجد", "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤»  العضو لا يوجد", "md")
      end
   end
end

local function run(msg, STORMAPIBYTAHAJ20)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if tonumber(msg.from.id) == SUDO then
if STORMAPIBYTAHAJ20[1] == "addsudo" or STORMAPIBYTAHAJ20[1] == "رفع مطور" then
if not STORMAPIBYTAHAJ20[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="addsudo"})
  end
  if STORMAPIBYTAHAJ20[2] and string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = STORMAPIBYTAHAJ20[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=STORMAPIBYTAHAJ20[2],cmd="addsudo"})
    end
  if STORMAPIBYTAHAJ20[2] and not string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = STORMAPIBYTAHAJ20[2]
    }, action_by_username, {chat_id=msg.to.id,username=STORMAPIBYTAHAJ20[2],cmd="addsudo"})
      end
   end
if STORMAPIBYTAHAJ20[1] == "remsudo" or STORMAPIBYTAHAJ20[1] == "تنزيل مطور" then
if not STORMAPIBYTAHAJ20[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remsudo"})
  end
  if STORMAPIBYTAHAJ20[2] and string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = STORMAPIBYTAHAJ20[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=STORMAPIBYTAHAJ20[2],cmd="remsudo"})
    end
  if STORMAPIBYTAHAJ20[2] and not string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = STORMAPIBYTAHAJ20[2]
    }, action_by_username, {chat_id=msg.to.id,username=STORMAPIBYTAHAJ20[2],cmd="remsudo"})
      end
   end
end
if STORMAPIBYTAHAJ20[1] == "addmod" or STORMAPIBYTAHAJ20[1] == "رفع اداري" and is_sudo(msg) then
if not STORMAPIBYTAHAJ20[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="addmod"})
  end
  if STORMAPIBYTAHAJ20[2] and string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = STORMAPIBYTAHAJ20[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=STORMAPIBYTAHAJ20[2],cmd="addmod"})
    end
  if STORMAPIBYTAHAJ20[2] and not string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = STORMAPIBYTAHAJ20[2]
    }, action_by_username, {chat_id=msg.to.id,username=STORMAPIBYTAHAJ20[2],cmd="addmod"})
      end
   end
if STORMAPIBYTAHAJ20[1] == "remadmin" or STORMAPIBYTAHAJ20[1] == "تنزيل اداري" and is_sudo(msg) then
if not STORMAPIBYTAHAJ20[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.to.id,cmd="remadmin"})
  end
  if STORMAPIBYTAHAJ20[2] and string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = STORMAPIBYTAHAJ20[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=STORMAPIBYTAHAJ20[2],cmd="remadmin"})
    end
  if STORMAPIBYTAHAJ20[2] and not string.match(STORMAPIBYTAHAJ20[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = STORMAPIBYTAHAJ20[2]
    }, action_by_username, {chat_id=msg.to.id,username=STORMAPIBYTAHAJ20[2],cmd="remadmin"})
      end
   end

if STORMAPIBYTAHAJ20[1] == '``' and is_admin(msg) then
local text = STORMAPIBYTAHAJ20[2]
tdcli.createNewGroupChat({[0] = msg.from.id}, text)
  if not lang then
return '``'
  else
return '``'
   end
end

if STORMAPIBYTAHAJ20[1] == '``' and is_admin(msg) then
local text = STORMAPIBYTAHAJ20[2]
tdcli.createNewChannelChat({[0] = msg.sender_user_id_}, text)
   if not lang then 
return '``'
  else
return '``'
   end
end
if STORMAPIBYTAHAJ20[1]:lower() == 'شحن'  and STORMAPIBYTAHAJ20[2] and STORMAPIBYTAHAJ20[3] then
		if string.match(STORMAPIBYTAHAJ20[2], '^-%d+$') then
			if tonumber(STORMAPIBYTAHAJ20[3]) > 0 and tonumber(STORMAPIBYTAHAJ20[3]) < 1001 then
				local extime = (tonumber(STORMAPIBYTAHAJ20[3]) * 86400)
				redis:setex('ExpireDate:'..STORMAPIBYTAHAJ20[2], extime, true)
				if not redis:get('CheckExpire::'..msg.to.id) then
					redis:set('CheckExpire::'..msg.to.id,true)
				end
					tdcli.sendMessage(SUDO, 0, 1, '👁‍🗨￤»  وقت تفعيل المجموعة '..STORMAPIBYTAHAJ20[2]..'👁‍🗨￤»  الوقت المقدر  '..STORMAPIBYTAHAJ20[3]..' 👁‍🗨￤»  وقت التفعيل', 1, 'md')
					tdcli.sendMessage(STORMAPIBYTAHAJ20[2], 0, 1, ' 👁‍🗨￤»  تم شحن المجموعه لمدة\n👁‍🗨￤»  المده { '..STORMAPIBYTAHAJ20[3]..' }يوم\n 👁‍🗨￤»  ارسل الاشتراك لعرض اشتراك المجموعه\n...',1 , 'md')
			else
					tdcli.sendMessage(msg.to.id, msg.id_, 1, 'من 1 الى 1000 فقط', 1, 'md')
			end
		end
end
	
if STORMAPIBYTAHAJ20[1]:lower() == 'اضافه' and STORMAPIBYTAHAJ20[2] then
    local function adduser(ex, data)
        --	tdcli.addChatMember(msg.to.id, data.id_ , 0, dl_cb, nil)
        	tdcli.sendMessage(msg.chat_id_, 0, 1, '👁‍🗨￤»  تم اضافه العضو : '..data.first_name_, 1, 'html')
        end
    return   tdcli_function ({ID = "SearchPublicChat",username_ = STORMAPIBYTAHAJ20[2]}, adduser)
end
if msg.to.type == 'channel' or msg.to.type == 'chat' then
if STORMAPIBYTAHAJ20[1] == 'شحن' and STORMAPIBYTAHAJ20[2] and not STORMAPIBYTAHAJ20[3] and is_sudo(msg) then
if tonumber(STORMAPIBYTAHAJ20[2]) > 0 and tonumber(STORMAPIBYTAHAJ20[2]) < 1001 then
local extime = (tonumber(STORMAPIBYTAHAJ20[2]) * 86400)
redis:setex('ExpireDate:'..msg.to.id, extime, true)
if not redis:get('CheckExpire::'..msg.to.id) then
redis:set('CheckExpire::'..msg.to.id)
end
tdcli.sendMessage(msg.to.id, msg.id_, 1, '👁‍🗨￤» تم شحن المجموعه  ل ['..STORMAPIBYTAHAJ20[2]..'] يوم 📢', 1, 'html')
tdcli.sendMessage(SUDO, 0, 1, ' 👁‍🗨￤» تم  تمديد مده الاشتراك ['..STORMAPIBYTAHAJ20[2]..'في.\n ['..msg.to.title..']', 1, 'html')
else
tdcli.sendMessage(msg.to.id, msg.id_, 1, '_ اختر من 1 الى 1000 فقط ⌚️    ._', 1, 'md')
end
end

if STORMAPIBYTAHAJ20[1]:lower() == 'الاشتراك' and is_mod(msg) and not STORMAPIBYTAHAJ20[2] then
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
return	tdcli.sendMessage(msg.to.id, msg.id_, 1, '_المجموعة مفعله مدى الحياة⌚️_', 1, 'md')
else
local day = math.floor(expi / 86400) + 1
	if day == 1 then
	day = 'يوم واحد' 
	elseif day == 2 then
   	day = 'يومين'
	elseif day == 3 then
   	day = '3 ايام'
   	else
	day = day..' يوم'
end
return tdcli.sendMessage(msg.to.id, msg.id_, 1, '👁‍🗨￤»  باقي '..day..' وينتهي اشتراك البوت 💯', 1, 'md')
end
end

if STORMAPIBYTAHAJ20[1] == 'الاشتراك' and is_mod(msg) and STORMAPIBYTAHAJ20[2] then
if string.match(STORMAPIBYTAHAJ20[2], '^-%d+$') then
local expi = redis:ttl('ExpireDate:'..STORMAPIBYTAHAJ20[2])
if expi == -1 then
tdcli.sendMessage(msg.to.id, msg.id_, 1, '_المجموعة مفعله مدى الحياة⌚️_', 1, 'md')
else
local day = math.floor(expi / 86400 ) + 1
	if day == 1 then
	day = 'يوم واحد' 
	elseif day == 2 then
   	day = 'يومين'
	elseif day == 3 then
   	day = '3 ايام'
   	else
	day = day..' يوم'
end
tdcli.sendMessage(msg.to.id, msg.id_, 1, day..'مدة تفعيل المجموعة.', 1, 'md')
end
end
end
if STORMAPIBYTAHAJ20[1] == 'تحويل سوبر' and is_admin(msg) then
local id = msg.to.id
tdcli.migrateGroupChatToChannelChat(id)
  if not lang then
return '``'
  else
return '``'
   end
end

if STORMAPIBYTAHAJ20[1] == '``' and is_admin(msg) then
tdcli.importChatInviteLink(STORMAPIBYTAHAJ20[2])
   if not lang then
return '``'
  else
return '``'
  end
end

if STORMAPIBYTAHAJ20[1] == 'تغيير اسم البوت' and is_sudo(msg) then
tdcli.changeName(STORMAPIBYTAHAJ20[2])
   if not lang then
return '👁‍🗨￤»  تم تغيير اسم البوت :_ \n`{ '..STORMAPIBYTAHAJ20[2]..' }`'
  else
return '👁‍🗨￤»  تم تغيير اسم البوت :_ \n`{ '..STORMAPIBYTAHAJ20[2]..' }`'
   end
end

if STORMAPIBYTAHAJ20[1] == 'ضع معرف البوت' and is_sudo(msg) then
tdcli.changeUsername(STORMAPIBYTAHAJ20[2])
   if not lang then
return '👁‍🗨￤» تم تغيير معرف البوت\n{ @'..STORMAPIBYTAHAJ20[2]..' }'
  else
return '👁‍🗨￤» تم تغيير معرف البوت\n{ @'..STORMAPIBYTAHAJ20[2]..' }'
   end
end

if STORMAPIBYTAHAJ20[1] == 'حذف معرف البوت' and is_sudo(msg) then
tdcli.changeUsername('')
   if not lang then
return '👁‍🗨￤» تم حذف معرف البوت'
  else
return '👁‍🗨￤» تم حذف معرف البوت'
  end
end

if STORMAPIBYTAHAJ20[1] == 'الماركدون' and is_sudo(msg) then
if STORMAPIBYTAHAJ20[2] == 'تفعيل' then
redis:set('markread','on')
   if not lang then
return '👁‍🗨￤» تم تفعيل الماركدون'
else
return '👁‍🗨￤» تم تفعيل الماركدون'
   end
end
if STORMAPIBYTAHAJ20[2] == 'تعطيل' then
redis:set('markread','off')
  if not lang then
return '👁‍🗨￤» تم تعطيل الماركدون'
   else
return '👁‍🗨￤» تم تعطيل الماركدون'
      end
   end
end

if STORMAPIBYTAHAJ20[1] == 'رساله' and is_admin(msg) then		
tdcli.sendMessage(STORMAPIBYTAHAJ20[2], 0, 0, STORMAPIBYTAHAJ20[3], 0)	end	

if STORMAPIBYTAHAJ20[1] == 'اذاعه' and is_sudo(msg) then		
local data = load_data(_config.moderation.data)		
local bc = STORMAPIBYTAHAJ20[2]			
for k,v in pairs(data) do				
tdcli.sendMessage(k, 0, 0, bc, 0)			
end	
end

if STORMAPIBYTAHAJ20[1] == 'sudolist' or STORMAPIBYTAHAJ20[1] == 'المطورين'  and is_sudo(msg) then
return sudolist(msg)
    end
    if STORMAPIBYTAHAJ20[1]:lower() == "جلب ملف" and STORMAPIBYTAHAJ20[2] then 
       local plug = "./plugins/"..STORMAPIBYTAHAJ20[2]..".lua" 
      tdcli.sendDocument(msg.chat_id_, msg.id_,0, 
1, nil, plug, '👁‍🗨￤» الملف تابع لتيم ستورم\n\n•~~•🚸•~~•♦️•~~•🚸•~~•\n👁‍🗨￤» تابعنا @TEAMSTORM', dl_cb, nil) 
    end 
  end 
if STORMAPIBYTAHAJ20[1] == '``' and is_admin(msg) then
return chat_list(msg)
    end
   if STORMAPIBYTAHAJ20[1]:lower() == 'دخول' and is_admin(msg) and STORMAPIBYTAHAJ20[2] then
	   tdcli.sendMessage(msg.to.id, msg.id, 1, 'I Invite you in '..STORMAPIBYTAHAJ20[2]..'', 1, 'html')
	   tdcli.sendMessage(STORMAPIBYTAHAJ20[2], 0, 1, "Admin Joined!🌚", 1, 'html')
    tdcli.addChatMember(STORMAPIBYTAHAJ20[2], msg.from.id, 0, dl_cb, nil)
  end
		if STORMAPIBYTAHAJ20[1] == 'تعطيل' and STORMAPIBYTAHAJ20[2] and is_admin(msg) then
    local data = load_data(_config.moderation.data)
			-- Group configuration removal
			data[tostring(STORMAPIBYTAHAJ20[2])] = nil
			save_data(_config.moderation.data, data)
			local groups = 'groups'
			if not data[tostring(groups)] then
				data[tostring(groups)] = nil
				save_data(_config.moderation.data, data)
			end
			data[tostring(groups)][tostring(STORMAPIBYTAHAJ20[2])] = nil
			save_data(_config.moderation.data, data)
	   tdcli.sendMessage(STORMAPIBYTAHAJ20[2], 0, 1, "Group has been removed by admin command", 1, 'html')
    return '_Group_ *'..STORMAPIBYTAHAJ20[2]..'* _removed_'
		end
if STORMAPIBYTAHAJ20[1] == 'الاداريين' or STORMAPIBYTAHAJ20[1] == 'الاداريين'  and is_admin(msg) then
return adminlist(msg)
    end
    if STORMAPIBYTAHAJ20[1] == 'المجموعات' and is_sudo(msg) then
return chat_num(msg)
end
     if STORMAPIBYTAHAJ20[1] == 'غادر' and is_admin(msg) then
  tdcli.changeChatMemberStatus(msg.to.id, our_id, 'Left', dl_cb, nil)
   end
     if STORMAPIBYTAHAJ20[1] == 'المغادره تلقائيا' and is_admin(msg) then
local hash = 'auto_leave_bot'
--Enable Auto Leave
     if STORMAPIBYTAHAJ20[2] == 'تفعيل' then
    redis:del(hash)
   return '👁‍🗨￤» *المغادره تلقائيا تم تفعيلها*'
--Disable Auto Leave
     elseif STORMAPIBYTAHAJ20[2] == 'تعطيل' then
    redis:set(hash, true)
   return '👁‍🗨￤» *المغادره تلقائيا تم تعطيلها*'
--Auto Leave Status
      elseif STORMAPIBYTAHAJ20[2] == 'حاله المغادره' then
      if not redis:get(hash) then
   return '👁‍🗨￤» *الخروج تلقائي تم تفعيله 📡*'
       else
   return '👁‍🗨￤» *الخروج تلقائي تم تعطيله ❌*'
         end
      end
   end
   end
return { 
patterns = { 
"^(تفعيل) (.*)$",
"^(تعطيل) (.*)$",
"^(رفع مطور)$", 
"^(تنزيل مطور)$",
"^(المطورين)$",
"^(رفع مطور) (.*)$", 
"^(تنزيل مطور) (.*)$",
"^(رفع اداري)$", 
"^(تنزيل اداري)$",
"^(الاداريين)$",
"^(رفع اداري) (.*)$", 
"^(تنزيل اداري) (.*)$",
"^(غادر)$",
"^(المغادره تلقائيا) (.*)$", 
"^(ترقيه سوبر)$",
"^(المجموعات)$",
"^(دخول) (.*)$",
"^(حاله المغادره)$",
"^(تغيير اسم البوت) (.*)$",
"^(ضع معرف البوت) (.*)$",
"^(حذف معرف البوت) (.*)$",
"^(الماركدون) (.*)$",
"^(رساله) (%d+) (.*)$",
"^(اذاعه) (.*)$",
"^(جلب ملف) (.*)$", 
"^(الاشتراك)$",
"^(الاشتراك) (.*)$",
"^(شحن) (.*) (%d+)$",
"^(شحن) (%d+)$",
"^(الاشتراك) ([123])$",
}, 
run = run 
}
--[[
 __   ___________   ___     _____     __  __
/  |  |___   ___|  / _ \   | ___ }   |  \/  |
\_ \      | |     | | | |  | |_) }   | |\/| |
 _) |     | |     | |_| |  |  _< \   | |  | |
|__/      |_|      \___/   |_|  \_\  |_|  |_|
 BY @TAHAJ20 DEV : TAHAJ20            
--]]
