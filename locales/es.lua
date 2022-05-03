local Translations = {
    error = {
        not_in_range = 'Estás muy lejos de la municipalidad',
        not_enough_money = 'No tienes suficiente dinero contigo, necesitas %s en efectivo',
    },
    success = {
        received_license = 'Has recibido tu %{value} por $%s'
    },
    info = {
        blip_text = 'Servicios de la ciudad',
        city_services_menu = '[E] - Menu de servicios de la ciudad',
        id_card = 'Identificación',
        drivers_license = 'Licencia de conducir',
        weapons_license = 'Licencia de armas',
        new_job = '¡Felicidades por tu nuevo trabajo! (%{job})',
        driving_school = 'Escuela de manejo',
        take_driving_lessons = 'Tomar clases de manejo',
        open_city_hall = 'Abrir municipalidad',
        trucker = 'Camionero',
        taxi = 'Taxi',
        tow_truck = 'Grúa',
        news_reporter = 'Reportero',
        garbage_collector = 'Recolector de basura',
        bus_driver = 'Chofer de autobús',
        email_sent = 'Un email ha sido enviado a las escuelas de manejo y serás contactad@ automáticamente',
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
