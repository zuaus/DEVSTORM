--Begin msg_checks.lua By @TAHAJ20 
local TIME_CHECK = 2
local function anti_flood(msg)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
local flood = data[tostring(chat)]['settings']['flood']
   if msg.from.username then
      user_name = "@"..check_markdown(msg.from.username)
         else
      user_name = check_markdown(msg.from.first_name)
     end
   if flood == "kick" then
if redis:get('sender:'..user..':flood') then
return
else
   del_msg(chat, msg.id)
    kick_user(user, chat)
   if not lang then
  tdcli.sendMessage(chat, msg.id, 0, "_User_ "..user_name.." `[ "..user.." ]` _has been_ *kicked* _because of_ *flooding*", 0, "md")
   elseif lang then
  tdcli.sendMessage(chat, msg.id, 0, "`👁‍🗨￤»  العضو` "..user_name.."\n👁‍🗨￤»  الالايدي *[ "..user.." ]*\n`👁‍🗨￤»  تم طرده بسبب تكرار الرسائل`", 0, "md")
    end
redis:setex('sender:'..user..':flood', 30, true)
      end
   end
   if flood == "silent" then
if redis:get('sender:'..user..':flood') then
return
else
   del_msg(chat, msg.id)
    silent_user(user_name, user, chat)
   if not lang then
  tdcli.sendMessage(chat, msg.id, 0, "_User_ "..user_name.." `[ "..user.." ]` _has been_ *banned* _because of_ *flooding*", 0, "md")
   elseif lang then
  tdcli.sendMessage(chat, msg.id, 0, "`👁‍🗨￤»  العضو` "..user_name.."\n👁‍🗨￤»  الالايدي *[ "..user.." ]*\n`👁‍🗨￤»  تم كتمك بسبب تكرار الرسائل`", 0, "md")
    end
redis:setex('sender:'..user..':flood', 30, true)
      end
   end
end
  
local function pre_process(msg)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
local is_channel = msg.to.type == "channel"
local is_chat = msg.to.type == "chat"
local auto_leave = 'auto_leave_bot'
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
if not redis:get('autodeltime1') then
	redis:setex('autodeltime1', 14400, true)
     run_bash("rm -rf ~/.telegram-cli/data/sticker/*")
     run_bash("rm -rf ~/.telegram-cli/data/photo/*")
     run_bash("rm -rf ~/.telegram-cli/data/animation/*")
     run_bash("rm -rf ~/.telegram-cli/data/video/*")
     run_bash("rm -rf ~/.telegram-cli/data/audio/*")
     run_bash("rm -rf ~/.telegram-cli/data/voice/*")
     run_bash("rm -rf ~/.telegram-cli/data/temp/*")
     run_bash("rm -rf ~/.telegram-cli/data/thumb/*")
     run_bash("rm -rf ~/.telegram-cli/data/document/*")
     run_bash("rm -rf ~/.telegram-cli/data/profile_photo/*")
     run_bash("rm -rf ~/.telegram-cli/data/encrypted/*")
	 run_bash("rm -rf ./data/photos/*")
end
   if is_channel or is_chat then
        local TIME_CHECK = 2
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['time_check'] then
            TIME_CHECK = tonumber(data[tostring(chat)]['settings']['time_check'])
          end
        end
    if msg.text then
  if msg.text:match("(.*)") then
    if not data[tostring(msg.to.id)] and not redis:get(auto_leave) and not is_admin(msg) then
  --tdcli.sendMessage(msg.to.id, "", 0, "_This Is Not One Of My_ *Groups*", 0, "md")
  --tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
      end
   end
end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.link then
		links = settings.link
	else
		links = 'غير مفعل'
	end
	if settings.tag then
		tags = settings.tag
	else
		tags = 'غير مفعل'
	end
	if settings.lock_pin then
		lock_pin = settings.lock_pin
	else
		lock_pin = 'غير مفعل'
	end
	if settings.arabic then
		arabic = settings.arabic
	else
		arabic = 'غير مفعل'
	end
	if settings.mention then
		mentions = settings.mention
	else
		mentions = 'غير مفعل'
	end
		if settings.edit then
		edit = settings.edit
	else
		edit = 'غير مفعل'
	end
		if settings.spam then
		spam = settings.spam
	else
		spam = 'غير مفعل'
	end
	if settings.flood then
		flood = settings.flood
	else
		flood = 'غير مفعل'
	end
	if settings.markdown then
		markdowns = settings.markdown
	else
		markdowns = 'غير مفعل'
	end
	if settings.webpage then
		webpages = settings.webpage
	else
		webpages = 'غير مفعل'
	end
	if settings.chat then
		chats = settings.chat
	else
		chats = 'غير مفعل'
	end
	if settings.gif then
		gifs = settings.gif
	else
		gifs = 'غير مفعل'
	end
   if settings.photo then
		photos = settings.photo
	else
		photos = 'غير مفعل'
	end
	if settings.sticker then
		stickers = settings.sticker
	else
		stickers = 'غير مفعل'
	end
	if settings.contact then
		contacts = settings.contact
	else
		contacts = 'غير مفعل'
	end
	if settings.inline then
		inlines = settings.inline
	else
		inlines = 'غير مفعل'
	end
	if settings.game then
		games = settings.game
	else
		games = 'غير مفعل'
	end
	if settings.text then
		Ltext = settings.text
	else
		Ltext = 'غير مفعل'
	end
	if settings.keyboard then
		keyboards = settings.keyboard
	else
		keyboards = 'غير مفعل'
	end
	if settings.forward then
		forwards = settings.forward
	else
		forwards = 'غير مفعل'
	end
	if settings.view then
		view = settings.view
	else
		view = 'غير مفعل'
	end
	if settings.location then
		locations = settings.location
	else
		locations = 'غير مفعل'
	end
   if settings.document then
		documents = settings.document
	else
		documents = 'غير مفعل'
	end
	if settings.voice then
		voices = settings.voice
	else
		voices = 'غير مفعل'
	end
	if settings.audio then
		audios = settings.audio
	else
		audios = 'غير مفعل'
	end
	if settings.video then
		videos = settings.video
	else
		videos = 'غير مفعل'
	end
	if settings.lock_tgservice then
		lock_tgservice = settings.lock_tgservice
	else
		lock_tgservice = 'غير مفعل'
	end
	if settings.lock_join then
		lock_join = settings.lock_join
	else
		lock_join = 'غير مفعل'
	end
   if msg.from.username then
      username = "@"..check_markdown(msg.from.username)
         else
      username = check_markdown(msg.from.first_name)
     end
   if msg.from.username then
      user_name = "@"..msg.from.username
         else
      user_name = msg.from.first_name
     end
  if msg.adduser or msg.joinuser or msg.deluser then
  if lock_tgservice == "yes" then
del_msg(chat, tonumber(msg.id))
  end
end
 if not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) and msg.from.id ~= our_id then
	if msg.adduser or msg.joinuser then
		if lock_join == "yes" then
			function join_kick(arg, data)
				kick_user(data.id_, msg.to.id)
			end
			if msg.adduser then
				tdcli.getUser(msg.adduser, join_kick, nil)
			elseif msg.joinuser then
				tdcli.getUser(msg.joinuser, join_kick, nil)
			end
		end
	end
end
   if msg.pinned and is_channel then
  if lock_pin == "yes" then
     if is_owner(msg) then
      return
     end
     if tonumber(msg.from.id) == our_id then
      return
     end
    local pin_msg = data[tostring(chat)]['pin']
      if pin_msg then
  tdcli.pinChannelMessage(msg.to.id, pin_msg, 1)
       elseif not pin_msg then
   tdcli.unpinChannelMessage(msg.to.id)
          end
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<b>الالايدي :</b> '..msg.from.id..'\n<b>المعرف :</b> '..('@'..msg.from.username or '<i>لا يوجد معرف</i>')..'\n<i>تثبيت الرسائل مقفل من المدراء 🔐</i>', 0, "html")
     elseif not lang then
    tdcli.sendMessage(msg.to.id, msg.id, 0, '<b>User ID :</b> '..msg.from.id..'\n<b>Username :</b> '..('@'..msg.from.username or '<i>No Username</i>')..'\n<i>You Have Not Permission To Pin Message, Last Message Has Been Pinned Again</i>', 0, "html")
          end
      end
  end
      if not is_mod(msg) and msg.from.id ~= our_id and not is_whitelist(msg.from.id, msg.to.id) then
if msg.edited then
if edit == "بالتحذير" then
  local offender = 'edit_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع التعديل هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Editing Message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of editing message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع التعديل هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not Editing messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif edit == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif edit == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع التعديل تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Editing message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of editing message</i>', 0, "html")
          end
elseif edit == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤»️ ممنوع التعديل هنا تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Editing message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of editing message</i>', 0, "html")
       end
   end
end
if msg.forward_info_ then
if forwards == "بالتحذير" then
  local offender = 'forward_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اعادة التوجيه هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding Message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of forwarding message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اعادة التوجيه هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not Forwarding messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif forwards == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif forwards == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اعادة توجيه تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of forwarding message</i>', 0, "html")
          end
elseif forwards == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اعادة توجيه هنا تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of forwarding message</i>', 0, "html")
       end
   end
end
if tonumber(msg.views_) ~= 0 then
if view == "بالتحذير" then
  local offender = 'view_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اوسال توجيه القنواة هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding from channel not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of forwarding from channel</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اوسال توجيه القنواة هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not Forwarding from channel</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif view == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif view == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اوسال توجيه القنواة تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding from Channel not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of forwarding from channel</i>', 0, "html")
          end
elseif view == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع اوسال توجيه القنواة تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Forwarding from Channel not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of forwarding from channel</i>', 0, "html")
       end
   end
end
if msg.photo_ then
if photos == "بالتحذير" then
  local offender = 'photo_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصور هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Photos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send photo</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصور هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Photos</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif photos == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif photos == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال صور تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Photos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send photo</i>', 0, "html")
          end
elseif photos == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصور تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Photos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send photo</i>', 0, "html")
       end
   end
end
    if msg.video_ then
if videos == "بالتحذير" then
  local offender = 'video_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الفيديو هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Videos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send video</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الفيديو هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Videos</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif videos == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif videos == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الفيديو تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Videos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send video</i>', 0, "html")
          end
elseif videos == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الفيديو تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Videos not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send videos</i>', 0, "html")
       end
   end
end
    if msg.document_ then
if documents == "بالتحذير" then
  local offender = 'document_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Documents not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send document</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Documents</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif documents == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif documents == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملفات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Documents not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send document</i>', 0, "html")
          end
elseif documents == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملفات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Documents not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send document</i>', 0, "html")
       end
   end
end
    if msg.sticker_ then
if stickers == "بالتحذير" then
  local offender = 'sticker_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملصقات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Stickers not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send sticker</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملصقات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Stickers</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif stickers == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif stickers == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملصقات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Stickers not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send sticker</i>', 0, "html")
          end
elseif stickers == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الملصقات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Stickers not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send sticker</i>', 0, "html")
       end
   end
end
    if msg.animation_ then
if gifs == "بالتحذير" then
  local offender = 'gif_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال صور المتحركة هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Gifs not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send gif</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال صور المتحركة هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Gifs</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif gifs == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif gifs == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال صورمتحركة تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Gifs not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send gif</i>', 0, "html")
          end
elseif gifs == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال صور متحركة تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Gifs not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send gif</i>', 0, "html")
       end
   end
end
    if msg.contact_ then
if contacts == "بالتحذير" then
  local offender = 'contact_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال جهات اتصال هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Contacts not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send contact</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال جهات اتصال هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Contacts</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif contacts == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif contacts == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال جهات اتصال تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Contacts not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send contact</i>', 0, "html")
          end
elseif contacts == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال جهات اتصال تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Contacts not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send contact</i>', 0, "html")
       end
   end
end
    if msg.location_ then
if locations == "بالتحذير" then
  local offender = 'location_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المواقع هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Location not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send location</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المواقع هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Location</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif locations == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif locations == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المواقع تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Location not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send location</i>', 0, "html")
          end
elseif locations == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المواقع تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Location not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send location</i>', 0, "html")
       end
   end
end
    if msg.voice_ then
if voices == "بالتحذير" then
  local offender = 'voice_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Voice not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send voice</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Voice</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif voices == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif voices == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>👁‍🗨￤» العضو : </i> '..user_name..' \n<i>👁‍🗨￤» الايدي :</i> <b>'..user..'</b>\n??‍🗨￤» ممنوع ارسال التسجيلات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Voice not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send voice</i>', 0, "html")
          end
elseif voices == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال التسجيلات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Voice not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send voice</i>', 0, "html")
       end
   end
end
   if msg.content_ then
  if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
if keyboards == "بالتحذير" then
  local offender = 'keyboard_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال كيبورد هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Keyboard not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send keyboard</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال كيبورد هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Keyboard</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif keyboards == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif keyboards == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال كيبورد تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Keyboard not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send keyboard</i>', 0, "html")
          end
elseif keyboards == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال كيبورد تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Keyboard not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send keyboard</i>', 0, "html")
         end
      end
   end
end
    if tonumber(msg.via_bot_user_id_) ~= 0 then
if inlines == "بالتحذير" then
  local offender = 'inline_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال اللستات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Inline not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send inline</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال اللستات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Inline</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif inlines == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif inlines == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال اللستات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Inline not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send inline</i>', 0, "html")
          end
elseif inlines == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال اللستات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Inline not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send inline</i>', 0, "html")
       end
   end
end
    if msg.game_ then
if games == "بالتحذير" then
  local offender = 'game_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الالعاب هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Games not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send game</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الالعاب هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Games</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif games == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif games == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الالعاب تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Games not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send game</i>', 0, "html")
          end
elseif games == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الالعاب تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Games not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send game</i>', 0, "html")
       end
   end
end
    if msg.audio_ then
if audios == "بالتحذير" then
  local offender = 'audio_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Audios not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send audio</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Audios</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif audios == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif audios == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Audios not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of send audio</i>', 0, "html")
          end
elseif audios == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الصوتيات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Audios not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of send audio</i>', 0, "html")
       end
   end
end
if msg.media.caption then
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Tt][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][mM][.][Mm][Ee]/")
if link_caption then
if links == "بالتحذير" then
  local offender = 'link_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of link posting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send link messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif links == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif links == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of link posting</i>', 0, "html")
          end
elseif links == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of link posting</i>', 0, "html")
       end
   end
end
local tag_caption = msg.media.caption:match("@")("#")("/")("!")
if tag_caption then
if tags == "بالتحذير" then
  local offender = 'tag_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of Tags posting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send tags messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif tags == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif tags == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of tags posting</i>', 0, "html")
          end
elseif tags == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of tags posting</i>', 0, "html")
       end
   end
end
if is_filter(msg, msg.media.caption) then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
    end
local arabic_caption = msg.media.caption:match("[\216-\219][\128-\191]")
if arabic_caption then
if arabic == "بالتحذير" then
  local offender = 'arabic_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال حروف عربية هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of arabic message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال حروف عربية هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Arabic messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif arabic == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif arabic == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال العربية تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of arabic message</i>', 0, "html")
          end
elseif arabic == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال العربية تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of Arabic message</i>', 0, "html")
         end
      end
   end
end
if msg.text then
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
        local max_chars = 4000
        if data[tostring(msg.to.id)] then
          if data[tostring(msg.to.id)]['settings']['set_char'] then
            max_chars = tonumber(data[tostring(msg.to.id)]['settings']['set_char'])
          end
        end
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			local max_real_digits = tonumber(max_chars) * 50
			local max_len = tonumber(max_chars) * 51
			if string.len(msg.text) > max_len or ctrl_chars > max_chars or real_digits > max_real_digits then
if spam == "بالتحذير" then
  local offender = 'spam_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الكلايش مقفول هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Spam Message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of spam message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الكلايش مقفول هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Spam messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif spam == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif spam == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الكلايش مقفول تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Spam message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of spam message</i>', 0, "html")
          end
elseif spam == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤»️ ممنوع ارسال الكلايش مقفول تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Spam message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of spam message</i>', 0, "html")
          end
       end
   end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg then
if links == "بالتحذير" then
  local offender = 'link_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of link posting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send link messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif links == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif links == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of link posting</i>', 0, "html")
          end
elseif links == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الروابط تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Link posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of link posting</i>', 0, "html")
       end
   end
end
local tag_msg = msg.text:match("@")
if tag_msg then
if tags == "بالتحذير" then
  local offender = 'tag_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of Tags posting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send tags messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif tags == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif tags == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of tags posting</i>', 0, "html")
          end
elseif tags == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المعرفات تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Tags posting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of tags posting</i>', 0, "html")
       end
   end
end
if is_filter(msg, msg.text) then
 if is_channel then
 del_msg(chat, tonumber(msg.id))
  elseif is_chat then
kick_user(user, chat)
      end
    end
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg then
if arabic == "بالتحذير" then
  local offender = 'arabic_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال حروف عربية هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of arabic message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال حروف عربية هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Arabic messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif arabic == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif arabic == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال العربية تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of arabic message</i>', 0, "html")
          end
elseif arabic == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال العربية تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Arabic not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of Arabic message</i>', 0, "html")
       end
   end
end
if msg.text:match("(.*)") then
if Ltext == "بالتحذير" then
  local offender = 'text_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال الدردشه مقفله هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Text Message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of text message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال الدردشه مقفله هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Text messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif Ltext == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif Ltext == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال الدردشه مقفله تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Text message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of text message</i>', 0, "html")
          end
elseif Ltext == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال الدردشه مقفله تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Text message not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of Text message</i>', 0, "html")
          end
       end
   end
end
if chats == "بالتحذير" then
  local offender = 'chat_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال المجموعه  مقفلة', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Chatting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of chatting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال المجموعه  مقفلة', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not chatting into group</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif chats == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif chats == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال المجموعه  مقفلة تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Chatting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of chatting</i>', 0, "html")
          end
elseif chats == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع الارسال المجموعه  مقفلة تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Chatting not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of chatting</i>', 0, "html")
       end
   end
if msg.content_.entities_ and msg.content_.entities_[0] then
    if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
if mentions == "بالتحذير" then
  local offender = 'mention_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المنشن هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Mention not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of mention message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المنشن هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Mention messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif mentions == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif mentions == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال المنشن تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Mention not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of mention message</i>', 0, "html")
          end
elseif mentions == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤»️ ممنوع ارسال المنشن تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Mention not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of mention message</i>', 0, "html")
       end
   end
end
  if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if webpages == "بالتحذير" then
  local offender = 'webpage_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال روابط المواقع هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Webpage not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of webpage posting</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال روابط المواقع هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Webpage</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif webpages == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif webpages == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال روابط المواقع تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Webpage not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of webpage posting</i>', 0, "html")
          end
elseif webpages == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال روابط المواقع تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Webpage not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of webpage posting</i>', 0, "html")
       end
   end
end
  if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
if markdowns == "بالتحذير" then
  local offender = 'markdown_offender:'..msg.to.id
  local is_offender = redis:sismember(offender, msg.from.id)
  if is_offender then
 del_msg(chat, tonumber(msg.id))
redis:srem(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الماركداون هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Markdown not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of markdown message</i>', 0, "html")
          end
  elseif not is_offender then
 del_msg(chat, tonumber(msg.id))
redis:sadd(offender, user)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الماركداون هنا', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Do not send Markdown messages</i>\n<i>User</i> '..user_name..' '..user..' <i>this is warning, next time you will be kick</i>', 0, "html")
        end
   end
elseif markdowns == "بالحذف" then
 del_msg(chat, tonumber(msg.id))
elseif markdowns == "بالطرد" then
del_msg(chat, tonumber(msg.id))
 kick_user(user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الماركداون تم طردك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Markdown not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been kicked because of markdown message</i>', 0, "html")
          end
elseif markdowns == "بالكتم" then
del_msg(chat, tonumber(msg.id))
 silent_user(username, user, chat)
    if lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '👁‍🗨￤» العضو : '..user_name..' \n👁‍🗨￤» الايدي : '..user..'\n👁‍🗨￤» ممنوع ارسال الماركداون تم كتمك', 0, "html")
     elseif not lang then
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<i>Markdown not allowed here</i>\n<i>User</i> '..user_name..' '..user..' <i>has been banned because of markdown message</i>', 0, "html")
          end
       end
    end
 end
if msg.to.type ~= 'pv' and not is_mod(msg) and not msg.adduser and msg.from.id ~= our_id and not is_whitelist(msg.from.id, msg.to.id) then
  if msg.from.id then
    local hash = 'user:'..user..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MAX = 5
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['num_msg_max'] then
            NUM_MSG_MAX = tonumber(data[tostring(chat)]['settings']['num_msg_max'])
          end
        end
    if msgs > NUM_MSG_MAX then
     anti_flood(msg)
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
               end
           end
      end
   end
end
return {
	patterns = {},
	pre_process = pre_process
}
--End msg_checks.lua--
