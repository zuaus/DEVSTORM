do

local function run(msg, matches)
if matches[1]=="موقعي" and is_sudo(msg) then 
return "\n🖲┊اسم المجموعه :> \n\n|  "..msg.to.title.. "  |\n\n\n💳┊ايدي المجموعه :> \n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."\n\n\n 🔗| موقعك:: 》 المطور🎐\n"
elseif matches[1]=="موقعي" and is_admin(msg) then 
return  "\n🖲┊اسم المجموعه :> \n\n|  "..msg.to.title.. "  |\n\n\n💳┊ايدي المجموعه :> \n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 الاداري 📮"
elseif matches[1]=="موقعي" and is_owner(msg) then 
return  "\n🖲┊اسم المجموعه :> \n\n|  "..msg.to.title.. "  |\n\n\n💳┊ايدي المجموعه :> \n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 المدير 📌"
elseif matches[1]=="موقعي" and is_mod(msg) then 
return  "\n🖲┊اسم المجموعه :> \n\n|  "..msg.to.title.. "  |\n\n\n💳┊ايدي المجموعه :> \n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 الادمن 🔱"
elseif matches[1]=="موقعي" then 
return  "<code>\n🖲┊اسم المجموعه :> </code> \n\n|  "..msg.to.title.. "  |<code> \n\n\n💳┊ايدي المجموعه :> </code>\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 عضو 👥"
------------------------------
end
if matches[1]=="me" and is_sudo(msg) then 
return "\n🖲┊اسم المجموعه :> \n"..msg.to.title.. "\n\n\n💳┊ايدي المجموعه :> \n\n\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."\n\n\n 🔗| موقعك:: 》 المطور🎐"
elseif matches[1]=="me" and is_admin(msg) then 
return  "\n🖲┊اسم المجموعه :> \n"..msg.to.title.. "\n\n\n💳┊ايدي المجموعه :> \n\n\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 الاداري 📮"
elseif matches[1]=="me" and is_owner(msg) then 
return  "\n🖲┊اسم المجموعه :> \n"..msg.to.title.. "\n\n\n💳┊ايدي المجموعه :> \n\n\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 المدير 📌"
elseif matches[1]=="me" and is_mod(msg) then 
return  "\n🖲┊اسم المجموعه :> \n"..msg.to.title.. "\n\n\n💳┊ايدي المجموعه :> \n\n\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 الادمن 🔱"
elseif matches[1]=="me" then 
return  "\n🖲┊اسم المجموعه :> \n"..msg.to.title.. "\n\n\n💳┊ايدي المجموعه :> \n\n\n"..msg.to.id.. "\n\n\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. "\n\n\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n\n\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n\n\n ⚜┊ايديك :> "..user.."_\n\n\n *🔗| موقعك::* 》 عضو 👥"
------------------------------
end
end

return {
  patterns = {
    "^(me)$",
    "^(موقعي)$",
    },
  run = run
}
end
