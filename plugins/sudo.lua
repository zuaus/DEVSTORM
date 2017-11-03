--Start 
local function run (msg,matches)

  if matches[1]:lower() == 'تنظيف' and matches[2]:lower() == 'الحظر' then
if not is_sudo(msg) then
      return -- «Mods allowed»
    end
	    local function cleanbl(ext, res)
      if tonumber(res.total_count_) == 0 then -- «Blocklist is empty or maybe Bot is not group's admin»
        return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, '⛥┇قائمه الحظر خاليه من الاعضاء', 1 , 'md')
      end
      local x = 0
      for x,y in pairs(res.members_) do
        x = x + 1
        tdcli.changeChatMemberStatus(ext.chat_id, y.user_id_, 'Left', dl_cb, nil) -- «Changing user status to left, removes user from blocklist»
      end
      return tdcli.sendMessage(ext.chat_id, ext.msg_id, 0, '⛥┇تم رفع الحظر عن جميع الاعضاء ✔', 1 , 'md')
    end
	
    return tdcli.getChannelMembers(msg.to.id, 0, 'Kicked', 200, cleanbl, {chat_id = msg.to.id, msg_id = msg.id}) -- «Gets channel blocklist»
  end

end

return {
  patterns ={
    "^(تنظيف) (الحظر)$",
  },
  run = run,
}

