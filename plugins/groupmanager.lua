local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
     return "👁‍🗨￤» للمــدراء فقــط🚸 " 
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» المجموعه بالتاكيد تم تفعيلها'
else
return '👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» المجموعه بالتاكيد تم تفعيلها'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      whitelist ={},
      settings = {
          set_name = msg.to.title,
          link = 'بالحذف',
          tag = 'غير مفعل',
          spam = 'غير مفعل',
          webpage = 'غير مفعل',
          markdown = 'غير مفعل',
          flood = 'بالتصميت',
          lock_bots = 'yes',
          lock_pin = 'no',
          welcome = 'yes',
                  forward = 'غير مفعل',
                  view = 'غير مفعل',
                  audio = 'غير مفعل',
                  video = 'غير مفعل',
                  contact = 'غير مفعل',
                  text = 'غير مفعل',
                  photos = 'غير مفعل',
                  gif = 'غير مفعل',
                  location = 'غير مفعل',
                  document = 'غير مفعل',
                  sticker = 'غير مفعل',
                  voice = 'غير مفعل',
                   chat = 'غير مفعل',
				   keyboard = 'غير مفعل',
		  num_msg_max = '10',
		  set_char = '4000',
		  time_check = '2'
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
  return '👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تفــعيل الــمجموعــه\nٴ❖••••••••••❂••••••••••❖\n📌┊بواسطه : @'..msg.from.username..'\n'
else
  local text = '👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تفــعيل الــمجموعــه\nٴ❖••••••••••❂••••••••••❖\n📌┊بواسطه : @'..msg.from.username..'\n'
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=28, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return "👁‍🗨￤» للمــدراء فقــط🚸 " 
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '📛 ¦ تم تعطيل البوت بالفعل ✅'
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
  return '📛 ¦ تم تعطيل البوت في المجموعة ✅'
 else
  local text = '📛 ¦ تم تعطيل البوت في المجموعة ✅'
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=22, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
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
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» بــالفعــل تـم منعـــها"
            else
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» بــالفعــل تـم منعـــها"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» تــم منـعهـا"
            else
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» تــم منـعهـا"
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
         return "👁‍🗨￤»   الــكلمه { "..word.." }\n👁‍🗨￤» بــالفعــل تـم الغــاء منعــها"
       elseif lang then
         return "👁‍🗨￤»   الــكلمه { "..word.." }\n👁‍🗨￤» بــالفعــل تـم الغــاء منعــها"
     end
      else
       if not lang then
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» تــم الغــاء منعــها"
       elseif lang then
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــكلمه { "..word.." }\n👁‍🗨￤» تــم الغــاء منعــها"
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
    return "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
 else
    return "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "👁‍🗨￤»  لا يوجد ادمنيه في المجموعه"
else
   return "👁‍🗨￤»  لا يوجد ادمنيه في المجموعه"
  end
end
if not lang then
   message = '\n `📇￤الادمنـــيه`\n\n•~~•🔸️•~~•♦•~~•🔸•~~•\n\n'
else
   message = '\n `📇￤الادمنـــيه`\n\n•~~•🔸️•~~•♦•~~•🔸•~~•\n\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
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
    return "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
else
return  "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return  "👁‍🗨￤»  لا يوجد مدراء في المجموعه"
else
    return  "👁‍🗨￤»  لا يوجد مدراء في المجموعه"
  end
end
if not lang then
   message = '\n `💳￤المـــدراء`\n•~~•🔸️•~~•♦•~~•🔸•~~•\n\n'
else
   message = '\n `💳￤المـــدراء`\n•~~•🔸️•~~•♦•~~•🔸•~~•\n\n'
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
    return tdcli.sendMessage(data.chat_id_, "", 0, "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "الْٰمٍٰجًِّـمٍوٰ૭وعه لْٰيَٰـسٌٍـتّٰ ضـمٍٰنٍٰ ‏مٍٰجًِّـمٍوٰ૭وعاتّٰ  الْٰبٌِٰـ૭وتّٰـ ‏ ⁾🎷", 0, "md")
     end
  end
    if cmd == "``" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *موجود مسبقا في المميزون*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم اضافته الى المميزون*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *غير موجود في المميزون*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم ازالته من المميزون*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
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
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» _ User_ "..user_name.."\n👁‍🗨￤» ID *"..data.id_.."*\n👁‍🗨￤»  _is already a_ *SuperList*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👁‍🗨￤» العضو_ "..user_name.." \n👁‍🗨￤» ايدي*"..data.id_.."* \n`👁‍🗨￤» هو مدير مسبقا`", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  *user* ['..user_name..'] \n👁‍🗨￤» *ID* *['..data.id_..']* \n👁‍🗨￤»  *Is add to* `SuperList`  ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ ['..user_name..']\n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» ` تم اضافته مدير`', 0, "md")
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is Already a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو ادمن في المجموعة مسبقا`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Add to* `Adminlist` ', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم اضافته ادمن في المجموعة`', 0, "md")
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
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `ليس مدير في المجموعة`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه مدير`', 0, "md")
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
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو ليس ادمن في مجموعة`', 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه من الاشراف`', 0, "md")
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
  return tdcli.sendMessage(data.chat_id_, "", 0, '*المــستخدم لا يوجـــد 💻*' , 0, "md")
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
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*Group is not added ❎*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعة ليست مفعلة_", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *موجود مسبقا في المميزون*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم اضافته الى المميزون*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *غير موجود في المميزون*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم ازالته من المميزون*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» _ User_ "..user_name.."\n👁‍🗨￤» ID *"..data.id_.."*\n👁‍🗨￤»  _is already a_ *SuperList*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👁‍🗨￤» العضو_ "..user_name.." \n👁‍🗨￤» ايدي*"..data.id_.."* \n`👁‍🗨￤» هو مدير مسبقا`", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  *user* ['..user_name..'] \n👁‍🗨￤» *ID* *['..data.id_..']* \n👁‍🗨￤»  *Is add to* `SuperList`  ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ ['..user_name..']\n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» ` تم اضافته مدير`', 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is Already a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو ادمن في المجموعة مسبقا`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Add to* `Adminlist` ', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم اضافته ادمن في المجموعة`', 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `ليس مدير في المجموعة`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه مدير`', 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو ليس ادمن في مجموعة`', 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه من الاشراف`', 0, "md")
   end
end
   if cmd == "ايدي" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "Result for [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "معلومات عن [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '*المــستخدم لا يوجـــد 💻*' , 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
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
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعة ليست مفعلة_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_المجموعة ليست مفعلة_", 0, "md")
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
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *موجود مسبقا في المميزون*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم اضافته الى المميزون*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *غير موجود في المميزون*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_العضو_ "..user_name.." *"..data.id_.."* *تم ازالته من المميزون*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "👁‍🗨￤» _ User_ "..user_name.."\n👁‍🗨￤» ID *"..data.id_.."*\n👁‍🗨￤»  _is already a_ *SuperList*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_👁‍🗨￤» العضو_ "..user_name.." \n👁‍🗨￤» ايدي*"..data.id_.."* \n`👁‍🗨￤» هو مدير مسبقا`", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  *user* ['..user_name..'] \n👁‍🗨￤» *ID* *['..data.id_..']* \n👁‍🗨￤»  *Is add to* `SuperList`  ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤»  _العضو_ ['..user_name..']\n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» ` تم اضافته مدير`', 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is Already a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو مشرف في المجموعة مسبقا`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Add to* `Adminlist` ', 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم اضافته مشرف في المجموعة`', 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `ليس مدير في المجموعة`', 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Superlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه مدير`', 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is not a* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `هو ليس مشرف في مجموعة`', 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» *User* ['..user_name..'] \n👁‍🗨￤» *ID*  *['..data.id_..'] *\n👁‍🗨￤»  *Is delete from* `Adminlist` ', 0, "md")    else return tdcli.sendMessage(arg.chat_id, "", 0, '👁‍🗨￤» _العضو_ ['..user_name..'] \n👁‍🗨￤» _ الايدي _*['..data.id_..']*\n👁‍🗨￤» `تم حذفه من الاشراف`', 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = 'not found'
 else
username = '*المــستخدم لا يوجـــد 💻*' 
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Info for [ '..data.id_..' ] :\nUserName : '..username..'\nName : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'معلومات عن[ '..data.id_..' ] :\n المعرف : '..username..'\n الاسم : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User not founded_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, '*المــستخدم لا يوجـــد 💻*' , 0, "md")
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, '*المــستخدم لا يوجـــد 💻*' , 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
      end
   end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  دخول البوتات "
elseif lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  دخول البوتات "
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  دخول البوتات "
else
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  دخول البوتات "
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  دخول البوتات"
elseif lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  دخول البوتات"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  دخول البوتات"
else
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  دخول البوتات"
end
end
end

---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  التثبيت  "
elseif lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  التثبيت  "
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  التثبيت  "
else
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  التثبيت  "
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  التثبيت"
elseif lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  التثبيت"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  التثبيت"
else
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  التثبيت"
end
end
end

---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end
end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  دخول الاعضاء "
elseif lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  دخول الاعضاء "
end
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  دخول الاعضاء "
else
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  دخول الاعضاء "
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end 
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  دخول الاعضاء"
elseif lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  دخول الاعضاء"
end
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  دخول الاعضاء"
else
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  دخول الاعضاء"
end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
  return "👁‍🗨￤» للمــدراء فقــط🚸 " 
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
if data[tostring(target)]["settings"]["set_char"] then 	
SETCHAR = tonumber(data[tostring(target)]['settings']['set_char'])
	print('custom'..SETCHAR) 	
else 	
SETCHAR = 4000
end
if data[tostring(target)]["settings"]["time_check"] then 	
TIME_CHECK = tonumber(data[tostring(target)]['settings']['time_check'])
	print('custom'..TIME_CHECK) 	
else 	
TIME_CHECK = 2
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["link"] then			
data[tostring(target)]["settings"]["link"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["tag"] then			
data[tostring(target)]["settings"]["tag"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mention"] then			
data[tostring(target)]["settings"]["mention"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["arabic"] then			
data[tostring(target)]["settings"]["arabic"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["edit"] then			
data[tostring(target)]["settings"]["edit"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["spam"] then			
data[tostring(target)]["settings"]["spam"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["flood"] then			
data[tostring(target)]["settings"]["flood"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["markdown"] then			
data[tostring(target)]["settings"]["markdown"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["webpage"] then			
data[tostring(target)]["settings"]["webpage"] = "غير مفعل"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "غير مفعل"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "غير مفعل"		
 end
 end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["chat"] then			
data[tostring(target)]["settings"]["chat"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["gif"] then			
data[tostring(target)]["settings"]["gif"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["text"] then			
data[tostring(target)]["settings"]["text"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["photo"] then			
data[tostring(target)]["settings"]["photo"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["video"] then			
data[tostring(target)]["settings"]["video"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["audio"] then			
data[tostring(target)]["settings"]["audio"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["voice"] then			
data[tostring(target)]["settings"]["voice"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["sticker"] then			
data[tostring(target)]["settings"]["sticker"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["contact"] then			
data[tostring(target)]["settings"]["contact"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["forward"] then			
data[tostring(target)]["settings"]["forward"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["view"] then			
data[tostring(target)]["settings"]["view"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["location"] then			
data[tostring(target)]["settings"]["location"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["document"] then			
data[tostring(target)]["settings"]["document"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tgservice"] then			
data[tostring(target)]["settings"]["lock_tgservice"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["inline"] then			
data[tostring(target)]["settings"]["inline"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["game"] then			
data[tostring(target)]["settings"]["game"] = "غير مفعل"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["keyboard"] then			
data[tostring(target)]["settings"]["keyboard"] = "غير مفعل"		
end
end
 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_join"] then			
 data[tostring(target)]["settings"]["lock_join"] = "غير مفعل"		
 end
 end
 local expire_date = ''
local expi = redis:ttl('ExpireDate1:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'غير محدود'
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
 text = "*•♦• اعدادات المجموعة •♦•\n•~-~•⚜•~-~•📍•~-~•⚜•~-~•\n\n_• التعديل •_ *"..settings.edit.."*\n_• الدردشه •_ *"..settings.text.."*\n_• الروابط •_ *"..settings.link.."*\n_• المعرفات •_ *"..settings.tag.."*\n_• المنشن •_ *"..settings.mention.."*\n_• العربيه •_ *"..settings.arabic.."*\n_•  الصفحات •_ *"..settings.webpage.."*\n_• الماركداون •_ *"..settings.markdown.."*\n_•  التوجيه •_ *"..settings.forward.."*\n_• الملصقات •_ *"..settings.sticker.."*\n_• الفيديو •_ *"..settings.video.."*\n_• الصوتيات •_ *"..settings.audio.."*\n_• الاغاني •_ *"..settings.voice.."*\n_• الصور •_ *"..settings.photo.."*\n_• الملفات •_ *"..settings.document.."*\n_• المواقع •_ *"..settings.location.."*\n_• المتحركه •_ *"..settings.gif.."*\n_• الكل •_ *"..settings.chat.."*\n_• الجهات •_ *"..settings.contact.."*\n_• اللستات •_ *"..settings.inline.."*\n_• الكيبورد •_ *"..settings.keyboard.."*\n_• توجيه القنواة •_ *"..settings.view.."*\n_الترحيب •_ *"..settings.welcome.."*\n_• دخول الاعضاء •_ *"..settings.lock_join.."*\n_• التثبيت •_ *"..settings.lock_pin.."*\n_• الاشعارات •_ *"..settings.lock_tgservice.."*\n_• دخول البوتات •_ *"..settings.lock_bots.."*\n_• التكرار •_ *"..settings.flood.."*\n_• الكلايش •_ *"..settings.spam.."*\n عدد التكرار •_*\n•~-~•⚜•~-~•📍•~-~•⚜•~-~•\n•*تابعنا*• @TEAMSTORM\n*لغه المجموعه* • *العربيه*"
 else
local settings = data[tostring(target)]["settings"] 
 text = "*•♦• اعدادات المجموعة •♦•\n•~-~•⚜•~-~•📍•~-~•⚜•~-~•\n\n_• التعديل •_ *"..settings.edit.."*\n_• الدردشه •_ *"..settings.text.."*\n_• الروابط •_ *"..settings.link.."*\n_• المعرفات •_ *"..settings.tag.."*\n_• المنشن •_ *"..settings.mention.."*\n_• العربيه •_ *"..settings.arabic.."*\n_•  الصفحات •_ *"..settings.webpage.."*\n_• الماركداون •_ *"..settings.markdown.."*\n_•  التوجيه •_ *"..settings.forward.."*\n_• الملصقات •_ *"..settings.sticker.."*\n_• الفيديو •_ *"..settings.video.."*\n_• الصوتيات •_ *"..settings.audio.."*\n_• الاغاني •_ *"..settings.voice.."*\n_• الصور •_ *"..settings.photo.."*\n_• الملفات •_ *"..settings.document.."*\n_• المواقع •_ *"..settings.location.."*\n_• المتحركه •_ *"..settings.gif.."*\n_• الكل •_ *"..settings.chat.."*\n_• الجهات •_ *"..settings.contact.."*\n_• اللستات •_ *"..settings.inline.."*\n_• الكيبورد •_ *"..settings.keyboard.."*\n_• توجيه القنواة •_ *"..settings.view.."*\n_الترحيب •_ *"..settings.welcome.."*\n_• دخول الاعضاء •_ *"..settings.lock_join.."*\n_• التثبيت •_ *"..settings.lock_pin.."*\n_• الاشعارات •_ *"..settings.lock_tgservice.."*\n_• دخول البوتات •_ *"..settings.lock_bots.."*\n_• التكرار •_ *"..settings.flood.."*\n_• الكلايش •_ *"..settings.spam.."*\n عدد التكرار •_*\n•~-~•⚜•~-~•📍•~-~•⚜•~-~•\n•*تابعنا*• @TEAMSTORM\n*لغه المجموعه* • *العربيه*"
 end
return text
end

---------------Lock TgService-------------------
local function lock_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
 return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end
end

local lock_tgservice = data[tostring(target)]["settings"]["lock_tgservice"] 
if lock_tgservice == "yes" then
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  الاشعارات "
elseif lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  الاشعارات "
end
else
 data[tostring(target)]["settings"]["lock_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الاشعارات "
else
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الاشعارات "
end
end
end

local function unlock_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
else
return "👁‍🗨￤» للمــدراء فقــط🚸 " 
end 
end

local lock_tgservice = data[tostring(target)]["settings"]["lock_tgservice"]
 if lock_tgservice == "no" then
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  الاشعارات"
elseif lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  الاشعارات"
end 
else 
data[tostring(target)]["settings"]["lock_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  الاشعارات"
else
return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم فتح  الاشعارات"
end 
end
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local Chash = "cmd_lang:"..msg.to.id
local Clang = redis:get(Chash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
if msg.to.type ~= 'pv' then
if ((matches[1] == "تفعيل" and not Clang) or (matches[1] == "تفعيل" and Clang)) then
return modadd(msg)
end
if ((matches[1] == "تعطيل" and not Clang) or (matches[1] == "تعطيل" and Clang)) then
return modrem(msg)
end
if not data[tostring(msg.to.id)] then return end
if (matches[1] == "ايدي" and not Clang) then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
if data.photos_[0] then
local rank
if is_sudo(msg) then
rank = 'المطور  👨‍✈️' 
elseif is_owner(msg) then
rank = 'مدير الكروب 👨‍🏭' 
elseif is_sudo(msg) then
rank = 'الاداري 👦' 
elseif is_mod(msg) then
rank = 'ادمن الكروب 👮' 
else
rank = 'عضو بس 👲' 
end
if msg.from.username then
userxn = "@"..(msg.from.username or "---")
else
userxn = "لا يتوفر"
end
local msgs = tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)

tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'\n👁‍🗨￤» ايديك • '..msg.sender_user_id_..'\n👁‍🗨￤» معرفك • @'..(msg.from.username or '----')..'\n👁‍🗨￤» رسائلك • '..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0)..'\n👁‍🗨￤» موقعك • '..rank..'\n',msg.id_,msg.id_) 
else
tdcli.sendMessage(msg.to.id, msg.id_, 1, "_انت لا تملك صوره في حسابك 😢💭...!_\n\n> _ايدي المجموعه 🎭 :_ `"..msg.to.id.."`\n_ايديك 📍:_ `"..msg.from.id.."`", 1, 'md')
end
end
local lock_id = data[tostring(msg.to.id)]["settings"]["lock_id"] 
if lock_id == "🔒" then
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.from.id,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
end
if msg.reply_id and not matches[2] and is_mod(msg) then
tdcli_function ({
ID = "GetMessage",
chat_id_ = msg.to.id,
message_id_ = msg.reply_id
}, action_by_reply, {chat_id=msg.to.id,cmd="ايدي"})
end
if matches[2] and is_mod(msg) then
tdcli_function ({
ID = "SearchPublicChat",
username_ = matches[2]
}, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="ايدي"})
end
end
if ((matches[1] == "تثبيت" and not Clang) or (matches[1] == "تثبيت" and Clang)) and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تثبيـــت الرسـالـــه"
elseif lang then
local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تثبيـــت الرسـالـــه"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=25, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تثبيـــت الرسـالـــه"
elseif lang then
local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تثبيـــت الرسـالـــه"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=25, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
end
end
end
if ((matches[1] == 'الغاء التثبيت' and not Clang) or (matches[1] == "الغاء التثبيت" and Clang)) and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم الغـــاء تثبيـــت الرسـالـــه"
elseif lang then
local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم الغـــاء تثبيـــت الرسـالـــه"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=26, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم الغـــاء تثبيـــت الرسـالـــه"
elseif lang then
local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم الغـــاء تثبيـــت الرسـالـــه"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=26, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
end
end
end
if ((matches[1]:lower() == "``" and not Clang) or (matches[1] == "``" and Clang)) and matches[2] == "+" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="setwhitelist"})
      end
   end
if ((matches[1]:lower() == "whitelist" and not Clang) or (matches[1] == "المميزون" and Clang)) and matches[2] == "-" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="remwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="remwhitelist"})
      end
   end
if ((matches[1] == "رفع مدير" and not Clang) or (matches[1] == 'رفع مدير' and Clang)) and is_admin(msg) then
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
if ((matches[1] == "تنزيل مدير" and not Clang) or (matches[1] == "تنزيل مدير" and Clang)) and is_admin(msg) then
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
if ((matches[1] == "رفع ادمن" and not Clang) or (matches[1] == "رفع ادمن" and Clang)) and is_owner(msg) then
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
if ((matches[1] == "تنزيل ادمن" and not Clang) or (matches[1] == "تنزيل ادمن" and Clang)) and is_owner(msg) then
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

---------------------Links Settings------------------
if (matches[1] == "الروابط" and not Clang) or (matches[1] == "الروابط" and Clang) and is_mod(msg) then
local link = data[tostring(msg.to.id)]["settings"]["link"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["link"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["link"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["link"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["link"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الروابط \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if link == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الروابط مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الروابط مفتوحه"
   end
end
  local offender = 'link_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["link"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الروابط"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الروابط"
       end
   end
end

---------------------Tag Settings------------------
if (matches[1] == "المعرفات" and not Clang) or (matches[1] == "المعرفات" and Clang) and is_mod(msg) then
local tags = data[tostring(msg.to.id)]["settings"]["tag"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["tag"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["tag"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["tag"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["tag"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  المعرفات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if tags == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المعرفات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المعرفات مفتوحه"
   end
end
  local offender = 'tag_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["tag"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المعرفات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المعرفات"
       end
   end
end

---------------------Text Settings------------------
if (matches[1] == "الدردشه" and not Clang) or (matches[1] == "الدردشه" and Clang) and is_mod(msg) then
local text = data[tostring(msg.to.id)]["settings"]["text"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["text"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["text"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["text"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["text"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الدردشه \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if text == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الدردشه مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الدردشه مفتوحه"
   end
end
  local offender = 'text_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["text"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "??‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الدردشه"
    else
    return "??‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الدردشه"
       end
   end
end

---------------------Chat Settings------------------
if (matches[1] == "الكل" and not Clang) or (matches[1] == "الكل" and Clang) and is_mod(msg) then
local chats = data[tostring(msg.to.id)]["settings"]["chat"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["chat"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["chat"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["chat"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["chat"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  الكل \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if chats == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكل مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكل مفتوحه"
   end
end
  local offender = 'chat_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["chat"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكل"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكل"
       end
   end
end

---------------------Arabic Settings------------------
if (matches[1] == "العربيه" and not Clang) or (matches[1] == "العربيه" and Clang) and is_mod(msg) then
local arabic = data[tostring(msg.to.id)]["settings"]["arabic"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["arabic"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["arabic"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["arabic"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["arabic"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل العربيه \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if arabic == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ العربيه مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ العربيه مفتوحه"
   end
end
  local offender = 'arabic_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["arabic"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   العربيه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   العربيه"
       end
   end
end

---------------------Edit Settings------------------
if (matches[1] == "التعديل" and not Clang) or (matches[1] == "التعديل" and Clang) and is_mod(msg) then
local edit = data[tostring(msg.to.id)]["settings"]["edit"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["edit"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["edit"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["edit"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["edit"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التعديل \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if edit == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ التعديل مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ التعديل مفتوحه"
   end
end
  local offender = 'edit_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["edit"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   التعديل"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   التعديل"
       end
   end
end

---------------------MarkDown Settings------------------
if (matches[1] == "الماركداون" and not Clang) or (matches[1] == "الماركداون" and Clang) and is_mod(msg) then
local markdown = data[tostring(msg.to.id)]["settings"]["markdown"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["markdown"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["markdown"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["markdown"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["markdown"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الماركداون \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if markdown == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الماركداون مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الماركداون مفتوحه"
   end
end
  local offender = 'markdown_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["markdown"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الماركداون"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الماركداون"
       end
   end
end

---------------------Mention Settings------------------
if (matches[1] == "المنشن" and not Clang) or (matches[1] == "المنشن" and Clang) and is_mod(msg) then
local mention = data[tostring(msg.to.id)]["settings"]["mention"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["mention"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["mention"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["mention"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["mention"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المنشن \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if mention == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المنشن مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المنشن مفتوحه"
   end
end
  local offender = 'mention_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["mention"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المنشن"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المنشن"
       end
   end
end

---------------------Flood Settings------------------
if (matches[1] == "التكرار" and not Clang) or (matches[1] == "التكرار" and Clang) and is_mod(msg) then
local flood = data[tostring(msg.to.id)]["settings"]["flood"] 
if (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["flood"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل تكرار \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل تكرار \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["flood"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل تكرار \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل تكرار \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if flood == "disable" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تكرار مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تكرار مفتوحه"
   end
end
data[tostring(msg.to.id)]["settings"]["flood"] = "disable"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   تكرار"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   تكرار"
       end
   end
end

---------------------Spam Settings------------------
if (matches[1] == "الكلايش" and not Clang) or (matches[1] == "الكلايش" and Clang) and is_mod(msg) then
local spam = data[tostring(msg.to.id)]["settings"]["spam"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["spam"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["spam"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
     return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["spam"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["spam"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
     return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكلايش \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if spam == "disable" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكلايش مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكلايش مفتوحه"
   end
end
  local offender = 'spam_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["spam"] = "disable"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكلايش"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكلايش"
       end
   end
end

---------------------Webpage Settings------------------
if (matches[1] == "الصفحات" and not Clang) or (matches[1] == "الصفحات" and Clang) and is_mod(msg) then
local webpage = data[tostring(msg.to.id)]["settings"]["webpage"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["webpage"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["webpage"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["webpage"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["webpage"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصفحات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if webpage == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصفحات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصفحات مفتوحه"
   end
end
  local offender = 'webpage_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["webpage"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصفحات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصفحات"
       end
   end
end

---------------------Forward Settings------------------
if (matches[1] == "التوجيه" and not Clang) or (matches[1] == "التوجيه" and Clang) and is_mod(msg) then
local forward = data[tostring(msg.to.id)]["settings"]["forward"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["forward"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["forward"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["forward"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل التوجيه \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["forward"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل قفل اعادة توجيه \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل قفل اعادة توجيه \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if forward == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ التوجيه مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ التوجيه مفتوحه"
   end
end
  local offender = 'forward_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["forward"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   التوجيه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   التوجيه"
       end
   end
end

---------------------View Settings------------------
if (matches[1] == "توجيه القنواة" and not Clang) or (matches[1] == "توجيه القنواة" and Clang) and is_mod(msg) then
local view = data[tostring(msg.to.id)]["settings"]["view"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["view"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["view"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["view"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n??‍🗨￤تم قفل توجيه القنواة\n👁‍??￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n??‍🗨￤تم قفل توجيه القنواة\n👁‍??￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["view"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل توجيه القنواة\n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if view == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ توجيه القنواةمفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ توجيه القنواةمفتوحه"
   end
end
  local offender = 'view_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["view"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   توجيه القنواة"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   توجيه القنواة"
       end
   end
end

---------------------Sticker Settings------------------
if (matches[1] == "الملصقات" and not Clang) or (matches[1] == "الملصقات" and Clang) and is_mod(msg) then
local sticker = data[tostring(msg.to.id)]["settings"]["sticker"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["sticker"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["sticker"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["sticker"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["sticker"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "??‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "??‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملصقات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if sticker == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الملصقات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الملصقات مفتوحه"
   end
end
  local offender = 'sticker_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["sticker"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الملصقات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الملصقات"
       end
   end
end

---------------------Photo Settings------------------
if (matches[1] == "الصور" and not Clang) or (matches[1] == "الصور" and Clang) and is_mod(msg) then
local photo = data[tostring(msg.to.id)]["settings"]["photo"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["photo"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["photo"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["photo"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["photo"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصور \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if photo == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصور مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصور مفتوحه"
   end
end
  local offender = 'photo_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["photo"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصور"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصور"
       end
   end
end

---------------------Video Settings------------------
if (matches[1] == "الفيديو" and not Clang) or (matches[1] == "الفيديو" and Clang) and is_mod(msg) then
local video = data[tostring(msg.to.id)]["settings"]["video"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["video"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["video"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["video"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["video"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الفيديو \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if video == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الفيديو مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الفيديو مفتوحه"
   end
end
  local offender = 'video_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["video"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الفيديو"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الفيديو"
       end
   end
end

---------------------Gif Settings------------------
if (matches[1] == "المتحركه" and not Clang) or (matches[1] == "المتحركه" and Clang) and is_mod(msg) then
local gif = data[tostring(msg.to.id)]["settings"]["gif"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["gif"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["gif"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["gif"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["gif"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المتحركه \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if gif == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المتحركه مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المتحركه مفتوحه"
   end
end
  local offender = 'gif_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["gif"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المتحركه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المتحركه"
       end
   end
end

---------------------Keyboard Settings------------------
if (matches[1] == "الكيبورد" and not Clang) or (matches[1] == "الكيبورد" and Clang) and is_mod(msg) then
local keyboard = data[tostring(msg.to.id)]["settings"]["keyboard"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["keyboard"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["keyboard"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["keyboard"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["keyboard"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الكيبورد \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if keyboard == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكيبورد مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الكيبورد مفتوحه"
   end
end
  local offender = 'keyboard_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["keyboard"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكيبورد"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الكيبورد"
       end
   end
end

---------------------Document Settings------------------
if (matches[1] == "الملفات" and not Clang) or (matches[1] == "الملفات" and Clang) and is_mod(msg) then
local document = data[tostring(msg.to.id)]["settings"]["document"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["document"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["document"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["document"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["document"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الملفات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if document == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الملفات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الملفات مفتوحه"
   end
end
  local offender = 'document_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["document"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الملفات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الملفات"
       end
   end
end

---------------------Location Settings------------------
if (matches[1] == "المواقع" and not Clang) or (matches[1] == "المواقع" and Clang) and is_mod(msg) then
local location = data[tostring(msg.to.id)]["settings"]["location"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["location"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["location"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["location"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["location"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل المواقع \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if location == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المواقع مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ المواقع مفتوحه"
   end
end
  local offender = 'location_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["location"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المواقع"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   المواقع"
       end
   end
end

---------------------Contact Settings------------------
if (matches[1] == "الجهات" and not Clang) or (matches[1] == "الجهات" and Clang) and is_mod(msg) then
local contact = data[tostring(msg.to.id)]["settings"]["contact"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["contact"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["contact"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["contact"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["contact"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الجهات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if contact == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الجهات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الجهات مفتوحه"
   end
end
  local offender = 'contact_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["contact"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الجهات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الجهات"
       end
   end
end

---------------------Audio Settings------------------
if (matches[1] == "الصوت" and not Clang) or (matches[1] == "الصوت" and Clang) and is_mod(msg) then
local audio = data[tostring(msg.to.id)]["settings"]["audio"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["audio"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["audio"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["audio"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["audio"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الصوت \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if audio == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصوت مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الصوت مفتوحه"
   end
end
  local offender = 'audio_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["audio"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصوت"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الصوت"
       end
   end
end

---------------------Game Settings------------------
if (matches[1] == "الالعاب" and not Clang) or (matches[1] == "الالعاب" and Clang) and is_mod(msg) then
local game = data[tostring(msg.to.id)]["settings"]["game"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["game"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["game"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["game"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍??￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍??￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["game"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الالعاب \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if game == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ قفل الالعاب مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ قفل الالعاب مفتوحه"
   end
end
  local offender = 'game_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["game"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   قفل الالعاب"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   قفل الالعاب"
       end
   end
end

---------------------Inline Settings------------------
if (matches[1] == "اللستات" and not Clang) or (matches[1] == "اللستات" and Clang) and is_mod(msg) then
local inline = data[tostring(msg.to.id)]["settings"]["inline"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["inline"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم اللستات \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم اللستات \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["inline"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["inline"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["inline"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل اللستات \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if inline == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ اللستات مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ اللستات مفتوحه"
   end
end
  local offender = 'inline_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["inline"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   اللستات"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   اللستات"
       end
   end
end

---------------------Voice Settings------------------
if (matches[1] == "الاغاني" and not Clang) or (matches[1] == "الاغاني" and Clang) and is_mod(msg) then
local voice = data[tostring(msg.to.id)]["settings"]["voice"] 
if (matches[2] == "بالتحذير" and not Clang) or (matches[2] == "بالتحذير" and Clang) then
data[tostring(msg.to.id)]["settings"]["voice"] = "بالتحذير"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه التحذير ⚠"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه التحذير ⚠"
   end
elseif (matches[2] == "بالحذف" and not Clang) or (matches[2] == "بالحذف" and Clang) then
data[tostring(msg.to.id)]["settings"]["voice"] = "بالحذف"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الحذف 🗑"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الحذف 🗑"
   end
elseif (matches[2] == "بالطرد" and not Clang) or (matches[2] == "بالطرد" and Clang) then
data[tostring(msg.to.id)]["settings"]["voice"] = "بالطرد"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الطرد 🚸"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الطرد 🚸"
   end
elseif (matches[2] == "بالكتم" and not Clang) or (matches[2] == "بالكتم" and Clang) then
data[tostring(msg.to.id)]["settings"]["voice"] = "بالكتم"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الكتم 🔕"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل الاغاني \n👁‍🗨￤ خاصيه الكتم 🔕"
   end
elseif (matches[2] == "تعطيل" and not Clang) or (matches[2] == "تعطيل" and Clang) then
  if voice == "مفتوحه" then
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الاغاني مفتوحه"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ الاغاني مفتوحه"
   end
end
  local offender = 'voice_offender:'..msg.to.id
   redis:del(offender)
data[tostring(msg.to.id)]["settings"]["voice"] = "مفتوحه"
 save_data(_config.moderation.data, data)
   if not lang then
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الاغاني"
    else
    return "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح   الاغاني"
       end
   end
end

if ((matches[1] == "قفل" and not Clang) or (matches[1] == "قفل" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "البوتات" and not Clang) or (matches[2] == "البوتات" and Clang)) then
return lock_bots(msg, data, target)
end
if ((matches[2] == "التثبيت" and not Clang) or (matches[2] == "التثبيت" and Clang)) and is_owner(msg) then
return lock_pin(msg, data, target)
end
if ((matches[2] == "الدخول" and not Clang) or (matches[2] == "الاعضاء" and Clang)) then
return lock_join(msg, data, target)
end
if ((matches[2] == "الاشعارات" and not Clang) or (matches[2] == "الاشعارات" and Clang)) then
return lock_tgservice(msg ,data, target)
end
end

if ((matches[1] == "فتح" and not Clang) or (matches[1] == "فتح" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "البوتات" and not Clang) or (matches[2] == "البوتات" and Clang)) then
return unlock_bots(msg, data, target)
end
if ((matches[2] == "التثبيت" and not Clang) or (matches[2] == "التثبيت" and Clang)) and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if ((matches[2] == "الدخول" and not Clang) or (matches[2] == "الاعضاء" and Clang)) then
return unlock_join(msg, data, target)
end
if ((matches[2] == "الاشعارات" and not Clang) or (matches[2] == "الاشعارات" and Clang)) then
return unlock_tgservice(msg ,data, target)
end
end

if (matches[1]:lower() == "معلومات المجموعه" or matches[1] == 'معلومات المجموعه') and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
if not lang then
ginfo = "*`•`معلومات المجموعه`•`*\n🔬￤ عـدد الادمنـية :  *"..data.administrator_count_.."*\n👤￤ عـدد الاعضـاء : *"..data.member_count_.."*\n👟￤ عـدد المطـرودين : *"..data.kicked_count_.."*\n🌐￤ الايـدي : *"..data.channel_.id_.."*"
elseif lang then
ginfo = "*`•`معلومات المجموعه`•`*\n🔬￤ عـدد الادمنـية :  *"..data.administrator_count_.."*\n👤￤ عـدد الاعضـاء : *"..data.member_count_.."*\n👟￤ عـدد المطـرودين : *"..data.kicked_count_.."*\n🌐￤ الايـدي : *"..data.channel_.id_.."*"
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if (matches[1]:lower() == 'newlink' or matches[1] == 'تغير الرابط') and is_mod(msg) and not matches[2] then
	local function callback_link (arg, data)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "البَُـــوت ليَُـــس مديَُـــر المجموعَُـــه قَُـــم بارسَُـــال ￤¶ > ضع رابط < ¶￤  📛", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "البَُـــوت ليَُـــس مديَُـــر المجموعَُـــه قَُـــم بارسَُـــال ￤¶ > ضع رابط < ¶￤  📛", 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "تَُـــم صنَُـــع رابَُـــط جديَُـــد للمجموعَُـــه 📎", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "تَُـــم صنَُـــع رابَُـــط جديَُـــد للمجموعَُـــه 📎", 1, 'md')
            end
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if (matches[1]:lower() == 'newlink' or matches[1] == 'رابط جديد') and is_mod(msg) and (matches[2] == 'pv' or matches[2] == 'خاص') then
	local function callback_link (arg, data)
		local result = data.invite_link_
		local administration = load_data(_config.moderation.data) 
				if not result then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bot is not group creator_\n_set a link for group with using_ /setlink", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_البوت ليس منشئ المجموعة_\n_قم بحفظ الرابط بأمر_ /setlink", 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = result
					save_data(_config.moderation.data, administration)
        if not lang then
		tdcli.sendMessage(user, msg.id, 1, "*Newlink Group* _:_ `"..msg.to.id.."`\n"..result, 1, 'md')
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*New link Was Send In Your Private Message*", 1, 'md')
        elseif lang then
		tdcli.sendMessage(user, msg.id, 1, "*رابط المجموعة :* _:_ `"..msg.to.id.."`\n"..result, 1, 'md')
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لقد قمت بإرسال الرابط على الخاص_", 1, 'md')
            end
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if (matches[1]:lower() == 'ضع رابط' or matches[1] == 'ضع رابط') and is_owner(msg) then
		if not matches[2] then
		data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
			if not lang then
			return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قـــم بارســـال الرابـــط الـــجديـــد'
    else 
         return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قـــم بارســـال الرابـــط الـــجديـــد'
       end
	   end
		 data[tostring(chat)]['settings']['linkgp'] = matches[2]
			 save_data(_config.moderation.data, data)
      if not lang then
			return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم حفــظ الرابــط الجــديــد ✔"
    else 
         return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم حفــظ الرابــط الجــديــد ✔"
       end
		end
		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم حفــظ الرابــط الجــديــد ✔"
           else
           return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم حفــظ الرابــط الجــديــد ✔"
		 	end
       end
		end
    if (matches[1]:lower() == 'الرابط' or matches[1] == 'الرابط') and is_mod(msg) and not matches[2] then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
     else
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
      end
      end
     if not lang then
       text =   "👁‍🗨￤»  رابــط المجــموعـة 🔻 \n •~~•🔸•~~•♦️•~~•🔸•~~• \n\n"..linkgp
     else
      text =   "👁‍🗨￤»  رابــط المجــموعـة 🔻 \n •~~•🔸•~~•♦️•~~•🔸•~~• \n\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
     if ((matches[1] == "الرابط" and not Clang) or (matches[1] == "الرابط" and Clang)) and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
     else
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
      end
      end
    if not lang then
    texth = "اضغط هنا للحصول على الرابط 🚸"
        elseif lang then
    texth = "اضغط هنا للحصول على الرابط 🚸"
    end
local function inline_link_cb(TM, BD)
      if BD.results_ and BD.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, BD.inline_query_id_, BD.results_[0].id_, dl_cb, nil)
    else
     if not lang then
       text =   "👁‍🗨￤»  رابــط المجــموعـة 🔻 \n •~~•🔸•~~•♦️•~~•🔸•~~• \n\n"..linkgp
     else
      text =   "👁‍🗨￤»  رابــط المجــموعـة 🔻 \n •~~•🔸•~~•♦️•~~•🔸•~~• \n\n"..linkgp
         end
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "md")
   end
end
tdcli.getInlineQueryResults(107705060, msg.to.id, 0, 0, "["..texth.." "..msg.to.title.."]("..linkgp..")", 0, inline_link_cb, nil)
end
     
     
    if (matches[1]:lower() == 'الرابط' or matches[1] == 'الرابط') and (matches[2] == 'pv' or matches[2] == 'خاص') then
	if is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
     else
        return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  قم بارسال[ ضع رابط ] لوضع رابط جديد"
      end
      end
     if not lang then
	 tdcli.sendMessage(chat, msg.id, 1, "<b>link Was Send In Your Private Message</b>", 1, 'html')
     tdcli.sendMessage(user, "", 1, "<b>Group Link "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
     else
	 tdcli.sendMessage(chat, msg.id, 1, "<b>تم ارسال الرابط في الخاص</b>", 1, 'html')
      tdcli.sendMessage(user, "", 1, "<b>رابط المجموعة "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
         end
     end
	 end
  if (matches[1]:lower() == "ضع قوانين" or matches[1] == 'ضع قوانين') and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  ُتــم حفـــظ الـــقوانيــن 📇"
   else 
  return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  ُتــم حفـــظ الـــقوانيــن 📇"
   end
  end
  if matches[1]:lower() == "القوانين" or matches[1] == 'القوانين' then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "👁‍🗨 القوانين:\n عدم تكرار في المجموعه 👁‍🗨￤»  .\nعدم عمل توجيهات داخل المجموعه 👁‍??￤»  .\nعدم نشر الكلايش الاباحيه 👁‍🗨￤»  .\nعدم التكلم في السياسه 👁‍🗨￤»  \nعدم نشر الروابط 👁‍🗨￤»   .\n احترم تحترم 👁‍🗨￤»   .\n@TEAMSTORM"
    elseif lang then
       rules = "👁‍🗨 القوانين:\n عدم تكرار في المجموعه 👁‍🗨￤»  .\nعدم عمل توجيهات داخل المجموعه 👁‍??￤»  .\nعدم نشر الكلايش الاباحيه 👁‍🗨￤»  .\nعدم التكلم في السياسه 👁‍🗨￤»  \nعدم نشر الروابط 👁‍🗨￤»   .\n احترم تحترم 👁‍🗨￤»   .\n@TEAMSTORM"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if ((matches[1] == "res" and not Clang) or (matches[1] == "من هو" and Clang)) and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if ((matches[1] == "معلومات" and not Clang) or (matches[1] == "معلومات" and Clang)) and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
		if ((matches[1]:lower() == 'setchar' and not Clang) or (matches[1] == "الحد الاقصى للحروف" and Clang)) then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
    if not lang then
     return "`تم ضع عدد رسائل الحروف هو :` *[ "..matches[2].." ]* `حرف`"
   else
     return "`تم ضع عدد رسائل الحروف هو :` *[ "..matches[2].." ]* `حرف`"
		end
  end
  if ((matches[1]:lower() == 'ضع تكرار' and not Clang) or (matches[1] == "ضع تكرار" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  يـــمكنك وضـــع عــدد التــكرار مــن `{  1 / 50  }` فقَُـــط "
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			if not lang then
    return '👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم وضع عدد تكرار رسائل \n👁‍🗨￤{`'..tonumber(matches[2])..'`} رساله'
    else
    return '👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤ تم وضع عدد تكرار رسائل \n👁‍🗨￤{`'..tonumber(matches[2])..'`} رساله'
    end
       end
  if ((matches[1]:lower() == 'ضع وقت التكرار' and not Clang) or (matches[1] == "ضع وقت تكرار" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  يـــمكنك وضـــع عــدد التــكرار مــن `{  1 / 50  }` فقَُـــط "
      end
			local time_max = matches[2]
			data[tostring(chat)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "`تم ضع زمن تكرار الرسائل هو  :` *[ "..matches[2].." ]* `ثواني`"
    else
    return "`تم ضع زمن تكرار الرسائل هو  :` *[ "..matches[2].." ]* `ثواني`"
    end
       end
		if ((matches[1]:lower() == 'مسح' and not Clang) or (matches[1] == "مسح" and Clang)) and is_owner(msg) then
			if ((matches[2] == 'الادمنيه' and not Clang) or (matches[2] == "الادمنيه" and Clang)) then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد ادمنيـــه لــيتم مسحهَُـــم "
             else
                return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد ادمنيـــه لــيتم مسحهَُـــم "
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تنزيـــل جميـــع الادمنيـــه "
          else
            return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تنزيـــل جميـــع الادمنيـــه "
			end
         end
			if ((matches[2] == 'قائمه المنع' and not Clang) or (matches[2] == "قائمه المنع" and Clang)) then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لاتـوجــد كلمـــات ليتـــم مسحهـــا"
         else
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لاتـوجــد كلمـــات ليتـــم مسحهـــا"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»   قـائـــمه الـــمنع  تـــم مسحهـــا"
           else
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»   قـائـــمه الـــمنع  تـــم مسحهـــا"
           end
			end
			if ((matches[2] == 'القوانين' and not Clang) or (matches[2] == "القوانين" and Clang)) then
				if not data[tostring(chat)]['rules'] then
            if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد قـوانـــين ليتـــم مســـحها"
             else
               return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد قـوانـــين ليتـــم مســـحها"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم مســـح القـوانـــين "
          else
            return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم مســـح القـوانـــين "
			end
       end
			if ((matches[2] == 'الترحيب' and not Clang) or (matches[2] == "ترحيب" and Clang)) then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد ترحـــيب فـي المــجمـوعـــه"
             else
               return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد ترحـــيب فـي المــجمـوعـــه"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم مســح ترحـــيب  المــجمـوعـــه"
          else
            return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم مســح ترحـــيب  المــجمـوعـــه"
			end
       end
			if ((matches[2] == 'الوصف' and not Clang) or (matches[2] == "الوصف" and Clang)) then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد وصــف فـي المــجمـوعـــه"
            else
              return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد وصــف فـي المــجمـوعـــه"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم مســح وصـــف المــجمـوعـــه"
           else
              return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــم مســح وصـــف المــجمـوعـــه"
             end
		   	end
        end
		if ((matches[1]:lower() == 'مسح' and not Clang) or (matches[1] == "مسح" and Clang)) and is_admin(msg) then
			if ((matches[2] == 'المدراء' and not Clang) or (matches[2] == "المدراء" and Clang)) then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
					return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد مــدراء فـي المــجمـوعـــه"
            else
                return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد مــدراء فـي المــجمـوعـــه"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تنزيـــل جميـــع الــمدراء "
           else
            return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم تنزيـــل جميـــع الــمدراء "
          end
			end
     end
if ((matches[1] == "ضع اسم" and not Clang) or (matches[1] == "ضع اسم" and Clang)) and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if ((matches[1] == "ضع وصف" and not Clang) or (matches[1] == "ضع وصف" and Clang)) and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم وضــع وصــف فـي المــجمـوعـــه"
    else
     return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تـــم وضــع وصــف فـي المــجمـوعـــه"
      end
  end
  if ((matches[1] == "الوصف" and not Clang) or (matches[1] == "الوصف" and Clang)) and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد وصــف فـي المــجمـوعـــه"
      elseif lang then
      about = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  لا يـــوجــد وصــف فـي المــجمـوعـــه"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if ((matches[1] == 'منع' and not Clang) or (matches[1] == "منع" and Clang)) and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if ((matches[1] == 'الغاء منع' and not Clang) or (matches[1] == "الغاء منع" and Clang)) and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if ((matches[1] == 'قائمه المنع' and not Clang) or (matches[1] == "قائمه المنع" and Clang)) and is_mod(msg) then
    return filter_list(msg)
  end
if ((matches[1] == "الاعدادات" and not Clang) or (matches[1] == "الاعدادات" and Clang)) then
return group_settings(msg, target)
end
if ((matches[1] == "اعدادات قفل" and not Clang) or (matches[1] == "اعدادات قفل" and Clang)) then
return mutes(msg, target)
end
if ((matches[1] == "الادمنيه" and not Clang) or (matches[1] == "الادمنيه" and Clang)) then
return modlist(msg)
end
if ((matches[1] == "المدراء" and not Clang) or (matches[1] == "المدراء" and Clang)) and is_owner(msg) then
return ownerlist(msg)
end
if ((matches[1] == "``" and not Clang) or (matches[1] == "``" and Clang)) and not matches[2] and is_mod(msg) then
return whitelist(msg.to.id)
end
end
if (matches[1]:lower() == "ضع لغه" and not Clang) and is_owner(msg) then
local hash = "gp_lang:"
if matches[2] == "عربي" then
redis:set(hash, true)
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر لغــة الــمجموعــه'
  elseif matches[2] == "انكلش" then
 redis:del(hash)
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر لغــة الــمجموعــه'
end
end
if (matches[1] == 'ضع لغه' and Clang) and is_owner(msg) then
local hash = "gp_lang:"
if matches[2] == "عربي" then
redis:set(hash, true)
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر لغــة الــمجموعــه'
  elseif matches[2] == "عربي" then
 redis:del(hash)
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر لغــة الــمجموعــه'
end
end

if (matches[1]:lower() == "الاوامر" and not Clang) and is_owner(msg) then
local hash = "cmd_lang:"
if matches[2] == "عربي" then
redis:set(hash, true)
   if lang then
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر الى اوامر عربي '
else
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر الى اوامر عربي '
end
end
end

if (matches[1]:lower() == "عربي" and Clang) and is_owner(msg) then
local hash = "cmd_lang:"
redis:del(hash)
   if lang then
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر الى اوامر انكلش '
else
return '👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» الــمجمــوعــه\n👁‍🗨￤» { '..msg.to.title..'}\n👁‍🗨￤» تــم تــغييــر الى اوامر انكلش '
end
end
if matches[1] == "طلع البوتات" and not matches[2] and is_owner(msg) then
function delbots(arg, data)
local deleted = 0 
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then

kick_user(v.user_id_, msg.to.id)
deleted = deleted + 1 
end
end
if deleted == 0 then
tdcli.sendMessage(msg.to.id, msg.id, 1, '', 1, 'md')
else
tdcli.sendMessage(msg.to.id, msg.id, 1, '', 1, 'html')
end
end
tdcli.getChannelMembers(msg.to.id, 0, 'Bots', 200, delbots, nil)
end
--------------------- Welcome -----------------------
	if (matches[1]:lower() == "الترحيب" or matches[1] == 'الترحيب') and is_mod(msg) then
	if not lang then
		if matches[2] == "تفعيل" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تفعيلهَُـــا"
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تفعيلهَُـــا"
			end
		end
		
		if matches[2] == "تعطيل" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تعطيلهَُـــا"
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
				return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تعطيلهَُـــا"
			end
		end
		else
				if matches[2] == "تفعيل" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
				local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تفعيلهَُـــا"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=20, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
				local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تفعيلهَُـــا"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=24, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
			end
		end
		
		if matches[2] == "تعطيل" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
				local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تعطيلهَُـــا"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=24, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
				local text = "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  رسالَُـــه التَُـــرحيَُـــب تَُـــم تعطيلهَُـــا"
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=30, user_id_=msg.sender_user_id_}}}}, dl_cb, nil)
			end
		end
		end
	end
	if (matches[1]:lower() == "ضع ترحيب" or matches[1] == 'ضع ترحيب') and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــــم وضـــع الترحــــيب \n👁‍🗨￤»  الــــكلمه »:  { "..matches[2].." }\n`•~~•🔸️•~~•♦•~~•🔸•~~•`\n\n`\n👁‍🗨￤»  تستطيع ايضا وضع ⏬`\n_{ gpname } \n👁‍🗨 اسم المجموعه 📇_\n_{ rules } \n👁‍🗨 اضهار القوانين📑 _\n_{ time } \n👁‍🗨  عرض الوقت ⏰ _\n_{ date } \n👁‍🗨 عرض التاريخ 📆 _\n_{ name } \n👁‍🗨 اسم الشخص👤_\n_{ username } \n👁‍🗨 معرف الشخص👤_"
       else
		return "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤»  تــــم وضـــع الترحــــيب \n👁‍🗨￤»  الــــكلمه »:  { "..matches[2].." }\n`•~~•🔸️•~~•♦•~~•🔸•~~•`\n\n`\n👁‍🗨￤»  تستطيع ايضا وضع ⏬`\n_{ gpname } \n👁‍🗨 اسم المجموعه 📇_\n_{ rules } \n👁‍🗨 اضهار القوانين📑 _\n_{ time } \n👁‍🗨  عرض الوقت ⏰ _\n_{ date } \n👁‍🗨 عرض التاريخ 📆 _\n_{ name } \n👁‍🗨 اسم الشخص👤_\n_{ username } \n👁‍🗨 معرف الشخص👤_"
       end
     end
	end
local checkmod = true

local function pre_process(msg)
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
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "👁‍🗨￤» اهلا بك يا "..(check_markdown(msg.from.first_name or "----"))..'\n👁‍🗨￤» نورتنا ضيف جهاتك في كروب {` '..msg.to.title..'`}\n\n•~~•🚸•~~•♦️•~~•🚸•~~•\n•♦• تابع @TEAMSTORM'
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
  	return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show Group Rules_\n_{time} ➣ Show time english _\n_{date} ➣ Show date english _\n_{timefa} ➣ Show time persian _\n_{datefa} ➣ show date persian _\n_{name} ➣ New Member First Name_\n_{username} ➣ New Member Username_"
       else
		 rules = "👁‍🗨 القوانين الافتراضية:\nعدم التكرار 👁‍🗨\nعدم نشر الروابط 👁‍🗨\nعدم عمل توجيهات 👁‍🗨\n عدم نشر كلايش اباحيه 👁‍🗨\n عدم التكلم في السياسه 👁‍🗨\n احترم تحترم 👁‍🗨"
       end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_..' '..(data.last_name_ or '')))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.adduser, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.sender_user_id_, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
        end
		end
	end
 end
 
return {
patterns ={
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(الروابط) (.*)$",
"^(المعرفات) (.*)$",
"^(الصفحات) (.*)$",
"^(الكلايش) (.*)$",
"^(التكرار) (.*)$",
"^(الماركداون) (.*)$",
"^(المنشن) (.*)$",
"^(العربيه) (.*)$",
"^(التوجيه) (.*)$",
"^(توجيه القنواة) (.*)$",
"^(الاغاني) (.*)$",
"^(المتحركه) (.*)$",
"^(الصوت) (.*)$",
"^(الفيديو) (.*)$",
"^(الكل) (.*)$",
"^(الصور) (.*)$",
"^(اللستات) (.*)$",
"^(الكيبورد) (.*)$",
"^(الجهات) (.*)$",
"^(الملفات) (.*)$",
"^(المواقع) (.*)$",
"^(الدردشه) (.*)$",
"^(التعديل) (.*)$",
"^(الملصقات) (.*)$",
"^(ضع لغه) (.*)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(الروابط) (.*)$",
"^(المعرفات) (.*)$",
"^(الصفحات) (.*)$",
"^(الكلايش) (.*)$",
"^(التكرار) (.*)$",
"^(الماركداون) (.*)$",
"^(المنشن) (.*)$",
"^(العربيه) (.*)$",
"^(التوجيه) (.*)$",
"^(توجيه القنواة) (.*)$",
"^(الاغاني) (.*)$",
"^(المتحركه) (.*)$",
"^(الصوت) (.*)$",
"^(الفيديو) (.*)$",
"^(الكل) (.*)$",
"^(الصور) (.*)$",
"^(اللستات) (.*)$",
"^(الكيبورد) (.*)$",
"^(الجهات) (.*)$",
"^(الملفات) (.*)$",
"^(المواقع) (.*)$",
"^(الدردشه) (.*)$",
"^(التعديل) (.*)$",
"^(الملصقات) (.*)$",
"^(ضع لغه) (.*)$",
"^(الاوامر) (.*)$",
'^(الاعدادات)$',
'^(تثبيت)$',
'^(الغاء التثبيت)$',
'^(تفعيل)$',
'^(تعطيل)$',
'^(رفع مدير)$',
'^(رفع مدير) (.*)$',
'^(تنزيل مدير) (.*)$',
'^(تنزيل مدير)$',
'^(رفع ادمن)$',
'^(رفع ادمن) (.*)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (.*)$',
'^(قفل) (.*)$',
'^(فتح) (.*)$',
--'^(قفل) (.*)$',
--'^(فتح) (.*)$',
'^(رابط جديد)$',
'^(رابط جديد) (خاص)$',
'^(معلومات المجموعه)$',
--'^(قوانین)$',
'^(الرابط)$',
'^(ضع رابط)$',
'^(ضع رابط) ([https?://w]*.?telegram.me/joinchat/%S+)$',
'^(ضع رابط) ([https?://w]*.?t.me/joinchat/%S+)$',
'^(ضع قوانين) (.*)$',
'^(الرابط) (خاص)$',
'^(من هو) (.*)$',
'^(معلومات) (%d+)$',
'^(ضع تكرار) (%d+)$',
'^(ضع وقت تكرار) (%d+)$',
'^(مسح) (.*)$',
'^(الوصف)$',
'^(ضع اسم) (.*)$',
'^(ضع وصف) (.*)$',
'^(قائمه المنع)$',
'^(المدراء)$',
'^(الادمنيه)$',
--'^(الاوامر)$',
'^(منع) (.*)$',
'^(الغاء منع) (.*)$',
'^(الترحيب) (.*)$',
'^(ضع ترحيب) (.*)$',
'^(القوانين)$',
'^(طلع البوتات)$',
'^([https?://w]*.?telegram.me/joinchat/%S+)$',
'^([https?://w]*.?t.me/joinchat/%S+)$'


},
run=run,
pre_process = pre_process
}
--bytaha
