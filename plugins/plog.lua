do
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled, msg)
  local tmp = '\n'
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  مفعل  enabled, ❌ disabled
    local status = 'معطل￤»'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = 'مفعل￤»'
      end
      nact = nact+1
    end
    if not only_enabled or status == 'مفعل￤»'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'.'..status..' '..v..' \n'
    end
  end
  text = 'َ'..text..'\n\n•~~•🚸•~~•♦️•~~•🚸•~~•\n'..nsum..' 👁‍🗨￤»  الملفات المفعله\n\n'..nact..' 👁‍🗨￤» عدد الملفات \n\n'..nsum-nact..' 👁‍🗨￤» الملفات المعطله '..tmp
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end

local function list_plugins(only_enabled, msg)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  مفعل  enabled, ❌ disabled
    local status = 'معطل￤»'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = 'مفعل￤»'
      end
      nact = nact+1
    end
    if not only_enabled or status == 'مفعل￤»'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
     -- text = text..v..'  '..status..'\n'
    end
  end
  text = "\n'`•💠• تم تحديث الملفات •💠•`\n\n•~~•🚸•~~•♦️•~~•🚸•~~• \n\n"..nact.."👁‍🗨￤» عدد الملفات \n"..nsum.."👁‍🗨￤» الملفات المفعله  \n\n•~~•🚸•~~•♦️•~~•🚸•~~•\n👁‍🗨￤» تابع : @TEAMSTORM"
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'md')
end

local function reload_plugins(checks, msg)
  plugins = {}
  load_plugins()
  return list_plugins(true, msg)
end


local function enable_plugin( plugin_name, msg )
  print('checking if '..plugin_name..' exists')
  -- Check if plugin is enabled
  if plugin_enabled(plugin_name) then
    local text = ' 👁‍🗨￤» الملف {`'..plugin_name..'`}\n 👁‍🗨￤» الملف مفعل  '
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
	return
  end
  -- Checks if plugin exists
  if plugin_exists(plugin_name) then
    -- Add to the config table
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    -- Reload the plugins
    return reload_plugins(true, msg)
  else
    local text = ' '..plugin_name..' does not exists. '
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
  end
end

local function disable_plugin( name, msg )
  local k = plugin_enabled(name)
  -- Check if plugin is enabled
  if not k then
    local text = ' 👁‍🗨￤» الملف {`'..name..'`}\n 👁‍🗨￤» غير موجود  '
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
	return
  end
  -- Check if plugins exists
  if not plugin_exists(name) then
    local text = ' '..name..' does not exists. '
	tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
  else
  -- Disable and reload
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true, msg)
end  
end

local function disable_plugin_on_chat(receiver, plugin, msg)
  if not plugin_exists(plugin) then
    return "_Plugin doesn't exists_"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  local text = ' '..plugin..' disabled on this chat. '
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end

local function reenable_plugin_on_chat(receiver, plugin, msg)
  if not _config.disabled_plugin_on_chat then
    return 'There aren\'t any disabled plugins'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'There aren\'t any disabled plugins for this chat'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return '_This plugin is not disabled_'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  local text = ' '..plugin..' is enabled again. '
  tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end

local function run(msg, matches)
  -- Show the available plugins 
  if is_sudo(msg) then
  if (matches[1]:lower() == 'plist' or matches[1] == 'الملفات') then --after changed to moderator mode, set only sudo
    return list_all_plugins(false, msg)
  end
end
  -- Re-enable a plugin for this chat
   if matches[1]:lower() == 'pl' or matches[1] == 'ملف' then
  if matches[2] == '+' and matches[4] == 'chat' or matches[4] == 'مجموعة' then
      if is_mod(msg) then
    local receiver = msg.chat_id_
    local plugin = matches[3]
    print("enable "..plugin..' on this chat')
    return reenable_plugin_on_chat(receiver, plugin, msg)
  end
    end

  -- Enable a plugin
  if matches[2] == '+' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    local plugin_name = matches[3]
    print("enable: "..matches[3])
    return enable_plugin(plugin_name, msg)
  end
  -- Disable a plugin on a chat
  if matches[2] == '-' and matches[4] == 'chat' or matches[4] == 'مجموعة' then
      if is_mod(msg) then
    local plugin = matches[3]
    local receiver = msg.chat_id_
    print("disable "..plugin..' on this chat')
    return disable_plugin_on_chat(receiver, plugin, msg)
  end
    end
  -- Disable a plugin
  if matches[2] == '-' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    if matches[3] == 'plugins' then
		return 'This plugin can\'t be disabled'
    end
    print("disable: "..matches[3])
    return disable_plugin(matches[3], msg)
  end

  -- Reload all the plugins!
  if matches[2] == '*' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    return reload_plugins(true, msg)
  end
  end
  if (matches[1]:lower() == 'reload' or matches[1] == 'تحديث') and is_sudo(msg) then --after changed to moderator mode, set only sudo
    return reload_plugins(true, msg)
  end
end

return {
  description = "Plugin to manage other plugins. Enable, disable or reload.", 
  usage = {
      moderator = {
          "!pl - [plugin] chat : disable plugin only this chat.",
          "!pl + [plugin] chat : enable plugin only this chat.",
          },
      sudo = {
          "!plist : list all plugins.",
          "!pl + [plugin] : enable plugin.",
          "!pl - [plugin] : disable plugin.",
          "!pl * : reloads all plugins." },
          },
  patterns = {
"^([Pp]list)$",
"^([Pp]l) (+) ([%w_%.%-]+)$",
"^([Pp]l) (-) ([%w_%.%-]+)$",
"^([Pp]l) (+) ([%w_%.%-]+) (chat)$",
"^([Pp]l) (-) ([%w_%.%-]+) (chat)$",
"^([Pp]l) (*)$",
"^([Rr]eload)$",
	"^(تحديث)$",
	"^(الملفات)$",
	"^([Pp]l) (+) ([%w_%.%-]+)$",
"^([Pp]l) (-) ([%w_%.%-]+)$",
	"^(ملف) (+) ([%w_%.%-]+) (مجموعة)$",
	"^(ملف) (+) ([%w_%.%-]+) (مجموعة)$", 
	},
  run = run,
  moderated = true, -- set to moderator mode
  privileged = true
}

end

-- bytaha