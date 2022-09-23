local Translations = {
    error = {
        not_in_range = 'Estás muy lejos de la municipalidad',
        not_enough_money = 'No tienes suficiente dinero contigo, necesitas $%{cost} en efectivo',
        exploit_attempt = 'Intento de exploit, ¡abuso!',
        already_has_permission = 'No puedes dar permiso para una licencia de conducir, esta persona ya tiene permiso',
        player_not_online = 'El jugador no esta en línea'
    },
    success = {
        recived_license = 'Has recibido tu %{value} por %{value}',
        you_passed = '¡Has pasado la prueba! Recoge tu licencia de conducir en la municipalidad',
        drivers_license_granted = 'Al jugador con ID %{value} se le ha dado acceso para obtener una licencia de conducir'
    },
    info = {
        bilp_text = 'Servicios municipales',
        city_services_menu = '[E] - Menú de servicios municipales',
        id_card = 'Identificación',
        driver_license = 'Licencia de conducir',
        weaponlicense = 'Licencia para portación de armas',
        driving_school = 'Escuela de manejo',
        new_job = '¡Felicidades por tu nuevo trabajo! (%{job})',
        take_driving_lessons = '[E] Tomar clases de manejo',
        class_c_license = 'Licencia de conducir Clase C',
        email_sent = 'Un correo ha sido enviado a las escuelas de manejo, serás contactado automáticamente',
        give_drivers_license = 'Dar lecciones de conducir a alguien',
        person_id = 'ID de la persona',
        trucker = 'Camionero',
        taxi = 'Taxi',
        tow_truck = 'Grúa',
        news_reporter = 'Reportero de noticias',
        garbage_collector = 'Recolector de basura',
        bus_driver = 'Conductor de bus',
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
