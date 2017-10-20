local function run (msg , matches)
if matches[1]:lower() == "الاوامر" or matches[1] == 'help' and is_mod(msg) then
if not lang then
text = [[
📍 اهــلا بك عــزيزي هنــاك 4 قوائم ليتم عرضها 

            ⚜ • • • • • • • • • • • • • • • •⚜


📌┇ - م1  لعـرض قائمــه الـحمـايـه⚔🛡


🔕┇ - م2  لعـرض قائمــه الحـظر والطـرد🚸🗑


🔱┇ - م3  «لعــرض اوامـر المجموعـه 🔧


👥┇ - م4  «لعــرض اوامـر المطور 👨🏻‍🚀


            ⚜ • • • • • • • • • • • • • • • •⚜

]]
elseif lang then
text = [[
setowner [username|id|reply] 
Set Group
 Owner(Multi Owner)

remowner [username|id|reply] 
 Remove User From Owner List
 
promote [username|id|reply] 
Promote User To Group Admin

demote [username|id|reply] 
Demote User From Group Admins List

setflood [1-50]
Set Flooding Number

silent [username|id|reply] 
Silent User From Group

unsilent [username|id|reply] 
Unsilent User From Group

kick [username|id|reply] 
Kick User From Group

ban [username|id|reply] 
Ban User From Group

unban [username|id|reply] 
UnBan User From Group

id [reply]
Show User ID


lock 
📛 ┇
[ link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all ]
If This Actions Lock, Bot Check Actions And Delete Them

unlock 
 📮┇
[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all]
If This Actions Unlock, Bot Not Delete Them

set[rules | name | link | about | welcome]
Bot Set Them

clean [bans | mods | bots | rules | about | silentlist | filtelist | welcome]   
Bot Clean Them

filter [word]
Word filter

unfilter [word]
Word unfilter

pin [reply]
Pin Your Message

unpin 
Unpin Pinned Message

settings
Show Group Settings

silentlist
Show Silented Users List

filterlist
Show Filtered Words List

banlist
Show Banned Users List

ownerlist
Show Group Owners List 

modlist 
Show Group Moderators List

id
Show Your And Chat ID

link
Show Group Link

setwelcome. + text
set Welcome Message

addsudo [username|id|reply] 
Set  sudos

remsudo [username|id|reply] 
rem sudos

sudolist  
Show. sudos Users List

addadmin [username|id|reply] 
Set  sudos

remadmin [username|id|reply] 
Set  sudos

adminlist
Show adminsbot  Users List

  ;)]]
end
return text
end
-----------------------------------------
if matches[1]:lower() == "h1" or matches[1] == 'م1' and is_mod(msg) then
if not lang then
lock = [[
🔹- اهلا صديقي في اوامر الحمايه 👁‍🗨
🔸 〰 〰 〰 〰 〰 🔸

🎭┇قفل : /
                 => + الامر 
🎭┇فتح : \
🔹 〰 〰 〰 〰 〰 🔹

👁‍🗨┇ الروابط  📮

👁‍🗨┇ التوجيه. ♻

👁‍🗨┇ التاك   🏷

👁‍🗨┇ التعديل. 📎

👁‍🗨┇ البوتات. 👾

👁‍🗨┇ التكرار   ⚠️

👁‍🗨┇ الكلايش  📝

👁‍🗨┇ العربيه   📜

👁‍🗨┇ الفشار. 🔞

👁‍🗨┇ الاضافه.  🖇

👁‍🗨┇ الصفحات  💻

👁‍🗨┇الاغاني 🎤

👁‍🗨┇التثبيت🔖 

👁‍🗨┇الماركداون 🃏

👁‍🗨┇الاشعارات 🚩

👁‍🗨┇المتحركه 🎭

👁‍🗨┇الملصقات ♣

👁‍🗨┇الجهات 📞

👁‍🗨┇الملفات 📇

👁‍🗨┇التاك 🆔

👁‍🗨┇الصور 📷

👁‍🗨┇المواقع 🚏

👁‍🗨┇الفيديو 📺

👁‍🗨┇الصوت 📢

👁‍🗨┇الدردشه📝



🔱 〰 〰 〰 〰 〰 🔱

📌 @TAHAJ20
]]

elseif lang then

lock = [[
elseif lang then
text = [[
setowner [username|id|reply] 
Set Group
 Owner(Multi Owner)

remowner [username|id|reply] 
 Remove User From Owner List
 
promote [username|id|reply] 
Promote User To Group Admin

demote [username|id|reply] 
Demote User From Group Admins List

setflood [1-50]
Set Flooding Number

silent [username|id|reply] 
Silent User From Group

unsilent [username|id|reply] 
Unsilent User From Group

kick [username|id|reply] 
Kick User From Group

ban [username|id|reply] 
Ban User From Group

unban [username|id|reply] 
UnBan User From Group

id [reply]
Show User ID


lock 
📛 ┇
[ link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all ]
If This Actions Lock, Bot Check Actions And Delete Them

unlock 
 📮┇
[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all]
If This Actions Unlock, Bot Not Delete Them

set[rules | name | link | about | welcome]
Bot Set Them

clean [bans | mods | bots | rules | about | silentlist | filtelist | welcome]   
Bot Clean Them

filter [word]
Word filter

unfilter [word]
Word unfilter

pin [reply]
Pin Your Message

unpin 
Unpin Pinned Message

settings
Show Group Settings

silentlist
Show Silented Users List

filterlist
Show Filtered Words List

banlist
Show Banned Users List

ownerlist
Show Group Owners List 

modlist 
Show Group Moderators List

id
Show Your And Chat ID

link
Show Group Link

setwelcome. + text
set Welcome Message

addsudo [username|id|reply] 
Set  sudos

remsudo [username|id|reply] 
rem sudos

sudolist  
Show. sudos Users List

addadmin [username|id|reply] 
Set  sudos

remadmin [username|id|reply] 
Set  sudos

adminlist
Show adminsbot  Users List

]]
end
return lock
end
-----------------------------------------
if matches[1]:lower() == "h2" or matches[1] == 'م2' and is_mod(msg) then
if not lang then
lock2 = [[
اهلا عــزيزي في اوامــر الحــظر والطـرد 🚸🗑

ّ⚜ • • • • • • • • • • • •• • •⚜

 ⚜ {الحظــر } 🚫

🎐  حظر ❌

🎐  الغاء حظر ⭕️


⚜ • • • • • • • • • • •  • • •⚜

 ⚜ {لطــرد العــضو} 🚸

🗑 طرد 🚸

⚜ • • • • • • • • • • •  • • •⚜
 ⚜ {الـعـام} ⚫️

📍  حظر عام 🚯

📍 الغاء العام 🎎


⚜ • • • • • • • • • • •  • • •⚜

⚜ {قائمــه المنــع} 🔴

•  منع 🔴

 • الغاء منع ⛔️

⚜ • • • • • • • • • • •  • • •⚜

  ⚜ {قائمــﮭه الكتم} 🚫

{كتم} 🤐

 {الغاء الكتم} 🙂


⚜ • • • • • • • • • •  • • • •⚜

🔱  <TAHA>  🔱
]]
elseif lang then

lock2 = [[
اelseif lang then
text = [[
setowner [username|id|reply] 
Set Group
 Owner(Multi Owner)

remowner [username|id|reply] 
 Remove User From Owner List
 
promote [username|id|reply] 
Promote User To Group Admin

demote [username|id|reply] 
Demote User From Group Admins List

setflood [1-50]
Set Flooding Number

silent [username|id|reply] 
Silent User From Group

unsilent [username|id|reply] 
Unsilent User From Group

kick [username|id|reply] 
Kick User From Group

ban [username|id|reply] 
Ban User From Group

unban [username|id|reply] 
UnBan User From Group

id [reply]
Show User ID


lock 
📛 ┇
[ link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all ]
If This Actions Lock, Bot Check Actions And Delete Them

unlock 
 📮┇
[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all]
If This Actions Unlock, Bot Not Delete Them

set[rules | name | link | about | welcome]
Bot Set Them

clean [bans | mods | bots | rules | about | silentlist | filtelist | welcome]   
Bot Clean Them

filter [word]
Word filter

unfilter [word]
Word unfilter

pin [reply]
Pin Your Message

unpin 
Unpin Pinned Message

settings
Show Group Settings

silentlist
Show Silented Users List

filterlist
Show Filtered Words List

banlist
Show Banned Users List

ownerlist
Show Group Owners List 

modlist 
Show Group Moderators List

id
Show Your And Chat ID

link
Show Group Link

setwelcome. + text
set Welcome Message

addsudo [username|id|reply] 
Set  sudos

remsudo [username|id|reply] 
rem sudos

sudolist  
Show. sudos Users List

addadmin [username|id|reply] 
Set  sudos

remadmin [username|id|reply] 
Set  sudos

adminlist
Show adminsbot  Users List

]]
end
return lock2
end
-----------------------------------------
if matches[1]:lower() == "h3" or matches[1] == "م3" and is_mod(msg) then
if not lang then
helpfun = [[
• اوامر المجموعـه👩🏻‍🔧👨🏻‍🔧 •

⚜ • • • • • • • • • • • • • •⚜

👁‍🗨┇  تثبيت  >  بالرد 📌

👁‍🗨┇  الغاء تثبيت > بالرد 📌 🗑

👁‍🗨┇  تفعيل الترحيب ⚫️

👁‍🗨┇  تعطيل الترحيب 🔴

⚜ • • • • • • • • • • • • • •⚜

 🖲| ضع رابط  ◄ ثم ارسل الرابط  🔗

 🖲|ضع قوانين  +  النص 📋    

 🖲| ضع وصف  + النص 🏷

 🖲| ضع ترحيب +  النص 🎊

 🖲| ضع اسم. +  النص  📝     

⚜ • • • • • • • • • • • • • •⚜

 📮┇ مسح  ◄  الاوامر ادناه ↓

🌟 |  المحظورين  🔸 المكتومين  🔹قائمه العام

🌟 |  قائمه المنع 🔸 الادمنيه  🔹  المدراء

🌟 |  الوصف  🔸 القوانين  🔹  الترحيب

⚜ • • • • • • • • • • • • • •⚜

⚒• المحظورين :- لـعرض المحظورين 🚫

⚒• المكتومين :- لـعرض المكتومين 🔕

⚒• قائمه المنع :- لـعرض الكلمات الممنوعه📄

⚒• الادمنيه :- لـعرض ادمنيه البوت 👮🏻

⚒• المدراء :- لـعرض مدراء المجموعه 👨🏻‍✈️

⚒• الوصف :- لـعرض وصـف المجموعه 📇

⚒• القوانين :- لـعرض قوانين المجموعه 📋


⚜ • • • • • • • • • • • • • •⚜
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, helpfun, 1, 'md')
else

helpfun = [[
elseif lang then
text = [[
setowner [username|id|reply] 
Set Group
 Owner(Multi Owner)

remowner [username|id|reply] 
 Remove User From Owner List
 
promote [username|id|reply] 
Promote User To Group Admin

demote [username|id|reply] 
Demote User From Group Admins List

setflood [1-50]
Set Flooding Number

silent [username|id|reply] 
Silent User From Group

unsilent [username|id|reply] 
Unsilent User From Group

kick [username|id|reply] 
Kick User From Group

ban [username|id|reply] 
Ban User From Group

unban [username|id|reply] 
UnBan User From Group

id [reply]
Show User ID


lock 
📛 ┇
[ link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all ]
If This Actions Lock, Bot Check Actions And Delete Them

unlock 
 📮┇
[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all]
If This Actions Unlock, Bot Not Delete Them

set[rules | name | link | about | welcome]
Bot Set Them

clean [bans | mods | bots | rules | about | silentlist | filtelist | welcome]   
Bot Clean Them

filter [word]
Word filter

unfilter [word]
Word unfilter

pin [reply]
Pin Your Message

unpin 
Unpin Pinned Message

settings
Show Group Settings

silentlist
Show Silented Users List

filterlist
Show Filtered Words List

banlist
Show Banned Users List

ownerlist
Show Group Owners List 

modlist 
Show Group Moderators List

id
Show Your And Chat ID

link
Show Group Link

setwelcome. + text
set Welcome Message

addsudo [username|id|reply] 
Set  sudos

remsudo [username|id|reply] 
rem sudos

sudolist  
Show. sudos Users List

addadmin [username|id|reply] 
Set  sudos

remadmin [username|id|reply] 
Set  sudos

adminlist
Show adminsbot  Users List

]]
tdcli.sendMessage(msg.chat_id_, 0, 1, helpfun, 1, 'md')
end
end
-----------------------------------------
if matches[1] == "h4" or  matches[1] == "م4" and is_mod(msg) then
if not lang then
text = [[
 اوامـر الـمـطـور 👨🏻‍🚀

  ➖➖➖➖➖➖➖➖➖


🎐┇  تفعيل :لتفعيل البوت 🔵

🎐┇ تعطيل :لتعطيل البوت 🔴


  ➖➖➖➖➖➖➖➖➖
 
👤┇ رفع مدير.  ◄ { رد / معرف }

👤┇تنزيل مدير ◄ { رد / معرف }

👤┇رفع اداري   ◄ { رد / معرف }

👤┇تنزيل اداري ◄ { رد / معرف }

👤┇رفع ادمن    ◄ { رد / معرف }

👤┇تنزيل ادمن ◄ { رد / معرف }

👤┇رفع مطور  ◄ { رد / معرف } 

👤┇تنزيل مطور ◄ { رد / معرف }

  ➖➖➖➖➖➖➖➖➖

🔱┇ اذاعه  + الكلام ☑️

🔱┇ رساله  + ايدي المجموعه ✅

🔱┇ غادر  ◄ لخروج البوت 🙋🏻‍♂

  ➖➖➖➖➖➖➖➖➖

🔗┇المغادره تلقائيا ◄ تفعيل 🔵

🔗┇المغادره تلقائيا ◄ تعطيل 🔴

🔗┇ تنظيف  + العدد للـ100 فقط 🗑 

🔗 ┇المجموعات : لرؤيه المجموعات 📠 

➖➖➖➖➖➖➖➖➖
]]
tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
else

text = [[
elseif lang then
text = [[
setowner [username|id|reply] 
Set Group
 Owner(Multi Owner)

remowner [username|id|reply] 
 Remove User From Owner List
 
promote [username|id|reply] 
Promote User To Group Admin

demote [username|id|reply] 
Demote User From Group Admins List

setflood [1-50]
Set Flooding Number

silent [username|id|reply] 
Silent User From Group

unsilent [username|id|reply] 
Unsilent User From Group

kick [username|id|reply] 
Kick User From Group

ban [username|id|reply] 
Ban User From Group

unban [username|id|reply] 
UnBan User From Group

id [reply]
Show User ID


lock 
📛 ┇
[ link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all ]
If This Actions Lock, Bot Check Actions And Delete Them

unlock 
 📮┇
[link | tag | edit | arabic | webpage | bots | spam | flood | markdown | mention|gifs | photo | document | sticker | video | text | forward | location | audio | voice | contact | all]
If This Actions Unlock, Bot Not Delete Them

set[rules | name | link | about | welcome]
Bot Set Them

clean [bans | mods | bots | rules | about | silentlist | filtelist | welcome]   
Bot Clean Them

filter [word]
Word filter

unfilter [word]
Word unfilter

pin [reply]
Pin Your Message

unpin 
Unpin Pinned Message

settings
Show Group Settings

silentlist
Show Silented Users List

filterlist
Show Filtered Words List

banlist
Show Banned Users List

ownerlist
Show Group Owners List 

modlist 
Show Group Moderators List

id
Show Your And Chat ID

link
Show Group Link

setwelcome. + text
set Welcome Message

addsudo [username|id|reply] 
Set  sudos

remsudo [username|id|reply] 
rem sudos

sudolist  
Show. sudos Users List

addadmin [username|id|reply] 
Set  sudos

remadmin [username|id|reply] 
Set  sudos

adminlist
Show adminsbot  Users List

]]
tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
end
end
end


return {
patterns ={
"^([Hh]elp)$",
"^([Hh]1)$",
"^([Hh]2)$",
"^([Hh]3)$",
"^([Hh]4)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$"

}, 
run =run
}
