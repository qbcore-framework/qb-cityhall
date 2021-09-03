# qb-cityhall
City Services for QB-Core Framework :us:

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
Config = Config or {}

Config.CompanyPrice = 25000

Config.Cityhall = {
    coords = vector3(-265.0, -963.6, 31.2)
}

Config.DriverTest = {
    coords = vector3(-549.86, -191.75, 38.22)
}

Config.DrivingSchool = {
    coords = vector3(232.5, 368.7, 105.94)
}
```
