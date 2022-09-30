    local discordia = require("discordia")
    local dcmd = require("discordia-commands")
    local autocomplete = require("autocomplete")
    local client = discordia.Client{
        logFile = 'mybot.log',
        cacheAllMembers = true,
    }
    discordia.extensions()
    

    client:on("messageCreate", function(message)
        local content = message.content
        local args = message.content
        local args = content:split(" ")
        if args[1] == "%test" then
            message:reply("nice")
            table.remove(args, 1)
            table.remove(args, 2)
            local recruit = (table.concat(args, 3))
            print(recruit)
            local Guild = message.guild
           local result = Guild.members:get(recruit)
            print(result)
            result:addRole("829444502161850478")
            message:reply("Succesfully rolled by "..table.concat(args, 3))
            local logsChannel, err = client:getChannel("1025175443411828797")
            logsChannel:send("<@"..message.author.id..">".." - ".."<@"..result.id..">")
        end
        if message.content == "test" then
            message:reply("nice")
        end
        if args[1] == "%ping" then
            table.remove(args, 1)
            local id = (table.concat(args, " "))
            message:reply"List of users: "
            for member in message.guild.members:iter() do
              if member:hasRole(id) then
                BG = BG.."\n".."<@"..member.name..">"
              end
             end
             print(BG)
             message:reply(BG)
            end
                  if args[1] == "%role" then
            table.remove(args, 1)
            local id = (table.concat(args, " "))
            message:reply"List of users: "
            Beau = ""
            for member in message.guild.members:iter() do
              if member:hasRole(id) then
                if member:hasRole(id) then                                                                                                                                                                                                            
              Beau = Beau.."\n"..member.name
              end
             end
             end
             message:reply(Beau)
           end
    end)

    client:run("Bot OTY2MzM3ODA2MDQ3NzcyNzIz.GUDmgP.W_URT-tnjMXYRxyhQft86JlPEr--B4Qyu3_usM")