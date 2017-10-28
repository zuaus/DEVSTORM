
package.path = package.path..';.luarocks/share/lua/5.2/?.lua;.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath..';.luarocks/lib/lua/5.2/?.so'
require('./bot/utils')
require('./bot/methods')
http = require('socket.http')
JSON = (loadfile "./libs/dkjson.lua")()
https = require('ssl.https')
URL = require('socket.url')
curl = require('cURL')
ltn12 = require("ltn12")
redis = (loadfile "./libs/redis.lua")()
json = (loadfile "./libs/JSON.lua")()
JSON = (loadfile "./libs/dkjson.lua")()
serpent = (loadfile "./libs/serpent.lua")()

-- Save the content of _config to config.lua
-- Create a basic config.json file and saves it.
function save_config( )
  serialize_to_file(_config, './data/config.lua')
  print ('./data/config.lua 🌟| تم حفظ البيانات في الـ ')
end

function create_config( )
	io.write('\n\27[1;33m 🌟| ادخل ايدي حسابك لتصبح مطور  : \27[0;39;49m\n')
	local SUDO = tonumber(io.read())
if not tostring(SUDO):match('%d+') then
    SUDO = 373906612
  end
  	io.write('\n\27[1;33m 🌟| ارسل توكن البوت الان  : \27[0;39;49m\n')
	local token = io.read()
  -- A simple config with basic plugins and ourselves as privileged user
  config = {
    enabled_plugins = {
   "plugins",
    "msg_checks",
    "groupmanager",
    "tools",
    "banhammer",
    "replay",
    },
    sudo_users = {60809010, SUDO},--Sudo users
    master_id = SUDO, 
    token_bot = token, 
    disabled_channels = {},
    moderation = {data = './data/moderation.json'},
   info_text = [[*🌟| TH3BOSS  V19*
  
🌟|An advanced administration bot based on *TH3BOSS*

🌟|[TH3BOSS](https://github.com/moody2020/TH3BOSS)

*🌟|Admins :*

_🌟|Developer :_ [TH3BOSS](Telegram.Me/TH3BOSS)

_🌟|Developer :_ [BOSS](Telegram.Me/lBOSSl)

*🌟|Our channel :*

🌟|[TEAMBOSS](Telegram.Me/LLDEV1LL)

*🌟|Our Group Manger :*

[Group Manger](Telegram.Me/lBOSSl)
]],
  }
  serialize_to_file(config, './data/config.lua')
  print('🌟| تم حفظ البيانات في الـكونفك سوف يتم تشغيل البوت')
end


function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesn't exist
  if not f then
print ("\n🌟|  جاري انشاء الكونفك  : \n🌟|  خلي ايديك والتوكن وسوف يتم تشغيل بوتك\n🌟| سورس الزعيم الاصدار 19")  
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("🌟| ايدي المطور :  " .. user)
  end
  return config
end
_config = load_config( )



 if _config then
token_moody = _config.token_bot
master_idx = _config.master_id
else
token_moody = ""
master_idx = 60809010
end


send_api = "https://api.telegram.org/bot"..token_moody
sudo_id = master_idx

cUrl_Command = curl.easy{verbose = true}


function bot_run()
	bot = nil
	while not bot do
		bot = send_req(send_api.."/getMe")
	end
	bot = bot.result
	local runlog = "🌟| معرف بوتك : @"..bot.username.."\n🌟|يعمل على سورس الـزعـيـم  توكن اصدار 19 👮‍♀️\n🌟| تابع قناه السورس @lBOSSl"
	print(runlog)
	send_msg(sudo_id, runlog)
	last_update = last_update or 0
	last_cron = last_cron or os.time()
	startbot = true
	our_id = bot.id
end

function send_req(url)
	local dat, res = https.request(url)
	local tab = JSON.decode(dat)
	if res ~= 200 then return false end
	if not tab.ok then return false end
	return tab
end

function bot_updates(offset)
	local url = send_api.."/getUpdates?timeout=10"
	if offset then
		url = url.."&offset="..offset
	end
	return send_req(url)
end

function load_data(filename)
	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = JSON.decode(s)
	return data
end

function save_data(filename, data)
	local s = JSON.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()
end

function msg_valid(msg)
local msg_time = os.time() - 2
  if msg.date < tonumber(msg_time) then
    print('\27[36m》》رسائل سابقه《《\27[39m')
    return false
end

    return true
end

-- Returns a table with matches or nil
function match_pattern(pattern, text, lower_case)
  if text then
    local matches = {}
    if lower_case then
      matches = { string.match(text:lower(), pattern) }
    else
      matches = { string.match(text, pattern) }
    end
      if next(matches) then
        return matches
      end
  end
  -- nil
end
  plugins = {}
function match_plugins(msg)
  for name, plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end

function match_plugin(plugin, plugin_name, msg)

  -- Go over patterns. If one matches it's enough.
if plugin.pre_process then
        --If plugin is for privileged users only
		local result = plugin.pre_process(msg)
		if result then
			print("pre process: ", plugin_name)
		end
	end
  for k, pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text or msg.caption or msg.query)
    if matches then

      print("الملف :"..plugin_name.." |"..pattern)
      -- Function exists
      if plugin.run then
        -- If plugin is for privileged users only
          local result = plugin.run(msg, matches)
          if result then
            send_msg(msg.chat.id, result, msg.message_id, "md")
           end
        end
    end
  end
end
local function handle_inline_keyboards_cb(msg)
  msg.text = '###cb:'..msg.data
  msg.cb = true
if msg.new_chat_member then
msg.service = true
msg.text = '###new_chat_member'
end
if msg.message then
  msg.old_text = msg.message.text
  msg.old_date = msg.message.date
  msg.message_id = msg.message.message_id
  msg.chat = msg.message.chat
  msg.message_id = msg.message.message_id
  msg.chat = msg.message.chat
else -- if keyboard send via
			msg.chat = {type = 'inline', id = msg.from.id, title = msg.from.first_name}
	msg.message_id = msg.inline_message_id
    end
  msg.cb_id = msg.id
  msg.date = os.time()
  msg.message = nil
  msg.target_id = msg.data:match('.*:(-?%d+)')
  return get_var(msg)
end

-- Returns the config from config.lua file.
-- If file doesn't exist, create it.
function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesn't exist
  if not f then
print ("\n🌟|  جاري انشاء الكونفك :\n🌟|  خلي ايديك والتوكن وسوف يتم تشغيل بوتك\n🌟| سورس الزعيم الاصدار 19") 
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("🌟| ايدي المطور :  " .. user)
  end
  return config
end
_config = load_config( )

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("🌟| الملف شـغـال : ", v)

    local ok, err =  pcall(function()
      local t = loadfile("plugins/"..v..'.lua')()
      plugins[v] = t
    end)

    if not ok then
      print('\27[31mError loading plugin '..v..'\27[39m')
	    print(tostring(io.popen("lua plugins/"..v..".lua"):read('*all')))
      print('\27[31m'..err..'\27[39m')
      return
    end
	end
end

function msg_valid(msg)
	 if msg.date_ < os.time() - 60 then
        print('\27[36mNot valid: old msg\27[39m')
		 return false
	 end
 if is_silent_user(msg.sender_user_id_, msg.chat_id_) then
 del_msg(msg.chat_id_, msg.id_)
    return false
 end
 if is_banned(msg.sender_user_id_, msg.chat_id_) then
 del_msg(msg.chat_id_, tonumber(msg.id_))
     kick_user(msg.sender_user_id_, msg.chat_id_)
    return false
    end
 if is_gbanned(msg.sender_user_id_) then
 del_msg(msg.chat_id_, tonumber(msg.id_))
     kick_user(msg.sender_user_id_, msg.chat_id_)
    return false
       end
    return true
end

function match_pattern(pattern, text, lower_case)
	if text then
		local matches = {}
		if lower_case then
			matches = { string.match(text:lower(), pattern) }
		else
			matches = { string.match(text, pattern) }
		end
		if next(matches) then
			return matches
		end
	end
end

-- Check if plugin is on _config.disabled_plugin_on_chat table
local function is_plugin_disabled_on_chat(plugin_name, receiver)
  local disabled_chats = _config.disabled_plugin_on_chat
  -- Table exists and chat has disabled plugins
  if disabled_chats and disabled_chats[receiver] then
    -- Checks if plugin is disabled on this chat
    for disabled_plugin,disabled in pairs(disabled_chats[receiver]) do
      if disabled_plugin == plugin_name and disabled then
        local warning = '_Plugin_ *'..check_markdown(disabled_plugin)..'* _is disabled on this chat_'
        print(warning)
						tdcli.sendMessage(receiver, "", 0, warning, 0, "md")
        return true
      end
    end
  end
  return false
end

function match_plugin(plugin, plugin_name, msg)
	if plugin.pre_process then
        --If plugin is for privileged users only
		local result = plugin.pre_process(msg)
		if result then
			print("pre process: ", plugin_name)
        -- tdcli.sendMessage(msg.chat_id_, "", 0, result, 0, "md")
		end
	end
	for k, pattern in pairs(plugin.patterns) do
		matches = match_pattern(pattern, msg.text or msg.media.caption)
		if matches then
      if is_plugin_disabled_on_chat(plugin_name, msg.chat_id_) then
        return nil
      end
			print("Message matches: ", pattern..' | Plugin: '..plugin_name)
			if plugin.run then
        if not warns_user_not_allowed(plugin, msg) then
				local result = plugin.run(msg, matches)
					if result then
						tdcli.sendMessage(msg.chat_id_, msg.id_, 0, result, 0, "md")
                 end
					end
			end
			return
		end
	end
end
_config = load_config()
load_plugins()

 function var_cb(msg, data)
  -------------Get Var------------
	bot = {}
	msg.to = {}
	msg.from = {}
	msg.media = {}
	msg.id = msg.id_
	msg.to.type = gp_type(data.chat_id_)
	if data.content_.caption_ then
		msg.media.caption = data.content_.caption_
	end

	if data.reply_to_message_id_ ~= 0 then
		msg.reply_id = data.reply_to_message_id_
    else
		msg.reply_id = false
	end
	 function get_gp(arg, data)
		if gp_type(msg.chat_id_) == "channel" or gp_type(msg.chat_id_) == "chat" then
			msg.to.id = msg.chat_id_
			msg.to.title = data.title_
		else
			msg.to.id = msg.chat_id_
			msg.to.title = false
		end
	end
	tdcli_function ({ ID = "GetChat", chat_id_ = data.chat_id_ }, get_gp, nil)
	function botifo_cb(arg, data)
		bot.id = data.id_
		our_id = data.id_
		if data.username_ then
			bot.username = data.username_
		else
			bot.username = false
		end
		if data.first_name_ then
			bot.first_name = data.first_name_
		end
		if data.last_name_ then
			bot.last_name = data.last_name_
		else
			bot.last_name = false
		end
		if data.first_name_ and data.last_name_ then
			bot.print_name = data.first_name_..' '..data.last_name_
		else
			bot.print_name = data.first_name_
		end
		if data.phone_number_ then
			bot.phone = data.phone_number_
		else
			bot.phone = false
		end
	end
	tdcli_function({ ID = 'GetMe'}, botifo_cb, {chat_id=msg.chat_id_})
	 function get_user(arg, data)
		msg.from.id = data.id_
		if data.username_ then
			msg.from.username = data.username_
		else
			msg.from.username = false
		end
		if data.first_name_ then
			msg.from.first_name = data.first_name_
		end
		if data.last_name_ then
			msg.from.last_name = data.last_name_
		else
			msg.from.last_name = false
		end
		if data.first_name_ and data.last_name_ then
			msg.from.print_name = data.first_name_..' '..data.last_name_
		else
			msg.from.print_name = data.first_name_
		end
		if data.phone_number_ then
			msg.from.phone = data.phone_number_
		else
			msg.from.phone = false
		end
		match_plugins(msg)

	end
	tdcli_function ({ ID = "GetUser", user_id_ = data.sender_user_id_ }, get_user, nil)
-------------End-------------

end

function whoami()
	local usr = io.popen("id -un"):read('*a')
	usr = string.gsub(usr, '^%s+', '')
	usr = string.gsub(usr, '%s+$', '')
	usr = string.gsub(usr, '[\n\r]+', ' ') 
	if usr:match("^root$") then
		tcpath = '/root/.telegram-cli'
	elseif not usr:match("^root$") then
		tcpath = '/home/'..usr..'/.telegram-cli'
	end
end
function file_cb(msg)
	if msg.content_.ID == "MessagePhoto" then
		photo_id = ''
		local function get_cb(arg, data)
			photo_id = data.content_.photo_.sizes_[2].photo_.id_
			tdcli.downloadFile(photo_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageVideo" then
		video_id = ''
		local function get_cb(arg, data)
			video_id = data.content_.video_.video_.id_
			tdcli.downloadFile(video_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageAnimation" then
		anim_id, anim_name = '', ''
		local function get_cb(arg, data)
			anim_id = data.content_.animation_.animation_.id_
			anim_name = data.content_.animation_.file_name_
			 tdcli.downloadFile(anim_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageVoice" then
		voice_id = ''
		local function get_cb(arg, data)
			voice_id = data.content_.voice_.voice_.id_
			tdcli.downloadFile(voice_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageAudio" then
		audio_id, audio_name, audio_title = '', '', ''
		local function get_cb(arg, data)
			audio_id = data.content_.audio_.audio_.id_
			audio_name = data.content_.audio_.file_name_
			audio_title = data.content_.audio_.title_
			tdcli.downloadFile(audio_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageSticker" then
		sticker_id = ''
		local function get_cb(arg, data)
			sticker_id = data.content_.sticker_.sticker_.id_
			tdcli.downloadFile(sticker_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
	elseif msg.content_.ID == "MessageDocument" then
		document_id, document_name = '', ''
		local function get_cb(arg, data)
			document_id = data.content_.document_.document_.id_
			document_name = data.content_.document_.file_name_
			tdcli.downloadFile(document_id, dl_cb, nil)
		end
		tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = msg.id_ }, get_cb, nil)
end
end
function tdcli_update_callback (data)
	whoami()
	if (data.ID == "UpdateNewMessage") then

		local msg = data.message_
		local d = data.disable_notification_
		local chat = chats[msg.chat_id_]
		local hash = 'msgs:'..msg.sender_user_id_..':'..msg.chat_id_
		redis:incr(hash)
		if redis:get('markread') == 'on' then
			tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
    end
		if ((not d) and chat) then
			if msg.content_.ID == "MessageText" then
				do_notify (chat.title_, msg.content_.text_)
			else
				do_notify (chat.title_, msg.content_.ID)
			end
		end

		var_cb(msg, msg)
		file_cb(msg)
	if msg.content_.ID == "MessageText" then
		if msg_valid(msg) then
			msg.text = msg.content_.text_
			msg.edited = false
			msg.pinned = false
		end
	elseif msg.content_.ID == "MessagePinMessage" then
		msg.pinned = true
	elseif msg.content_.ID == "MessagePhoto" then
		msg.photo_ = true 

	elseif msg.content_.ID == "MessageVideo" then
		msg.video_ = true

	elseif msg.content_.ID == "MessageAnimation" then
		msg.animation_ = true

	elseif msg.content_.ID == "MessageVoice" then
		msg.voice_ = true

	elseif msg.content_.ID == "MessageAudio" then
		msg.audio_ = true

	elseif msg.content_.ID == "MessageForwardedFromUser" then
		msg.forward_info_ = true

	elseif msg.content_.ID == "MessageSticker" then
		msg.sticker_ = true

	elseif msg.content_.ID == "MessageContact" then
		msg.contact_ = true
	elseif msg.content_.ID == "MessageDocument" then
		msg.document_ = true

	elseif msg.content_.ID == "MessageLocation" then
		msg.location_ = true
	elseif msg.content_.ID == "MessageGame" then
		msg.game_ = true
	elseif msg.content_.ID == "MessageChatAddMembers" then
		if msg_valid(msg) then
			for i=0,#msg.content_.members_ do
				msg.adduser = msg.content_.members_[i].id_
			end
		end
	elseif msg.content_.ID == "MessageChatJoinByLink" then
		if msg_valid(msg) then
			msg.joinuser = msg.sender_user_id_
		end
	elseif msg.content_.ID == "MessageChatDeleteMember" then
		if msg_valid(msg) then
			msg.deluser = true
		end
	end
	if msg.content_.photo_ then
		return false
	end
	elseif data.ID == "UpdateMessageContent" then  
		cmsg = data
		local function edited_cb(arg, data)
			msg = data
			msg.media = {}
			if cmsg.new_content_.text_ then
				msg.text = cmsg.new_content_.text_
			end
			if cmsg.new_content_.caption_ then
				msg.media.caption = cmsg.new_content_.caption_
			end
			msg.edited = true
			var_cb(msg, msg)
		end
	tdcli_function ({ ID = "GetMessage", chat_id_ = data.chat_id_, message_id_ = data.message_id_ }, edited_cb, nil)
	elseif data.ID == "UpdateFile" then
		file_id = data.file_.id_
	elseif (data.ID == "UpdateChat") then
		chat = data.chat_
		chats[chat.id_] = chat
	elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
		tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)    
	end
end

