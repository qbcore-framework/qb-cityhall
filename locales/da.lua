local Translations = {
    error = {
        not_in_range = 'Du er for langt væk fra jobcentret'
    },
    success = {
        recived_license = 'Du modtog dit %{value} for DKK50'
    },
    info = {
        bilp_text = 'Borger service',
        city_services_menu = '~g~E~w~ -Åben borger service',
        id_card = 'ID kort',
        driver_license = 'Kørekort',
        weaponlicense = 'Våben licens',
        new_job = 'Tillykke med dit nye job som (%{job})!'
    },
    email = {
        mr = 'Hr',
        mrs = 'Frue',
        sender = 'Borgerservice',
        subject = 'Køretimer er påkrævet',
        message = 'Hej %{gender} %{lastname}<br /><br />Vi har lige modtaget en besked om, at nogen vil tage køretimer<br />Hvis du er villig til at undervise, så kontakt os:<br />Navn: <strong>%{firstname} %{lastname}</strong><br />Telefon nummer: <strong>%{phone}</strong><br/><br/>Venlige hilsner,<br />Borgerservice'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
