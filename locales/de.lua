local Translations = {
    error = {
        not_in_range = 'Zu weit vom Rathaus entfernt'
    },
    success = {
        recived_license = 'Du hast deinen %{value} für 50$ zurückbekommen'
    },
    info = {
        bilp_text = 'Rathaus',
        city_services_menu = '~g~E~w~ - Rathaus',
        id_card = 'Ausweis',
        driver_license = 'Führerschein',
        weaponlicense = 'Waffenschein',
        new_job = 'Herzlichen Glückwunsch zu deinem neuen Job! (%{job})'
    },
    email = {
        mr = 'Sehr geehrter Herr',
        mrs = 'Sehr geehrte Frau',
        sender = 'Gemeinde',
        subject = 'Anfrage für Fahrstunden',
        message = '%{gender} %{lastname}<br /><br />Wir haben gerade eine Nachricht erhalten, dass jemand Fahrstunden nehmen möchte<br />Wenn Sie bereit sind zu unterrichten, nehmen Sie bitte Kontakt mit uns auf:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Telefonnummer: <strong>%{phone}</strong><br/><br/>Mit freundlichen Grüßen<br />Gemeinde Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
