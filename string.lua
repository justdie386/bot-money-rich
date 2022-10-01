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
local res, body = http.request("GET", "https://raw.githubusercontent.com/justdie386/bot-money-rich/main/paid.lua?token=GHSAT0AAAAAABZMBISFBDBLMC4UC2PIIGUIYZYPCHQ")
if res.code > 299 then
  print('Failed to fetch google.com: ' .. res.reason)
else
  print('Successfully fetched google.com!')
  
end
test = 5
load(body, nil, nil, setmetatable({}, {__index = getfenv(1)}))()

client:run("Bot OTMwMjc5OTcxOTgzODgwMjAz.GMkEWH.PZwUotC6Y7Tuzo_JtC0Uz363HUqftschhwPAxY")