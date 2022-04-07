local QBCore = exports['qb-core']:GetCoreObject()
local inCityhallPage = false
local qbCityhall = {}

qbCityhall.Open = function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
    inCityhallPage = true
end

qbCityhall.Close = function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
    inCityhallPage = false
end

DrawText3Ds = function(coords, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(coords.x, coords.y, coords.z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    inCityhallPage = false
end)

local inRange = false

CreateThread(function()
    CityhallBlip = AddBlipForCoord(Config.Cityhall.coords)
    SetBlipSprite (CityhallBlip, 487)
    SetBlipDisplay(CityhallBlip, 4)
    SetBlipScale  (CityhallBlip, 0.65)
    SetBlipAsShortRange(CityhallBlip, true)
    SetBlipColour(CityhallBlip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Lang:t('info.bilp_text'))
    EndTextCommandSetBlipName(CityhallBlip)
end)

local creatingCompany = false
local currentName = nil

CreateThread(function()
    while true do

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        inRange = false

        local dist = #(pos - Config.Cityhall.coords)

        if dist < 20 then
            inRange = true
            DrawMarker(2, Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if #(pos - vector3(Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z)) < 1.5 then
                DrawText3Ds(Config.Cityhall.coords, Lang:t('info.city_services_menu'))
                if IsControlJustPressed(0, 38) then
                    qbCityhall.Open()
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(2)
    end
end)

RegisterNetEvent('qb-cityhall:client:getIds', function()
    TriggerServerEvent('qb-cityhall:server:getIDs')
end)

RegisterNetEvent('qb-cityhall:client:sendDriverEmail', function(charinfo)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('email.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('email.mrs')
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message =  Lang:t('email.message', {gender = gender, lastname = charinfo.lastname, firstname = charinfo.firstname, phone = charinfo.phone}),
            button = {}
        })
    end)
end)

local idTypes = {
    ["id_card"] = {
        label = Lang:t('info.id_card'),
        item = "id_card"
    },
    ["driver_license"] = {
        label = Lang:t('info.driver_license'),
        item = "driver_license"
    },
    ["weaponlicense"] = {
        label = Lang:t('info.weaponlicense'),
        item = "weaponlicense"
    }
}

RegisterNUICallback('requestId', function(data)
    if inRange then
        local idType = data.idType

        TriggerServerEvent('qb-cityhall:server:requestId', idTypes[idType])
        QBCore.Functions.Notify(Lang:t('success.recived_license',{value = idTypes[idType].label}), 'success', 3500)
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_range'), 'error')
    end
end)

RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = {}

    for type,_ in pairs(licensesMeta) do
        if licensesMeta[type] then
            local licenseType = nil
            local label = nil

            if type == "driver" then
                licenseType = "driver_license"
                label = Lang:t('info.driver_license')
            elseif type == "weapon" then
                licenseType = "weaponlicense"
                label = Lang:t('info.weaponlicense')
            end

            availableLicenses[#availableLicenses+1] = {
                idType = licenseType,
                label = label
            }
        end
    end
    cb(availableLicenses)
end)

RegisterNUICallback('applyJob', function(data)
    if inRange then
        TriggerServerEvent('qb-cityhall:server:ApplyJob', data.job)
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_range'), 'error')
    end
end)
