-- Variables

local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        for k, v in pairs(QBCore.Shared.StarterItems) do
            local info = {}
            if v.item == "id_card" then
                info.citizenid = Player.PlayerData.citizenid
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                info.gender = Player.PlayerData.charinfo.gender
                info.nationality = Player.PlayerData.charinfo.nationality
            elseif v.item == "driver_license" then
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                info.type = "Class C Driver License"
            end
            Player.Functions.AddItem(v.item, 1, false, info)
        end
    end
end

local function IsWhitelistedSchool(citizenid)
    local retval = false
    for k, v in pairs(Config.DrivingIntructors) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

-- Events

RegisterNetEvent('qb-cityhall:server:requestId', function(identityData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if Player then
        if identityData.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif identityData.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        elseif identityData.item == "weaponlicense" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
        end

        Player.Functions.AddItem(identityData.item, 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[identityData.item], 'add')
    end
end)

RegisterNetEvent('qb-cityhall:server:getIDs', function()
    local src = source
    GiveStarterItems(src)
end)

RegisterNetEvent('qb-cityhall:server:sendDriverTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        for k, v in pairs(Config.DrivingInstructors)
            local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(k)
            if SchoolPlayer then 
                TriggerClientEvent("qb-cityhall:client:sendDriverEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
            else
                local mailData = {
                    sender = "Township",
                    subject = "Driving lessons request",
                    message = "Hello,<br /><br />We have just received a message that someone wants to take driving lessons.<br />If you are willing to teach, please contact us:<br />Name: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Phone number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
                    button = {}
                }
                TriggerEvent("qb-phone:server:sendNewEventMail", k, mailData)
            end
        end
        TriggerClientEvent('QBCore:Notify', src, 'An email has been sent to driving schools, and you will be contacted automatically', "success", 5000)
    end
end)

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.SetJob(job, 0)
        TriggerClientEvent('QBCore:Notify', src, 'Congratulations with your new job! ('..QBCore.Shared.Jobs[job].label..')')
    end
end)

RegisterNetEvent('qb-cityhall:server:banPlayer', function()
    local src = source
    TriggerClientEvent('chatMessage', -1, "QB Anti-Cheat", "error", GetPlayerName(src).." has been banned for sending POST Request's ")
    exports.oxmysql:insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        GetPlayerName(src),
        QBCore.Functions.GetIdentifier(src, 'license'),
        QBCore.Functions.GetIdentifier(src, 'discord'),
        QBCore.Functions.GetIdentifier(src, 'ip'),
        'Abuse localhost:13172 For POST Requests',
        2145913200,
        GetPlayerName(src)
    })
    DropPlayer(src, 'Attempting To Exploit')
end)

-- Commands

QBCore.Commands.Add("drivinglicense", "Give a drivers license to someone", {{"id", "ID of a person"}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        if Config.DrivingInstructors[Player.PlayerData.citizenid] then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if SearchedPlayer then
                if not SearchedPlayer.PlayerData.metadata["licences"]["driver"] then
                    SearchedPlayer.PlayerData.metadata['licences']['driver'] = true
                    SearchedPlayer.Functions.SetMetaData("licences", SearchedPlayer.PlayerData.metadata['licences'])
                    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your driver's license at the town hall", "success", 5000)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Can't give driver's license ..", "error")
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have access to this command.", "error")
        end
    end
end)
