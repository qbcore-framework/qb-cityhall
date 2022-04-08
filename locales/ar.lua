local Translations = {
    error = {
        not_in_range = 'بعيدا جدا عن قاعة المدينة'
    },
    success = {
        recived_license = '%{value} تم تحصيله مقابل $50'
    },
    info = {
        bilp_text = 'ﻒﻴﻇﻮﺘﻟﺍ ﺰﻛﺮﻣ',
        city_services_menu = '~g~E~w~ - ﻒﻴﻇﻮﺘﻟﺍ ﺰﻛﺮﻣ', -- you need font arabic
        id_card = 'بطاقة التعريف',
        driver_license = 'رخصة السائق',
        weaponlicense = 'ترخيص الأسلحة النارية',
        new_job = '(%{job}) مبروك الوظيفة'
    },
    email = {
        mr = 'سيد',
        mrs = 'سيدة',
        sender = 'مركز التوظيف',
        subject = 'طلب دروس القيادة',
        message = '%{gender} %{lastname} مرحبا<br /><br />لقد تلقينا للتو رسالة أن شخصا ما يريد أن يأخذ دروس القيادة<br />إذا كنت على استعداد للتدريس، يرجى الاتصال بنا:<br /><strong>%{firstname} %{lastname}</strong><br /><strong>%{phone}</strong><br/><br/>مع احترام,<br />مركز التوظيف'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
