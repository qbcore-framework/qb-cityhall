local Translations = {
    error = {
        not_in_range = 'Estás muy lejos de la municipalidad'
    },
    success = {
        recived_license = 'Has recibido tu %{value} por $50'
    },
    info = {
        blip_text = 'Servicios de la ciudad',
        city_services_menu = '[E] - Menu de servicios de la ciudad',
        id_card = 'Identificación',
        driver_license = 'Licencia de conducir',
        weaponlicense = 'Licencia de armas',
        new_job = '¡Felicidades por tu nuevo trabajo! (%{job})',
        driving_school = 'Escuela de manejo'
    },
    email = {
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Municipio',
        subject = 'Solicitud de clases de manejo',
        message = 'Hola %{gender} %{lastname}<br /><br />Acabamos de recibir un mensaje de alguien que quiere tomar clases de manejo.<br />Si estás dispuesto a enseñar, por favor contáctanos:<br />Nombre: <strong>%{firstname} %{lastname}</strong><br />Número de teléfono: <strong>%{phone}</strong><br/><br/>Un cordial saludo,<br />Municipio de Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
