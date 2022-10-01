local discordia = require("discordia")
local dcmd = require("discordia-commands")
local autocomplete = require("autocomplete")
local commandType = discordia.enums.appCommandType
local optionType = discordia.enums.appCommandOptionType
local client = discordia.Client{
	logFile = 'mybot.log',
	cacheAllMembers = true,
}
discordia.extensions()
local http = require('coro-http')
local res, body = http.request("GET", "https://raw.githubusercontent.com/justdie386/bot-money-rich/main/load.lua?token=GHSAT0AAAAAABZMBISEB2NORONYTXABJFL6YZYVFYA")
if res.code > 299 then
  print('Failed to fetch github: ' .. res.reason)
else
  print('Successfully fetched github!')
  
end
local env = {
  test = 5,
  role1 = 5,
  role2 = 5,
  role3 = 5,
  role4 = 5,
  role6 = 5,
  logs = 5,
}
env = setmetatable(env, {__index = getfenv(1)})

load(body, nil, nil, env)()

