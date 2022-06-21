local Translations = {
    error = {
        not_in_range = 'Muy lejos del ayuntamiento'
    },
    success = {
        recived_license = 'Has recibido tu %{value} por $50'
    },
    info = {
        bilp_text = 'Servicios Civiles',
        city_services_menu = '~g~E~w~ - Servicios Civiles',
        id_card = 'DNI',
        driver_license = 'Licencia de Conducir',
        weaponlicense = 'Licencia de Armas',
        new_job = 'Felicidades en tu nuevo trabajo! (%{job})'
    },
    email = {
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Ayuntamiento',
        subject = 'Solicitud de clases de conducir',
        message = 'Hola %{gender} %{lastname}<br /><br />Acabamos de recibir un mensaje de que deseas clases de conducir<br />Si deseas enseñar, contactanos:<br />Nombre: <strong>%{firstname} %{lastname}</strong><br />Numero de teléfono: <strong>%{phone}</strong><br/><br/>Saludos,<br />Ayuntamiento Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
