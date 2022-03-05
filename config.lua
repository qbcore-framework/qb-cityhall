Config = Config or {}

Config.UseTarget = false -- Use qb-target interactions

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-265.0, -963.6, 31.2),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = "City Services"
        },
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 50
            },
            ["driver_license"] = {
                label = "Driver License",
                cost = 50
            },
            ["weaponlicense"] = {
                label = "Weapon License",
                cost = 50
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(240.3, -1379.89, 33.74),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = "Driving School"
        },
        instructors = {
            "DJD56142",
            "DXT09752",
            "SRI85140",
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vec4(-262.79, -964.18, 30.22, 181.71),
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = true
        }
    },
    -- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(240.91, -1379.2, 32.74, 138.96),
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}
