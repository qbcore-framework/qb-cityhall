local Translations = {
    error = {
        not_in_range = 'Muito longe da prefeitura'
    },
    success = {
        recived_license = 'Você recebeu seu %{value} por $50'
    },
    info = {
        new_job_app = 'Sua aplicação foi enviada ao chefe do(a) (%{job})',
        bilp_text = 'Serviços Municipais',
        city_services_menu = '~g~E~w~ - Menu de serviços da cidade',
        id_card = 'Carteira de Identidade',
        driver_license = 'Carteira de motorista',
        weaponlicense = 'Porte de arma',
        new_job = 'Parabéns pelo seu novo emprego! (%{job})'
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Obrigado por ter se aplicado a %(job).",
        jobAppMsg = "Olá %{gender} %{lastname}<br /><br />%{job} recebeu sua aplicação.<br /><br />O chefe está analisando seu pedido e entrará em contato para entrevista assim que possível.<br /><br />Mais uma vez, obrigado pela aplicação.",
        mr = 'Sr.',
        mrs = 'Sra.',
        sender = 'Município',
        subject = 'Solicitação de aulas de direção',
        message = 'Olá %{gender} %{lastname}<br /><br />Acabamos de receber uma mensagem de que alguém quer fazer aulas de direção<br />Se você está disposto a ensinar, entre em contato conosco:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Número de telefone: <strong>%{phone}</strong><br/><br/>Cumprimentos,<br />Prefeitura'
    }
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
