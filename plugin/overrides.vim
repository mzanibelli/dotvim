" Init
call cli#override("grep", "Grep")
call cli#override("h", "Help")
call cli#override("help", "Help")
call cli#override("make", "Make")
call cli#override("tag", "Tag")
call cli#override("w!!", "w !sudo tee % >/dev/null")
call cli#override("w$", "w")
call cli#override("w<", "w")
