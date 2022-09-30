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
                            type = optionType.string,
                            name = "Regiment",
                            description = "Regiment's name",
                            required = true,
                        },

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
        local recruit = args.this.recruit
        local recruiter = args.this.recruiter
        print(recruit.name)
        recruit:addRole("724689452131287111")
        recruit:addRole("811623854426161184")
        recruit:addRole("829055473008902185")
        recruit:addRole("811627216383115264")
        recruit:addRole("938845984274907216")
        recruit:addRole("862704039334641704")
        recruit:addRole("1010656048329265162")
        recruit:addRole("863760593785323530")
        recruit:setNickname("[CSG]] "..recruit.name)
        local logsChannel, err = client:getChannel("1012697310943264820")
        interaction:reply("Successfully roled by "..tostring(recruit.name))
       print("success")
       logsChannel:send("<@"..tostring(recruit.id)..">".." - ".."<@"..tostring(recruiter.id)..">")
       if err then print(err) end
    end
    BG = ""
    Beau = ""
    if interaction.data.name == "get-users" then
      for member in interaction.guild.members:iter() do
        if member:hasRole(args.from.role) then
          BG = BG.."\n"..member.name
        end
       end
       print(BG)
        interaction:reply(BG)
       if err then interaction:reply(err) end
      end
      if interaction.data.name == "get-users-ping" then
        for member in interaction.guild.members:iter() do
            if member:hasRole(args.from.role) then
              Beau = Beau.."\n".."<@"..member.id..">"
            end
           end
           local success, err = interaction:reply(Beau)
           if err then print(err) end
end
end)
    
client:run("Bot MTAyMzY5OTU5OTMwNDY5OTk1NA.GzxSiE.mOB-CGa8hbKqQJtB3ViAAQvCEV3_W53R73sxMA")