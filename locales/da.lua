local Translations = {
    error = {
        not_in_range = 'Du er for langt væk fra jobcentret'
    },
    success = {
        recived_license = 'Du modtog dit %{value} for DKK50'
    },
    info = {
        new_job_app = 'Your application was sent to the boss of (%{job})',
        bilp_text = 'Borger service',
        city_services_menu = '~g~E~w~ -Åben borger service',
        id_card = 'ID kort',
        driver_license = 'Kørekort',
        weaponlicense = 'Våben licens',
        new_job = 'Tillykke med dit nye job som (%{job})!'
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Thank you for applying to %(job).",
        jobAppMsg = "Hello %{gender} %{lastname}<br /><br />%{job} has received your application.<br /><br />The boss is looking into your request and will reach out to you for an interview at their earliest convienance.<br /><br />Once again, thank you for your application.",
        mr = 'Hr',
        mrs = 'Frue',
        sender = 'Borgerservice',
        subject = 'Køretimer er påkrævet',
        message = 'Hej %{gender} %{lastname}<br /><br />Vi har lige modtaget en besked om, at nogen vil tage køretimer<br />Hvis du er villig til at undervise, så kontakt os:<br />Navn: <strong>%{firstname} %{lastname}</strong><br />Telefon nummer: <strong>%{phone}</strong><br/><br/>Venlige hilsner,<br />Borgerservice'
    }
}

if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
