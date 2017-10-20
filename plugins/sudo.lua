--خلي معرفاتك بين الاقواس واحفض الملف 
local function run (msg , matches)
if matches[1]:lower() == "المطور" or matches[1] == 'مطور' and is_sudo and owner and admin(msg) then
if not lang then
text = [[


 ]]

end
return text
end
end


return {
patterns ={
"^(المطور)$",
 "^(مطور)$",
}, 
run =run
}
---امسح ملف الجهة الاتصال