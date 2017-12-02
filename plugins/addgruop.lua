local function run(msg,STORM)
  local key = 'chat:gp'..msg.to.id
  if STORM[1] == 'اضف رد' and is_mod(msg) then
    redis:hset(key,STORM[2],STORM[3])
    return "👁‍🗨￤» الــكلمــه {`"..STORM[2].."`}\n👁‍🗨￤» الــرد {`"..STORM[3].."`}\n👁‍🗨￤» تــم اضافتــها الــى قائمــه الردود"
  end
  
  if STORM[1] == 'حذف رد' and is_mod(msg) then
    redis:hdel(key,STORM[2])
    return "👁‍🗨￤» الــكلمــه {`"..STORM[2].."`}\n👁‍🗨￤» تــم ازالتها من قائمــه الردود"
  end
  
  if redis:hget(key,STORM[1]) then
    return redis:hget(key,STORM[1])
  end
end
 
return {
  patterns = {
    "^(اضف رد) ([^%s]+) (.+)$", 
"^(حذف رد) (.*)$",
    "^(.*)$"
    },
  run = run
}