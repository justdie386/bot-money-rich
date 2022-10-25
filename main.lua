local handle = io.popen("luvit.exe simple.lua")
local result = handle:read("*a")
print(result)
handle:close()