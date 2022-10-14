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
            if interaction.member:hasRole("1010651979229442079") == true then
                
                if interaction.data.name == "role" then
                    print(args.this.recruit)
                local recruiter = args.this.recruiter
                local recruit = args.this.recruit

                print(recruit.name)
                recruit:addRole(rolex)
                recruit:addRole(role1)
                recruit:addRole(role2)
                recruit:addRole(role3)
                recruit:addRole(role4)
                recruit:addRole(role5)
                recruit:addRole(role6)
                 recruit:addRole(role7)

            recruit:setNickname("[35th] "..recruit.name)
            local logsChannel, err = client:getChannel(logChannel)
            local success, err = interaction:reply{
                embed = {
                    title = "Succesfully roled by "..tostring(recruit.name),
                }
            }
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
            interaction:reply("List of user:")
        for member in interaction.guild.members:iter() do
            if member:hasRole(args.from.role) then
            BG = BG.."\n"..member.name
            Checker = Checker + 1
                if Checker == 40 then
                    print(BG)
                    ResultChannel:send(BG)
                    BG = " "
                    Checker = 0
                    interaction:reply(interaction.member)
                end
            end
        end
        if Checker ~= 0 or 40 then
                    print(BG)
            ResultChannel:send(BG)
            print(interaction.data.name.." used the command")
            Checker = 0
            interaction:reply(interaction.member)
        end
            end
        if interaction.data.name == "get-users-ping" then
            interaction:reply("List of user:")
            Check = 0
            Number = 0
            for member in interaction.guild.members:iter() do
                if member:hasRole(args.from.role) then
                Beau = Beau.."\n".."<@"..member.id..">"
                print(Beau)
                Check = Check + 1
                if Check == 40 then
                            print(Beau)
                    ResultChannel:send(Beau)
                    Beau = " "
                    Check = 0
                    interaction:reply(interaction.member)
                end
                end
            end
            if Check ~= 0 or 40 then
                    print(Beau)
                ResultChannel:send(Beau)
                Check = 0
                interaction:reply(interaction.member)
            end
    end
else interaction:reply("You aren't a 35th staff don't even try") end
    end)
    client:run(token)
    print("naw man you are awesome too")
    if nice == "nice" then
        print("nice")
    end