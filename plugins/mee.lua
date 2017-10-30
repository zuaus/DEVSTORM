do

local function run(msg, matches)
if matches[1] == "ايديي" and is_sudo(msg) then 
return "\n `"..msg.from.id.."`"
elseif matches[1]=="ايديي" and is_admin(msg) then 
return "\n `"..msg.from.id.."`"
elseif matches[1]=="ايديي" and is_owner(msg) then 
return "\n `"..msg.from.id.."`"
elseif matches[1]=="ايديي" and is_mod(msg) then 
return "\n `"..msg.from.id.."`"
elseif matches[1]=="معرفي" then 
return  "\n👁‍🗨┊معرفك :> @"..(msg.from.username or "لايوجد").. "\n"
elseif matches[1]=="``" then 
return  "\n🗯┊رسائلك :> "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).."\n"
elseif matches[1]=="اسمي" then 
return  "\n♦️┊اسمك :> "..(check_markdown(msg.from.first_name or "----")).."\n "
elseif matches[1]=="ايديي" then 
return "\n `"..msg.from.id.."`"
------------------------------
end
if matches[1]=="موقعي" and is_sudo(msg) then 
return "\n⛥┋رسائلك ≫ { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n⛥┋معرفك ≫   @"..(msg.from.username or "لايوجد").. "\n⛥┋اسمك  ≫  "..(check_markdown(msg.from.first_name or "----")).."\n⛥┋ايديك  ≫  "..user.."\n⛥┋موقعك ≫ المطور"
elseif matches[1]=="موقعي" and is_admin(msg) then 
return "\n⛥┋رسائلك ≫ { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n⛥┋معرفك ≫   @"..(msg.from.username or "لايوجد").. "\n⛥┋اسمك  ≫  "..(check_markdown(msg.from.first_name or "----")).."\n⛥┋ايديك  ≫  "..user.."\n⛥┋موقعك ≫ المدير"
elseif matches[1]=="موقعي" and is_owner(msg) then 
return "\n⛥┋رسائلك ≫ { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n⛥┋معرفك ≫   @"..(msg.from.username or "لايوجد").. "\n⛥┋اسمك  ≫  "..(check_markdown(msg.from.first_name or "----")).."\n⛥┋ايديك  ≫  "..user.."\n⛥┋موقعك ≫ الاداري"
elseif matches[1]=="موقعي" and is_mod(msg) then 
return "\n⛥┋رسائلك ≫ { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n⛥┋معرفك ≫   @"..(msg.from.username or "لايوجد").. "\n⛥┋اسمك  ≫  "..(check_markdown(msg.from.first_name or "----")).."\n⛥┋ايديك  ≫  "..user.."\n⛥┋موقعك ≫ الادمن"
elseif matches[1]=="موقعي" then 
return "\n⛥┋رسائلك ≫ { "..tonumber(redis:get('msgs:'..msg.from.id..':'..msg.to.id) or 0).. " }\n⛥┋معرفك ≫   @"..(msg.from.username or "لايوجد").. "\n⛥┋اسمك  ≫  "..(check_markdown(msg.from.first_name or "----")).."\n⛥┋ايديك  ≫  "..user.."\n⛥┋موقعك ≫ عضو"
------------------------------
end
end

return {
  patterns = {
    "^(ايديي)$",
    "^(اسمي)$",
        "^(معرفي)$",
    "^(رسايلي)$",
        "^(موقعي)$",
    },
  run = run
}
end
