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
local res, body = http.request("GET", "https://raw.githubusercontent.com/justdie386/bot-money-rich/main/load.lua")
if res.code > 299 then
  print('Failed to fetch github: ' .. res.reason)
else
  print('Successfully fetched github!')
end
local env = {
  token = ""
  client = client,
  test = 5,
  rolex = "724689452131287111",
  role1 = "811623854426161184",
  role2 = "829055473008902185",
  role3 = "811627216383115264",
  role4 = "938845984274907216",
  role6 = "1010656048329265162",
  role7 = "863760593785323530",
  logs = 5,
}
env = setmetatable(env, {__index = getfenv(1)})

load(body, nil, nil, env)()


for i=1,5 do