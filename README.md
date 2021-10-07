# qb-cityhall
City Services for QB-Core Framework :us:

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>


## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-phone](https://github.com/qbcore-framework/qb-phone) - For E-Mail
- [qb-logs](https://github.com/qbcore-framework/qb-logs) - Log System

## Screenshots
![City Services](https://i.imgur.com/KAFkAVO.png)
![Request Birth Certificate](https://i.imgur.com/GJp5m49.png)
![Request Driver License](https://i.imgur.com/xn6udGI.png)
![Apply For a Job](https://i.imgur.com/gl4SNjX.png)

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
```
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
```
