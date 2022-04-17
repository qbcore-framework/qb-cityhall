local Translations = {
    error = {
        not_in_range = 'Trop loin de l\'Hotel de Ville'
    },
    success = {
        recived_license = 'Vous avez reçu votre %{value} pour $50'
    },
    info = {
        bilp_text = 'Services administratifs',
        city_services_menu = '~g~E~w~ - Menu Services Administratifs',
        id_card = 'Carte d\'idendité',
        driver_license = 'Permis de conduire',
        weaponlicense = 'Permis de port d\'armes',
        new_job = 'Félicitations pour votre nouveau travail! (%{job})'
    },
    email = {
        mr = 'Mr',
        mrs = 'Mme',
        sender = 'Municipalité',
        subject = 'Demande de leçon de conduite',
        message = 'Bonjour %{gender} %{lastname}<br /><br />Nous venons de recevoir un message indiquant qu\'une personne souhaite prendre des cours de conduite<br />Si vous souhaitez enseigner, veuillez nous contacter :<br />Nom: <strong>%{firstname} %{lastname}</strong><br />Numéro de téléphone: <strong>%{phone}</strong><br/><br/>Kind regards,<br />La municipalité de Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
