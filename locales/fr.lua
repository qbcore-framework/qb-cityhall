local Translations = {
    error = {
        not_in_range = 'Trop loin de la mairie'
    },
    success = {
        recived_license = 'Vous avez reçu votre %{value} pour $50'
    },
    info = {
        bilp_text = 'Services Publiques',
        city_services_menu = '~g~E~w~ - Menu Services Pubiques',
        id_card = 'Carte d\'identité',
        driver_license = 'Permis de conduire',
        weaponlicense = 'Permis d\'armes',
        new_job = 'Bravo pour votre nouveau travail! (%{job})'
    },
    email = {
        mr = 'Mr',
        mrs = 'Mme',
        sender = 'Mairie',
        subject = 'Demande de cours de conduite',
        message = 'Bonjour, %{gender} %{lastname}<br /><br />Nous avons reçu un message de quelqu\'un voulant passer son permis<br />Si vous souhaitez lui faire passer, Veuillez nous contacter:<br />Nom: <strong>%{firstname} %{lastname}</strong><br />Numéro de Téléphone: <strong>%{phone}</strong><br/><br/>Cordialement,<br />Mairie de Los Santos',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
