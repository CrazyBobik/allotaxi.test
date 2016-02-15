<?php

define('SHOP_TITLE', 'Мебельное ателье "АМАДО"');


K_Session::set('securitySalt', '123asd...!!!eee','Platform');


$emailsConfigPath = ROOT_PATH.'/configs/options/emails.txt';
K_Registry::set('emailsConfigPath', $emailsConfigPath );


$templatesConfigPath = ROOT_PATH.'/configs/options/templates.txt';
K_Registry::set('templatesConfigPath', $templatesConfigPath );


$sectionViewTypes = array(
        'block' => 'Блоки',
        'list' => 'Список'
);
K_Registry::set('sectionViewTypes', $sectionViewTypes);


$yandexApiKey = '';
//if ( $_SERVER['HTTP_HOST'] == 'vnezony.loc' ) {
    $yandexApiKey = 'AF7vj08BAAAA-UtldQIAn-4l69zjur0q_XM6oSrOL3ZqMVwAAAAAAAAAAADtefFTf1M7X6yQU1lx9dy5hlRddg==';
//} 
K_Registry::set( 'yandexApiKey', $yandexApiKey );


$userEducationList = array(
    0 => 'Нет',
    1 => 'Начальная школа (1-3 классы)',
    2 => 'Среднее школьное (5-11 классы)',
    3 => 'Среднее техническое: техникум, училище',
    4 => 'Высшее - ВУЗ'
);
K_Registry::set( 'userEducationList', $userEducationList );


$userFamilyStatus = array(
    '' => 'Не указано',
    'Не женат/не замужем' => 'Не женат/не замужем',
    'Женат/Замужем' => 'Женат/Замужем',
    'В разводе' => 'В разводе'
);
K_Registry::set( 'userFamilyStatus', $userFamilyStatus );

$userChildrenStatus = array(
    0 => 'Детей нет',
    1 => 'Дети есть'
);
K_Registry::set( 'userChildrenStatus', $userChildrenStatus );

$publicHtml = 'www';
K_Registry::set('publicHtml', $publicHtml);


$albumsAccessLevel = array(
    'me' => 'Вижу только я',
    'friends' => 'Видят только друзья',
    'all' => 'Видят все'
);

K_Registry::set('albumsAccessLevel', $albumsAccessLevel);


$ruYearsLingvo = array(1=>'год', 2=>'года', 5=>'лет');
K_Registry::set('ruYearsLingvo', $ruYearsLingvo);