local QBCore = exports['qb-core']:GetCoreObject()
local availableJobs = {
    ["trucker"] = Lang:t('info.trucker'),
    ["taxi"] = Lang:t('info.taxi'),
    ["tow"] = Lang:t('info.tow_truck'),
    ["reporter"] = Lang:t('info.news_reporter'),
    ["garbage"] = Lang:t('info.garbage_collector'),
    ["bus"] = Lang:t('info.bus_driver')
}

-- Functions

local function giveStarterItems()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    for _, v in pairs(QBCore.Shared.StarterItems) do
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
            info.type = Lang:t('info.class_c_license')
        end
        Player.Functions.AddItem(v.item, 1, nil, info)
    end
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-cityhall:server:receiveJobs', function(_, cb)
    cb(availableJobs)
end)

-- Events

RegisterNetEvent('qb-cityhall:server:requestId', function(item, hall)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney("cash", itemInfo.cost) then return TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money', {cost = itemInfo.cost}), 'error') end
    local info = {}
    if item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = Lang:t('info.class_c_license')
    elseif item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    else
        return DropPlayer(src, Lang:t('error.exploit_attempt'))
    end
    if not Player.Functions.AddItem(item, 1, nil, info) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)

RegisterNetEvent('qb-cityhall:server:sendDriverTest', function(instructors)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    for i = 1, #instructors do
        local citizenid = instructors[i]
        local SchoolPlayer = QBCore.Functions.GetPlayerByCitizenId(citizenid)
        if SchoolPlayer then
            TriggerClientEvent("qb-cityhall:client:sendDriverEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local mailData = {
                sender = Lang:t('email.sender'),
                subject = Lang:t('email.subject'),
                message = Lang:t('email.message'),
                button = {}
            }
            TriggerEvent("qb-phone:server:sendNewMailToOffline", citizenid, mailData)
        end
    end
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.email_sent'), "success", 5000)
end)

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(job, cityhallCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    local pedCoords = GetEntityCoords(ped)
    local JobInfo = QBCore.Shared.Jobs[job]
    if #(pedCoords - cityhallCoords) >= 20.0 or not availableJobs[job] then
        return DropPlayer(source, Lang:t('error.exploit_attempt'))
    end
    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.new_job', {job = JobInfo.label}))
end)

RegisterNetEvent('qb-cityhall:server:getIDs', giveStarterItems)

-- Commands

QBCore.Commands.Add("drivinglicense", Lang:t('info.give_drivers_license'), {{"id", Lang:t('info.person_id')}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if SearchedPlayer then
        if not SearchedPlayer.PlayerData.metadata["licences"]["driver"] then
            for i = 1, #Config.DrivingSchools do
                for id = 1, #Config.DrivingSchools[i].instructors do
                    if Config.DrivingSchools[i].instructors[id] == Player.PlayerData.citizenid then
                        SearchedPlayer.PlayerData.metadata["licences"]["driver"] = true
                        SearchedPlayer.Functions.SetMetaData("licences", SearchedPlayer.PlayerData.metadata["licences"])
                        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t('success.you_passed'), "success", 5000)
                        TriggerClientEvent('QBCore:Notify', source, Lang:t('success.drivers_license_granted', {value = SearchedPlayer.PlayerData.source}), "success", 5000)
                        break
                    end
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t('error.already_has_permission'), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.player_not_online'), "error")
    end
end)
