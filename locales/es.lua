local Translations = {
    error = {
        not_in_range = 'Muy lejos de la municipalidad'
    },
    success = {
        recived_license = 'Has recibido tu %{value} por $50'
    },
    info = {
        bilp_text = 'Servicios municipales',
        city_services_menu = '[E] - Servicios municipales',
        id_card = 'DNI',
        driver_license = 'Licencia de conducir',
        weaponlicense = 'Licencia para portacion de armas',
        new_job = 'Felicidades por tu nuevo trabajo! (%{job})'
    },
    email = {
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Municipalidad',
        subject = 'Solicitud de clases de conducir',
        message = 'Hola %{gender} %{lastname}<br /><br />Acabamos de recibir un mensaje de que deseas clases de conducir<br />Si deseas enseñar, contactanos:<br />Nombre: <strong>%{firstname} %{lastname}</strong><br />Numero de teléfono: <strong>%{phone}</strong><br/><br/>Saludos,<br />Ayuntamiento Los Santos'
    }
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
