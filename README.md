# qb-cityhall
Updated version of qb-cityhall with extra license options + license examiners.

## New Features
- Ability to get driving lessons when drivers license has been seized
- New weapon, watercraft and aircraft licenses
- Examiners for weapon, watercraft and aircraft licenses

## Dependencies
For everything to work properly update the following
- [qb-phone](https://github.com/Jakats/qb-phone) - Email Notifications
- [qb-inventory](https://github.com/Jakats/qb-inventory) - Added new licenses as items
- [qb-policejob](https://github.com/Jakats/qb-policejob) - Added seizing for new licenses

Extra:
- [qb-shops](https://github.com/Jakats/qb-shops) - Require weapon license to purchase weapons
- [qb-logs](https://github.com/qbcore-framework/qb-logs) - Log System



## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-core
ensure qb-phone
ensure qb-logs
ensure qb-cityhall
```
- Add new licenses to qb-core shared.lua
```
    ["boat_license"] 				 = {["name"] = "boat_license",				    ["label"] = "Watercraft License",			["weight"] = 0,			["type"] = "item",		["image"] = "boat_license.png",		["unique"] = true,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Watercraft License"},
	["plane_license"] 				 = {["name"] = "plane_license",				    ["label"] = "Aircraft License",			["weight"] = 0,			["type"] = "item",		["image"] = "weapon_license.png",		["unique"] = true,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Aircraft License"},
```

## Configuration
Inside config.lua
```
Config = Config or {}

Config.CompanyPrice = 25000 -- NOT USED

Config.Cityhall = {         -- Location for Cithall
    coords = vector3(-265.0, -963.6, 31.2)
}

Config.DrivingSchool = {    -- Location for requesting DMV Lessons
    coords = vector3(240.42, -1379.78, 33.74)
}

Config.WeaponSchool = {     --Location for requesting shooting lessons
    coords = vector3(14.11, -1106.26, 29.8)
}

Config.BoatingSchool = {
    coords = vector3(-712.18, -1299.04, 5.1)
}

Config.FlyingSchool = {
    coords = vector3(-1154.42, -2715.46, 19.89)
}
```

To add driving and shooting instructors go to server/main.lua and edit the following: 
```
local DrivingSchools = {
    "CITiZENID1",
    "CITIZENID1"
}

local WeaponSchools = {
    "CITiZENID1",
    "CITIZENID2"
}

local BoatingSchools = {
    "CITiZENID1",
    "CITIZENID2"
}

local FlyingSchools = {
    "CITiZENID1",
    "CITIZENID2"
}
```
