

local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return ' *You are not bot admin*'
else
return '*أانــتٰ لسَُـــتٰ أدُمَُـــٰن ⚜ 👁‍*'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '*Group is already added*'
else
 return '⛤￤الــمجمــوعــه\n⛤￤{ '..msg.to.title..'}\n⛤￤المجموعه بالتاكيد تم تفعيلها'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'yes',
          lock_markdown = 'yes',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
          welcome = 'yes',
          },
   mutes = {
                  mute_fwd = 'yes',
                  mute_audio = 'yes',
                  mute_video = 'yes',
                  mute_contact = 'yes',
                  mute_text = 'no',
                  mute_photos = 'yes',
                  mute_gif = 'yes',
                  mute_loc = 'no',
                  mute_doc = 'yes',
                  mute_sticker = 'yes',
                  mute_voice = 'yes',
                   mute_all = 'no',
				   mute_keyboard = 'yes'
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '*Group has been added*'
else
return '⛤￤الــمجمــوعــه\n⛤￤{ '..msg.to.title..'}\n⛤￤تــم تفــعيل الــمجموعــه\nٴ❖••••••••••❂••••••••••❖\n📌┊بواسطه : @'..msg.from.username..'\n'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '*You are not bot admin*'
   else
        return '*أانــتٰ لسَُـــتٰ أدُمَُـــٰن ⚜ 👁‍*'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '*Group is not added*'
else
    return '📛 ¦ تم تعطيل البوت بالفعل ✅'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*Group has been removed*'
 else
 return '📛 ¦ تم تعطيل البوت في المجموعة ✅'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return " *Word* _"..word.."\n_⛥*is already filtered *"
            else
   return  "⛥┋الــكلمه { "..word.." }\n⛥┋ بــالفعــل تـم منعـــها"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return " *Word* _"..word.."_ *added to filtered words list *"
            else
   return  "⛥┋الــكلمه { "..word.." }\n⛥┋تــم منـعهـا"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return " *Word* _"..word.."_ *removed from filtered words list* "
       elseif lang then
  return  "⛥┋الــكلمه { "..word.." }\n⛥┋ بــالفعــل تـم الغــاء منعــها"
     end
      else
       if not lang then
         return " *Word* _"..word.."_ *is not filtered *"
       elseif lang then
      return  "⛥┋الــكلمه { "..word.." }\n⛥┋تــم الغــاء منعــها"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "*Group is not added *"
 else
    return  "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "* No moderator in this group*"
else
return  "⚜┋ لْٰا  يَٰـو૭وجًِّـدِٰ ادِٰمٍٰنٍٰيَٰـه  ⁞❉💥"
  end
end
if not lang then
   message = '*List of moderators :*\n'
else
   message = '\n `📇￤الادمنـــيه`\n\n`❖••••••••❂••••••••❖`\n\n'
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end


local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return " *Group is not added *"
else
return  "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return " *No owner in this group *"
else
return  "⚜┋ لْٰا يَٰـو૭وجًِّـدِٰ  مٍٰدِٰرِٰاء  ℡ ̇₎ ✨"
  end
end
if not lang then
   message = ' *List of moderators :*\n'
else
   message = '\n `💳￤المـــدراء`\n`❖••••••••❂••••••••❖`\n\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*Group is not added *", 0, "md")
else
return tdcli.sendMessage(data.chat_id_, "", 0, "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷", 0, "md")
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
   return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is already a group owner', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ بٌِٰـالْٰفِٰـعلْٰ  هو  مٍٰدِٰيَٰـﮧرِٰ  ✨ _', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is now the group owner*', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه مٍٰدِٰيَٰـﮧرِٰ  ℡💜_', 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is already a moderator*', 0, "md")
else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ ابٌِٰـالْٰفِٰـعلْٰ هو૭  ادِٰمٍٰنٍٰ  ♛ֆ₎  _', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *has been promoted*', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه ادِٰمٍٰنٍٰ  ♛ֆ₎_', 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is not a group owner*', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه 📛_', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ is no longer a group owner *', 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰدِٰيَٰـﮧرِٰ  ⛥_', 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is not a moderator*', 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _ابٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ✿⇣_', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *has been demoted *', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ادِٰمٍٰنٍٰ  ⁞⚡️_', 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "ايدي" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*👨┋لم يتم العثور عليه *", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*المــستخدم لا يوجـــد 💻*", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, " *Group is not added _", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is already a group owner', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ بٌِٰـالْٰفِٰـعلْٰ  هو  مٍٰدِٰيَٰـﮧرِٰ  ✨ _', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is now the group owner*', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه مٍٰدِٰيَٰـﮧرِٰ  ℡💜_', 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
   return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is already a moderator*', 0, "md")
else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ ابٌِٰـالْٰفِٰـعلْٰ هو૭  ادِٰمٍٰنٍٰ  ♛ֆ₎  _', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *has been promoted*', 0, "md")
   else
   return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه ادِٰمٍٰنٍٰ  ♛ֆ₎_', 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is not a group owner*', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _بٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه 📛_', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ is no longer a group owner *', 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰدِٰيَٰـﮧرِٰ  ⛥_', 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *is not a moderator*', 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _ابٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ✿⇣_', 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _User_ ['..user_name..']\n⛥┇ _ ID _*['..data.id_..']*\n⛥┇ *has been demoted *', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ادِٰمٍٰنٍٰ  ⁞⚡️_', 0, "md")
   end 
end 
   if cmd == "id" then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md") 
end 
    if cmd == "res" then 
    if not lang then 
     text = "Result for [ ".. check_markdown(data.type_.user_.username_) .." ] :\n" 
    .. "".. check_markdown(data.title_) .."\n" 
    .. " [".. data.id_ .."]" 
  else 
     text = "النتيجه هي [".. check_markdown(data.type_.user_.username_) .." ] :\n" 
    .. "".. check_markdown(data.title_) .."\n" 
    .. " [".. data.id_ .."]" 
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md') 
      end 
   end 
else 
    if lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👨┋لم يتم العثور عليه *", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*المــستخدم لا يوجـــد 💻*", 0, "md") 
      end 
   end 
end 

local function action_by_id(arg, data) 
local hash = "gp_lang:"..arg.chat_id 
local lang = redis:get(hash) 
local cmd = arg.cmd 
    local administration = load_data(_config.moderation.data) 
  if not administration[tostring(arg.chat_id)] then 
  if not lang then 
    return tdcli.sendMessage(data.chat_id_, "", 0, "_Group is not added_", 0, "md") 
else 
    return tdcli.sendMessage(data.chat_id_, "", 0, "🤖 ¦ تم تعطيل البوت في المجموعة ✅", 0, "md") 
     end 
  end 
if not tonumber(arg.user_id) then return false end 
   if data.id_ then 
if data.first_name_ then 
if data.username_ then 
user_name = '@'..check_markdown(data.username_) 
else 
user_name = check_markdown(data.first_name_) 
end 
  if cmd == "setowner" then 
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *group owner*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ بٌِٰـالْٰفِٰـعلْٰ  هو  مٍٰدِٰيَٰـﮧرِٰ  ✨ _', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group owner*", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه مٍٰدِٰيَٰـﮧرِٰ  ℡💜_', 0, "md")
   end 
end 
  if cmd == "promote" then 
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already a_ *moderator*", 0, "md") 
else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_ ابٌِٰـالْٰفِٰـعلْٰ هو૭  ادِٰمٍٰنٍٰ  ♛ֆ₎  _', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *promoted*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇_تّٰـمٍٰ تّٰـرِٰقٍٰيَٰـﮧتّٰـه ادِٰمٍٰنٍٰ  ♛ֆ₎_', 0, "md")
   end 
end 
   if cmd == "remowner" then 
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *group owner*", 0, "md") 
   else 
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _ابٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ✿⇣_', 0, "md") 
      end 
   end 
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer a_ *group owner*", 0, "md") 
    else 
return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه  مٍٰدِٰيَٰـﮧرِٰ  ⛥_', 0, "md") 
   end 
end 
   if cmd == "demote" then 
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then 
    if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not a_ *moderator*", 0, "md") 
    else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _ابٌِٰـالْٰفِٰـعلْٰ تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ✿⇣_', 0, "md")
   end 
  end 
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil 
    save_data(_config.moderation.data, administration) 
   if not lang then 
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *demoted*", 0, "md") 
   else 
    return tdcli.sendMessage(arg.chat_id, "", 0, '⛥┇ _العضو _'..user_name..']\n⛥┇ _ الايدي _*['..data.id_..']*\n⛥┇ _تّٰـمٍٰ تّٰـنٍٰزًَيَٰـﮧلْٰه ادِٰمٍٰنٍٰ  ⁞⚡️_', 0, "md")
   end 
end 
    if cmd == "معلومات" then 
if data.username_ then 
username = '@'..check_markdown(data.username_) 
else 
if not lang then 
username = '*not found*' 
 else 
username = '*المــستخدم لا يوجـــد 💻*' 
  end 
end 
     if not lang then 
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Info for [ '..data.id_..' ] :\nUserName : '..username..'\nName : '..data.first_name_, 1) 
   else 
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'المعلومات 🎄 ['..data.id_..' ] :\n معرفه 🎌 :@'..username..'\nالاســم 🎈: '..data.first_name_, 1) 
      end 
   end 
 else 
    if not lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "_👨┋لم يتم العثور عليه ed_", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "المــستخدم لا يوجـــد 💻", 0, "md") 
    end 
  end 
else 
    if lang then 
  return tdcli.sendMessage(arg.chat_id, "", 0, "المــستخدم لا يوجـــد 💻", 0, "md") 
   else 
  return tdcli.sendMessage(arg.chat_id, "", 0, "*👨┋لم يتم العثور عليه *", 0, "md") 
      end 
   end 
end 

---------------قفل الروابط-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "*Link* _Posting Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الروابـــط \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Link* _Posting Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل الـــروابـــط \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "للمشرفين فقط!!"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "*Link* _Posting Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الروابـــط \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Link* _Posting Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح الـــروابـــط \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "*Tag* _Posting Is Already Locked_"
elseif lang then
 return " ⛥┇بالفعـل تـم قفــل الـــتـــاك \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Tag* _Posting Has Been Locked_"
else
 return " ⛥┇تــــــم قفـــــــل الـــتـــاك \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "*Tag* _Posting Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـــتـــاك \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Tag* _Posting Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح الـــتـــاك \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "*Mention* _Posting Is Already Locked_"
elseif lang then
 return " ⛥┇بالفعـل تـم قفــل التذكيـــر \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "*Mention* _Posting Has Been Locked_"
else 
 return " ⛥┇تــــــم قفــــل التذكير \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "*Mention* _Posting Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح التذكيـــر \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Mention* _Posting Has Been Unlocked_" 
else
return "🎗┇ تـم فتـح التذكيـــر \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "*Arabic/Persian* _Posting Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل العربيـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Arabic/Persian* _Posting Has Been Locked_"
else
 return "⛥┇تــــــم قفــــل العربيــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "*Arabic/Persian* _Posting Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح العربيـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Arabic/Persian* _Posting Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح العربيــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end     

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "*Editing* _Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل التـــعديـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Editing* _Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل التـــعديـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "*Editing* _Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح التـــعديـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Editing* _Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح التـــعديـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "*Spam* _Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــكلايـــش \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Spam* _Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل الـــكلايـــش \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "*Spam* _Posting Is Not Locked_" 
elseif lang then
 return "🎗┇بالفعـل تـم فتـح الـــكلايـــش \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "*Spam* _Has been unlocked_" 
elseif lang then
 return "🎗┇تــــــم فتــــح الـــكلايـــش \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "*Flooding* _Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــتكـــرار \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Flooding* _Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل الـــتكـــرار \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "*Flooding* _Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـــتكـــرار \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Flooding* _Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح الـــتكـــرار \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "*Bots* _Protection Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل البوتـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Bots* _Protection Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الــبوتات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "*Bots* _Protection Is Not Enabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح البوتـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Bots* _Protection Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الــبوتــات\n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "*Markdown* _Posting Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الماركـــون \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Markdown* _Posting Has Been Locked_"
else
 return "⛥┇تــــــم قفــــل الماركــدون \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "*Markdown* _Posting Is Not Locked_"
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـماركدون \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Markdown* _Posting Has Been Unlocked_"
else
return "🎗┇تــــــم فتــــح الماركــدون \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "*Webpage* _Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الصفـحــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Webpage* _Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل الــصفحات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "*Webpage* _Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الصفـحــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Webpage* _Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح الــصفحات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "*Pinned Message* _Is Already Locked_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل التـــثبـيـــت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Pinned Message* _Has Been Locked_"
else
 return "⛥┇تــــــم قفـــــــل التـــثبـيـــت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "*Pinned Message* _Is Not Locked_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح التـــثبـيـــت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Pinned Message* _Has Been Unlocked_" 
else
return "🎗┇تــــــم فتــــح التـــثبـيـــت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"

end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "_You're Not_ *Moderator*"
else
  return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "no"		
 end
 end
 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'ليس محدود!'
else
	expire_date = 'Unlimited!'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' يوم'
else
	expire_date = day..' Days'
end
end
if not lang then

local settings = data[tostring(target)]["settings"] 
 text = "ارسل اعدادات المجموعة لعرض اعدادات المجموعة ☑️"
else
local settings = data[tostring(target)]["settings"] 
 text = "ارسل اعدادات المجموعة لمعرفة اعدادات المجموعة ☑"
end
return text
end
--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "_You're Not_ *Moderator*" 
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "*Mute All* _Is Already Enabled_" 
elseif lang then
return "⛥┇بالفعـل تـم قفــل الـــكـــل\n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute All* _Has Been Enabled_" 
else
return "⛥┇تــــــم قفـــــــل الـــكـــل\n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "_You're Not_ *Moderator*" 
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "*Mute All* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـــكـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute All* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الـــكـــل \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "*Mute Gif* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل المـــتحركـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "*Mute Gif* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل المـــتحركـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "*Mute Gif* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح المـــتحركـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Gif* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح المـــتحركـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "*Mute Game* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الالعــاب \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Game* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفــــل الالــعاب \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "*Mute Game* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الالعــاب \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*Mute Game* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الالــعاب\n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "*Mute Inline* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الاونلايــن \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Inline* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفــــل الاونلايــن \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "*Mute Inline* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الاونلايــن \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Inline* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الاونلايــن \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "*Mute Text* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــدردشـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Text* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الـــدردشـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "*Mute Text* _Is Already Disabled_"
elseif lang then
return "🎗┇بالفعـل تـم فتـح الكتابــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Text* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الـــدردشـــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "*Mute Photo* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــصـــور \n🔹➖➖➖➖➖➖➖🔸\n👁‍🗨┇تابع > @TEAMSTORM "
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Photo* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الـــصـــور \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "*Mute Photo* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـــصـــور \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Photo* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الـــصـــور \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "*Mute Video* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الفـــيديـــو \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "*Mute Video* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الفـــيديـــو \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "*Mute Video* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الفـــيديـــو \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Video* _Has Been Disabled_" 
else
return "🎗┇تـم فتـح الفـــيديـــو \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "*Mute Audio* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الصـــوت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Audio* _Has Been Enabled_"
else 
return "⛥┇تــــــم قفـــــــل الصـــوت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "*Mute Audio* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الصـــوت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*Mute Audio* _Has Been Disabled_"
else
return "🎗┇تــــــم فتــــح الصـــوت \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "*Mute Voice* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الاغـــانـــي \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Voice* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الاغـــانـــي \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "*Mute Voice* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الاغـــانـــي \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*Mute Voice* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الاغـــانـــي \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "*Mute Sticker* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــملصـــقـات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Sticker* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الـــملصـــقـات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "*Mute Sticker* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الــصفحات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*Mute Sticker* _Has Been Disabled_"
else
return "🎗┇تــــــم فتــــح الـــملصـــقـات\n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "*Mute Contact* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــجهـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Contact* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الـــجهـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "*Mute Contact* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح الـــجهـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Contact* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الـــجهـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "للمشرفين فقط!!"
end
end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "*Mute Forward* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الـــتوجـــيه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Forward* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الـــتوجـــيه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "*Mute Forward* _Is Already Disabled_"
elseif lang then
return "??┇بالفعـل تـم فتـح الـــتوجـــيه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*Mute Forward* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الـــتوجـــيه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "*Mute Location* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الــمواقع \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "*Mute Location* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل الــمواقع \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "*Mute Location* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح المواقـــع \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Location* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح الــمواقع \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "*Mute Document* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل المـــلفـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Document* _Has Been Enabled_"
else
 return "⛥┇تــــــم قفـــــــل المـــلفـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "*Mute Document* _Is Already Disabled_" 
elseif lang then
return "🎗┇بالفعـل تـم فتـح المـــلفـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Document* _Has Been Disabled_" 
else
return "🎗┇تــــــم فتــــح المـــلفـــات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "*Mute TgService* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الاشـــعارات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute TgService* _Has Been Enabled_"
else
return "⛥┇تــــــم قفـــــــل الاشـــعارات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "*Mute TgService* _Is Already Disabled_"
elseif lang then
return "🎗┇بالفعـل تـم فتـح الاشـــعارات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute TgService* _Has Been Disabled_"
else
return "🎗┇تــــــم فتــــح الاشـــعارات \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "*Mute Keyboard* _Is Already Enabled_"
elseif lang then
 return "⛥┇بالفعـل تـم قفــل الكتابــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
else
 data[tostring(target)]["mutes"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute Keyboard* _Has Been Enabled_"
else
return "⛥┇تــــــم قفــــل الكتابــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end 
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "*Mute Keyboard* _Is Already Disabled_"
elseif lang then
return "🎗┇بالفعـل تـم فتـح الكتابــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n" 
end 
else 
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*Mute Keyboard* _Has Been Disabled_"
else
return "🎗┇تــــــم فتــــح الكتابــه \n`•••⛥•••••❂•••••⛥•••`\n👨‍💻┇بواسطة :  @"..msg.from.username.."\n"
end 
end
end
----------MuteList---------
local function mutes(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "_You're Not_ *Moderator*"	
else
 return "⛥┇ انــت لســــت ادمــــن 💢🚸"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_keyboard"] then			
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"		
end
end
if not lang then
local mutes = data[tostring(target)]["mutes"] 
 text = " *Group Mute List* : \n_Mute all : _ *"..mutes.mute_all.."*\n_Mute gif :_ *"..mutes.mute_gif.."*\n_Mute text :_ *"..mutes.mute_text.."*\n_Mute inline :_ *"..mutes.mute_inline.."*\n_Mute game :_ *"..mutes.mute_game.."*\n_Mute photo :_ *"..mutes.mute_photo.."*\n_Mute video :_ *"..mutes.mute_video.."*\n_Mute audio :_ *"..mutes.mute_audio.."*\n_Mute voice :_ *"..mutes.mute_voice.."*\n_Mute sticker :_ *"..mutes.mute_sticker.."*\n_Mute contact :_ *"..mutes.mute_contact.."*\n_Mute forward :_ *"..mutes.mute_forward.."*\n_Mute location :_ *"..mutes.mute_location.."*\n_Mute document :_ *"..mutes.mute_document.."*\n_Mute TgService :_ *"..mutes.mute_tgservice.."*\n_Mute Keyboard :_ *"..mutes.mute_keyboard.."*\n*____________________*\n*Group Language* : `EN`"
else
local mutes = data[tostring(target)]["mutes"] 
 text = " *اعدادات الوسائط ⛥* : \n_الكل 🎵 : _ *"..mutes.mute_all.."*\n_المتحركه 🎵:_ *"..mutes.mute_gif.."*\n_الدردشه 🎵:_ *"..mutes.mute_text.."*\n_الاونلاين 🎵 :_ *"..mutes.mute_inline.."*\n_الالعاب 🎵 :_ *"..mutes.mute_game.."*\n_الصور 🎵:_ *"..mutes.mute_photo.."*\n_الفيديو 🎵:_ *"..mutes.mute_video.."*\n_الصوت 🎵:_ *"..mutes.mute_audio.."*\n_الاغاني 🎵 :_ *"..mutes.mute_voice.."*\n_الملصقات 🎵 :_ *"..mutes.mute_sticker.."*\n_الجهات 🎵 :_ *"..mutes.mute_contact.."*\n_التوجيه 🎵 :_ *"..mutes.mute_forward.."*\n_المواقع 🎵:_ *"..mutes.mute_location.."*\n_الملفات 🎵:_ *"..mutes.mute_document.."*\n_الاشعارات 🎵:_ *"..mutes.mute_tgservice.."*\n*____________________*\n_لغة المجموعة ⛥_ : `العربيه`"
end
return text
end

local function TAHAJ20DEVSTORM(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
if msg.to.type ~= 'pv' then
if matches[1] == "id" or matches[1]=="ايدي" or matches[1]=="Id" or matches[1]=="ايد"then
if not matches[2] and not msg.reply_id then
if is_sudo(msg) then 
  rank = 'المطور  🔱' 
 elseif is_owner(msg) then 
  rank = 'مدير الكروب 🗿' 
 elseif is_mod(msg) then 
  rank = 'ادمن الكروب ⛥' 
 else 
  rank = 'عضو بس 👦' 
 end
local function getpro(arg, data)
 if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"Group Name : "..(check_markdown(msg.to.title)).."\nGroup ID : "..msg.to.id.."\nName : "..(check_markdown(msg.from.first_name or "----"))..'\n masg 💭 '..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).."\nUserName : @"..(msg.from.username or "").."\nUser ID : "..msg.from.id.."",dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'\n⛤┋ايديك : '..msg.sender_user_id_..'\n⛤┋معرفك : @'..(msg.from.username or '----')..'\n⛤┋رسائلك : '..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)..'\n⛤┋موقعك : '..rank..'\n',msg.id_,msg.id_) 
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo...!`\n\n> *Chat ID :* `"..msg.to.id.."`\n*User ID :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_انت لا تملك صوره في حسابك 😢💭...!_\n\n> _ايدي المجموعه 🎭 :_ `"..msg.to.id.."`\n_ايديك 📍:_ `"..msg.from.id.."`", 1, 'md')
            end
        end
end
	   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)	
end
if msg.reply_id and not matches[2] then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "pin" or matches[1] == "تثبيت" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "*تَُـــمْ تٽیَُـــيَت آلُرڛَُـــآلَُُـــهِ  👁‍🗨*"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Message Has Been Pinned*"
elseif lang then
return "*تَُـــمْ تٽیَُـــيَت آلُرڛَُـــآلَُُـــهِ  👁‍🗨*"
end
end
end
if matches[1] == 'unpin' or matches[1] == 'الغاء تثبيت' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "*تَُـــمْ آلَُُـــغٍآء تٽیَُـــيَت آلُرڛَُـــآلَُُـــهِ  🔕*"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pin message has been unpinned*"
elseif lang then
return "*تَُـــمْ آلَُُـــغٍآء تٽیَُـــيَت آلُرڛَُـــآلَُُـــهِ  🔕*"
end
end
end
if matches[1] == "add" or matches[1] == 'تفعيل' then
return modadd(msg)
end
if matches[1] == "rem" or matches[1] == 'تعطيل' then
return modrem(msg)
end
if matches[1] == "setowner" or matches[1] == 'رفع مدير' and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "remowner" or matches[1] == 'تنزيل مدير' and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "promote" or matches[1] == 'رفع ادمن' and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "demote" or matches[1] == 'تنزيل ادمن' and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end
   if matches[1] == 'del' and is_mod(msg) or matches[1] == 'Del' and is_mod(msg) or matches[1] == 'rmsg' and is_mod(msg) or matches[1] == 'Rmsg' and is_mod(msg) or matches[1] == 'تنظيف' and is_mod(msg) then
        if tostring(msg.to.id):match("^-100") then 
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  'تستطيع المسح من [ 1 الى 1000 ] 🚸⚠'
            else
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].."تم تنظيف المجموعه ⛥"
            end
        else
            return 'تستطيع التنظيف فقط في مجموعات السوبر 😄🎌'
        end
    end

if matches[1] == "lock" or matches[1] == "قفل" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link" or matches[2] == "الروابط" then
return lock_link(msg, data, target)
end
if matches[2] == "tag" or matches[2] == "التاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "arabic" or matches[2] == "العربية" then
return lock_arabic(msg, data, target)
end
if matches[2] == "edit" or matches[2] == "التعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "spam" or matches[2] == "الكلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2] == "التكرار" then
return lock_flood(msg, data, target)
end
if matches[2] == "bots" or matches[2] == "البوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2] == "الماركدون" then
return lock_markdown(msg, data, target)
end
if matches[2] == "webpage" or matches[2] == "الصفحات" then
return lock_webpage(msg, data, target)
end
if matches[2] == "pin" or matches[2] == "التثبيت" and is_owner(msg) then
return lock_pin(msg, data, target)
end
end

if matches[1] == "unlock" or matches[1] == "فتح" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link" or matches[2] == "الروابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "tag" or matches[2] == "التاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "arabic" or matches[2] == "العربية" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "edit" or matches[2] == "التعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "spam" or matches[2] == "الكلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2] == "التكرار" then
return unlock_flood(msg, data, target)
end
if matches[2] == "bots" or matches[2] == "البوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2] == "الماركدون" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "webpage" or matches[2] == "الصفحات" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "pin" or matches[2] == "التثبيت" and is_owner(msg) then
return unlock_pin(msg, data, target)
end
end
if matches[1] == "mute" or matches[1] == "قفل" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all" or matches[2] == "الكل" then
return mute_all(msg, data, target)
end
if matches[2] == "gif" or matches[2] == "المتحركه" then
return mute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2] == "الدردشه" then
return mute_text(msg ,data, target)
end
if matches[2] == "photo" or matches[2] == "الصور" then
return mute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2] == "الفيديو" then
return mute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2] == "الصوت" then
return mute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2] == "الاغاني" then
return mute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2] == "الملصقات" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2] == "الجهات" then
return mute_contact(msg ,data, target)
end
if matches[2] == "forward" or matches[2] == "التوجيه" then
return mute_forward(msg ,data, target)
end
if matches[2] == "location" or matches[2] == "المواقع" then
return mute_location(msg ,data, target)
end
if matches[2] == "document" or matches[2] == "الملفات" then
return mute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2] == "الاشعارات" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2] == "الاونلاين" then
return mute_inline(msg ,data, target)
end
if matches[2] == "game" or matches[2] == "الالعاب" then
return mute_game(msg ,data, target)
end
end

if matches[1] == "unmute" or matches[1] == "فتح" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all" or matches[2] == "الكل" then
return unmute_all(msg, data, target)
end
if matches[2] == "gif" or matches[2] == "المتحركه" then
return unmute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2] == "الدردشه" then
return unmute_text(msg, data, target)
end
if matches[2] == "photo" or matches[2] == "الصور" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2] == "الفيديو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2] == "الصوت" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2] == "الاغاني" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2] == "الملصقات" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2] == "الجهات" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "forward" or matches[2] == "التوجيه" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "location" or matches[2] == "المواقع" then
return unmute_location(msg ,data, target)
end
if matches[2] == "document" or matches[2] == "الملفات" then
return unmute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2] == "الاشعارات" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2] == "الاونلاين" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "game" or matches[2] == "الالعاب" then
return unmute_game(msg ,data, target)
end
end
if matches[1] == "gpinfo" or matches[1] == 'اعدادات المجموعه' and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Group Info :*\n*Admin Count :* `"..data.administrator_count_.."`\n*Member Count :* `"..data.member_count_.."`\n*Kicked Count :* `"..data.kicked_count_.."`\n*Gp ID :* `"..data.channel_.id_.."`"
print(serpent.block(data))
elseif lang then
ginfo = "*معلومات المجموعه 🎈 :*\n_عدد الادمنيه 🔱 :_ *"..data.administrator_count_.."*\n_عدد الاعضاء 🎗 :_ *"..data.member_count_.."*\n_عدد المحضورين 📌 :_ *"..data.kicked_count_.."*\n_أيدي المجموعة 🎌:_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if matches[1] == 'newlink' or matches[1] == 'تغير الرابط' and is_mod(msg) then
			local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bot is not group creator_\n_set a link for group with using_ /setlink", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "البَُـــوت ليَُـــس مديَُـــر المجموعَُـــه قَُـــم بارسَُـــال ┇¶ > ضع رابط < ¶┇  📛", 1, 'md')
    end
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
				else
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Newlink Created*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "تَُـــم صنَُـــع رابَُـــط جديَُـــد للمجموعَُـــه 📎", 1, 'md')
     end
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if matches[1] == 'setlink' or matches[1] == 'ضع رابط' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return '*اقٌَُـــمْ ٻآرڛَُــآلُ آلَُـرآٻَُـطَُُ لَُُــيَٺمْ ﭸَُــفُظًهِ 🎻*'
       end
		end

		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "تــم حفــظ الرابــط الجــديــد✔"
		 	end
       end
		end
    if matches[1] == 'link' or matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "قم بارسال[ ضع رابط ] لوضع رابط جديد ⛥"
     else
        return "قم بارسال[ ضع رابط ] لوضع رابط جديد ⛥"
      end
      end
     if not lang then
       text = "<b>Group Link :</b>\n"..linkgp
     else
      text =  "🔱 رابَُـــط المجموعَُـــه\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
  if matches[1] == "setrules" or matches[1] == 'ضع قوانين' and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "*تَُـــم حفَُـــظ الَُـــقوانيَُـــن. 📇*"
   end
  end
  if matches[1] == "rules" or matches[1] == 'القوانين' then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹ️ The Default Rules :\n No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@TEAMSTORM"
    elseif lang then
       rules = "ℹ️ القوانين:\n عدم التكرار في المجموعه 🔅.\nعدم عمل توجيهات داخل المجموعه 🔅.\nعدم نشر الكلايش الاباحيه 🔅.\nعدم التكلم في السياسه 🔅\nعدم نشر الروابط 🔅 .\n احترم تحترم 🔅 .\n@TEAMSTORM"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" or matches[1] == 'تدقيق' and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if matches[1] == "whois" or matches[1] == 'معلومات حول' and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
  if matches[1] == 'setflood' or matches[1] == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "يَُـــمكنك وضَُـــع عَُـــدد تَُـــكرار مَُـــن┇¶ > 1 / 50 <┇¶ فقَُـــط. ⛥*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
       end
		if matches[1]:lower() == 'clean' or matches[1] == 'مسح' and is_owner(msg) then
			if matches[2] == 'mods' or matches[2] == 'الادمنيه' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
					return "_No_ *moderators* _in this group_"
             else
                return "*لا يوجَُـــد ادمنيَُـــه لَُـــيتم مسحهَُـــم ⛥*"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *moderators* _has been demoted_"
          else
            return "*تَُـــم مسَُـــح الادمنيَُـــه ⛥*"
			end
         end
			if matches[2] == 'filterlist' or matches[2] == 'قائمه المنع' then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
					return "*Filtered words list* _is empty_"
         else
					return "لا توجَُـــد كلمَُـــات ليَُـــم مسحهَُـــا ⛥"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
				return "*Filtered words list* _has been cleaned_"
           else
				return "تَُـــم مسَُـــح قائمَُـــه المَُـــنع ⛥"
           end
			end
			if matches[2] == 'rules' or matches[2] == 'قوانين' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
					return "_No_ *rules* _available_"
             else
               return "*لا توجَُـــد قوانيَُـــن فَُـــي المجموَُعَُـــه ⛥*"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "*Group rules* _has been cleaned_"
          else
            return "*تَُـــم مسَُـــح قوانَُـــين المجموعَُـــه ⛥*"
			end
       end
			if matches[2] == 'welcome' or matches[2] == 'الترحيب' then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					return "*Welcome Message not set*"
             else
               return "*لا يوجَُـــد ترحيَُـــب فَُـــي المجموعَُـــه ⛥*"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "*Welcome message* _has been cleaned_"
          else
            return "*تَُـــم مسَُـــح الترحيَُـــب ⛥*"
			end
       end
			if matches[2] == 'about' or matches[2] == 'الوصف' then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
					return "_No_ *description* _available_"
            else
              return "*لا يوجَُـــد وصَُـــف فَُـــي المجموعَُـــه ⛥*"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
				return "*Group description* _has been cleaned_"
           else
              return "*تَُـــم مسَُـــح وصَُـــف المجموعَُـــه ⛥*"
             end
		   	end
        end
		if matches[1]:lower() == 'clean' or matches[1] == 'مسح' and is_admin(msg) then
			if matches[2] == 'owners' or matches[2] == 'المدراء' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
					return "_No_ *owners* _in this group_"
            else
                return "*لالا يوجَُـــد مَُـــدراء فَُـــي المجموعَُـــه ⛥*"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *owners* _has been demoted_"
           else
            return "*تَُـــم مسَُـــح الَُـــمدراء ⛥*"
          end
			end
     end
if matches[1] == "setname" or matches[1] == 'ضع اسم' and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "setabout" or matches[1] == 'ضع وصف' and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Group description* _has been set_"
    else
     return "*تَُـــم وضَُـــع وصَُـــف المجموعَُـــه ⛥*"
      end
  end
  if matches[1] == "about" or matches[1] == 'الوصف' and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_No_ *description* _available_"
      elseif lang then
      about = "*لا يوجَُـــد وصَُـــف فَُـــي المجموعَُـــه ⛥*"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'filter' or matches[1] == "منع" and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'unfilter' or matches[1] == "الغاء منع" and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'filterlist' or matches[1] == "قائمه المنع" and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "settings" or matches[1] == 'اعدادات' then
return group_settings(msg, target)
end
if matches[1] == "mutelist" or matches[1] == 'قائمة المنع' then
return mutes(msg, target)
end
if matches[1] == "modlist" or matches[1] == 'الادمنيه' then
return modlist(msg)
end
if matches[1] == "ownerlist" or matches[1] == 'المدراء' and is_owner(msg) then
return ownerlist(msg)
end

if matches[1] == "setlang" or matches[1] == 'ضع لغه' and is_owner(msg) then
   if matches[2] == "en" or matches[2] == 'انكلش' then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_Group Language Set To:_ EN"
  elseif matches[2] == "ar" or matches[2] == 'عربي' then
redis:set(hash, true)
return "*تَُـــم وضَُـــع اللغَُـــه :> العربَُـــيه*"
end
end
if matches[1]== 'رسائلي' or matches[1]=='رسايلي' then
local msgs = tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)
return '✉ عدد الرسائل هي  : [`'..msgs..'`] رساله \n\n'
 end
if matches[1]:lower() == 'معلوماتي' or matches[1]:lower() == 'موقعي'  then
if msg.from.first_name then
if msg.from.username then username = '@'..msg.from.username
else username = 'لا يوجد 🌝'
end

if is_sudo(msg) then rank = 'المطور مالتي ⛥'

elseif is_owner(msg) then rank = 'مدير المجموعه 🔱'

elseif is_admin(msg) then rank = 'اداري في البوت 📛'

elseif is_mod(msg) then rank = 'ادمن في البوت 💡'

else rank = 'مجرد عضو 😂😋'
end
local text = '📛┋ اهـلا بـك معلوماتك :\n\n📛┋ الاسم الاول :'..data.first_name_..'\n\n📛┋ الاسم الثاني :'..lastName..'\n\n📛┋ المعرف: '..username..'\n\n📛┋ الايدي : [ <code>'..data.id_..'</code> ]\n\n📛┋ ايدي الكروب : [ <code>'..arg.chat_id..'</code> ]\n\n📛┋ موقعك :'..rank..'\n\n ⛥┋¦ مـطـور الـسـورس : @TAHAJ20\n\n ⛥┋¦ قـنـاه الـسـورس : @TEAMSTORM' 
tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'html')
end
end
if matches[1] == "help" or matches[1] == "الاوامر" and is_mod(msg) then
if not lang then
text = [[

]]
end
return text
end
--------------------- Welcome -----------------------
	if matches[1] == "welcome" or matches[1] == 'الترحيب' and is_mod(msg) then
		if matches[2] == "enable" or matches[2] == 'تفعيل' then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "_Group_ *welcome* _is already enabled_"
       elseif lang then
				return "رسالَُـــه التَُـــرحيَُـــب تَُـــم تفعيلهَُـــا ⛥"
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "_Group_ *welcome* _has been enabled_"
       elseif lang then
				return "تَُـــم تفعيَُـــل رسَُـــالَُـــه الَُـــترحيَُـــب ⛥"
          end
			end
		end
		
		if matches[2] == "disable" or matches[2] == 'تعطيل' then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
				return "_Group_ *Welcome* _is already disabled_"
      elseif lang then
				return "رسالَُـــه التَُـــرحيَُـــب تَُـــم تعطيلهَُـــا ⛥"
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
				return "_Group_ *welcome* _has been disabled_"
      elseif lang then
				return "تَُـــم تعطيـــل رسَُـــالَُـــه الَُـــترحيَُـــب ⛥"
          end
			end
		end
	end
	if matches[1] == "setwelcome" or matches[1] == 'ضع ترحيب' and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show Group Rules_\n_{name} ➣ New Member First Name_\n_{username} ➣ New Member Username_"
       else
		return "_رسالة الترحيب تم اضافتها :_\n*"..matches[2].."*\n\n*يمكنك أستخدام*\n_{gpname} أسم المجموعة_\n_{rules} ➣ اضهار القوانين_\n_{name} ➣ عضو جديد الاسم الاول_\n_{username} ➣ عضو جديد اليوزر نيم_"
        end
     end
	end
end
-----------------------------------------
local function TAHAJ20(msg)
   local chat = msg.to.id
   local user = msg.from.id
 local data = load_data(_config.moderation.data)
	local function welcome_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome dear*"
    elseif lang then
     welcome = "نــورت المــجموعــه حياتــي ⛥"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n No Flood.\n2 No Spam.\n3 No Advertising.\n4 Try to stay on topic.\n5 Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban."
    elseif lang then
       rules = "ℹ️ القوانين الافتراضية:\nعدم التكرار 🎗\nعدم نشر الروابط 🎗\nعدم عمل توجيهات 🎗\n عدم نشر كلايش اباحيه 🎗\n عدم التكلم في السياسه 🎗\n احترم تحترم 🎗"
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
    end
    end
	end
	end
return {
patterns ={
"^(id)$",
"^(id) (.*)$",
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(pin)$",
"^(unpin)$",
"^(تثبيت)$",
"^(الغاء تثبيت)$",
"^(gpinfo)$",
"^(اعدادات المجموعه)$",
"^(add)$",
"^(rem)$",
"^(تفعيل)$",
"^(تعطيل)$",
"^(setowner)$",
"^(setowner) (.*)$",
"^(remowner)$",
"^(remowner) (.*)$",
"^(رفع مدير)$",
"^(رفع مدير) (.*)$",
"^(تنزيل مدير)$",
"^(تنزيل مدير) (.*)$",
"^(promote)$",
"^(promote) (.*)$",
"^(demote)$",
"^(demote) (.*)$",
"^(رفع ادمن)$",
"^(رفع ادمن) (.*)$",
"^(تنزيل ادمن)$",
"^(تنزيل ادمن) (.*)$",
"^(modlist)$",
"^(ownerlist)$",
"^(الادمنيه)$",
"^(المدراء)$",
"^(lock) (.*)$",
"^(unlock) (.*)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(settings)$",
"^(mutelist)$",
"^(اعدادت)$",
"^(قائمه المنع)$",
"^(mute) (.*)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(unmute) (.*)$",
"^(link)$",
"^(setlink)$",
"^(newlink)$",
"^(rules)$",
"^(setrules) (.*)$",
"^(about)$",
"^(setabout) (.*)$",
"^(setname) (.*)$",
"^(clean) (.*)$",
"^(setflood) (%d+)$",
"^(res) (.*)$",
"^(معلومات) (%d+)$",
"^(setlang) (.*)$",
"^(filter) (.*)$",
"^(unfilter) (.*)$",
"^(filterlist)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(تغير الرابط)$",
"^(القوانين)$",
"^(ضع قوانين) (.*)$",
"^(الترحيب)$",
"^(الوصف)$",
"^(ضع وصف) (.*)$",
"^(ضع اسم) (.*)$",
"^(مسح) (.*)$",
"^(التكرار) (%d+)$",
"^(تدقيق) (.*)$",
"^(معلومات حول) (%d+)$",
"^(ضع لغه) (.*)$",
"^(منع) (.*)$",
"^(الغاء منع) (.*)$",
"^(قائمه المنع)$",
"^(ضع تكرار) (.*)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(ضع ترحيب) (.*)",
"^(الترحيب) (.*)$",
"^(setwelcome) (.*)",
"^(welcome) (.*)$",
"^(موقعي)", 
"^(معلوماتي)$", 
"^(رسايلي)$", 
"^(رسائلي)$", 

},
run=TAHAJ20DEVSTORM,
pre_process = TAHAJ20
}
--نهايه سعيده هههه
