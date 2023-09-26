local Translations = {
    error = {
        not_in_range = 'Muito longe da prefeitura'
    },
    success = {
        recived_license = 'Você recebeu sua %{value} por $50'
    },
    info = {
        new_job_app = 'Sua candidatura foi enviada ao chefe de (%{job})',
        bilp_text = 'Serviços da Cidade',
        city_services_menu = '~g~E~w~ - Menu de Serviços da Cidade',
        id_card = 'Cartão de Identificação',
        driver_license = 'Carteira de Motorista',
        weaponlicense = 'Licença de Armas de Fogo',
        new_job = 'Parabéns pelo seu novo emprego! (%{job})',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Obrigado por se candidatar a %(job).",
        jobAppMsg = "Olá %{gender} %{lastname},<br /><br />%{job} recebeu sua candidatura.<br /><br />O chefe está analisando sua solicitação e entrará em contato com você para uma entrevista assim que possível.<br /><br />Mais uma vez, obrigado pela sua candidatura.",
        mr = 'Sr.',
        mrs = 'Sra.',
        sender = 'Município',
        subject = 'Solicitação de aulas de direção',
        message = 'Olá %{gender} %{lastname},<br /><br />Recebemos uma mensagem de alguém interessado em fazer aulas de direção.<br />Se você estiver disposto a ensinar, entre em contato conosco:<br />Nome: <strong>%{firstname} %{lastname}</strong><br />Número de telefone: <strong>%{phone}</strong><br/><br/>Atenciosamente,<br />Município de Los Santos'
    }
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end