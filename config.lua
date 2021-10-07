Config = {}

Config.Cityhall = {
    coords = vector3(-265.0, -963.6, 31.2)
}

Config.DriverTest = {
    coords = vector3(-549.86, -191.75, 38.22)
}

Config.DrivingSchool = {
    coords = vector3(232.5, 368.7, 105.94)
}

--[[

Example to add driving instructors (needs citizenid)

Config.DrivingInstructors = {
    ["JDO85938"] = true,
    ["AKB01845"] = true,
}

--]]

Config.DrivingInstructors = {

}

Config.AvailableJobs = {
    ["trucker"] = {
        job = "trucker",
        label = "Trucker"
    },
    ["taxi"] = {
        job = "taxi",
        label = "Taxi Driver"
    },
    ["tow"] = {
        job = "tow",
        label = "Tow Truck"
    },
    ["reporter"] = {
        job = "reporter",
        label = "News Reporter"
    },
    ["garbage"] = {
        job = "garbage",
        label = "Garbage Collector"
    },
}

Config.IDTypes = {
    ["id_card"] = {
        label = "ID Card",
        item = "id_card"
    },
    ["driver_license"] = {
        label = "Drivers License",
        item = "driver_license"
    },
    ["weaponlicense"] = {
        label = "Firearms License",
        item = "weaponlicense"
    }
}
