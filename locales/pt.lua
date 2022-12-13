local Translations = {
    error = {
        not_in_range = 'Encontra-se muito longe da camara municipal'
    },
    success = {
        recived_license = 'Recebeu  %{value} por €50'
    },
    info = {
        bilp_text = 'Camâra Municipal',
        city_services_menu = 'E - Menu Serviços',
        id_card = 'Cartão do Cidadão',
        driver_license = 'Carta de Condução',
        weaponlicense = 'Licença porte de arma',
        new_job = 'Parabéns! O seu novo trabalho: (%{job})'
    },
    email = {
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Serviços Municipais',
        subject = 'Solicitação de aulas de condução',
        message = 'Olá %{gender} %{lastname}<br /><br />Acabamos de receber uma mensagem de que alguém quer fazer aulas de condução<br />Se quiser fazer de instructor por favor contacte-nos:<br />Nome: <strong>%{firstname} %{lastname}</strong><br />Telemóvel: <strong>%{phone}</strong><br/><br/>Melhores Cumprimentos,<br />Serviços Municipais'
    }
}
if GetConvar('qb_locale', 'en') == 'pt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
