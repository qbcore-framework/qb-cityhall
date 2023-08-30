local Translations = {
    error = {
        not_in_range = 'Muito longe da prefeitura'
    },
    success = {
        recived_license = 'Você recebeu sua %{value} por $50'
    },
    info = {
        new_job_app = 'Sua inscrição foi enviada para o chefe de (%{job})',
        bilp_text = 'Serviços da Cidade',
        city_services_menu = '~g~E~w~ - Menu de Serviços da Cidade',
        id_card = 'Cartão de Identidade',
        driver_license = 'Carteira de Motorista',
        weaponlicense = 'Licença de Armas',
        new_job = 'Parabéns pelo seu novo emprego! (%{job})',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Obrigado por se inscrever para %(job).",
        jobAppMsg = "Olá %{gender} %{lastname},<br /><br />%{job} recebeu sua inscrição.<br /><br />O chefe está analisando sua solicitação e entrará em contato com você para uma entrevista o mais breve possível.<br /><br />Mais uma vez, obrigado pela sua inscrição.",
        mr = 'Sr.',
        mrs = 'Sra.',
        sender = 'Município',
        subject = 'Pedido de aulas de direção',
        message = 'Olá %{gender} %{lastname},<br /><br />Acabamos de receber uma mensagem de alguém que deseja fazer aulas de direção.<br />Se você estiver disposto a ensinar, entre em contato conosco:<br />Nome: <strong>%{firstname} %{lastname}</strong><br />Número de telefone: <strong>%{phone}</strong><br/><br/>Atenciosamente,<br />Município Los Santos'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
