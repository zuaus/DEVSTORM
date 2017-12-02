local function taha(msg)
 if msg.content_.ID == "MessageUnsupported" and redis:get("mute-video-not"..msg.to.id) then
 tdcli.deleteMessages(msg.chat_id_, {[0] = tonumber(msg.id_)}) 
 end
end
local function tahaj20(msg, matches)
 if (matches[1] == "lock selph" or matches[1] == "قفل السيلفي") and not redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  hash = "mute-video-not"..msg.to.id
  redis:set(hash , true)
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم قفل  السيلفي" , 0, "md")
 elseif (matches[1] == "lock selph" or matches[1] == "قفل السيلفي") and redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم قفل  السيلفي" , 0, "md")
 elseif matches[1] == "unlock selph" or matches[1] == "فتح السيلفي" and not redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤تم فتح  السيلفي" , 0, "md")
 elseif matches[1] == "unlock selph" or matches[1] == "فتح السيلفي" and redis:get("mute-video-not"..msg.to.id) and is_mod(msg) then
  redis:del("mute-video-not"..msg.to.id)
  tdcli.sendMessage(msg.to.id,msg.id_ ,0, "👁‍🗨￤مرحــبا عزيــزي المستخــدم \n👁‍🗨￤بالفعل تم فتح  السيلفي" , 0, "md")
 end
end

return {
   patterns = {
      '^(lock selph)$',
      '^(unlock selph)$',
	  '^(قفل السيلفي)$',
	  '^(فتح السيلفي)$',
 },
  run = tahaj20,
  pre_process = taha
}