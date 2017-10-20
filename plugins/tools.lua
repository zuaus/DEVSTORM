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
 text = "*List of sudo :*\n"
   else
 text = "_قائمه المطوريين :_\n"
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
 text = '*List of bot admins :*\n'
   else
 text = "\n _ قائمه الاداريين_"
  end
		  	local compare = text
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    text = text..i..'- '..(user[2] or '')..' 〰('..user[1]..')\n'
		  	i = i +1
		  	end
		  	if compare == text then
   if not lang then
		  		text = '_No_ *admins* _available_'
      else
		  		text = '_لا يوجد اداريين في المجموعه ✉'
           end
		  	end
		  	return text
    end

local function chat_list(msg)
	i = 1
	local data = load_data(_config.moderation.data)
    local groups = 'groups'
    if not data[tostring(groups)] then
        return 'No groups at the moment'
    end
    local message = 'List of Groups:\n*Use #join (ID) to join*\n\n'
    for k,v in pairsByKeys(data[tostring(groups)]) do
		local group_id = v
		if data[tostring(group_id)] then
			settings = data[tostring(group_id)]['settings']
		end
        for m,n in pairsByKeys(settings) do
			if m == 'set_name' then
				name = n:gsub("", "")
				chat_name = name:gsub("‮", "")
				group_name_id = name .. '\n(ID: ' ..group_id.. ')\n\n'
				if name:match("[\216-\219][\128-\191]") then
					group_info = i..' - \n'..group_name_id
				else
					group_info = i..' - '..group_name_id
				end
				i = i + 1
			end
        end
		message = message..group_info
    end
	return message
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is already an_ *admin*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ 🎴_', 0, "md") 
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been promoted as_ *admin*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ رِٰفِٰـعه  ادِٰارِٰيَٰ ❉💥_', 0, "md") 
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md") 
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is already a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is now_ *sudoer*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is no longer a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
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
  return tdcli.sendMessage(data.chat_id_, "", 0, "*العضو لا يوجد*", 0, "md")
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md") 
   end
end
    if cmd == "remadmin" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md") 
   end
end
    if cmd == "addsudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is already a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is now_ *sudoer*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
   end
end
    if cmd == "remsudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is no longer a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
      end
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*العضو لا يوجد*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*العضو لا يوجد*", 0, "md")
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md") 
   end
end
    if cmd == "remadmin" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _has been demoted from_ *admin*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـلْٰه  ادِٰارِٰيَٰ  🔖_', 0, "md") 
   end
end
    if cmd == "addsudo" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is already a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is now_ *sudoer*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ رِٰفِٰـعه  مٍٰطَُِـ૭ورِٰ  ❉💥_', 0, "md") 
   end
end
    if cmd == "remsudo" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is not a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_بٌِٰـالْٰفِٰـعلْٰ  تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _UŚËℜ_ ['..user_name..'] \n📎| _îᗫ_ *['..data.id_.."\n* _is no longer a_ *sudoer*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, '🔹| _العضو_ ['..user_name..'] \n📎| _الايدي_ *['..data.id_..']*\n📛|_تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰطَُِـ૭ورِٰ  🔖_', 0, "md") 
      end
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*العضو لا يوجد*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*العضو لا يوجد*", 0, "md")
      end
   end
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if tonumber(msg.from.id) == SUDO then
if matches[1] == "addsudo" or matches[1] == "رفع مطور" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="addsudo"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="addsudo"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="addsudo"})
      end
   end
if matches[1] == "remsudo" or matches[1] == "تنزيل مطور" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remsudo"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remsudo"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remsudo"})
      end
   end
end
if matches[1] == "addmod" or matches[1] == "رفع اداري" and is_sudo(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="addmod"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="addmod"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="addmod"})
      end
   end
if matches[1] == "remadmin" or matches[1] == "تنزيل اداري" and is_sudo(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.to.id,cmd="remadmin"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remadmin"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remadmin"})
      end
   end

if matches[1] == 'creategroup' and is_admin(msg) then
local text = matches[2]
tdcli.createNewGroupChat({[0] = msg.from.id}, text)
  if not lang then
return '_Group Has Been Created!_'
  else
return '_Group Has Been Created!_'
   end
end

if matches[1] == 'createsuper' and is_admin(msg) then
local text = matches[2]
tdcli.createNewChannelChat({[0] = msg.sender_user_id_}, text)
   if not lang then 
return '_SuperGroup Has Been Created!_'
  else
return '_SuperGroup Has Been Created!_'
   end
end

if matches[1] == 'تحويل سوبر' and is_admin(msg) then
local id = msg.to.id
tdcli.migrateGroupChatToChannelChat(id)
  if not lang then
return '_Group Has Been Changed To SuperGroup!_'
  else
return '_Group Has Been Changed To SuperGroup!_'
   end
end

if matches[1] == 'import' and is_admin(msg) then
tdcli.importChatInviteLink(matches[2])
   if not lang then
return '*Done!*'
  else
return '*Done!*'
  end
end

if matches[1] == 'تغيير اسم البوت' and is_sudo(msg) then
tdcli.changeName(matches[2])
   if not lang then
return '_Changed NAEM BOT:_ *'..matches[2]..'*'
  else
return '_تم تغيير اسم البوت✉:_ \n*'..matches[2]..'*'
   end
end

if matches[1] == 'ضع معرف البوت' and is_sudo(msg) then
tdcli.changeUsername(matches[2])
   if not lang then
return '*_Changed Username bot_*:_ @'..matches[2]
  else
return '*تم تغيير معرف البوت*:_ \n@'..matches[2]..''
   end
end

if matches[1] == 'حذف معرف البوت' and is_sudo(msg) then
tdcli.changeUsername('')
   if not lang then
return '*Username deleat!*'
  else
return '*تم المسح!*'
  end
end

if matches[1] == 'الماركدون' and is_sudo(msg) then
if matches[2] == 'تفعيل' then
redis:set('markread','on')
   if not lang then
return '_Markread >_ *ON*'
else
return '_الماركدون تم تفعيله_*✔*'
   end
end
if matches[2] == 'تعطيل' then
redis:set('markread','off')
  if not lang then
return '_Markread >_ *OFF*'
   else
return '_الماركدون تم تعطيله_ *❌*'
      end
   end
end

if matches[1] == 'رساله' and is_admin(msg) then		
tdcli.sendMessage(matches[2], 0, 0, matches[3], 0)	end	

if matches[1] == 'اذاعه' and is_sudo(msg) then		
local data = load_data(_config.moderation.data)		
local bc = matches[2]			
for k,v in pairs(data) do				
tdcli.sendMessage(k, 0, 0, bc, 0)			
end	
end

if matches[1] == 'sudolist' or matches[1] == 'قائمه المطورين'  and is_sudo(msg) then
return sudolist(msg)
    end
    if matches[1]:lower() == "جلب ملف" and matches[2] then
	    local plug = "./plugins/"..matches[2]..".lua"
		tdcli.sendDocument(msg.chat_id_, msg.id_,0, 
1, nil, plug, '\n〰〰〰〰〰@TEAMSTORM', dl_cb, nil)
    end
if matches[1] == 'المجموعات' and is_admin(msg) then
return chat_list(msg)
    end
   if matches[1]:lower() == 'دخول' and is_admin(msg) and matches[2] then
	   tdcli.sendMessage(msg.to.id, msg.id, 1, 'I Invite you in '..matches[2]..'', 1, 'html')
	   tdcli.sendMessage(matches[2], 0, 1, "Admin Joined!🌚", 1, 'html')
    tdcli.addChatMember(matches[2], msg.from.id, 0, dl_cb, nil)
  end
		if matches[1] == 'rem' and matches[2] and is_admin(msg) then
    local data = load_data(_config.moderation.data)
			-- Group configuration removal
			data[tostring(matches[2])] = nil
			save_data(_config.moderation.data, data)
			local groups = 'groups'
			if not data[tostring(groups)] then
				data[tostring(groups)] = nil
				save_data(_config.moderation.data, data)
			end
			data[tostring(groups)][tostring(matches[2])] = nil
			save_data(_config.moderation.data, data)
	   tdcli.sendMessage(matches[2], 0, 1, "Group has been removed by admin command", 1, 'html')
    return '_Group_ *'..matches[2]..'* _removed_'
		end
if matches[1] == 'الاصدار' or matches[1] == 'سورس' or matches[1] == 'يا سورس' or matches[1] ==  'المطورين' or matches[1] ==  'مطورين' or matches[1] == 'السورس' then
return tdcli.sendMessage(msg.to.id, msg.id, 1, _config.info_text, 1, 'html')
    end
if matches[1] == 'adminlist' or matches[1] == 'قائمه الاداريين'  and is_admin(msg) then
return adminlist(msg)
    end
     if matches[1] == 'غادر' and is_admin(msg) then
  tdcli.changeChatMemberStatus(msg.to.id, our_id, 'Left', dl_cb, nil)
   end
     if matches[1] == 'المغادره تلقائي' and is_admin(msg) then
local hash = 'auto_leave_bot'
--Enable Auto Leave
     if matches[2] == 'تفعيل' then
    redis:del(hash)
   return '*المغادره تلقائيا تم تفعيلها 🔅*'
--Disable Auto Leave
     elseif matches[2] == 'تعطيل' then
    redis:set(hash, true)
   return '*المغادره تلقائيا تم تعطيلها ❌*'
--Auto Leave Status
      elseif matches[2] == 'حاله المغادره' then
      if not redis:get(hash) then
   return '*الخروج تلقائي تم تفعيله 📡*'
       else
   return '*الخروج تلقائي تم تعطيله ❌*'
         end
      end
   end
end
return { 
patterns = { 
"^(رفع مطور)$", 
"^(تنزيل مطور)$",
"^(قائمه المطورين)$",
"^(رفع مطور) (.*)$", 
"^(تنزيل مطور) (.*)$",
"^(رفع اداري)$", 
"^(تنزيل اداري)$",
"^(قائمه الاداريين)$",
"^(رفع اداري) (.*)$", 
"^(تنزيل اداري) (.*)$",
"^(غادره)$",
"^(المغادره تلقائي) (.*)$", 
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
"^(السورس)$", 
"^(مطورين)$", 
"^(المطورين)$", 
"^(يا سورس)$", 
"^(سورس)$", 
"^(الاصدار)$", 
"^(addsudo)$", 
"^(remsudo)$",
"^(sudolist)$",
"^(addsudo) (.*)$", 
"^(remsudo) (.*)$",
"^(addmod)$", 
"^(remadmin)$",
"^(adminlist)$",
"^(addmod) (.*)$", 
"^(remadmin) (.*)$",
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
