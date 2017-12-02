local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
    local channel_id = chat_id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
  else
    local group_id = chat_id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
  end
  return chat
end

local function tahaj20(msg, matches) 
if matches[1] == 'clean deleted' or 'اطرد المحذوف' and is_mod(msg) and msg.to.type == "channel" then 
  function check_deleted(TM, BD) 
    for k, v in pairs(BD.members_) do 
local function clean_cb(TM, BD)
if not BD.first_name_ then
kick_user(BD.id_, msg.to.id) 
end
end
tdcli.getUser(v.user_id_, clean_cb, nil)
 end 
    tdcli.sendMessage(msg.to.id, msg.id, 1, "👁‍🗨￤» مرحــبا عزيــزي المستخــدم \n👁‍🗨￤» تــــــم طرد الحـــسابـات المحذوفه", 1, 'md') 
  end 
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.to.id).ID,offset_ = 0,limit_ = 1000000}, check_deleted, nil)
  end 
end 

return {  
patterns ={  
'^(clean deleted)$',
	"^(اطرد المحذوف)$",
	},
  run = tahaj20 
}
---by tahaj20
