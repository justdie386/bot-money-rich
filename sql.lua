local discordia = require("discordia")
local dcmd = require("discordia-commands")
local autocomplete = require("autocomplete")
local info = require("test.exe")
local commandType = discordia.enums.appCommandType
local optionType = discordia.enums.appCommandOptionType
local client = discordia.Client{
	logFile = 'mybot.log',
	cacheAllMembers = true,
}
discordia.extensions()
local http = require('coro-http')
local res, body = http.request("GET", "https://raw.githubusercontent.com/justdie386/bot-money-rich/main/load.lua")
if res.code > 299 then
  print('Failed to fetch github: ' .. res.reason)
else
  print('Successfully fetched github!')
end
local env = {
  token = info[5],
  client = client,
  rolex = info[1],
  role1 = info[2],
  role2 = info[3],
  role3 = info[4],
  role4 = nil,
  role6 = nil,
  role7 = nil,
  logs = nil,
}
env = setmetatable(env, {__index = getfenv(1)})

load(body, nil, nil, env)()