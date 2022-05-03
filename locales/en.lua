local Translations = {
    error = {
        not_in_range = 'Too far from the city hall',
        not_enough_money = 'You don\'t have enough money on you, you need %{cost} cash',
        exploit_attempt = 'Attempted exploit abuse',
        already_has_permission = 'Can\'t give permission for a drivers license, this person already has permission',
    },
    success = {
        received_license = 'You have received your %{value} for $%{value2}',
        you_passed = 'You have passed! Pick up your drivers license at the town hall',
        drivers_license_granted = 'Player with ID %{value} has been granted access to a driving license'
    },
    info = {
        blip_text = 'City Services',
        city_services_menu = '[E] - City Services Menu',
        id_card = 'ID Card',
        drivers_license = 'Drivers License',
        weapons_license = 'Firearms License',
        new_job = 'Congratulations with your new job! (%{job})',
        driving_school = 'Driving School',
        take_driving_lessons = 'Take Driving Lessons',
        open_city_hall = 'Open City Hall',
        trucker = 'Trucker',
        taxi = 'Taxi',
        tow_truck = 'Tow Truck',
        news_reporter = 'News Reporter',
        garbage_collector = 'Garbage Collector',
        bus_driver = 'Bus Driver',
        email_sent = 'An email has been sent to driving schools, and you will be contacted automatically',
        give_drivers_license = 'Give a drivers license to someone'
    },
    email = {
        mr = 'Mr',
        mrs = 'Mrs',
        sender = 'Township',
        subject = 'Driving lessons request',
        message = 'Hello %{gender} %{lastname}<br /><br />We have just received a message that someone wants to take driving lessons<br />If you are willing to teach, please contact us:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Phone Number: <strong>%{phone}</strong><br/><br/>Kind regards,<br />Township Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
