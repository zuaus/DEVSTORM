do

local function run(msg, matches)
if matches[1] == "جلب صوره" then
 local function getpro(arg,data)
local id = matches[2]
if data.photos_[0] then
 tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'👁‍🗨￤ تفضل هاك صورته\n'..id..'\n')
   else
  return tdcli.sendMessage(msg.to.id,  msg.id,1, '♦️￤»   العضو '..id..'\n\n♦️￤»   لا توجد صوره في حسابه'..id..'  ',1,'html')
  end
  end
  tdcli_function ({ID ="GetUserProfilePhotos", user_id_ = matches[2], offset_ = 0, limit_ = 1 }, getpro, nil)   
   end
if matches[1] == "الحساب" then
            local text = ' 👁‍🗨￤اضغط هنا للدخول الى الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.to.id, reply_to_message_id_=msg.id, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=29, user_id_=matches[2]}}}}, dl_cb, nil)
end
if matches[1] == "ايديي" and is_sudo(msg) then 
return "\n `"..arg.chat_id.."`"
elseif matches[1]=="ايديي" and is_admin(msg) then 
return "\n `"..arg.chat_id.."`"
elseif matches[1]=="ايديي" and is_owner(msg) then 
return "\n `"..arg.chat_id.."`"
elseif matches[1]=="ايديي" and is_mod(msg) then 
return "\n `"..arg.chat_id.."`"
elseif matches[1]=="معرفي" then 
return  "\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n"
elseif matches[1]=="gid" then 
return  "`"..msg.to.id.. "`"
elseif matches[1]=="رسايلي" then 
return  "♦️￤»  مرحــبا عزيــزي المستخــدم \n♦️￤»  عدد رسائلك المرسله هي 🔻\n♦️￤» {` "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).." `} رساله\n"
elseif matches[1]=="اسمي" then 
return  "\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n "
elseif matches[1]=="رسائلي" then 
return "♦️￤»  مرحــبا عزيــزي المستخــدم \n♦️￤»  عدد رسائلك المرسله هي 🔻\n♦️￤» {` "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).." `} رساله\n"
------------------------------
end
if matches[1]=="موقعي" and is_sudo(msg) then 
return "•🚸• موقعك في المجموعه •🚸• \n\n•~~•🗯•~~•♦️•~~•🗯•~~• \n \n\n♦️￤»  رسائلك • { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n\n♦️￤»  معرفك •   @"..(msg.from.username or "لايوجد").. "\n\n♦️￤» اسمك  •  "..(check_markdown(msg.from.first_name or "----")).."\n\n♦️￤» ايديك •  "..user.."\n\n♦️￤»  موقعك • المطور \n\n•~~•🗯•~~•♦️•~~•🗯•~~•\n\n•💠• تابعنا @TEAMSTORM "
elseif matches[1]=="موقعي" and is_admin(msg) then 
return "•🚸• موقعك في المجموعه •🚸• \n\n•~~•🗯•~~•♦️•~~•🗯•~~• \n \n\n♦️￤»  رسائلك • { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n\n♦️￤»  معرفك •   @"..(msg.from.username or "لايوجد").. "\n\n♦️￤» اسمك  •  "..(check_markdown(msg.from.first_name or "----")).."\n\n♦️￤» ايديك •  "..user.."\n\n♦️￤»  موقعك • المدير \n\n•~~•🗯•~~•♦️•~~•🗯•~~•\n\n•💠• تابعنا @TEAMSTORM "
elseif matches[1]=="موقعي" and is_owner(msg) then 
return "•🚸• موقعك في المجموعه •🚸• \n\n•~~•🗯•~~•♦️•~~•🗯•~~• \n \n\n♦️￤»  رسائلك • { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n\n♦️￤»  معرفك •   @"..(msg.from.username or "لايوجد").. "\n\n♦️￤» اسمك  •  "..(check_markdown(msg.from.first_name or "----")).."\n\n♦️￤» ايديك •  "..user.."\n\n♦️￤»  موقعك • الاداري \n\n•~~•🗯•~~•♦️•~~•🗯•~~•\n\n•💠• تابعنا @TEAMSTORM "
elseif matches[1]=="موقعي" and is_mod(msg) then 
return "•🚸• موقعك في المجموعه •🚸• \n\n•~~•🗯•~~•♦️•~~•🗯•~~• \n \n\n♦️￤»  رسائلك • { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n\n♦️￤»  معرفك •   @"..(msg.from.username or "لايوجد").. "\n\n♦️￤» اسمك  •  "..(check_markdown(msg.from.first_name or "----")).."\n\n♦️￤» ايديك •  "..user.."\n\n♦️￤»  موقعك • الادمن \n\n•~~•🗯•~~•♦️•~~•🗯•~~•\n\n•💠• تابعنا @TEAMSTORM "
elseif matches[1]=="موقعي" then 
return "•🚸• موقعك في المجموعه •🚸• \n\n•~~•🗯•~~•♦️•~~•🗯•~~• \n \n\n♦️￤»  رسائلك • { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n\n♦️￤»  معرفك •   @"..(msg.from.username or "لايوجد").. "\n\n♦️￤» اسمك  •  "..(check_markdown(msg.from.first_name or "----")).."\n\n♦️￤» ايديك •  "..user.."\n\n♦️￤»  موقعك • عضو \n\n•~~•🗯•~~•♦️•~~•🗯•~~•\n\n•💠• تابعنا @TEAMSTORM "
------------------------------
end
end

return {
  patterns = {
    "^(gid)$",
    "^(اسمي)$",
        "^(معرفي)$",
    "^(رسايلي)$",
        "^(رسائلي)$",
"^(الحساب) (.*)$",
"^(جلب صوره) (.*)$",
        "^(موقعي)$",
    },
  run = run
}
end
