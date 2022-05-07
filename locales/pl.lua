local Translations = {
    error = {
        not_in_range = 'Za daleko od ratusza'
    },
    success = {
        recived_license = 'Otrzymałeś %{value} za $50'
    },
    info = {
        bilp_text = 'Usługi Miejskie',
        city_services_menu = '~g~E~w~ - Menu Usług Miejskich',
        id_card = 'Dowód Osobisty',
        driver_license = 'Prawo Jazdy',
        weaponlicense = 'Licencja na Broń',
        new_job = 'Gratulacje z powodu nowej pracy! (%{job})'
    },
    email = {
        mr = 'Pan',
        mrs = 'Pani',
        sender = 'Ratusz',
        subject = 'Prośba o lekcje jazdy',
        message = 'Witaj %{gender} %{lastname}<br /><br />Właśnie otrzymaliśmy wiadomość, że ktoś chce wziąć lekcje jazdy<br />Jeśli chcesz uczyć, skontaktuj się z nami:<br />Imię: <strong>%{firstname} %{lastname}</strong><br />Numer: <strong>%{phone}</strong><br/><br/>Z poważaniem,<br />Ratusz Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
