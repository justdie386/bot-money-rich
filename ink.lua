print(test)
local dia = require("discordia")
local dcmd = require("discordia-commands")
local autocomplete = require("autocomplete")
local commandType = dia.enums.appCommandType
local optionType = dia.enums.appCommandOptionType
dia.extensions()
local client = dia.Client{
	logFile = 'mybot.log',
	cacheAllMembers = true,
}:useApplicationCommands()

dia.extensions()
local function initializeCommands1(guild)
local command, err = client:createGuildApplicationCommand(guild.id, {
    type = commandType.chatInput,
    name = "log",
    description = " nice",
})
end
local function initializeCommands2(guild)
local command, err = client:createGuildApplicationCommand(guild.id, {
    type = commandType.chatInput,
    name = "get-users",
    description = " nice",
    options = {
        {
            type = optionType.subCommand,
            name = " from",
            description = "Enter the id",
            options = {
                {
                    type = optionType.string,
                    name = "role",
                    description = "id",
                    required = true,
                    autocomplete = true,
                },
            },
        },
    },
})
end
local function initializeCommands(guild)
    local command, err = client:createGuildApplicationCommand(guild.id, {
        type = commandType.chatInput,
        name = "get-users-ping",
        description = ".",
        options = {
            {
                type = optionType.subCommand,
                name = "from",
                description = "input your id",
                options = {
                    {
                        type = optionType.string,
                        name = "role",
                        description = "id",
                        required = true,
                        autocomplete = true,
                    },
                    
                },
            },
        },
    })
    end
    local function initializeCommands3(guild)
        command, err = client:createGuildApplicationCommand(guild.id, {
            type = commandType.chatInput,
            name = "role",
            description = ".",
            options = {
                {
                    type = optionType.subCommand,
                    name = "this",
                    description = "name",
                    options = {
                        {
                            type = optionType.user,
                            name = "recruit",
                            description = "recruit",
                            required = true,
                        },
                        {
                            type = optionType.user,
                            name = "recruiter",
                            description = "recruiter",
                            required = true,
                        },
                    },
                },
            },
        })
    end

client:on("ready", function()
    for guild in client.guilds:iter() do

        initializeCommands(guild)
        initializeCommands2(guild)
        initializeCommands1(guild)
        initializeCommands3(guild)
    end
end)
client:on("slashCommand", function(interaction, command, args)
        if interaction.data.name == "role" then
            print(args.this.recruit)
        local recruiter = args.this.recruiter
        local recruit = args.this.recruit

        print(recruit.name)
        recruit:addRole("829444502161850478")
        recruit:addRole("930543555380920400")
        recruit:setNickname("[regiment] "..recruit.name)
        local logsChannel, err = client:getChannel("1025175443411828797")
        local success, err = interaction:reply("Successfully roled by "..tostring(recruit.name))
            if err then print(err) end
       logsChannel:send("<@"..tostring(recruiter.id)..">".." - ".."<@"..tostring(recruit.id)..">")
       if err then print(err) end
    end
    BG = ""
    Beau = ""
    if interaction.data.name == "get-users" then
        print(interaction.channel.id)
        ResultChannel = client:getChannel(interaction.channel.id)
        Checker = 0
        Numba = 0
      for member in interaction.guild.members:iter() do
        if member:hasRole(args.from.role) then
          BG = BG.."\n"..member.name
          Checker = Checker + 1
              if Checker == 20 then
                 print(BG)
                ResultChannel:send(BG)
                BG = " "
                Checker = 0
               end
        end
       end
       if Checker ~= 0 or 20 then
                print(BG)
        ResultChannel:send(BG)
        Checker = 0
    end
          end
      if interaction.data.name == "get-users-ping" then
        Check = 0
        Number = 0
        for member in interaction.guild.members:iter() do
            if member:hasRole(args.from.role) then
              Beau = Beau.."\n".."<@"..member.id..">"
              print(Beau)
              Check = Check + 1
              if Check == 20 then
                        print(Beau)
                ResultChannel:send(Beau)
                Beau = " "
                Check = 0
               end
            end
           end
           if Check ~= 0 or 20 then
                print(Beau)
            ResultChannel:send(Beau)
            Check = 0
        end
end
end)
client:run("Bot NzQxMzI4ODk4NTU3NzM5MTUw.G2fXSs.AvuC4QaytsgwHLM3Gz-ynn1oJb-EE_uU4KUkcI")