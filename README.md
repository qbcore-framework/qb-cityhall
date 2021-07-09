# qb-cityhall
City Services for QB-Core Framework :us:

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-phone](https://github.com/qbcore-framework/qb-phone) - For E-Mail
- [qb-logs](https://github.com/qbcore-framework/qb-logs) - Log System

## Screenshots
![City Services](https://imgur.com/czVg0Ze.png)
![Request Birth Certificate](https://imgur.com/l6KSzPf.png)
![Request Driver License](https://imgur.com/pP24GEw.png)
![Apply For a Job](https://imgur.com/dXKKsn0.png)

## Features
- Ability to request birth certificate when lost
- Ability to request driver license when lost
- Ability to apply to government jobs

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

```
