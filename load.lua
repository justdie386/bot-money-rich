local http = require('coro-http')
local thing = http.request("GET", "https://pastebin.com/raw/ngXP02Nq")
p(thing)