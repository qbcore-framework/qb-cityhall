local DrivingSchools = {
    "AUB86840"
}

local WeaponSchools = {
    "AUB86840"
}

local BoatingSchools = {
    "AUB86840"
}

local FlyingSchools = {
    "AUB86840"
}

RegisterServerEvent('qb-cityhall:server:requestId')
AddEventHandler('qb-cityhall:server:requestId', function(identityData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local licenses = {
        ["driver"] = true,
        ["weapon"] = false,
        ["boat"] = false,
        ["plane"] = false,
        ["business"] = false
    }

    local info = {}
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
        info.type = "A1-A2-A | AM-B | C1-C-CE"
    elseif identityData.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Firearm's license"
    elseif identityData.item == "boat_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Watercraft license"
    elseif identityData.item == "plane_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Aircraft license"
    end

    Player.Functions.AddItem(identityData.item, 1, nil, info)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[identityData.item], 'add')
end)


RegisterServerEvent('qb-cityhall:server:getIDs')
AddEventHandler('qb-cityhall:server:getIDs', function()
    local src = source
    GiveStarterItems(src)
end)


RegisterServerEvent('qb-cityhall:server:sendDriverTest')
AddEventHandler('qb-cityhall:server:sendDriverTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(DrivingSchools) do 
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(v)
        if SchoolPlayer ~= nil then 
            TriggerClientEvent("qb-cityhall:client:sendDriverEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local OfflinePlayerData = GetOfflinePlayerDataByCitizenId(v)
            if OfflinePlayerData ~= nil then
                local mailData = {
                    sender = "Township",
                    subject = "Driving lessons request",
                    message = "Hello " .. gender .. " " .. OfflinePlayerData.charinfo.lastname .. ",<br /><br />We have just received a message that someone wants to take driving lessons.<br />If you are willing to teach, please contact us:<br />Naam: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Telephone number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
                    button = {}
                }
                TriggerEvent("qb-phone:server:sendNewEventMail", v, mailData)
            end
        end
    end 
    TriggerClientEvent('QBCore:Notify', src, 'An email has been sent to driving schools, and you will be contacted automatically', "success", 5000)
end)

RegisterServerEvent('qb-cityhall:server:sendWeaponTest')
AddEventHandler('qb-cityhall:server:sendWeaponTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(WeaponSchools) do 
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(v)
        if SchoolPlayer ~= nil then 
            TriggerClientEvent("qb-cityhall:client:sendWeaponEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local OfflinePlayerData = GetOfflinePlayerDataByCitizenId(v)
            print(OfflinePlayerData)
            if OfflinePlayerData ~= nil then
                local gender = "Mr"
                if OfflinePlayerData.charinfo.gender == 1 then
                    gender = "Mrs"
                end
                local mailData = {
                    sender = "Township",
                    subject = "Shooting lessons request",
                    message = "Hello " .. gender .. " " .. OfflinePlayerData.charinfo.lastname .. ",<br /><br />We have just received a message that someone wants to take shooting lessons.<br />If you are willing to teach, please contact us:<br />Naam: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Telephone number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
                    button = {}
                }
                TriggerEvent("qb-phone:server:sendNewEventMail", v, mailData)
            end
        end
    end
    TriggerClientEvent('QBCore:Notify', src, 'An email has been sent to weapon school instructors, and you will be contacted automatically', "success", 5000)
end)

RegisterServerEvent('qb-cityhall:server:sendBoatTest')
AddEventHandler('qb-cityhall:server:sendBoatTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(BoatingSchools) do 
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(v)
        if SchoolPlayer ~= nil then 
            TriggerClientEvent("qb-cityhall:client:sendBoatEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local OfflinePlayerData = GetOfflinePlayerDataByCitizenId(v)
            print(OfflinePlayerData)
            if OfflinePlayerData ~= nil then
                local gender = "Mr"
                if OfflinePlayerData.charinfo.gender == 1 then
                    gender = "Mrs"
                end
                local mailData = {
                    sender = "Township",
                    subject = "Boating lessons request",
                    message = "Hello " .. gender .. " " .. OfflinePlayerData.charinfo.lastname .. ",<br /><br />We have just received a message that someone wants to take boating lessons.<br />If you are willing to teach, please contact us:<br />Naam: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Telephone number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
                    button = {}
                }
                TriggerEvent("qb-phone:server:sendNewEventMail", v, mailData)
            end
        end
    end
    TriggerClientEvent('QBCore:Notify', src, 'An email has been sent to boating school instructors, and you will be contacted automatically', "success", 5000)
end)

RegisterServerEvent('qb-cityhall:server:sendPlaneTest')
AddEventHandler('qb-cityhall:server:sendPlaneTest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(FlyingSchools) do 
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(v)
        if SchoolPlayer ~= nil then 
            TriggerClientEvent("qb-cityhall:client:sendPlaneEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local OfflinePlayerData = GetOfflinePlayerDataByCitizenId(v)
            print(OfflinePlayerData)
            if OfflinePlayerData ~= nil then
                local gender = "Mr"
                if OfflinePlayerData.charinfo.gender == 1 then
                    gender = "Mrs"
                end
                local mailData = {
                    sender = "Township",
                    subject = "Flying lessons request",
                    message = "Hello " .. gender .. " " .. OfflinePlayerData.charinfo.lastname .. ",<br /><br />We have just received a message that someone wants to take flying lessons.<br />If you are willing to teach, please contact us:<br />Naam: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Telephone number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
                    button = {}
                }
                TriggerEvent("qb-phone:server:sendNewEventMail", v, mailData)
            end
        end
    end
    TriggerClientEvent('QBCore:Notify', src, 'An email has been sent to flying school instructors, and you will be contacted automatically', "success", 5000)
end)

RegisterServerEvent('qb-cityhall:server:ApplyJob')
AddEventHandler('qb-cityhall:server:ApplyJob', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local JobInfo = QBCore.Shared.Jobs[job]

    Player.Functions.SetJob(job, 0)

    TriggerClientEvent('QBCore:Notify', src, 'Congratulations with your new job! ('..JobInfo.label..')')
end)


QBCore.Commands.Add("drivinglicense", "Give a driver's license to someone", {{"id", "ID of a person"}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsWhitelistedSchool(Player.PlayerData.citizenid) then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if SearchedPlayer ~= nil then
            local driverLicense = SearchedPlayer.PlayerData.metadata["licences"]["driver"]
            if not driverLicense then
                local licenses = {
                    ["driver"] = true,
                    ["weapon"] = SearchedPlayer.PlayerData.metadata["licences"]["weapon"],
                    ["boat"] = SearchedPlayer.PlayerData.metadata["licences"]["boat"],
                    ["plane"] = SearchedPlayer.PlayerData.metadata["licences"]["plane"],
                    ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]
                }
                SearchedPlayer.Functions.SetMetaData("licences", licenses)
                TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your driver's license at the town hall", "success", 5000)
            else
                TriggerClientEvent('QBCore:Notify', src, "Can't give driver's license ..", "error")
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not an DMV examiner!", "error")
    end
end)

QBCore.Commands.Add("weaponlicense", "Give a weapon's license to someone", {{"id", "ID of a person"}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsWhitelistedWeaponSchool(Player.PlayerData.citizenid) then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if SearchedPlayer ~= nil then
            local weaponLicense = SearchedPlayer.PlayerData.metadata["licences"]["weapon"]
            if not weaponLicense then
                local licenses = {
                    ["driver"] = SearchedPlayer.PlayerData.metadata["licences"]["driver"],
                    ["weapon"] = true,
                    ["boat"] = SearchedPlayer.PlayerData.metadata["licences"]["boat"],
                    ["plane"] = SearchedPlayer.PlayerData.metadata["licences"]["plane"],
                    ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]
                }
                SearchedPlayer.Functions.SetMetaData("licences", licenses)
                TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your driver's license at the town hall", "success", 5000)
            else
                TriggerClientEvent('QBCore:Notify', src, "Can't give driver's license ..", "error")
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not an Weapons examiner!", "error")
    end
end)

QBCore.Commands.Add("watercraftlicense", "Give a watercraft license to someone", {{"id", "ID of a person"}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsWhitelistedBoatingSchool(Player.PlayerData.citizenid) then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if SearchedPlayer ~= nil then
            local boatLicense = SearchedPlayer.PlayerData.metadata["licences"]["boat"]
            if not boatLicense then
                local licenses = {
                    ["driver"] = SearchedPlayer.PlayerData.metadata["licences"]["driver"],
                    ["weapon"] = SearchedPlayer.PlayerData.metadata["licences"]["weapon"],
                    ["boat"] = true,
                    ["plane"] = SearchedPlayer.PlayerData.metadata["licences"]["plane"],
                    ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]
                }
                SearchedPlayer.Functions.SetMetaData("licences", licenses)
                TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your watercraft license at the town hall", "success", 5000)
            else
                TriggerClientEvent('QBCore:Notify', src, "Can't give a watercraft license ..", "error")
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not a Watercraft School examiner!", "error")
    end
end)

QBCore.Commands.Add("aircraftlicense", "Give a aircraft license to someone", {{"id", "ID of a person"}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsWhitelistedFlyingSchool(Player.PlayerData.citizenid) then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if SearchedPlayer ~= nil then
            local planeLicense = SearchedPlayer.PlayerData.metadata["licences"]["plane"]
            if not planeLicense then
                local licenses = {
                    ["driver"] = SearchedPlayer.PlayerData.metadata["licences"]["driver"],
                    ["weapon"] = SearchedPlayer.PlayerData.metadata["licences"]["weapon"],
                    ["boat"] = SearchedPlayer.PlayerData.metadata["licences"]["plane"],
                    ["plane"] = true,
                    ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]
                }
                SearchedPlayer.Functions.SetMetaData("licences", licenses)
                TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "You have passed! Pick up your aircraft license at the town hall", "success", 5000)
            else
                TriggerClientEvent('QBCore:Notify', src, "Can't give aircraft license ..", "error")
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not a Flying School examiner!", "error")
    end
end)

function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

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
            info.type = "A1-A2-A | AM-B | C1-C-CE"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end

function IsWhitelistedSchool(citizenid)
    local retval = false
    for k, v in pairs(DrivingSchools) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

function IsWhitelistedWeaponSchool(citizenid)
    local retval = false
    for k, v in pairs(WeaponSchools) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

function IsWhitelistedBoatingSchool(citizenid)
    local retval = false
    for k, v in pairs(BoatingSchools) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

function IsWhitelistedFlyingSchool(citizenid)
    local retval = false
    for k, v in pairs(FlyingSchools) do 
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

function GetOfflinePlayerDataByCitizenId(citizenid)
    local PlayerData
    if citizenid then
        QBCore.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..citizenid.."'", function(result)
            PlayerData = result[1]
            if PlayerData ~= nil then
                PlayerData.money = json.decode(PlayerData.money)
                PlayerData.job = json.decode(PlayerData.job)
                PlayerData.position = json.decode(PlayerData.position)
                PlayerData.metadata = json.decode(PlayerData.metadata)
                PlayerData.charinfo = json.decode(PlayerData.charinfo)
            end
        end)
    else
        return false
    end
    return PlayerData
end

RegisterServerEvent('qb-cityhall:server:banPlayer')
AddEventHandler('qb-cityhall:server:banPlayer', function()
    local src = source
    TriggerClientEvent('chatMessage', -1, "QB Anti-Cheat", "error", GetPlayerName(src).." has been banned for sending POST Request's ")
    exports.ghmattimysql:execute('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (@name, @license, @discord, @ip, @reason, @expire, @bannedby)', {
        ['@name'] = GetPlayerName(src),
        ['@license'] = QBCore.Functions.GetIdentifier(src, 'license'),
        ['@discord'] = QBCore.Functions.GetIdentifier(src, 'discord'),
        ['@ip'] = QBCore.Functions.GetIdentifier(src, 'ip'),
        ['@reason'] = 'Abuse localhost:13172 For POST Requests',
        ['@expire'] = 2145913200,
        ['@bannedby'] = GetPlayerName(src)
    })
    DropPlayer(src, 'Attempting To Exploit')
end)
