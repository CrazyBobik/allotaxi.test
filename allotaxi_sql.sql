-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 15 2016 г., 09:52
-- Версия сервера: 5.5.40
-- Версия PHP: 5.4.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `allotaxi_sql`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tags`
--

CREATE TABLE IF NOT EXISTS `blog_tags` (
  `bt_blog_id` int(10) NOT NULL,
  `bt_tag_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_tags`
--

INSERT INTO `blog_tags` (`bt_blog_id`, `bt_tag_id`) VALUES
(2658, 2660),
(2658, 2661);

-- --------------------------------------------------------

--
-- Структура таблицы `clientform_data`
--

CREATE TABLE IF NOT EXISTS `clientform_data` (
`clientform_data_id` int(10) NOT NULL,
  `clientform_data_type` varchar(500) DEFAULT NULL,
  `clientform_data_content` text,
  `clientform_data_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(10) NOT NULL,
  `comment_new` int(10) NOT NULL,
  `comment_name` varchar(50) NOT NULL,
  `comment_email` varchar(50) NOT NULL,
  `comment_status` enum('опубликован','ожидает публикации') NOT NULL DEFAULT 'ожидает публикации',
  `comment_content` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_ip` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
`id` int(10) unsigned NOT NULL,
  `info_ru` text COLLATE utf8_unicode_ci NOT NULL,
  `info_en` text COLLATE utf8_unicode_ci,
  `head_ru` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `head_en` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `info_ru`, `info_en`, `head_ru`, `head_en`) VALUES
(1, '&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;Наші контакти:&lt;/span&gt;&lt;br&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;Благодійний Фонд допомоги\nбіженцям та переселенцям «Співчуття»&lt;/span&gt;&lt;br&gt;Адреса: 65107 м. Одеса, вул.\nКанатна,83, каб. 717&lt;br&gt;тел.:728-36-87&lt;br&gt;тел./факс: 42-96-36&lt;br&gt;i-mail: &lt;a href=&quot;mailto:fvic@odessa.net&quot;&gt;&lt;span style=&quot;color: windowtext; text-decoration: none;&quot;&gt;timwik@ukr.net&lt;/span&gt;&lt;/a&gt;\n\n\n\n\n\n\n\n\n\n\n\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;o:p&gt; &lt;/o:p&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;Інтеграційний центр «VITA»&lt;/span&gt;&lt;br&gt;Адреса: 65037 м. Одеса, вул. Зої\nКосмодем’янської, 7.&lt;br&gt;тел.: 741-65-78&lt;br&gt;тел./факс: 741-71-31&lt;br&gt;i-mail: &lt;a href=&quot;mailto:fvic@odessa.net&quot;&gt;&lt;span style=&quot;color: windowtext; text-decoration: none;&quot;&gt;timwik@ukr.net&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;o:p&gt; &lt;/o:p&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;Управління міграційної служби в\nОдеській області&lt;/span&gt;&lt;br&gt;Адреса: 65107 м. Одеса, вул.\nКанатна,83, каб. 719&lt;br&gt;тел.: 728-33-18&lt;br&gt;тел./факс: 728-15-92&lt;br&gt;&lt;span style=&quot;font-size: 12pt;&quot; times=&quot;&quot; new=&quot;&quot; roman=&quot;&quot; ;=&quot;&quot; lang=&quot;EN-US&quot;&gt;e-mail:&lt;/span&gt;&lt;span style=&quot;font-size: 12pt;&quot; times=&quot;&quot; new=&quot;&quot; roman=&quot;&quot; ;=&quot;&quot; lang=&quot;EN-US&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size: 12pt;&quot; times=&quot;&quot; new=&quot;&quot; roman=&quot;&quot; ;=&quot;&quot; lang=&quot;EN-US&quot;&gt;strvice-migration@ukr.net&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;br&gt;&lt;span style=&quot;font-size: 12pt;&quot; times=&quot;&quot; new=&quot;&quot; roman=&quot;&quot; ;=&quot;&quot; lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;Редакційна колегія газети\n«Міграція»:&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Балух В.С&lt;/span&gt;. – почесний голова\nБлагодійного фонду імені П.І. Калнишевського&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Заяць Н. О.&lt;/span&gt; - голова Управління\nміграційної служби в Харківській області&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Кобилянський В. О&lt;/span&gt;. - директор\nкомпанії РСК  «Капітан»&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Корнацький Д.В&lt;/span&gt;. – начальник\nвідділу міграційної служби в Хмельницькій області&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Науменко Н.М.&lt;/span&gt; - Директор\nДепартаменту у справах біженців та притулку Державного комітету у справах\nнаціональностей та релігій України&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Супруновський І. П.&lt;/span&gt; – голова\nУправління міграційної служби в Одеській області, член Національного Союзу\nжурналістів України.&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Товт М. М.&lt;/span&gt; - голова Управління\nміграційної служби в Закарпатській області&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Удовенко Г. Й.&lt;/span&gt; - Голова Ради з\nпитань етнонаціональної політики при Президентові України, Міністр закордонних\nсправ (1994-1998 рр), Президент 52-ї сесії Генеральної Асамблеї ООН (1997-1998\nрр), член колегій Міністерства закордонних справ України та Держкомнацрелігій\nУкраїни.&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Франчук О. Г.&lt;/span&gt; – начальник НГВУ\n«Охтирканафтогаз»&lt;o:p&gt; &lt;/o:p&gt;&lt;br&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic; text-decoration: underline;&quot;&gt;Тимофеєва В. П. - головний\nредактор&lt;/span&gt;&lt;/p&gt;\n\n&lt;br&gt;', '&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;Our contacts here:&lt;/span&gt;&lt;span style=&quot;&quot; lang=&quot;EN-US&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;Charity Relief Foundation for Refugees and Immigrants\n«Sympathy»&lt;/span&gt;&lt;br&gt;&lt;/span&gt;Address: 65107 &lt;st1:city w:st=&quot;on&quot;&gt;Odessa&lt;/st1:city&gt;,\nKanatnaya st., 83, 717&lt;br&gt;phone: 728-36-87&lt;br&gt;phone/fax: 42-96-36&lt;br&gt;e-mail: timwik@ukr.net &lt;br&gt;\n\n\n\n\n\n\n\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;span style=&quot;&quot; lang=&quot;EN-US&quot;&gt;\n  &lt;br&gt;\n&lt;st1:placename style=&quot;font-weight: bold; font-style: italic;&quot; w:st=&quot;on&quot;&gt;Integration&lt;/st1:placename&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt; &lt;/span&gt;&lt;st1:placetype style=&quot;font-weight: bold; font-style: italic;&quot; w:st=&quot;on&quot;&gt;Center&lt;/st1:placetype&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;\n«VITA» &lt;/span&gt;&lt;br&gt;\nAddress: 65037 &lt;st1:place w:st=&quot;on&quot;&gt;&lt;st1:city w:st=&quot;on&quot;&gt;Odessa&lt;/st1:city&gt;&lt;/st1:place&gt;,\nZoya Kosmodemyanskaya st. 7 &lt;br&gt;\nphone: 741-65-78&lt;br&gt;\nphone/fax: 741-71-31&lt;br&gt;e-mail: timwik@ukr.net &lt;br&gt;\n  &lt;br&gt;\n&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic;&quot;&gt;\nThe Department of the Migration Service in &lt;/span&gt;&lt;st1:place style=&quot;font-weight: bold; font-style: italic;&quot; w:st=&quot;on&quot;&gt;&lt;st1:city w:st=&quot;on&quot;&gt;Odessa&lt;/st1:city&gt;&lt;/st1:place&gt;&lt;br&gt;Address: 65107 &lt;st1:place w:st=&quot;on&quot;&gt;&lt;st1:city w:st=&quot;on&quot;&gt;Odessa&lt;/st1:city&gt;&lt;/st1:place&gt;, Kanatnaya st., 83, 719 &lt;br&gt;\nphone: 728-33-18&lt;br&gt;phone/fax: 728-15-92&lt;br&gt;e-mail:&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt; &lt;/span&gt;&lt;span style=&quot;&quot; lang=&quot;EN-US&quot;&gt;strvice-migration@ukr.net&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;span style=&quot;&quot; lang=&quot;EN-US&quot;&gt;&lt;span style=&quot;font-weight: bold; text-decoration: underline;&quot;&gt;&lt;br&gt;Editorial board of the newspaper &quot;Migration&quot;: &lt;/span&gt;&lt;br&gt;\n&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nBaluh V.&lt;/span&gt; - Honorary Chairman of the Foundation named Kalnyshevsky&lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nZayats N.&lt;/span&gt; – Head of the Department of the Migration Service in Harkhiv &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nKobylyansky V&lt;/span&gt;. - Director of FCC &quot;Captain&quot; &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nKornatsky D.&lt;/span&gt; - Head of the Department of the Migration Service in Khmelnitsky &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nNaumenko N.&lt;/span&gt; - Director of the Department for Refugees and Asylum of the State\nCommittee for Nationalities and Religions of Ukraine &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\n&lt;/span&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Suprunovskyy I. &lt;/span&gt;- Head of The Department of the Migration Service in Odessa, a\nmember of the National Union of Journalists of Ukraine. &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nTovt M.&lt;/span&gt; - Head of The Department of the migration service in the Zakarpattja\n(Transcarpation) region &lt;br&gt;\nUdovenko G. J. - President of the council on ethno-national policy of the\nPresident of Ukraine, Minister of Foreign Affairs (1994-1998 years), President\nof the 52nd session of UN General Assembly (1997-1998), member of the Board of\nthe Ministry of Foreign Affairs of Ukraine and State Committee for\nNationalities and Religions of Ukraine. &lt;br&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;\nFranchuk A.G. &lt;/span&gt;- Head of the Office &quot;Ohtyrkanaftohaz&quot; &lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent: 36pt;&quot;&gt;&lt;span style=&quot;&quot; lang=&quot;EN-US&quot;&gt;&lt;br&gt;&lt;span style=&quot;font-weight: bold; font-style: italic; text-decoration: underline;&quot;&gt;Timofeeva V. - Chief Editor&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;br&gt;', 'Контакти', 'Contacts');

-- --------------------------------------------------------

--
-- Структура таблицы `privilege`
--

CREATE TABLE IF NOT EXISTS `privilege` (
`privilege_id` int(11) NOT NULL,
  `privilege_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `privilege_acl_key` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `privilege_status` tinyint(1) DEFAULT '0',
  `privilege_description` text COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `privilege`
--

INSERT INTO `privilege` (`privilege_id`, `privilege_name`, `privilege_acl_key`, `privilege_status`, `privilege_description`) VALUES
(5, NULL, NULL, 1, 'Полный доступ'),
(6, 'view', NULL, 1, 'Только просмотр'),
(7, 'edit', NULL, 1, 'Редактирование'),
(8, 'add', NULL, 1, 'Добавление'),
(9, 'addremove', NULL, 1, 'Добавление удаление');

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
`region_id` int(10) NOT NULL,
  `region_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `regions`
--

INSERT INTO `regions` (`region_id`, `region_name`) VALUES
(1, 'Киевская область'),
(2, 'Сумская область'),
(3, 'Волынская область'),
(4, 'Львовская область'),
(5, 'Ровенская область'),
(6, 'Луганская область'),
(7, 'Полтавская область'),
(8, 'Тернопольская область'),
(9, 'Харьковская область'),
(10, 'Винницкая область'),
(11, 'Житомирская область'),
(12, 'Николаевская область'),
(13, 'Черкасская область'),
(14, 'Черниговская область'),
(15, 'Кировоградская область'),
(16, 'Черновицкая область'),
(17, 'Запорожская область'),
(18, 'Одесская область'),
(19, 'Закарпатская область'),
(20, 'Хмельницкая область'),
(21, 'Донецкая область'),
(22, 'Автономная Республика Крым'),
(23, 'Днепропетровская область'),
(24, 'Ивано-Франковская область'),
(25, 'Херсонская область');

-- --------------------------------------------------------

--
-- Структура таблицы `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
`resource_id` int(11) NOT NULL,
  `resource_status` tinyint(4) NOT NULL DEFAULT '0',
  `resource_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `resource_parent_id` int(11) DEFAULT NULL,
  `resource_deny_action` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `resource_level` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `resource`
--

INSERT INTO `resource` (`resource_id`, `resource_status`, `resource_name`, `resource_parent_id`, `resource_deny_action`, `resource_level`) VALUES
(1, 1, NULL, NULL, NULL, 0),
(4, 1, 'admin/auth/index', 6, NULL, 1),
(6, 1, 'admin', NULL, '/admin/auth/index', 0),
(8, 1, 'default', NULL, NULL, 0),
(15, 1, 'api', NULL, '/api/erorr', 0),
(16, 1, 'admin/acl', 6, '/admin', 1),
(17, 1, 'admin/typesmanager', 6, '/admin', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`role_id` int(11) NOT NULL,
  `role_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `role_acl_key` varchar(45) COLLATE utf8_bin NOT NULL,
  `role_status` tinyint(1) DEFAULT '1',
  `role_parent_id` int(11) DEFAULT NULL,
  `role_level` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_acl_key`, `role_status`, `role_parent_id`, `role_level`) VALUES
(44, 'Гость', 'guests', 1, NULL, 0),
(45, 'Администратор', 'admin', 1, NULL, 0),
(47, 'Админка', 'adminka', 1, NULL, 0),
(48, 'Менеджер', 'manager', 1, 47, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rule`
--

CREATE TABLE IF NOT EXISTS `rule` (
`rule_id` int(11) unsigned NOT NULL,
  `rule_role_id` int(11) NOT NULL,
  `rule_resource_id` int(11) NOT NULL,
  `rule_privilege_id` int(11) NOT NULL,
  `rule_order` int(11) unsigned NOT NULL DEFAULT '0',
  `rule_type` enum('allow','deny') COLLATE utf8_bin NOT NULL DEFAULT 'deny',
  `rule_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `rule`
--

INSERT INTO `rule` (`rule_id`, `rule_role_id`, `rule_resource_id`, `rule_privilege_id`, `rule_order`, `rule_type`, `rule_status`) VALUES
(86, 44, 8, 6, 0, 'allow', 1),
(87, 44, 4, 6, 0, 'allow', 1),
(88, 45, 1, 5, 0, 'allow', 1),
(89, 44, 15, 5, 0, 'allow', 1),
(90, 47, 1, 5, 0, 'allow', 1),
(91, 47, 16, 5, 0, 'deny', 1),
(93, 47, 17, 5, 0, 'deny', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tree`
--

CREATE TABLE IF NOT EXISTS `tree` (
`tree_id` int(10) unsigned NOT NULL,
  `tree_lkey` int(10) unsigned NOT NULL,
  `tree_rkey` int(10) unsigned NOT NULL,
  `tree_level` int(10) unsigned NOT NULL,
  `tree_pid` int(10) unsigned NOT NULL,
  `tree_type` varchar(300) NOT NULL,
  `tree_name` varchar(300) NOT NULL,
  `tree_link` varchar(1000) NOT NULL,
  `tree_title` varchar(500) NOT NULL,
  `tree_added` int(11) NOT NULL,
  `tree_modified` int(11) NOT NULL,
  `tree_stype` varchar(10) NOT NULL,
  `tree_bloked` tinyint(4) NOT NULL,
  `tree_meta_title` varchar(700) NOT NULL,
  `tree_meta_description` varchar(750) NOT NULL,
  `tree_meta_keywords` varchar(1500) NOT NULL,
  `tree_meta_canonical` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6805 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tree`
--

INSERT INTO `tree` (`tree_id`, `tree_lkey`, `tree_rkey`, `tree_level`, `tree_pid`, `tree_type`, `tree_name`, `tree_link`, `tree_title`, `tree_added`, `tree_modified`, `tree_stype`, `tree_bloked`, `tree_meta_title`, `tree_meta_description`, `tree_meta_keywords`, `tree_meta_canonical`) VALUES
(1, 1, 310, 0, 0, 'site', 'site', '/', 'Весь сайт', 1336134191, 1336134191, '', 0, '', '', '', ''),
(8, 75, 76, 2, 7, 'form', 'add_type', '/forms/add_type/', 'Добавление нового типа', 1336727140, 1336727140, '', 0, '', '', '', ''),
(7, 74, 85, 1, 1, 'folder', 'forms', '/forms/', 'Формы', 1336726996, 1336726996, '', 0, '', '', '', ''),
(9, 79, 80, 2, 7, 'form', 'add_element', '/forms/add_element/', 'Добавление нового элемента', 1336727140, 1336727140, '', 0, '', '', '', ''),
(10, 81, 82, 2, 7, 'form', 'edit_element', '/forms/edit_element/', 'Редактирование элемента', 1337175034, 1337175034, '', 0, '', '', '', ''),
(90, 77, 78, 2, 7, 'form', 'edit_type', '/forms/edit_type/', 'Редактирование типа', 1338196271, 1338196271, '', 0, '', '', '', ''),
(449, 104, 133, 1, 1, 'folder', 'hmvcblocks', '/hmvcblocks/', 'HMVC блоки', 1342605083, 1342605083, '', 0, '', '', '', ''),
(184, 86, 87, 1, 1, 'folder', 'client_forms', '/client_forms/', 'Клиентские формы', 1338564408, 1338564408, '', 0, '', '', '', ''),
(226, 88, 103, 1, 1, 'folder', 'page_types', '/page_types/', 'Страницы по типам', 1339752475, 1339752475, '', 0, '', '', '', ''),
(769, 3, 12, 2, 768, 'page', 'defoult', '/pages/defoult/', '_Базовые блоки', 1344347178, 1344347178, '', 0, '', '', '', ''),
(768, 2, 73, 1, 1, 'list', 'pages', '/pages/', 'Страницы', 1344347118, 1344347118, '', 0, '', '', '', ''),
(6698, 274, 277, 1, 1, 'list', 'modules', '/modules/', 'Модули', 1388049516, 1388049516, '', 0, '', '', '', ''),
(6699, 275, 276, 2, 6698, 'block', 'right', '/modules/right/', 'Модуль справа', 1388049585, 1388049585, '', 0, '', '', '', ''),
(3167, 91, 100, 4, 3156, 'list', 'right', '/page_types/articles/list/right/', 'Правая колонка', 1357646362, 1357646362, '', 0, '', '', '', ''),
(3171, 98, 99, 5, 3167, 'block', 'blocknewsrightcollum', '/page_types/articles/list/right/blocknewsrightcollum/', 'Блок последние новости правая колонка', 1357646362, 1357646362, '', 0, '', '', '', ''),
(3170, 96, 97, 5, 3167, 'block', 'blockinforightcollum', '/page_types/articles/list/right/blockinforightcollum/', 'Блок полезная информация правая колонка', 1357646362, 1357646362, '', 0, '', '', '', ''),
(2736, 144, 145, 1, 1, 'folder', 'trash', '/trash/', 'Корзина', 1356105346, 1356105346, '', 0, '', '', '', ''),
(3169, 94, 95, 5, 3167, 'block', 'fast-bar', '/page_types/articles/list/right/fast-bar/', 'Быстрые кнопки', 1357646362, 1357646362, '', 0, '', '', '', ''),
(2393, 105, 106, 2, 449, 'node', 'search', '/hmvcblocks/search/', 'Блок поиска обьектов', 1353586004, 1353586004, '', 0, '', '', '', ''),
(6671, 40, 41, 3, 6670, 'block', 'taxi-price', '/pages/taxi-price/taxi-price/', 'Услуги', 1383918453, 1383918453, '', 0, '', '', '', ''),
(6670, 39, 42, 2, 768, 'page', 'taxi-price', '/pages/taxi-price/', 'Услуги', 1383918436, 1383918436, '', 0, 'Пассажирские и грузовые перевозки в Одессе - Алло такси', 'Пассажирские и грузовые перевозки в Одессе предлагает служба заказа такси в Одессе - Алло такси. Мы подберем оптимальное авто для перевозки любого груза и количества пассажиров.', 'перевозки, одессе, пассажирские, грузовые, грузоперевозки, такси, одесса', ''),
(2429, 134, 143, 1, 1, 'folder', 'templates', '/templates/', 'Шаблоны', 1355929549, 1355929549, '', 0, '', '', '', ''),
(3168, 92, 93, 5, 3167, 'block', 'blockstocsrightcollum', '/page_types/articles/list/right/blockstocsrightcollum/', 'Блок акции левая колонка', 1357646362, 1357646362, '', 0, '', '', '', ''),
(2663, 89, 102, 2, 226, 'page', 'articles', '/page_types/articles/', 'Статьии', 1356079523, 1356079523, '', 0, '', '', '', ''),
(2430, 135, 136, 2, 2429, 'node', 'content', '/templates/content/', 'Блок контента', 1355929640, 1355929640, '', 0, '', '', '', ''),
(6656, 27, 32, 2, 768, 'page', 'taxi-novosti', '/pages/taxi-novosti/', 'Новости', 1383897537, 1383897537, '', 0, 'Автомобильные новости от службы заказа  АЛЛО такси', 'Самые актуальные новости мира автомобилей от службы заказа АЛЛО такси в Одессе', 'автомобильные, новости, одессы, украины, автопром', ''),
(6654, 146, 273, 1, 1, 'list', 'news', '/news/', 'Новости', 1383835835, 1383835835, '', 0, '', '', '', ''),
(6655, 115, 116, 2, 449, 'node', 'news', '/hmvcblocks/news/', 'Блок новости', 1383897386, 1383897386, '', 0, '', '', '', ''),
(3234, 109, 110, 2, 449, 'node', 'articles', '/hmvcblocks/articles/', 'Блок просмотра статей', 1379334537, 1379334537, '', 0, '', '', '', ''),
(6680, 157, 158, 2, 6654, 'news', 'interesnye-fakty-o-taksi', '/news/interesnye-fakty-o-taksi/', 'Несколько интересных фактов о такси', 1383919446, 1383919446, '', 0, 'Интересные факты о такси', 'Несколько интересных и ключевых моментов из истории развития такси', 'такси, интересное, факты, новости', ''),
(6668, 34, 35, 3, 6667, 'block', 'taxi-work', '/pages/taxi-work/taxi-work/', 'Вакансии', 1383918067, 1383918067, '', 0, '', '', '', ''),
(6667, 33, 38, 2, 768, 'page', 'taxi-work', '/pages/taxi-work/', 'Вакансии', 1383918052, 1383918052, '', 0, 'Работа водителем в Одессе. Вакансии водителя в Одессе', 'Ищете работу водителя такси со своим авто в Одессе? В такси АЛЛО всегда найдется несколько вакансий. Звоните', 'работа, водитель, такси, со своим авто, одессе, одесса, водителем, вакансии, вакансия', ''),
(6666, 149, 150, 2, 6654, 'news', 'koncept-chevrolet-sonic-ricky', '/news/koncept-chevrolet-sonic-ricky/', 'Концепт Chevrolet Sonic Ricky', 1383908661, 1383908661, '', 0, 'Концепт Chevrolet Sonic Ricky', 'На выставке SEMA в 2011 году Рикки Кармайкл представил свою первую версию модели Sonic All Activity Vehicle. Теперь два года спустя, Кармайкл возвращается на SEMA с новой моделью Sonic', 'концепт, Chevrolet Sonic Ricky', ''),
(3245, 13, 16, 2, 768, 'page', '404', '/pages/404/', '_404', 1379416447, 1379416447, '', 0, '', '', '', ''),
(3248, 14, 15, 3, 3245, 'block', 'error', '/pages/404/error/', 'Блок сообщения о ошибке', 1379416478, 1379416478, '', 0, '', '', '', ''),
(2572, 137, 138, 2, 2429, 'node', 'typepage', '/templates/typepage/', 'Типовая страница', 1356017444, 1356017444, '', 0, '', '', '', ''),
(6694, 139, 140, 2, 2429, 'node', 'type', '/templates/type/', 'Блок стандартный', 1384349433, 1384349433, '', 0, '', '', '', ''),
(6657, 28, 29, 3, 6656, 'block', 'taxi-novosti', '/pages/taxi-novosti/taxi-novosti/', 'Новости', 1383897558, 1383897558, '', 0, '', '', '', ''),
(6661, 283, 286, 2, 6750, 'page', 'one', '/system-pages/one/', 'Новость отдельно', 1383902703, 1383902703, '', 0, '', '', '', ''),
(3241, 111, 112, 2, 449, 'node', 'object', '/hmvcblocks/object/', 'Блок просмотра обьекта', 1379340586, 1379340586, '', 0, '', '', '', ''),
(3211, 20, 21, 3, 3209, 'block', 'index', '/pages/index/index/', 'Главная страница', 1378905108, 1378905108, '', 0, '', '', '', ''),
(3212, 4, 5, 3, 769, 'folder', 'content', '/pages/defoult/content/', 'Центральные блоки', 1378905689, 1378905689, '', 0, '', '', '', ''),
(6678, 155, 156, 2, 6654, 'news', 'kompanija-avto-renault', '/news/kompanija-avto-renault/', 'Компания авто Renault', 1383919174, 1383919174, '', 0, 'Компания авто Renault', 'Renault - крупнейшая французская автомобильная компания, принадлежащая государству, выпускает легковые, грузовые такси и спортивные автомобили.', 'компания, авто, французская, Renault', ''),
(6676, 151, 152, 2, 6654, 'news', 'amerikancy-pridumali-kak-sdelat-avtomobili-umnee', '/news/amerikancy-pridumali-kak-sdelat-avtomobili-umnee/', 'Сделать автомобиль умнее', 1383918954, 1383918954, '', 0, 'Американцы придумали, как сделать автомобили умнее', 'На веб-сайте компании Apple появилась характеристика оригинального автоматического устройства, и эта новость будет представлять интерес не только для владельцев смартфонов iPhone от Apple.', 'американцы, придумали, как, сделать, автомобили, умнее', ''),
(6677, 153, 154, 2, 6654, 'news', 'povyshenie-cen-na-taksi-v-ukraine', '/news/povyshenie-cen-na-taksi-v-ukraine/', 'В Украине тарифы такси повысятся', 1383919060, 1383919060, '', 0, 'Повышение цен на такси в Украине', 'Повышение тарифов на перевозки как пассажирские, так и грузовые по Украине возросли. Читайте о росте цен на сайте Алло такси в Одессе', 'тарифы, такси, повышение, украина, новость', ''),
(6637, 113, 114, 2, 449, 'node', 'comments', '/hmvcblocks/comments/', 'Блок комментарии', 1380270195, 1380270195, '', 0, '', '', '', ''),
(6653, 83, 84, 2, 7, 'site', 'site', '/forms/site/', 'Весь сайт', 1383835773, 1383835773, '', 0, '', '', '', ''),
(6650, 23, 26, 2, 768, 'page', 'taxi-about-us', '/pages/taxi-about-us/', 'О компании', 1383829226, 1383829226, '', 0, 'О компании - служба заказа Алло такси', 'Компания АЛЛО Такси - все виды перевозок по Одессе. Заказывайте такси в проверенной службе такси Одессы', 'алло, такси, одесса, заказ, taxi, одессе', ''),
(6651, 24, 25, 3, 6650, 'block', 'taxi-about-us', '/pages/taxi-about-us/taxi-about-us/', 'О компании', 1383829238, 1383829238, '', 0, '', '', '', ''),
(3210, 107, 108, 2, 449, 'node', 'mainobjects', '/hmvcblocks/mainobjects/', 'Блок обьектов на главной', 1378904905, 1378904905, '', 0, '', '', '', ''),
(3209, 17, 22, 2, 768, 'page', 'index', '/pages/index/', 'Главная страница', 1378904570, 1378904570, '', 0, 'Такси в Одессе. Быстро и недорого - Алло такси', 'Если Вы хотите заказать хорошее недорогое такси в Одессе - Алло такси именно такое такси. Звоните в службу заказа или оставляйте онлайн заявку на сайте. Любимое такси в Одессе - Алло такси', 'заказ, такси, одессе, одесса, любимое, алло, заказать, taxi, услуги, авто, одессы', ''),
(3156, 90, 101, 3, 2663, 'filter', 'list', '/page_types/articles/list/', 'Страница для списка', 1357641351, 1357641351, '', 0, '', '', '', ''),
(6681, 159, 160, 2, 6654, 'news', 'sluzhba-zakaza-taksi-allo-taksi-v-odesse', '/news/sluzhba-zakaza-taksi-allo-taksi-v-odesse/', 'Такси в Одессе', 1383919549, 1383919549, '', 0, 'Услуги такси Одесса. Служба заказа такси Алло такси в Одессе', 'Услуги по предоставлению перевозок по Одессе обеспечивает компания Алло такси. Обращайтесь к профессионалам', 'услуги, такси, одесса, одессе', ''),
(6662, 284, 285, 3, 6661, 'block', 'one', '/system-pages/one/one/', 'Новость', 1383902737, 1383902737, '', 0, '', '', '', ''),
(6664, 117, 118, 2, 449, 'node', 'one', '/hmvcblocks/one/', 'Блок новость отдельно', 1383902782, 1383902782, '', 0, '', '', '', ''),
(6682, 161, 162, 2, 6654, 'news', 'jekonomnoe-taksi-v-odesse', '/news/jekonomnoe-taksi-v-odesse/', 'Экономное такси в Одессе', 1383919597, 1383919597, '', 0, 'Экономное такси в Одессе', 'Экономное такси в Одессе - Алло такси служба заказа круглосуточно', 'экономное, такси, одесса, заказ', ''),
(6683, 163, 164, 2, 6654, 'news', 'perevozka-mebeli-i-gruzov-ot-kompanii-allo-taksi', '/news/perevozka-mebeli-i-gruzov-ot-kompanii-allo-taksi/', 'Грузовые перевозки Одесса', 1383919657, 1383919657, '', 0, 'Перевозка мебели и грузов от компании Алло такси', 'Перевозки грузов, мебели при переезде в Одессе лучше осуществлять с компанией перевозчиком алло такси', 'перевозка, груза, мебели, грузовое такси одесса', ''),
(6684, 165, 166, 2, 6654, 'news', 'horoshee-taksi-v-odesse', '/news/horoshee-taksi-v-odesse/', 'Хорошее такси Одесса', 1383919754, 1383919754, '', 0, 'Хорошее такси в Одессе. Дешёвое такси Одессы', 'Заказать хорошее такси в Одессе по выгодным тарифам в диспетчерской службе "Алло Такси". Выгодные тарифы. Акционные поездки. Круглосуточное обслуживание', 'хорошее, такси, заказ, дешевое, одесса, выгодно', ''),
(6686, 167, 168, 2, 6654, 'news', 'sposoby-zakaza-taksi-v-odesse', '/news/sposoby-zakaza-taksi-v-odesse/', 'Заказ такси', 1383919859, 1383919859, '', 0, 'Способы заказа такси в Одессе', 'Способы заказа такси и правила поведения в такси. Должностные обязанности водителей такси перечислены в данной статье на сайте Алло такси в Одессе', 'способы, заказа, такси, одесса, перевозки, правила, нормы, водитель', ''),
(6687, 169, 170, 2, 6654, 'news', 'istoricheskie-fakty-o-istorii-formirovanija-sluzhby-taksi', '/news/istoricheskie-fakty-o-istorii-formirovanija-sluzhby-taksi/', 'История такси', 1383919917, 1383919917, '', 0, 'Исторические факты о истории формирования службы такси', 'Интересные факты о формировании современной службы такси читайте на сайте службы такси в Одессе Алло такси', 'факты, история, такси, служба, такси, исторические, факты', ''),
(6689, 171, 172, 2, 6654, 'news', 'novost-novyj-zakonoproekt-o-taksi-v-ukraine', '/news/novost-novyj-zakonoproekt-o-taksi-v-ukraine/', 'Новый законопроект О такси в Украине', 1383920043, 1383920043, '', 0, 'Новость новый законопроект о такси в Украине', 'Новость о принятии нового законопроекта "О такси в Украине" на официальном сайте Алло такси. Будьте в курсе события, касающихся сферы всех видов перевозок', 'новость, законопроект, такси, украина, алло такси, перевозки', ''),
(6691, 43, 46, 2, 768, 'page', 'sitemap', '/pages/sitemap/', 'Карта сайта', 1383922349, 1383922349, '', 0, 'Карта сайта службы заказа такси Алло Такси', 'службы, заказа, такси, алло такси, карта сайта, навигация', 'Карта сайта службы заказа такси Алло Такси - быстрая и удобная навигация по всему сайту', ''),
(6692, 44, 45, 3, 6691, 'block', 'sitemap', '/pages/sitemap/sitemap/', 'Карта сайта', 1383922368, 1383922368, '', 0, '', '', '', ''),
(6695, 173, 174, 2, 6654, 'news', 'samoupravlyaemyjavtomobilgoogle', '/news/samoupravlyaemyjavtomobilgoogle/', 'Самоуправляемый автомобиль Google', 1385537960, 1385537960, '', 0, 'Самоуправляемый автомобиль Google в службе такси', 'Крупная транспортная компания Uber (США) заявила о своем намерении закупить 2500 беспилотных автомобилей от Google для работы в службе такси.', 'беспилотный, без водителя, самоуправляемый, автомобиль, google, uber, закипили', ''),
(6700, 147, 148, 2, 6654, 'news', 'pojavlenie-mobilnoj-parkovki-v-ukraine', '/news/pojavlenie-mobilnoj-parkovki-v-ukraine/', 'Появление  «мобильной парковки» в Украине', 1404398286, 1404398286, '', 0, 'Появление  «мобильной парковки» в Украине', 'Теперь украинцы смогут оплачивать автомобильную парковку при помощи мобильного телефона. Данные изменения были одобрены правительством на заседании 25 июня.', 'парковка, оплатить, через, мобильный, приняли, закон', ''),
(6711, 175, 176, 2, 6654, 'news', 'benzin-mojet-podorojat-v-avguste', '/news/benzin-mojet-podorojat-v-avguste/', 'Бензин может подорожать в августе', 1407152031, 1407152031, '', 0, 'Бензин может подорожать в августе', 'Свежие новости автотранспорта на сайте Алло такси. Прогноз о повышении цен на бензин', 'бензин, цена, такси, одесса, стоимость', ''),
(6713, 30, 31, 3, 6656, 'block', 'novost-text', '/pages/taxi-novosti/novost-text/', 'Блок текста над новостями', 1414069360, 1414069360, '', 0, '', '', '', ''),
(6714, 141, 142, 2, 2429, 'node', 'content2', '/templates/content2/', 'Блок контенета2', 1414071082, 1414071082, '', 0, '', '', '', ''),
(6712, 177, 178, 2, 6654, 'news', 'pravila-straxovki-mogyt-izmenitsa', '/news/pravila-straxovki-mogyt-izmenitsa/', 'Правила страховки автомобиля могут измениться', 1407152302, 1407152302, '', 0, 'Правила страховки автомобиля могут измениться', 'Новостная статья о возможном изменении правил страхования автомобилей. Всегда актуальные новости на сайте Алло Такси', 'новость, страхование, правила, страховка, такси, транспорта', ''),
(6715, 179, 180, 2, 6654, 'news', 'v-2015-godu-inspektory-gai-v-ukraine-budut-zameneny-kamerami', '/news/v-2015-godu-inspektory-gai-v-ukraine-budut-zameneny-kamerami/', 'В 2015 году инспекторы ГАИ в Украине будут заменены камерами', 1419341370, 1419341370, '', 0, 'В 2015 году инспекторы ГАИ в Украине будут заменены камерами', 'Новость о том, что в Украине в 2015 году инспекторы ГАИ будут заменены камерами слежения', 'новость, замены, гаи, инспекторов, камерами, украина, 2015 год', ''),
(6716, 181, 182, 2, 6654, 'news', 'novost-ceny-na-taksi-v-odesse', '/news/novost-ceny-na-taksi-v-odesse/', 'Цены на такси в Одессе', 1421059451, 1421059451, '', 0, 'Новость цены на такси в Одессе', 'Новость на сайте алло такси - обзор цен на такси в Одессе', 'цены, такси, одесса, одессе, новость', ''),
(6717, 183, 184, 2, 6654, 'news', 'v-ukraine-pojavilis-jelektromobili', '/news/v-ukraine-pojavilis-jelektromobili/', 'В Украине появились электромобили', 1422350377, 1422350377, '', 0, 'В Украине появились электромобили', 'Новость на сайте алло такси о новинках в машиностроении. Появление электромобилей на дорогах Украины', 'новость, электро мобиль, электромобили, украина', ''),
(6781, 269, 270, 2, 6654, 'news', 'otkryvaetsja-trassa-odessa-reni-dlja-gruzovyh-avtomobilej', '/news/otkryvaetsja-trassa-odessa-reni-dlja-gruzovyh-avtomobilej/', 'Открывается трасса Одесса-Рени для грузовых автомобилей', 1454330197, 1454330197, '', 0, 'Открывается трасса Одесса-Рени для грузовых автомобилей', 'Открывается трасса Одесса-Рени для грузовых автомобилей. Читайте интересную информацию на сайте одесского перевозчика Алло Такси', 'новость, открывается, трасса, одесса, рени, грузовых, автомобилей', ''),
(6718, 185, 186, 2, 6654, 'news', 'novye-avtomobili-v-2015-godu', '/news/novye-avtomobili-v-2015-godu/', 'Новые автомобили в 2015 году', 1422889486, 1422889486, '', 0, 'Новые автомобили в 2015 году', 'Новость про новые автомобили в 2015 году. Читайте новостной раздел сайта диспетчерской службы вызова такси в Одессе "Алло Такси"', 'новость, новые, модели, машин, 2015, алло, такси, одесса, новостной, раздел', ''),
(6719, 187, 188, 2, 6654, 'news', 'novost-priobretenie-avtomobilej-v-budushhem', '/news/novost-priobretenie-avtomobilej-v-budushhem/', 'Приобретение автомобилей в будущем', 1423494185, 1423494185, '', 0, 'Новость приобретение автомобилей в будущем', 'Новость о том, какие машины будут преимущественно покупаться автолюбителями  в будущем. Читайте в новостном разделе сайта Алло Такси в Одессе', 'новость, приобретение, автомобилей, будущем, одесса, алло такси', ''),
(6720, 189, 190, 2, 6654, 'news', 'novost-avtomobil-2015-goda-v-ukraine-allo-taksi-odessa', '/news/novost-avtomobil-2015-goda-v-ukraine-allo-taksi-odessa/', 'Автомобиль 2015 года в Украине', 1424703391, 1424703391, '', 0, 'Новость автомобиль 2015 года в Украине - Алло такси Одесса', 'Новость об итогах конкурса автомобиль года 2015 в Украине. Читайте на сайте Алло такси', 'новость, автомобиль, 205 года, украина, алло, такси', ''),
(6721, 191, 192, 2, 6654, 'news', 'volna-rezkogo-podorozhanija-benzina-postepenno-utihaet-novost', '/news/volna-rezkogo-podorozhanija-benzina-postepenno-utihaet-novost/', 'Волна резкого подорожания бензина постепенно утихает', 1425301380, 1425301380, '', 0, 'Волна резкого подорожания бензина постепенно утихает новость', 'Новость волна резкого подорожания бензина постепенно утихает. Читайте подробнее на сайте одесского такси - Алло такси в новостном разделе', 'новость, волна, резкого, подорожания, бензина, постепенно, утихает', ''),
(6722, 193, 194, 2, 6654, 'news', 'ministerstvom-finansov-ukrainy-byli-zakazany-uslugi-taksi-na-125-millionov-griven', '/news/ministerstvom-finansov-ukrainy-byli-zakazany-uslugi-taksi-na-125-millionov-griven/', 'Министерством финансов Украины были заказаны услуги такси на 1,25 миллионов гривен', 1426516854, 1426516854, '', 0, 'Министерством финансов Украины были заказаны услуги такси на 1,25 миллионов гривен', 'Новость о том, что министерством финансов Украины были заказаны услуги такси на 1,25 миллионов гривен. Читайте подробнее на сайте службы заказа такси - Алло Такси в Одессе', 'новость, министерством, финансов, украины, были, заказаны, услуги, такси, миллионов, гривен', ''),
(6723, 195, 196, 2, 6654, 'news', 'ukrainskie-dorogi-v-2016-budut-kardinalno-remontirovatsja', '/news/ukrainskie-dorogi-v-2016-budut-kardinalno-remontirovatsja/', 'Украинские дороги в 2016 будут кардинально ремонтироваться', 1427125334, 1427125334, '', 0, 'Украинские дороги в 2016 будут кардинально ремонтироваться', 'Новость о том, что Украинские дороги в 2016 будут кардинально ремонтироваться. Читайте все новости автомобильной тематики на сайте Алло Такси в Одессе. Всегда актуальная информация', 'новость, украинские, дороги, 2016 год будут, кардинально, ремонтироваться', ''),
(6725, 197, 198, 2, 6654, 'news', 'pravila-bezopasnoj-ezdy-na-avtomobile-v-dozhd-novost', '/news/pravila-bezopasnoj-ezdy-na-avtomobile-v-dozhd-novost/', 'Правила безопасной езды на автомобиле в дождь', 1427727559, 1427727559, '', 0, 'Правила безопасной езды на автомобиле в дождь новость', 'Интересная статья - правила безопасной езды на автомобиле в дождь. Всегда полезные статьи на сайте службы такси Алло такси в Одессе', 'правила, безопасной, езды, автомобиле, дождь', ''),
(6726, 199, 200, 2, 6654, 'news', 'novost-v-ukraine-gai-vvedet-novuju-sistemu-shtrafov', '/news/novost-v-ukraine-gai-vvedet-novuju-sistemu-shtrafov/', 'В Украине ГАИ введет новую систему штрафов', 1428329003, 1428329003, '', 0, 'Новость в Украине ГАИ введет новую систему штрафов', 'Новость на сайте диспетчерской службы в Одессе Алло Taxi о том, что в Украине ГАИ введет новую систему штрафов. Читайте актуальную информацию', 'новость, украине, гаи, введет, новую, систему, штрафов', ''),
(6727, 201, 202, 2, 6654, 'news', 'pervye-proekty-stroitelstva-betonnyh-dorog-budut-uzhe-letom', '/news/pervye-proekty-stroitelstva-betonnyh-dorog-budut-uzhe-letom/', 'Первые проекты строительства бетонных дорог будут уже летом', 1429531892, 1429531892, '', 0, 'Первые проекты строительства бетонных дорог будут уже летом', 'Новость о том, что в Украине уже летом появятся первые проекты строительства бетонных дорог в Украине. Актуальная и точная информация на сайте Алло такси в Одесса', 'новость, первые, проекты, строительства, бетонных, дорог, будут, летом', ''),
(6728, 203, 204, 2, 6654, 'news', 'novost-o-sozdanii-dizelnogo-topliva-iz-vozduha-i-vody', '/news/novost-o-sozdanii-dizelnogo-topliva-iz-vozduha-i-vody/', 'Создали дизельное топливо из воздуха и воды', 1430211014, 1430211014, '', 0, 'Новость о создании дизельного топлива из воздуха и воды', 'Читайте новость о том, что создали дизельное топливо из воздуха и воды. Всегда полезная информация на сайте службы вызова такси в Одессе - Алло такси', 'новость, создали, дизельное, топливо, воздуха, воды, алло такси, одесса', ''),
(6729, 205, 206, 2, 6654, 'news', 'jekzoticheskoe-taksi-po-vsemu-miru', '/news/jekzoticheskoe-taksi-po-vsemu-miru/', 'Экзотические такси по всему миру', 1430744615, 1430744615, '', 0, 'Экзотическое такси по всему миру', 'Читайте про экзотические такси по всему миру в новостном разделе сайта одесского перевозчика "Алло Taxi". только познавательная информация и актуальные новости', 'новость, экзотическое, такси, всему, миру', ''),
(6730, 207, 208, 2, 6654, 'news', 'statja-kak-vlijaet-muzyka-na-vozhdenie-avtomobilja', '/news/statja-kak-vlijaet-muzyka-na-vozhdenie-avtomobilja/', 'Как влияет музыка на вождение автомобиля', 1431349190, 1431349190, '', 0, 'Статья как влияет музыка на вождение автомобиля', 'Интересная статья о влиянии музыки на вождение автомобиля. Читайте всегда актуальные и информативные статьи на сайте службы такси в Одессе Алло такси', 'статья, влияние, музыки, вождение, автомобиля, алло такси, одесса', ''),
(6731, 209, 210, 2, 6654, 'news', 'novost-jeep-vypustit-samyj-bolshoj-vnedorozhnik-za-vsju-istoriju', '/news/novost-jeep-vypustit-samyj-bolshoj-vnedorozhnik-za-vsju-istoriju/', 'Jeep выпустит самый большой внедорожник за всю историю', 1431958372, 1431958372, '', 0, 'Новость Jeep выпустит самый большой внедорожник за всю историю', 'Новость о том, что Jeep выпустит самый большой внедорожник за всю историю. Читайте подробнее на сайте Алло Такси в Одессе', 'новость, jeep,выпустит, самый, большой, внедорожник, истории, алло такси', ''),
(6732, 211, 212, 2, 6654, 'news', 'uluchshennaja-sistema-obzora-v-avtomobile-pozvoljaet-ustanovit-obzor-bez-mjortvyh-zon', '/news/uluchshennaja-sistema-obzora-v-avtomobile-pozvoljaet-ustanovit-obzor-bez-mjortvyh-zon/', 'Улучшенная система обзора в автомобиле позволяет установить обзор без «мёртвых зон»', 1432543660, 1432543660, '', 0, 'Улучшенная система обзора в автомобиле позволяет установить обзор без «мёртвых зон»', 'Новость о том, что улучшенная система обзора в автомобиле позволяет установить обзор без «мёртвых зон». Читайте полезную информацию на нашем сайте.', 'новость, улучшенная, система, обзора, автомобиле, позволяет, установить, хороший, обзор', ''),
(6733, 213, 214, 2, 6654, 'news', 'kak-sohranit-avto-posle-ezdy-po-nashim-dorogam', '/news/kak-sohranit-avto-posle-ezdy-po-nashim-dorogam/', 'Как сохранить авто после езды по нашим дорогам', 1433251803, 1433251803, '', 0, 'Как сохранить авто после езды по нашим дорогам', 'Полезная статья на сайте одесского перевозчика "Алло Такси". Как сохранить авто после езды по нашим дорогам. Читайте интересную и полезную информацию на нашем сайте', 'статья, сохранить, авто, машину, после, езды, нашим, дорогам', ''),
(6734, 215, 216, 2, 6654, 'news', 'v-konce-goda-nachnutsja-ispytanija-sverhzvukovogo-avtomobilja-bloodhound', '/news/v-konce-goda-nachnutsja-ispytanija-sverhzvukovogo-avtomobilja-bloodhound/', 'В конце года начнутся испытания сверхзвукового автомобиля Bloodhound', 1435044800, 1435044800, '', 0, 'В конце года начнутся испытания сверхзвукового автомобиля Bloodhound', 'В конце года начнутся испытания сверхзвукового автомобиля Bloodhound. Всегда актуальные и познавательные новости на сайте одесского перевозчика Алло Такси', 'новость, конце, года, начнутся, испытания, сверхзвукового, автомобиля, bloodhound', ''),
(6735, 217, 218, 2, 6654, 'news', 'kak-sohranit-avto-posle-ezdy-po-nashim-dorogam', '/news/kak-sohranit-avto-posle-ezdy-po-nashim-dorogam/', 'Влияние жары и дождя на автомобиль', 1435736096, 1435736096, '', 0, 'Влияние жары и дождя на автомобиль', 'Влияние жары и дождя на автомобиль. Читайте полезную информацию на сайте одесского перевозчика Алло Такси', 'новость, влияние, жары, дождя, автомобиль', ''),
(6736, 219, 220, 2, 6654, 'news', 'vydajushhiesja-dolgozhiteli-avtomobilnoj-industrii', '/news/vydajushhiesja-dolgozhiteli-avtomobilnoj-industrii/', 'Выдающиеся долгожители автомобильной индустрии', 1436182309, 1436182309, '', 0, 'Выдающиеся долгожители автомобильной индустрии', 'Выдающиеся долгожители автомобильной индустрии. Читайте полезную и интересную информацию на сайте одесского перевозчика Алло Такси', 'новость, выдающиеся, долгожители, автомобильной, индустрии', ''),
(6737, 221, 222, 2, 6654, 'news', 'dopolnitelnye-finansovye-postuplenija-na-stroitelstvo-dorogi-odessa-reni', '/news/dopolnitelnye-finansovye-postuplenija-na-stroitelstvo-dorogi-odessa-reni/', 'Дополнительные финансовые поступления на строительство дороги Одесса-Рени', 1436779202, 1436779202, '', 0, 'Дополнительные финансовые поступления на строительство дороги Одесса-Рени', 'Новость о том, что дополнительные финансовые поступления на строительство дороги Одесса-Рени. Читайте подробнее на сайте одесского перевозчика "Алло Такси"', 'новость, дополнительные, финансовые, поступления, строительство, дороги, одесса, рени', ''),
(6738, 223, 224, 2, 6654, 'news', 'v-kitae-razrabotali-sistemu-upravlenija-avtomobilem-siloj-mysli', '/news/v-kitae-razrabotali-sistemu-upravlenija-avtomobilem-siloj-mysli/', 'В Китае разработали систему управления автомобилем силой мысли', 1437392808, 1437392808, '', 0, 'В Китае разработали систему управления автомобилем силой мысли', 'В Китае разработали систему управления автомобилем силой мысли. Подробнее читать на сайте одесского перевозчика Алло Такси', 'китае, разработали, систему, управления, автомобилем, силой, мысли', ''),
(6739, 47, 50, 2, 768, 'page', 'skorost-i-bezopasnost', '/pages/skorost-i-bezopasnost/', 'Скорость и безопасность', 1437463601, 1437463601, '', 0, 'Скорость и безопасность перевозок от Алло Такси', 'Одесская служба такси "Алло Taxi" гарантирует молниеносную скорость и 100% безопасность как пассажирских, так и грузовых перевозок. Быстро и безопасно с Алло Такси в Одессе', 'скорость, безопасность, алло, такси, одесса, гарантируют, перевозку', ''),
(6740, 51, 54, 2, 768, 'page', 'peregon-avto', '/pages/peregon-avto/', 'Перегон авто', 1437463644, 1437463644, '', 0, 'Перегон авто в Одессе услуга от перевозчика Алло Taxi', 'Услуга перегон авто в Одессе от службы вызова такси Алло Taxi гарантирует надёжность и безопасность автомобиля при перегоне. Опытные водители доставят Ваше авто невредимым в любую точку города', 'перегон, авто, одесса, область, услуга, алло, такси, одессе', ''),
(6741, 55, 60, 2, 768, 'page', 'luchshie-tsenyi', '/pages/luchshie-tsenyi/', 'Лучшие цены', 1437463790, 1437463790, '', 0, 'Лучшие цены на такси в Одессе - Алло Такси', 'Алло Такси  гарантирует лучше цены в Одессе на услуги пассажирских и грузоперевозок по городу и области. Доступные цены Вас приятно удивят', 'лучшие, цены, вызов, такси, одесса, перевозки', ''),
(6742, 61, 64, 2, 768, 'page', 'perevozka-gruzov', '/pages/perevozka-gruzov/', 'Перевозка грузов', 1437463821, 1437463821, '', 0, 'Перевозка грузов по Одессе и Одесской области от Алло Taxi', 'Заказать перевозку грузов по Одессе и Одесской области по выгодным тарифам в диспетчерской службе перевозчика Алло Taxi. Быстрота и сохранность груза гарантированы', 'перевозка, груза, грузов, одесса, одесская, область, одессе, алло, такси', ''),
(6743, 62, 63, 3, 6742, 'block', 'perevozka-gruzov', '/pages/perevozka-gruzov/perevozka-gruzov/', 'Перевозка грузов', 1437463867, 1437463867, '', 0, '', '', '', ''),
(6745, 48, 49, 3, 6739, 'block', 'skorost-i-bezopasnost', '/pages/skorost-i-bezopasnost/skorost-i-bezopasnost/', 'Скорость и безопасность', 1437463966, 1437463966, '', 0, '', '', '', ''),
(6746, 52, 53, 3, 6740, 'block', 'peregon-avto', '/pages/peregon-avto/peregon-avto/', 'Перегон авто', 1437463986, 1437463986, '', 0, '', '', '', ''),
(6747, 58, 59, 3, 6741, 'block', 'luchshie-tsenyi', '/pages/luchshie-tsenyi/luchshie-tsenyi/', 'Лучшие цены', 1437464012, 1437464012, '', 0, '', '', '', ''),
(6748, 278, 281, 1, 1, 'list', 'articles', '/articles/', 'Статьи', 1437464969, 1437464969, '', 0, '', '', '', ''),
(6749, 279, 280, 2, 6748, 'articles', 'taxi-contact-us', '/articles/taxi-contact-us/', 'Контакты', 1437465075, 1437465075, '', 0, 'Алло Taxi - контакты', 'Контакты перевозчика Алло Taxi в Одессе. Оформляйте онлайн-заявку на сайте. Алло такси - круглосуточная служба вызова такси в Одессе. Телефоны службы вызова такси смотрите на сайте', 'такси, одесса, телефон, график, работы, контакты, онлайн, одессе', ''),
(6750, 282, 295, 1, 1, 'list', 'system-pages', '/system-pages/', 'Системные странички', 1437466095, 1437466095, '', 0, '', '', '', ''),
(6751, 291, 294, 2, 6750, 'page', 'article', '/system-pages/article/', 'Статья отдельно', 1437466136, 1437466136, '', 0, '', '', '', ''),
(6752, 292, 293, 3, 6751, 'block', 'article', '/system-pages/article/article/', 'Статья отдельно', 1437466189, 1437466189, '', 0, '', '', '', ''),
(6753, 119, 120, 2, 449, 'node', 'article', '/hmvcblocks/article/', 'Стятья', 1437466322, 1437466322, '', 0, '', '', '', ''),
(6755, 225, 226, 2, 6654, 'news', 'novaja-model-avtomobilja-lexus-budet-rabotat-ot-serdca-voditelja', '/news/novaja-model-avtomobilja-lexus-budet-rabotat-ot-serdca-voditelja/', 'Новая модель автомобиля Lexus будет работать от сердца водителя', 1438084792, 1438084792, '', 0, 'Новая модель автомобиля Lexus будет работать от сердца водителя', 'Новая модель автомобиля Lexus будет работать от сердца водителя. Всегда свежая информация из автомобильных новостей. Читайте на сайте Алло Такси', 'новая, модель, автомобиля, lexus, будет, работать, сердца, водителя', ''),
(6756, 227, 228, 2, 6654, 'news', 'registracija-avto-v-mreo-cherez-internet', '/news/registracija-avto-v-mreo-cherez-internet/', 'Регистрация авто в МРЕО через Интернет', 1438608876, 1438608876, '', 0, 'Регистрация авто в МРЕО через Интернет', 'Регистрация авто в МРЕО через Интернет. Читайте актуальную информацию на сайте одесского перевозчика - Алло Такси. Всегда интересно, всегда полезно', 'регистрация, авто, мрео, через, интернет, новость', ''),
(6757, 229, 230, 2, 6654, 'news', 'ispolzovanie-jam-na-dorogah-dlja-jekonomii-benzina', '/news/ispolzovanie-jam-na-dorogah-dlja-jekonomii-benzina/', 'Использование ям на дорогах для экономии бензина', 1439370233, 1439370233, '', 0, 'Использование ям на дорогах для экономии бензина', 'Использование ям на дорогах для экономии бензина. Читайте подробнее в новостном разделе на сайте одесского перевозчика Алло Такси', 'новость, использование, ям, дорогах, экономии, бензина', ''),
(6758, 231, 232, 2, 6654, 'news', 'the-guardian-byli-predstavleny-dokumenty-o-sekretnom-testirovanii-umnogo-avtomobilja-apple', '/news/the-guardian-byli-predstavleny-dokumenty-o-sekretnom-testirovanii-umnogo-avtomobilja-apple/', 'The Guardian были представлены документы о секретном тестировании умного автомобиля Apple', 1439817508, 1439817508, '', 0, 'The Guardian были представлены документы о секретном тестировании умного автомобиля Apple', 'The Guardian были представлены документы о секретном тестировании умного автомобиля Apple. Читайте подробнее на сайте диспетчерской службы вызова такси в Одессе Алло Такси', 'новость, guardian, были, представлены, документы, секретном, тестировании, умного, автомобиля, apple', ''),
(6759, 233, 234, 2, 6654, 'news', 'ukraina-mozhet-byt-konkurentom-ssha-v-proizvodstve-solnechnyh-zapravok', '/news/ukraina-mozhet-byt-konkurentom-ssha-v-proizvodstve-solnechnyh-zapravok/', 'Украина может быть конкурентом США в производстве солнечных заправок', 1441024563, 1441024563, '', 0, 'Украина может быть конкурентом США в производстве солнечных заправок', 'Украина может быть конкурентом США в производстве солнечных заправок. Читайте новости и обзоры о автомобилях на сайте одесского перевозчика Алло Такси в Одесс', 'украина, может, быть, конкурентом, сша, производстве, солнечных, заправок', ''),
(6760, 235, 236, 2, 6654, 'news', 'objazatelnyj-tehosmotr-mozhet-stat-neobhodimostju', '/news/objazatelnyj-tehosmotr-mozhet-stat-neobhodimostju/', 'Обязательный техосмотр может стать необходимостью', 1441698960, 1441698960, '', 0, 'Обязательный техосмотр может стать необходимостью', 'Обязательный техосмотр может стать необходимостью. Читайте подробнее на сайте диспетчерской службы в Одессе Алло Такси. Всегда полезная информация', 'новость, бязательный, техосмотр, может, стать, необходимостью', ''),
(6761, 237, 238, 2, 6654, 'news', 'do-konca-2015-goda-ozhidaetsja-pojavlenie-novogo-krossovera-geely-kotoryj-budet-podderzhivat-apple-carplay', '/news/do-konca-2015-goda-ozhidaetsja-pojavlenie-novogo-krossovera-geely-kotoryj-budet-podderzhivat-apple-carplay/', 'До конца 2015 года ожидается появление нового кроссовера Geely, который будет поддерживать Apple CarPlay', 1442220849, 1442220849, '', 0, 'До конца 2015 года ожидается появление нового кроссовера Geely, который будет поддерживать Apple CarPlay', 'До конца 2015 года ожидается появление нового кроссовера Geely, который будет поддерживать Apple CarPlay. Читайте подробнее на сайте одесского перевозчика Алло Такси', 'новость, конца, 2015 года, ожидается, появление, нового, кроссовера, geely, который, будет, поддерживать, apple, carplay', '');
INSERT INTO `tree` (`tree_id`, `tree_lkey`, `tree_rkey`, `tree_level`, `tree_pid`, `tree_type`, `tree_name`, `tree_link`, `tree_title`, `tree_added`, `tree_modified`, `tree_stype`, `tree_bloked`, `tree_meta_title`, `tree_meta_description`, `tree_meta_keywords`, `tree_meta_canonical`) VALUES
(6762, 239, 240, 2, 6654, 'news', 'sistemy-avtomaticheskogo-tormozhenija-skoro-stanut-normoj-dlja-vseh-avtoljubitelej', '/news/sistemy-avtomaticheskogo-tormozhenija-skoro-stanut-normoj-dlja-vseh-avtoljubitelej/', 'Системы автоматического торможения скоро станут нормой для всех автолюбителей', 1442839630, 1442839630, '', 0, 'Системы автоматического торможения скоро станут нормой для всех автолюбителей', 'Системы автоматического торможения скоро станут нормой для всех автолюбителей. Читайте актуальную информацию на сайте одесского перевозчика "Алло Такси"', 'новость, системы, автоматического, торможения, скоро, станут, нормой, для всех, автолюбителей', ''),
(6763, 241, 242, 2, 6654, 'news', 'shtrafy-za-narushenija-pdd-na-plohih-dorogah-hotjat-otmenit', '/news/shtrafy-za-narushenija-pdd-na-plohih-dorogah-hotjat-otmenit/', 'Штрафы за нарушения ПДД на плохих дорогах хотят отменит', 1443447077, 1443447077, '', 0, 'Штрафы за нарушения ПДД на плохих дорогах хотят отменить', 'Штрафы за нарушения ПДД на плохих дорогах хотят отменить. Читайте подробнее на сайте Алло Такси в Одессе. Актуальная и полезная информация в новостном сайте одесского перевозчика', 'новость, штрафы, нарушения, пдд, плохих, дорогах, хотят, отменить', ''),
(6764, 243, 244, 2, 6654, 'news', 'sv-stolice-sostojalsja-festival-retro-avtomobilej', '/news/sv-stolice-sostojalsja-festival-retro-avtomobilej/', 'В столице состоялся фестиваль ретро-автомобилей', 1444051140, 1444051140, '', 0, 'В столице состоялся фестиваль ретро-автомобилей', 'В столице состоялся фестиваль ретро-автомобилей. Читайте подробнее на сайте диспетчерской службы Алло Такси в Одессе. Всегда интересная информация', 'новость, столице, состоялся, фестиваль, ретро, автомобилей', ''),
(6765, 245, 246, 2, 6654, 'news', 'samye-kachestvennye-avtomobili-2015-goda', '/news/samye-kachestvennye-avtomobili-2015-goda/', 'Самые качественные автомобили 2015 года', 1444653168, 1444653168, '', 0, 'Самые качественные автомобили 2015 года', 'Самые качественные автомобили 2015 года. Читайте подробнее новость на сайте компании Алло Такси в Одессе', 'новость, самые, качественные, автомобили, 2015 года', ''),
(6766, 247, 248, 2, 6654, 'news', 'volkswagen-phaeton-stanet-jelektromobilem', '/news/volkswagen-phaeton-stanet-jelektromobilem/', 'Volkswagen Phaeton станет электромобилем', 1445247806, 1445247806, '', 0, 'Volkswagen Phaeton станет электромобилем', 'Volkswagen Phaeton станет электромобилем. Читайте автомобильные новости на сайте одесского перевозчика Алло Такси', 'новость, volkswagen, phaeton, станет, электромобилем', ''),
(6767, 249, 250, 2, 6654, 'news', 'uteplenie-dvigatelja', '/news/uteplenie-dvigatelja/', 'Утепление двигателя', 1445862786, 1445862786, '', 0, 'Утепление двигателя', 'Утепление двигателя. Читайте интересные статьи и полезную информацию на сайте одесского перевозчика Алло Такси', 'новость, утепление, двигателя, алло такси', ''),
(6768, 251, 252, 2, 6654, 'news', 'prezumpcija-nevinovnosti-voditelej-byla-otmenena', '/news/prezumpcija-nevinovnosti-voditelej-byla-otmenena/', 'Презумпция невиновности водителей была отменена', 1446457735, 1446457735, '', 0, 'Презумпция невиновности водителей была отменена', 'Презумпция невиновности водителей была отменена. Актуальная информация об изменениях в законодательстве на сайте одесского перевозчика Алло Такси', 'новость, презумпция, невиновности, водителей, была, отменена', ''),
(6769, 253, 254, 2, 6654, 'news', 's-segodnjashnego-dnja-dlja-avtomobilistov-vstupajut-v-silu-novye-pravila', '/news/s-segodnjashnego-dnja-dlja-avtomobilistov-vstupajut-v-silu-novye-pravila/', 'С сегодняшнего дня для автомобилистов вступают в силу новые правила', 1447070990, 1447070990, '', 0, 'С сегодняшнего дня для автомобилистов вступают в силу новые правила', 'С сегодняшнего дня для автомобилистов вступают в силу новые правила. Читайте актуальную и полезную информацию на сайте одесского перевозчика Алло Такси', 'новость, сегодняшнего, дня, автомобилистов, вступают, силу, новые, правила', ''),
(6770, 255, 256, 2, 6654, 'news', 'novovvedenija-v-pravilah-dorozhnogo-dvizhenija', '/news/novovvedenija-v-pravilah-dorozhnogo-dvizhenija/', 'Нововведения в правилах дорожного движения', 1448275228, 1448275228, '', 0, 'Нововведения в правилах дорожного движения', 'Нововведения в правилах дорожного движения. С 7 ноября в ПДД появились изменения, направленные на то, чтобы облегчить жизнь автомобилистам', 'новость, нововведения, правилах, дорожного, движения', ''),
(6771, 257, 258, 2, 6654, 'news', 'spravka-o-dtp-dlja-voditelej-v-ukraine-byla-otmenena', '/news/spravka-o-dtp-dlja-voditelej-v-ukraine-byla-otmenena/', 'Справка о ДТП для водителей в Украине была отменена', 1448892218, 1448892218, '', 0, 'Справка о ДТП для водителей в Украине была отменена', 'Справка о ДТП для водителей в Украине была отменена. Читайте свежие новости на сайте одесского перевозчика Алло такси', 'новость, справка, дтп, водителей, украине, была, отменена', ''),
(6772, 259, 260, 2, 6654, 'news', 'strahovye-vyplaty-dlja-avtomobilistov-budut-uvelicheny-v-dva-raza', '/news/strahovye-vyplaty-dlja-avtomobilistov-budut-uvelicheny-v-dva-raza/', 'Страховые выплаты для автомобилистов будут увеличены в два раза', 1449735398, 1449735398, '', 0, 'Страховые выплаты для автомобилистов будут увеличены в два раза', 'Страховые выплаты для автомобилистов будут увеличены в два раза. Читайте подробнее на сайте Алло такси. Одесская служба перевозок', 'новость, страховые, выплаты, автомобилистов, будут, увеличены, два, раза', ''),
(6773, 65, 68, 2, 768, 'page', 'bonusi-i-skidki', '/pages/bonusi-i-skidki/', 'Бонусы и скидки', 1449829751, 1449829751, '', 0, 'Бонусы и акции от Алло такси в Одессе. Скидки для постоянных клиентов', 'Гибкая система скидок для постоянных клиентов от Алло такси. Бонусная программа и акции. Алло такси в Одессе надёжный и выгодный перевозчик', 'акции, такси, алло, бонусы, скидки, одесса', ''),
(6774, 66, 67, 3, 6773, 'block', 'bonusi-i-skidki', '/pages/bonusi-i-skidki/bonusi-i-skidki/', 'Бонусы и скидки', 1449829751, 1449829751, '', 0, '', '', '', ''),
(6775, 69, 72, 2, 768, 'page', 'beznalichnii-raschet', '/pages/beznalichnii-raschet/', 'Безналичный расчет', 1449831881, 1449831881, '', 0, 'Безналичный расчет теперь в Алло Такси в Одессе', 'Безналичный расчёт в Алло такси. Оплата услуг такси в Одессе посредством банковской карты', 'безналичный, расчёт, оплата, такси, алло, одесса', ''),
(6776, 70, 71, 3, 6775, 'block', 'beznalichnii-raschet', '/pages/beznalichnii-raschet/beznalichnii-raschet/', 'Безналичный расчет', 1449831881, 1449831881, '', 0, '', '', '', ''),
(6778, 263, 264, 2, 6654, 'news', 'ukrainskoj-policii-pridetsja-osvaivat-novye-standarty-kachestva-dorog', '/news/ukrainskoj-policii-pridetsja-osvaivat-novye-standarty-kachestva-dorog/', 'Украинской полиции придется осваивать новые стандарты качества дорог', 1450705716, 1450705716, '', 0, 'Украинской полиции придется осваивать новые стандарты качества дорог', 'Украинской полиции придется осваивать новые стандарты качества дорог. На данный момент законопроект №3130 уже подготовлен к рассмотрению в Верховной Раде', 'новость, украинской, полиции, придется, осваивать, новые, стандарты, качества, дорог', ''),
(6777, 261, 262, 2, 6654, 'news', 'deputatyplanirujuturegulirovatrabotutaksi', '/news/deputatyplanirujuturegulirovatrabotutaksi/', 'Депутаты планируют урегулировать работу такси', 1450098728, 1450098728, '', 0, 'Депутаты планируют урегулировать работу такси', 'Депутаты планируют урегулировать работу такси. Читайте подробнее на сайте Алло такси всегда свежую и полезную информация на сайте одесского перевозчика Алло такси', 'новость, депутаты, планируют, урегулировать, работу, такси', ''),
(6779, 265, 266, 2, 6654, 'news', 'novaja-usluga-vyzova-i-oplaty-taksi-pojavilas-v-mobilnom-pilozhenii-privat24', '/news/novaja-usluga-vyzova-i-oplaty-taksi-pojavilas-v-mobilnom-pilozhenii-privat24/', 'Новая услуга вызова и оплаты такси появилась в мобильном приложении Privat24', 1453203144, 1453203144, '', 0, 'Новая услуга вызова и оплаты такси появилась в мобильном приложении Privat24', 'Новая услуга вызова и оплаты такси появилась в мобильном приложении Privat24', 'Новая услуга вызова и оплаты такси появилась в мобильном приложении Privat24', ''),
(6780, 267, 268, 2, 6654, 'news', 'v-odesse-pojavilas-sluzhba-taksi-dlja-invalidov-koljasochnikov', '/news/v-odesse-pojavilas-sluzhba-taksi-dlja-invalidov-koljasochnikov/', 'В Одессе появилась служба такси для инвалидов-колясочников', 1453731411, 1453731411, '', 0, 'В Одессе появилась служба такси для инвалидов-колясочников', 'В Одессе появилась служба такси для инвалидов-колясочников. В Одессе приступила к работе первая служба такси для инвалидов-колясочников, которая называется «Турбота»', 'новость, одессе, появилась, служба, такси, инвалидов, колясочников', ''),
(6782, 271, 272, 2, 6654, 'news', 'avtoshkoly-okazalis-na-grani-zakrytija', '/news/avtoshkoly-okazalis-na-grani-zakrytija/', 'Автошколы оказались на грани закрытия', 1454938941, 1454938941, '', 0, 'Автошколы оказались на грани закрытия', 'Автошколы оказались на грани закрытия. Читайте новости мира автомобилей на сайте одесского перевозчика Алло такси', 'новость, автошколы, оказались, грани, закрытия', ''),
(6783, 121, 122, 2, 449, 'node', 'main', '/hmvcblocks/main/', 'Главная', 1455269578, 1455269578, '', 0, '', '', '', ''),
(6784, 18, 19, 3, 3209, 'block', 'main', '/pages/index/main/', 'Главная', 1455269601, 1455269601, '', 0, '', '', '', ''),
(6785, 123, 124, 2, 449, 'node', 'price', '/hmvcblocks/price/', 'Цены', 1455270452, 1455270452, '', 0, '', '', '', ''),
(6786, 56, 57, 3, 6741, 'block', 'price', '/pages/luchshie-tsenyi/price/', 'Цены', 1455270479, 1455270479, '', 0, '', '', '', ''),
(6787, 6, 11, 3, 769, 'folder', 'footer', '/pages/defoult/footer/', 'Футер', 1455271971, 1455271971, '', 0, '', '', '', ''),
(6788, 9, 10, 4, 6787, 'block', 'lastnews', '/pages/defoult/footer/lastnews/', 'Последние новости', 1455272007, 1455272007, '', 0, '', '', '', ''),
(6790, 125, 126, 2, 449, 'node', 'lastnews', '/hmvcblocks/lastnews/', 'Последние новости', 1455272260, 1455272260, '', 0, '', '', '', ''),
(6796, 7, 8, 4, 6787, 'block', 'lastvacancies', '/pages/defoult/footer/lastvacancies/', 'Последние вакансии', 1455274914, 1455274914, '', 0, '', '', '', ''),
(6795, 127, 128, 2, 449, 'node', 'lastvacancies', '/hmvcblocks/lastvacancies/', 'Последние вакансии', 1455274886, 1455274886, '', 0, '', '', '', ''),
(6797, 296, 301, 1, 1, 'list', 'vacancies', '/vacancies/', 'Вакансии', 1455276703, 1455276703, '', 0, '', '', '', ''),
(6798, 297, 298, 2, 6797, 'vacancy', 'driver', '/vacancies/driver/', 'Водитель', 1455277198, 1455277198, '', 0, '', '', '', ''),
(6799, 299, 300, 2, 6797, 'vacancy', 'dispecher', '/vacancies/dispecher/', 'Диспечер', 1455277947, 1455277947, '', 0, '', '', '', ''),
(6800, 129, 130, 2, 449, 'node', 'onevacancy', '/hmvcblocks/onevacancy/', 'Одна вакансия', 1455278659, 1455278659, '', 0, '', '', '', ''),
(6801, 287, 290, 2, 6750, 'page', 'onevacancy', '/system-pages/onevacancy/', 'Одна вакансия', 1455278682, 1455278682, '', 0, '', '', '', ''),
(6802, 288, 289, 3, 6801, 'block', 'onevacancy', '/system-pages/onevacancy/onevacancy/', 'Одна вакансия', 1455278705, 1455278705, '', 0, '', '', '', ''),
(6803, 36, 37, 3, 6667, 'block', 'seovacancy', '/pages/taxi-work/seovacancy/', 'СЕО вакансии', 1455282028, 1455282028, '', 0, '', '', '', ''),
(6804, 131, 132, 2, 449, 'node', 'allvacancies', '/hmvcblocks/allvacancies/', 'Все вакансии', 1455282153, 1455282153, '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tree_rule`
--

CREATE TABLE IF NOT EXISTS `tree_rule` (
`tree_rule_id` int(11) unsigned NOT NULL,
  `tree_rule_role_id` int(11) NOT NULL,
  `tree_rule_resource_id` int(11) NOT NULL,
  `tree_rule_privilege_id` int(11) NOT NULL,
  `tree_rule_order` int(11) unsigned NOT NULL DEFAULT '0',
  `tree_rule_type` enum('allow','deny') COLLATE utf8_bin NOT NULL DEFAULT 'deny',
  `tree_rule_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `tree_rule`
--

INSERT INTO `tree_rule` (`tree_rule_id`, `tree_rule_role_id`, `tree_rule_resource_id`, `tree_rule_privilege_id`, `tree_rule_order`, `tree_rule_type`, `tree_rule_status`) VALUES
(1, 44, 128, 3, 0, 'deny', 1),
(2, 44, 118, 3, 0, 'allow', 1),
(4, 44, 141, 3, 0, 'allow', 1),
(8, 44, 117, 5, 0, 'allow', 1),
(9, 46, 181, 5, 0, 'allow', 1),
(10, 46, 177, 5, 0, 'allow', 1),
(11, 46, 152, 5, 0, 'deny', 1),
(15, 45, 1, 5, 0, 'allow', 1),
(16, 48, 636, 9, 0, 'allow', 1),
(17, 48, 702, 9, 0, 'allow', 1),
(18, 48, 703, 9, 0, 'allow', 1),
(19, 48, 586, 9, 0, 'allow', 1),
(20, 48, 172, 9, 0, 'allow', 1),
(22, 48, 787, 9, 0, 'allow', 1),
(23, 48, 790, 9, 0, 'allow', 1),
(24, 48, 839, 7, 0, 'allow', 1),
(26, 48, 112, 9, 0, 'allow', 1),
(27, 48, 897, 6, 0, 'allow', 1),
(28, 48, 895, 6, 0, 'allow', 1),
(29, 48, 896, 6, 0, 'allow', 1),
(30, 48, 898, 7, 0, 'allow', 1),
(31, 48, 899, 7, 0, 'allow', 1),
(32, 48, 900, 9, 0, 'allow', 1),
(33, 48, 870, 7, 0, 'allow', 1),
(34, 48, 871, 7, 0, 'allow', 1),
(35, 48, 869, 9, 0, 'allow', 1),
(36, 48, 838, 6, 0, 'allow', 1),
(37, 48, 910, 7, 0, 'allow', 1),
(38, 48, 1003, 6, 0, 'allow', 1),
(39, 48, 1004, 7, 0, 'allow', 1),
(40, 48, 859, 9, 0, 'allow', 1),
(42, 48, 998, 7, 0, 'allow', 1),
(43, 48, 1002, 7, 0, 'allow', 1),
(44, 48, 1012, 9, 0, 'allow', 1),
(45, 48, 943, 7, 0, 'allow', 1),
(46, 48, 1000, 7, 0, 'allow', 1),
(47, 48, 1021, 9, 0, 'allow', 1),
(48, 48, 2340, 9, 0, 'allow', 1),
(49, 48, 2333, 9, 0, 'allow', 1),
(50, 48, 2336, 9, 0, 'allow', 1),
(51, 48, 2349, 7, 0, 'allow', 1),
(52, 48, 2350, 7, 0, 'allow', 1),
(53, 48, 2379, 7, 0, 'allow', 1),
(54, 48, 2380, 7, 0, 'allow', 1),
(61, 48, 2381, 7, 0, 'allow', 1),
(62, 48, 768, 9, 0, 'allow', 1),
(63, 48, 714, 7, 0, 'deny', 1),
(64, 48, 3186, 9, 0, 'allow', 1),
(65, 48, 2790, 7, 0, 'allow', 1),
(66, 48, 6654, 9, 0, 'allow', 1),
(67, 48, 6698, 9, 0, 'allow', 1),
(68, 48, 6748, 9, 0, 'allow', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE IF NOT EXISTS `types` (
`type_id` int(10) unsigned NOT NULL,
  `type_name` varchar(200) NOT NULL,
  `type_desc` mediumtext NOT NULL,
  `type_fields` text NOT NULL,
  `types_module` varchar(200) NOT NULL,
  `type_added` int(11) NOT NULL,
  `type_modified` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`type_id`, `type_name`, `type_desc`, `type_fields`, `types_module`, `type_added`, `type_modified`) VALUES
(1, 'page', 'Текстовая страница', 'a:1:{s:14:"form_structure";s:923:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a...","label":"TITLE","id":"title","class":"b-field","name":"title","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 meta-keys...","label":"KEYWORDS","id":"mkeys","class":"b-field","name":"mkeys","table":"","field":"","default":"","filter":""}},{"type":"textarea","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 meta-description...","label":"DESCRIPTION","id":"mdesc","class":"b-textarea","name":"mdesc","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433","id":"save_button","class":"b-button greyishBtn submitForm","name":"save_button"}}]";}', 'type', 1336400922, 1379332541),
(3, 'folder', 'Тип папка', '', 'type', 1336728939, 1338890233),
(4, 'form', 'Тип форма', 'a:2:{s:5:"title";a:3:{s:4:"type";s:6:"string";s:5:"title";s:18:"Заголовок";s:7:"pattern";b:0;}s:7:"content";a:3:{s:4:"type";s:4:"text";s:5:"title";s:20:"Содержимое";s:7:"pattern";b:0;}}', 'type', 1336729036, 1336729036),
(6, 'site', 'Сайт', '', 'type', 1337952720, 1337952720),
(18, 'link', 'Ссылка', 'a:1:{s:14:"form_structure";s:1642:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441\\u0441\\u044b\\u043b\\u043a\\u0438...","label":"\\u0410\\u0434\\u0440\\u0435\\u0441","id":"address","class":"b-field","name":"address","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435 \\u0441\\u0441\\u044b\\u043b\\u043a\\u0438...","label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435","id":"content","class":"b-field","name":"content","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0441\\u044b\\u043b\\u043a\\u0438...","label":"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435","id":"description","class":"b-field","name":"description","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u041a\\u043b\\u0430\\u0441\\u0441 \\u0434\\u043b\\u044f \\u043c\\u0435\\u043d\\u044e","id":"link-class","class":"link-class","name":"class","table":"","field":"","default":"","filter":""}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430","id":"image-id","class":"image-class","name":"image","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u0441\\u0441\\u044b\\u043b\\u043a\\u0443","id":"save_button","class":"b-button greyishBtn submitForm","name":"save_button"}}]";}', 'type', 1338387559, 1357136918),
(22, 'clientform', 'Клиентская форма', 'a:1:{s:14:"form_structure";s:106:"[{"type":"hidden","values":{"id":"","class":"","name":"","table":"","field":"","default":"","filter":""}}]";}', 'type', 1338564299, 1338564299),
(23, 'image', 'Картинка', 'a:1:{s:14:"form_structure";s:1312:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438...","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"name","class":"b-field","name":"name","table":"","field":"","default":"","filter":""}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430","id":"image","class":"b-file","name":"image","table":"","field":"","default":"","filter":"image:w=480&h=285&iar=1"}},{"type":"input_text","values":{"placeholder":"","label":"\\u0421\\u0441\\u044b\\u043b\\u043a\\u0430 ","id":"image-link-id","class":"image-link","name":"link","table":"","field":"","default":"","filter":""}},{"type":"textarea","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0438...","label":"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435","id":"desc","class":"b-textarea","name":"desc","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0443","id":"save_image","class":"b-button greyishBtn submitForm","name":"save_image"}}]";}', 'type', 1338800310, 1353421429),
(20, 'block', 'Блок', 'a:1:{s:14:"form_structure";s:1642:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0430...","label":"\\u041d\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"name","class":"b-field","name":"name","table":"","field":"","default":"","filter":""}},{"type":"select","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435","id":"action","class":"b-select","name":"action","method":"{\\"field\\":\\"name\\",\\"filter\\":\\"node\\",\\"node\\":\\"\\/hmvcblocks\\/\\",\\"title\\":[\\"tree_title\\"]}"},"multiple":"undefined","options":{"1":{"value":"","baseline":"checked"}}},{"type":"wysiwyg","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435 \\u0431\\u043b\\u043e\\u043a\\u0430","id":"content","class":"b-wysiwyg","name":"content"}},{"type":"select","values":{"label":"\\u0428\\u0430\\u0431\\u043b\\u043e\\u043d","id":"template-id","class":"template-class","name":"template","method":"{\\"field\\":\\"name\\",\\"filter\\":\\"node\\",\\"node\\":\\"\\/templates\\/\\",\\"title\\":[\\"tree_title\\"]}"},"multiple":"undefined","options":{"1":{"value":"\\u0421\\u0442\\u0430\\u043d\\u0434\\u0430\\u0440\\u0442\\u043d\\u044b\\u0439 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d \\u0441\\u0442\\u0430\\u0440\\u0448\\u0435\\u0433\\u043e \\u043c\\u043e\\u0434\\u0443\\u043b\\u044f","baseline":"undefined"},"2":{"value":"\\u0411\\u0435\\u0437 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u0430","baseline":"undefined"}}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u0431\\u043b\\u043e\\u043a","id":"save_button","class":"b-button greyishBtn submitForm","name":"save_button"}}]";}', 'type', 1338535858, 1355929888),
(31, 'blockform', 'Блок форма', 'a:1:{s:14:"form_structure";s:836:"[{"type":"input_text","values":{"placeholder":"","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0444\\u043e\\u0440\\u043c\\u044b","id":"form-title","class":"form-title","name":"form_title","table":"","field":"","default":"","filter":""}},{"type":"select","values":{"label":"\\u041a\\u043b\\u0438\\u0435\\u043d\\u0442\\u0441\\u043a\\u0430\\u044f \\u0444\\u043e\\u0440\\u043c\\u0430","id":"client-form","class":"client-form","name":"client_form","method":"{\\"field\\":\\"name\\",\\"filter\\":\\"clientform\\",\\"node\\":\\"\\/client_forms\\/\\",\\"title\\":[\\"tree_title\\"]}"},"multiple":"undefined","options":{"1":{"value":"","baseline":"undefined"}}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u0431\\u043b\\u043e\\u043a","id":"save_button","class":"b-button greyishBtn submitForm","name":"save_button"}}]";}', 'type', 1340615025, 1353591790),
(35, 'node', 'Сущьность', 'a:1:{s:14:"form_structure";s:550:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"node-name","class":"node-name","name":"title","table":"","field":"","default":"","filter":""}},{"type":"wysiwyg","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435","id":"node-content","class":"node-content","name":"content"}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm add_type_button","name":""}}]";}', 'type', 1340803783, 1343048073),
(54, 'filter', 'Страница списка с фильтром', 'a:1:{s:14:"form_structure";s:1675:"[{"type":"input_text","values":{"placeholder":"","label":"\\u0422\\u0438\\u043f\\u044b \\u0447\\u0435\\u0440\\u0435\\u0437 \\u0437\\u0430\\u043f\\u044f\\u0442\\u0443\\u044e  \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u044c","id":"filter-types","class":"filter-types","name":"types","table":"","field":"","default":"","filter":""},"vlds":["length255"]},{"type":"input_text","values":{"placeholder":"","label":"\\u041f\\u043e\\u043b\\u044f \\u0434\\u043b\\u044f \\u0442\\u0438\\u043f\\u043e\\u0432 \\u043f\\u043e \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u043c \\u0438\\u0445 \\u0433\\u0440\\u0443\\u043f\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u0440\\u0438\\u043c\\u0435\\u0440  -  { \\"\\u0442\\u0438\\u043f1\\":\\"\\u043f\\u043e\\u043b\\u04351\\" , \\"\\u0442\\u0438\\u043f2\\":{\\"\\u043f\\u043e\\u043b\\u04351\\",\\"\\u043f\\u043e\\u043b\\u04352\\"} }} ","id":"filter-group","class":"filter-group","name":"group","table":"","field":"","default":"","filter":""},"vlds":["length255"]},{"type":"input_text","values":{"placeholder":"","label":"\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0435 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u0435","id":"condition-id","class":"condition-class","name":"condition","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a h1","id":"header1-id","class":"header1-class","name":"header1","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm add_node_button","name":""}}]";}', 'type', 1343123919, 1357651933),
(56, 'list', 'Список', 'a:1:{s:14:"form_structure";s:617:"[{"type":"input_text","values":{"placeholder":"","label":"\\u0420\\u0430\\u0437\\u0440\\u0435\\u0448\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0442\\u0438\\u043f\\u044b \\u0434\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u0441\\u043f\\u0438\\u0441\\u043a\\u0430, \\u0447\\u0435\\u0440\\u0435\\u0437 \\u0437\\u0430\\u043f\\u044f\\u0442\\u0443\\u044e","id":"list-types","class":"list-types","name":"types","table":"","field":"","default":"","filter":""},"vlds":["length255"]},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm add_type_button","name":""}}]";}', 'type', 1343980207, 1343982513),
(59, 'news', 'Новость', 'a:1:{s:14:"form_structure";s:927:"[{"type":"input_text","values":{"placeholder":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","id":"","class":"","name":"header","table":"","field":"","default":"","filter":""},"vlds":["length255"]},{"type":"wysiwyg","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435","id":"","class":"","name":"content"}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430","id":"","class":"","name":"img","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u0414\\u0430\\u0442\\u0430","id":"","class":"datepicker","name":"date","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u044c","id":"","class":"","name":"save_button"}}]";}', 'type', 1338289651, 1437478996),
(74, 'alias', 'Алиас', 'a:1:{s:14:"form_structure";s:628:"[{"type":"select","values":{"label":"\\u042d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u043d\\u0430 \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0441\\u0441\\u044b\\u043b\\u0430\\u0435\\u0442\\u0441\\u044f \\u0430\\u043b\\u0438\\u0430\\u0441 ","id":"element-id","class":"element-class","name":"elementid","method":"{\\"field\\":\\"id\\",\\"filter\\":\\"link\\",\\"node\\":\\"\\/sub-menu\\/ \\",\\"title\\":[\\"tree_title\\"]}"},"multiple":"undefined","options":{"1":{"value":"","baseline":"checked"}}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1355913703, 1357142804),
(76, 'blog', 'Блог', 'a:1:{s:14:"form_structure";s:751:"[{"type":"input_text","values":{"placeholder":"","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","id":"blog-title-id","class":"blog-title","name":"title","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u0414\\u0430\\u0442\\u0430","id":"blog-date-id","class":"blog-date  b-field datepicker","name":"date","table":"","field":"","default":"","filter":""}},{"type":"wysiwyg","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435","id":"blog-content","class":"blog-content","name":"content"}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1356076383, 1356082493),
(78, 'blogtag', 'Блог тег', 'a:1:{s:14:"form_structure";s:422:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u0435\\u0433\\u0430","id":"tag-name-id","class":"tag-name","name":"name","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button-section","class":"b-button greyishBtn submitForm add_type_button","name":""}}]";}', 'type', 1356077492, 1356077492),
(81, 'articles', 'Статьии', 'a:1:{s:14:"form_structure";s:583:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\\u0438","id":"header1-id","class":"header1-class","name":"header1","table":"","field":"","default":"","filter":""}},{"type":"wysiwyg","values":{"label":"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435","id":"content-id","class":"content-class","name":"content"}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1357210706, 1437465740),
(89, 'catalog', 'Каталог', 'a:1:{s:14:"form_structure";s:636:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"name-id","class":"name-class","name":"name","table":"","field":"","default":"","filter":""}},{"type":"select","values":{"label":"\\u0412\\u044b\\u0431\\u043e\\u0440 \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\u0430","id":"catalog-id","class":"catalog-class","name":"catalog","method":""},"multiple":"undefined","options":{"1":{"value":"","baseline":"undefined"}}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1357298003, 1357298003),
(90, 'blockcatalog', 'Блок каталога', 'a:1:{s:14:"form_structure";s:1628:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"name-id","class":"name-class","name":"name","table":"","field":"","default":"","filter":""}},{"type":"textarea","values":{"placeholder":"","label":"\\u0422\\u0435\\u043a\\u0441\\u0442 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u044f","id":"desc-id","class":"desc-class","name":"desc","table":"","field":"","default":"","filter":""}},{"type":"select","values":{"label":"\\u0412\\u044b\\u0431\\u043e\\u0440 \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\u0430","id":"catalog-id","class":"catalog-class","name":"catalog","method":"{\\"field\\":\\"id\\", \\"filter\\":\\"subcatalog,list\\", \\"node\\":\\"\\/catalogs\\/\\", \\"title\\":[\\"tree_title\\"], \\"go\\":{\\"childs\\":\\"1\\"}}"},"multiple":"undefined","options":{"1":{"value":"","baseline":"undefined"}}},{"type":"select","values":{"label":"\\u0422\\u0438\\u043f \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u044b\\u0431\\u0438\\u0440\\u0430\\u0442\\u044c \\u0432 \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\u0435","id":"types-id","class":"types-class","name":"types","method":""},"multiple":"undefined","options":{"1":{"value":"","baseline":"undefined"},"2":{"value":"colors","baseline":"undefined"},"3":{"value":"textures","baseline":"undefined"},"4":{"value":"doors","baseline":"undefined"},"5":{"value":"cloths","baseline":"undefined"},"6":{"value":"decors","baseline":"undefined"},"7":{"value":"products","baseline":"undefined"}}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1357299707, 1357315423),
(93, 'menulink', 'Ссылка в меню', 'a:1:{s:14:"form_structure";s:1601:"[{"type":"input_text","values":{"placeholder":"","label":"\\u041f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e","id":"menu-name","class":"menu-name","name":"name","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u0421\\u0441\\u044b\\u043b\\u043a\\u0430 \\u0441 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f\\u043c\\u0438 \\u043f\\u043e\\u0438\\u0441\\u043a\\u0430","id":"res-link","class":"res-link","name":"reslink","table":"","field":"","default":"","filter":""}},{"type":"select","values":{"label":"\\u0421\\u0432\\u0435\\u0440\\u043d\\u0443\\u0442\\u044c \\u043f\\u043e\\u0434\\u043f\\u0443\\u043d\\u043a\\u0442\\u044b \\u043c\\u0435\\u043d\\u044e  ","id":"hide-submenu","class":"hide-submenu","name":"hide","method":""},"multiple":"undefined","options":{"1":{"value":"\\u043d\\u0435\\u0442","baseline":"undefined"},"2":{"value":"\\u0434\\u0430","baseline":"undefined"}}},{"type":"input_text","values":{"placeholder":"","label":"Keywords","id":"id-keywords","class":"class-keywords","name":"keywords","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"Title","id":"id-title","class":"class-title","name":"title","table":"","field":"","default":"","filter":""}},{"type":"textarea","values":{"placeholder":"","label":"Description","id":"id-description","class":"class-description","name":"description","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save_button","class":"b-button greyishBtn submitForm","name":"save_button"}}]";}', 'type', 1378890379, 1379331520),
(94, 'beaforafter', 'До-После', 'a:1:{s:14:"form_structure";s:1274:"[{"type":"input_text","values":{"placeholder":"","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0431\\u043b\\u043e\\u043a\\u0430","id":"title-id","class":"title-class","name":"title","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0434\\u043f\\u0438\\u0441\\u044c \\u043f\\u043e\\u0434 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u043e\\u0439 1","id":"","class":"","name":"mtitle1","table":"","field":"","default":"","filter":""}},{"type":"input_text","values":{"placeholder":"","label":"\\u041d\\u0430\\u0434\\u043f\\u0438\\u0441\\u044c \\u043f\\u043e\\u0434 \\u043a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u043e\\u0439 2","id":"","class":"","name":"mtitle2","table":"","field":"","default":"","filter":""}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430 1","id":"","class":"","name":"beafor","table":"","field":"","default":"","filter":""}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430 2","id":"","class":"","name":"after","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c","id":"save-button","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1380198663, 1380266820),
(95, 'vacancy', 'Вакансия', 'a:1:{s:14:"form_structure";s:765:"[{"type":"input_text","values":{"placeholder":"","label":"\\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"","class":"","name":"name","table":"","field":"","default":"","filter":""}},{"type":"wysiwyg","values":{"label":"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435","id":"","class":"","name":"text"}},{"type":"file","values":{"label":"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430","id":"","class":"","name":"img","table":"","field":"","default":"","filter":""}},{"type":"textarea","values":{"placeholder":"","label":"\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d\\u044b","id":"","class":"","name":"phones","table":"","field":"","default":"","filter":""}},{"type":"submit","values":{"label":"","id":"","class":"b-button greyishBtn submitForm","name":""}}]";}', 'type', 1455277162, 1455277781);

-- --------------------------------------------------------

--
-- Структура таблицы `type_alias`
--

CREATE TABLE IF NOT EXISTS `type_alias` (
  `type_alias_id` int(10) unsigned NOT NULL,
  `type_alias_pid` int(10) unsigned NOT NULL,
  `type_alias_elementid` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_articles`
--

CREATE TABLE IF NOT EXISTS `type_articles` (
  `type_articles_id` int(10) unsigned NOT NULL,
  `type_articles_pid` int(10) unsigned NOT NULL,
  `type_articles_header1` varchar(500) NOT NULL,
  `type_articles_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_articles`
--

INSERT INTO `type_articles` (`type_articles_id`, `type_articles_pid`, `type_articles_header1`, `type_articles_content`) VALUES
(6749, 0, 'Контакты Алло Такси. Такси Одесса телефон', '<p style="line-height: 20.8000011444092px;"><img alt="Телефон такси Одесса" src="/upload/imgimages/sms-taxi.jpg" style="width: 259px; height: 194px; float: left; margin: 10px;" /></p>\n\n<p style="line-height: 20.8000011444092px;">Если Вы ищите быстрое и&nbsp;<a href="http://allotaxi.od.ua/">недорогое такси в Одессе</a>, обращайтесь в &laquo;Алло такси&raquo;! С нами Вас всегда ожидает оперативное обслуживание и комфортные условия при передвижении. Запишите для связи с Алло такси Одесса телефон, по которому Вы в любое время суток сможете дозвониться в нашу компанию 733-5000.</p>\n\n<p style="line-height: 20.8000011444092px;">&laquo;Алло такси&raquo; &ndash; это&nbsp;компания, которая заботится об экономном использовании Вашего времени, с нами любая поездка превратится в приятное путешествие по городу. Наш телефон такси Одесса 733-5000 всегда к Вашим услугам, без неполадок или перебоев на линии. В нашем автопарке достаточно машин, которые наши операторы равномерно распределяют. В течение 10 минут после заказа такси наши операторы перезвонят Вам и оповестят о подаче автомобиля.</p>\n\n<h2>Заказ такси онлайн Одесса</h2>\n\n<p style="line-height: 20.8000011444092px;">В том случае, если Вам неудобно пользоваться телефоном или Вы предпочитаете интернет в качестве средства связи, предлагаем Вам оформить&nbsp;<strong>заказ такси онлайн.</strong>&nbsp;&laquo;Алло такси&raquo; &ndash; это компания, которая всегда идёт в ногу со временем и предлагает своим клиентам все возможные инновации, которые сделают сотрудничество с нами максимально комфортным для наших клиентов. Вы можете оформить заказ такси онлайн Одесса<strong>,&nbsp;</strong>заполнив простую форму на нашем сайте. Данная услуга действует для экономии Вашего времени. Вам не нужно будет тратить время на звонок, а просто заполнить свой заказ в интернете и в нужное время автомобиль будет по нужному адресу. А операторы перезвонят Вам, когда машина будет доставлена.&nbsp;Услуги компании&nbsp;&laquo;Алло такси&raquo; всегда надежны, качественны и удобны, при любой форме заказа.</p>\n');

-- --------------------------------------------------------

--
-- Структура таблицы `type_beaforafter`
--

CREATE TABLE IF NOT EXISTS `type_beaforafter` (
  `type_beaforafter_id` int(10) unsigned NOT NULL,
  `type_beaforafter_pid` int(10) unsigned NOT NULL,
  `type_beaforafter_title` varchar(500) NOT NULL,
  `type_beaforafter_beafor` varchar(500) NOT NULL,
  `type_beaforafter_after` varchar(500) NOT NULL,
  `type_beaforafter_mtitle1` varchar(500) NOT NULL,
  `type_beaforafter_mtitle2` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_block`
--

CREATE TABLE IF NOT EXISTS `type_block` (
  `type_block_id` int(10) unsigned NOT NULL,
  `type_block_name` varchar(500) NOT NULL,
  `type_block_action` text NOT NULL,
  `type_block_content` text NOT NULL,
  `type_block_template` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_block`
--

INSERT INTO `type_block` (`type_block_id`, `type_block_name`, `type_block_action`, `type_block_content`, `type_block_template`) VALUES
(3211, 'Такси в Одессе', '', '<p><img alt="заказ такси одесса" src="/upload/imgimages/%D0%BD%D0%B0%20%D0%B3%D0%BB%D0%B0%D0%B2%D0%BD%D1%83%D1%8E.jpg" style="float: left; height: 150px; width: 150px; margin: 10px;" /></p>\n\n<p>В современном мире, наверное, не существует человека, который бы не пользовался таким благом цивилизации как транспорт. Общественный, личный, грузовой&hellip;все больше его разновидностей заполняют улицы городов, а это становится неудобно, когда надо срочно куда-то ехать. Обычно, когда дело касается срочности и вам надо быстро доехать в нужное место &laquo;палочкой-выручалочкой&raquo; становится такси. Возникает следующий вопрос, как среди множества служб такси в Одессе найти, то которое оперативно примет ваш заказ и с максимальной скоростью и комфортом доставит вас в пункт назначения. В записной книжке нет номера такси, а Интернет-поисковик по запросу &laquo;<strong>такси Одесса</strong>&raquo; выдает массу результатов.</p>\n\n<p>Алло такси &ndash; это лучшее Одесское такси, которое отличается оперативной работой на всех стадиях предоставления услуг: от приема заказа до перевозки пассажира. Мы подстраиваемся под любые жизненные ситуации и предоставим вам лучший транспорт. Вы опаздываете на деловую встречу, спешите на поезд, не успеваете доставить ребенка в школу или детский сад &ndash;&nbsp;мы гарантируем вам оперативное предоставление свободной машины и максимально быструю транспортировку кратчайшим путем. Если вы встречаете в аэропорту друзей, которые приехали на море, возвращаетесь после шумной вечеринки и захотели с комфортом прокатиться по городу &ndash; служба Алло такси организует приятное путешествие в хорошем авто по чудесному городу.</p>\n\n<p>Обращаясь в нашу службу, вы совершаете вызов <strong>такси в Одессе</strong> с широчайшим перечнем услуг, потому что наши машины адаптированы не только для пассажирских перевозок, мы выполняем также <a href="http://allotaxi.od.ua/taxi-price">грузовые перевозки</a>, доставляем продукты и лекарства, занимаемся перегоном автомобилей, буксируем ваше авто, при необходимости доставляем вместительные машины, в том числе и микроавтобусы.</p>\n\n<p>Алло такси, благодаря профессионализму наших диспетчеров, &ndash; это оперативный заказ такси в Одессе. Наши сотрудники в максимально короткие сроки обработают ваш запрос и предоставят вам комфортабельную машину, которая соответствует всем техническим нормам и стандартам. А опытные водители, отлично знающие город, быстро и без затруднений доставят вас в нужное место. Прибегнув к нашим услугам один раз, и по заслугам оценив <a href="http://allotaxi.od.ua/taxi-work">работу</a> наших сотрудников, вы больше не пожелаете пользоваться другими службами такси. Позвонив на наш номер, вы сможете заказать такси в Одессе и получить лучшего проводника по всему городу и за его пределами, если вы приехали в Южную Пальмиру впервые.</p>\n\n<p>Идя в ногу со временем, в нашей службе сейчас успешно функционирует новая услуга &ndash; заказ такси онлайн Одесса, которая отлично подойдет активным пользователям интернета, каких сейчас большинство. Мы стараемся предоставить вам не только высокое качество обслуживания при принятии заказов и комфортные условия передвижения, мы хотим максимально упростить вам задание и предоставить возможность заказать такси, Одесса, не выходя из сети.</p>\n\n<p>Еще одним немаловажным&nbsp; плюсом Алло такси есть его доступность. Не является секретом повышения стоимости проезда в общественном транспорте, ездить на своей машине тоже дело затратное, так как цены на бензин выросли и дороги оставляют желать лучшего. Наша служба адаптируется к условиям, которые диктует украинский рынок нефтепродуктов и сохраняет свою доступную ценообразующую функцию, так как ценит стабильности и хочет быть выгодным всем своим клиентам. Прейскурант цен выдвигает Алло на позицию лидера в номинации &laquo;эконом такси Одесса&raquo;. По этому, если вы ищете службу <strong>такси Одесса недорого</strong>, потому что обычно ездите на общественном транспорте, не хотите тратить лишних денег и вам важно найти дешевое такси в Одессе, которое в экстренных случаях выручит вас, то Алло такси &ndash; идеальный вариант. Учитывая <a href="http://allotaxi.od.ua/luchshie-tsenyi">стоимость</a> услуг в нашей службе, нас можно смело обозначить как экономное такси Одесса, которое все могут себе позволить.&nbsp; Алло такси станет надежным партнером, а уровень нашего сервиса и быстрота оказания услуг превратит Алло такси от одноразовой службы быстрого предоставления транспорта и транспортировки клиента, в любимое такси Одессы.</p>\n\n<p>Если вы пользуетесь услугами нашей службы, то вызов такси в Одессе больше не будет для вас проблемой, а в вашей телефонной книжке появится новый контакт &laquo;хорошее такси Одесса&raquo;, который не раз пригодиться вам и выручит вас во многих ситуациях.</p>\n', 'content'),
(3248, '', '', '<div id="content" class="span12">\n					<!-- Begin Content -->\n					<h1 class="page-header">Такой страницы не существует.</h1>\n					<div class="well">\n						<div class="row-fluid">\n							<div class="span6">\n								<p><strong>В процессе обработки вашего запроса произошла ошибка.</strong></p>\n								<p>Вы не можете посетить текущую страницу по причине:</p>\n								<ul>\n									<li><strong>просроченная закладка/избранное</strong></li>\n									<li><strong>пропущен адрес</strong></li>\n									<li>поисковый механизм, у которого <strong>просрочен список для этого сайта</strong></li>\n									<li>у вас <strong>нет права доступа</strong> на эту страницу</li>\n								</ul>\n							</div>\n							<div class="span6">\n								<p><strong>Вы можете воспользоваться поиском по сайту или перейти на главную страницу сайта.</strong></p>\n								<p>Поиск по сайту</p>\n																<p>Вернуться на Домашнюю страницу</p>\n								<p><a href="" class="btn"><i class="icon-home"></i> Домашняя страница</a></p>\n							</div>\n						</div>\n						<hr />\n						<p>Если проблемы продолжатся, пожалуйста, обратитесь к системному администратору сайта и сообщите об ошибке, описание которой приведено ниже.</p>\n						<blockquote>\n							<span class="label label-inverse">404</span> Материал не найден						</blockquote>\n					</div>\n					<!-- End Content -->\n				</div>', 'content'),
(6651, 'Алло такси', '', '<div class="page-header">&nbsp;</div>\n\n<p><img alt="Компания Алло такси Одесса" src="/upload/imgimages/taksi2.jpg" style="width: 360px; height: 240px; float: left; margin: 0 10px 0 0;" /></p>\n\n<p>Компания Алло такси была основана в 2012 году, сегодня мы продолжаем активно развиваться, многие из наших заказчиков, стали нашими постоянными клиентами. Алло такси &ndash; это всегда высокий уровень обслуживания и удобства. Наша компания всегда заботится о <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасности</a> и комфорте своих клиентов.</p>\n\n<p>Сотрудники нашей компании имеют высокую квалификацию и значительный опыт работы, который позволяет им не только оперативно и качественно обслуживать клиентов, но и справляться с любыми непредвиденными ситуациями. Водители нашей компании обладают опытом вождения не менее 3 лет, хорошо знают город. Алло такси &ndash; это компания с индивидуальным подходом к каждому нашему клиенту. Заказ такси в Одессе с нашей компанией &ndash; это всегда гарантия надёжности, безопасности и выполнение заказа в самые короткие сроки.</p>\n\n<p>Компания Алло такси Одесса предоставляет клиентам широкий спектр услуг, самыми популярными являются пассажирские перевозки, <a href="http://allotaxi.od.ua/taxi-price">грузовые перевозки</a>, заказ микроавтобусов, поездки по Одессе и за пределами города. Приоритетами нашего <a href="http://allotaxi.od.ua/">такси в Одессе</a> являются скорость и безопасность во время передвижения наших клиентов.</p>\n\n<h2>Преимущества Алло Такси</h2>\n\n<p>Пользуясь услугами нашей компании Вас всегда ожидает быстрая <a href="http://allotaxi.od.ua/taxi-work">работа</a> наших операторов, вежливое обращение всего персонала, удобные условия при осуществлении перевозок, и всё это по приемлемым <a href="http://allotaxi.od.ua/luchshie-tsenyi">ценам</a>. Если Вам необходимо быстро доехать в какую-либо точку города или за пределы города, звоните нам по телефону 733-5000 и наши операторы оперативно примут Ваш заказ и оповестят о подаче автомобиля. С <strong>Алло такси Одесса</strong> Вам всегда гарантировано своевременное выполнение заказа и только приятные эмоции во время поездки.</p>\n\n<p>В автопарках компании Алло такси находится значительное количество самых разных автомобилей. Все машины регулярно проходят технический осмотр. Автомобили нашей компании оснащены всеми современными техническими устройствами для обеспечения Вашего максимального комфорта и безопасности. У нас Вы можете заказать такси в Одессе для осуществления пассажирских перевозок и грузовой автомобиль &nbsp;для переезда или&nbsp; перевоза товара. Вы можете заказать в нашей компании микроавтобус для масштабных мероприятий. Как правило, для гостей на свадьбу или для корпоративного мероприятия &nbsp;наши клиенты заказывают микроавтобус или автобус. Пользуясь услугами компании Алло такси Одесса, Вы всегда получаете положительные эмоции от сотрудничества с нашей компанией.</p>\n\n<p>Также на нашем сайте Вы найдете самые <a href="http://allotaxi.od.ua/taxi-novosti">свежие новости автомобильной тематики</a>, а также много другой полезной информации.</p>\n', 'type'),
(3168, '', 'blockstocsrightcollum', '', 'Без шаблона'),
(3169, '', '', '          <div class="b-fast-bar">\n                            <div class="row-fluid">\n                                <a class="span6 calculator" href="/" title="">\n                                    <img src="/usr/img/calculator.png" alt="" />\n                                </a>\n                                <a class="span6 on-line-consult" href="/" title="">\n                                    <img src="/usr/img/on-line-consult.png" alt="" />\n                                </a>\n                            </div>\n                            <div class="row-fluid">\n                                <a class="span6" href="/" title="">\n                                    <img src="/usr/img/call-me.png" alt="" />\n                                </a>\n                                <a class="span6" href="/" title="">\n                                    <img src="/usr/img/Window-on-credit.png" alt="" />\n                                </a>\n                            </div>\n                            <a href="#" title="" class="crib">Шпаргалка для клиента</a>\n                        </div>', 'Без шаблона'),
(3170, '', 'blockinforightcollum', '', 'Без шаблона'),
(3171, '', 'blocknewsrightcollum', '', 'Без шаблона'),
(6662, '', 'one', '', 'Стандартный шаблон старшего модуля'),
(6668, 'Работа водителем в Одессе', 'allvacancies', '', 'Стандартный шаблон старшего модуля'),
(6699, '', '', '<div class="span3" id="aside">\n<div class="well ">\n<div class="page-header"><strong>Контакты</strong></div>\n\n<div class="custom">\n<div class="contacts" style="margin-left:10px">\n<div class="vcard">\n<p><img height="26" src="/images/phone_green.png" width="26" /> <strong><span class="tel">048-733-5000</span></strong></p>\n\n<p><strong><img alt="" height="25" src="/images/icon-pay-kyivstar.png" width="25" />&nbsp;<span class="tel">097-802-3222</span></strong></p>\n\n<p><strong><img alt="" height="24" src="/images/red-icon-md.png" width="24" />&nbsp;<span class="tel">066-976-3222</span></strong></p>\n\n<p><strong><img alt="" height="24" src="/images/Oboy_logotyp_Laif.png" width="24" />&nbsp;<span class="tel">093-970-3222</span></strong></p>\n</div>\n\n<p><img alt="" height="24" src="/images/images 1.jpg" width="24" />&nbsp;<strong><span class="url">allotaxi.od.ua</span> &darr;</strong></p>\n<!--\n			Skype ''Skype Me™!'' button\n			http://www.skype.com/go/skypebuttons\n			-->\n\n<p><a href="skype:allotaxi.od.ua?call"><img alt="Skype Me™!" height="63" src="/images/skype.png" style="border: none;" width="153" /></a></p>\n</div>\n</div>\n</div>\n\n<div class="well ">\n<div class="page-header"><strong>Мы в сети</strong></div>\n\n<div class="custom">\n<table align="center" border="0" cellpadding="1" cellspacing="1" style="width: 180px; height: 120px">\n	<tbody>\n		<tr>\n			<td style="text-align: center;"><a href="https://www.facebook.com/allotaxiodessa" target="_blank"><img alt="" src="/images/facebook_48x48.png" /></a></td>\n			<td style="text-align: center;"><a href="https://twitter.com/allotaxi_odessa" target="_blank"><img alt="" src="/images/twitter.png" style="height: 50px; width: 50px;" /></a></td>\n			<td style="text-align: center;"><img alt="" src="/images/linkedin.png" style="height: 48px; width: 48px;" /></td>\n		</tr>\n		<tr>\n			<td style="text-align: center;"><img alt="" src="/images/vkontakte.png" style="height: 48px; width: 48px;" /></td>\n			<td style="text-align: center;"><a href="https://www.youtube.com/user/allotaxiod/videos" target="_blank"><img alt="" src="/images/youtobe.png" style="height: 54px; width: 54px;" /></a></td>\n			<td style="text-align: center;"><a href="http://allotax.livejournal.com/" target="_blank"><img alt="" src="/images/livejournal.png" style="height: 48px; width: 48px;" /></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n</div>\n</div>\n<div id="vk_groups">&nbsp;</div>\n<script type="text/javascript">\nVK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "320", color1: ''FFFFFF'', color2: ''2B587A'', color3: ''5B7FA6''}, 12452407);\n</script>\n</div>\n', 'Стандартный шаблон старшего модуля'),
(6657, '', 'news', '', 'Стандартный шаблон старшего модуля'),
(6713, 'Автомобильные новости', '', '<p>Услуги такси в Одессе пользуются активной популярностью. Приезжая в наш курортный, южный город, множество туристов и гостей города хотят воспользоваться услугами надёжной, доступной службы такси. Если Вы ищите партнёра для осуществление качественный <a href="http://allotaxi.od.ua/taxi-price">пассажирских или грузовых перевозок</a>, обращайтесь в службу Алло такси.</p>\n\n<p>На нашем сайте Вы можете получить всю необходимую информацию о тарифах, <a href="http://allotaxi.od.ua/taxi-contact-us">контактах</a> и услугах нашей службы. В разделе &laquo;новости&raquo; Вы можете получить всю свежую актуальную информацию о <a href="http://allotaxi.od.ua/">такси в Одессе</a>. Если Вы интересуетесь новинками в службах такси, на нашем сайте Вы всегда сможете получить полезную информацию о нововведениях, тарифах и ситуации на авторынке Украины. С нами Вы всегда будете в курсе всех новостей и изменений.</p>\n\n<p>В данном разделе только самая актуальная информация об изменениях <a href="http://allotaxi.od.ua/luchshie-tsenyi">цен</a> на бензин, новых законопроектах о <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозках</a>, новых мобильных услугах и многое другое. Если Вы находитесь в другом городе или впервые приехали в Одессу, и хотите ознакомиться с ситуацией на дорогах в городе и всех изменениях, заходите на сайт <a href="http://allotaxi.od.ua/taxi-about-us">Алло такси</a>. Обладая всей необходимой, актуальной информацией о современных тарифах и услугах такси, Вы сможете без труда получить качественное обслуживание и добраться в любую часть города в максимально короткие сроки.</p>\n', 'content2'),
(6671, 'Перевозки в Одессе', '', '<p>Компания &laquo;Алло такси&raquo; начала свою деятельность в 2012 году. На протяжении этого времени многие из наших клиентов, стали нашими постоянными заказчиками. Компания &laquo;Алло такси&raquo; предоставляет услуги пассажирских и грузовых перевозок в Одессе и за её пределами. Для того, чтобы <a href="http://allotaxi.od.ua/">заказать такси в Одессе</a>, звоните нам и компания &laquo;Алло такси&raquo; организует для Вас комфортную и быструю поездку.</p>\n\n<h2>Пассажирские перевозки в&nbsp;Одессе</h2>\n\n<p>Если Вам необходимо быстро и без лишних хлопот доехать в какую-либо точку города или за его пределы, предлагаем Вам услуги компании &laquo;Алло такси&raquo;. Наша компания зарекомендовала себя как лидер в сфере перевозок. Наша основная задача &ndash; это организация Вашего комфорта во время передвижения с помощью нашей службы такси. Пассажирские перевозки &ndash; одна из самых актуальных услуг в таких городах, как Одесса. Наша компания всегда оперативно примет Ваш заказ позаботится о своевременной доставке автомобиля. Благодаря большому автопарку, высокой квалификации наших специалистов и налаженному процессу работы компания &laquo;Алло такси&raquo; организовывает оперативные, комфортабельные <strong>пассажирские перевозки в&nbsp;Одессе</strong>. Мы предоставляем свои услуги как частным лицам, так и компаниям для осуществления перевозок по Одессе и в другие города.</p>\n\n<p>Сотрудники компании &laquo;Алло такси&raquo; составят наиболее удобный маршрут и оперативно свяжутся с Вами, когда автомобиль будет по адресу. Звоните нам и мы позаботимся о Вашем комфортном передвижении по городу. В число преимуществ нашей компании входит:</p>\n\n<ul>\n	<li>большой автопарк, в котором находятся автомобили разного типа и назначения;</li>\n	<li>приемлемые цены;</li>\n	<li>высококвалифицированный персонал, обладающий значительным опытом работы (все водители с опытом работы от 3 лет).</li>\n</ul>\n\n<div class="sly">\n<h2>Грузоперевозки в&nbsp;Одессе</h2>\n\n<p>Своим клиентам <a href="http://allotaxi.od.ua/taxi-about-us">компания &laquo;Алло такси&raquo;</a> предлагает грузоперевозки по Одессе. Мы поможем Вам осуществить перевозки груза в самые короткие сроки, с соблюдением всех требований к безопасности груза. Для осуществления перевозок такого типа мы предоставляем нашим клиентам автобусы и микроавтобусы, оснащённые всеми необходимыми современными инновациями, благодаря которым Ваше имущество будет правильно укомплектовано и доставлено в сохранности.</p>\n\n<p>Осуществляя грузоперевозки компания &laquo;Алло такси&raquo; гарантирует своим клиентам внимательное обслуживание, индивидуальный подход ко всем клиентам и бережное отношение к Вашему имуществу.</p>\n\n<p>Если Вас ожидает переезд, компания &laquo;Алло такси&raquo; избавит Вас от забот, связанных с перевозками мебели. Сотрудники нашей компании имеют квалификацию в сборе мебели. Заказывая у нас <strong>услугу грузоперевозки Одесса</strong> Вы можете полностью положиться на наших сотрудников, они возьмут на себя все этапы перевозки груза.</p>\n\n<p>Компания &laquo;Алло такси&raquo; обеспечивает грузоперевозки Одесса на высшем уровне, без ограничения по размеру груза. В нашем автопарке находятся грузовые автомобили, способные перевозить груз, весом до 5 тонн. В том случае, если Вы хотите сэкономить время при доставке товара в магазин или торговый центр, компания &laquo;Алло такси&raquo; будет рада помочь Вам!</p>\n\n<h3>&nbsp;</h3>\n\n<h3>Весь перечень услуг такси в Одессе &quot;Алло такси&quot;</h3>\n\n<ul>\n	<li>Такси Одесса недорого</li>\n	<li>Пассажирские перевозки Одесса</li>\n	<li>Перегон автомобиля Одесса и другие города</li>\n	<li>Грузовое такси Одесса</li>\n	<li>Проезд пассажиров</li>\n	<li>Предварительные заказы такси Одесса за сутки и более</li>\n	<li>Перевозки малогабаритных грузов</li>\n	<li>Перегон автотранспорта</li>\n	<li>Междугородние перевозки Одесса</li>\n	<li>Буксировка автомобилей</li>\n	<li>Доставка продуктов, лекарств</li>\n	<li>Заказы микроавтобусов</li>\n	<li>Встреча VIP клиентов, трансфер</li>\n	<li>Проезд пассажиров с животными</li>\n	<li>Грузовые перевозки Одесса</li>\n</ul>\n</div>\n', 'type'),
(6743, 'Перевозка грузов', '', '<p>Южная Пальмира всегда считалась торговым городом. Именно здесь проживают самые активные люди. Предприимчивость и энергичность одесситов реализуется в постоянных переездах. Жители Южной Пальмиры склонны к регулярным сменам места <a href="http://allotaxi.od.ua/taxi-work">работы</a> или жительства. В данном случае возникает потребность в перевозке. Организовать данную процедуру своими силами довольно сложно, особенно, если нет собственного автомобиля. Это становится причиной того, что растет популярность грузового такси. Грузовая перевозка &ndash; это уникальная возможность организовать процедуру загрузки и выгрузки в кратчайшие сроки.</p>\n\n<p>Компания Алло Taxi оказывает оперативную <a href="http://allotaxi.od.ua/taxi-price">перевозку груза по Одессе</a> и области. Мы гарантируем нашим клиентам сохранность и <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасность</a> их груза. Наши профессиональные водители доставят любой груз из пункта А в пункт Б быстро и выгодно. Заказать наше грузовое <a href="http://allotaxi.od.ua/">такси</a> можно по телефону или при помощи онлайн заявки. Квалифицированные диспетчеры быстро обработают Вашу заявку, а опытные водители ее выполнят. Партнерство с нашей компанией гарантирует быструю и качественную доставку. Мы предлагаем нашим клиентам <a href="http://allotaxi.od.ua/luchshie-tsenyi">выгодные цены</a> и профессиональные услуги. Для наших постоянных клиентов действуют гибкие системы скидок.</p>\n\n<p>Грузоперевозка представляет собой довольно активную процедуру, которая заключается в перемещении из одного места в другое разных по своим характеристикам грузов. Следует отметить, что грузы, которые подлежат перевозке могут быть разнообразными. Это необходимо учитывать при создании условий транспортировки. Любая разновидность грузов имеет свои уникальные особенности и условия хранения, что влияет на процесс перевозки. Оценив все характеристики товаров или материалов, которые участвуют в транспортировке, можно выбирать способ их доставки до места назначения. Сегодня наиболее популярным способом доставить груз остается автомобильная доставка. Немаловажное преимущество данной перевозки заключается в том, что она экономит время и денежные средства заказчика. Подобный вид перевозки груза позволяет контролировать его в процессе доставки.</p>\n\n<p>Наша компания Алло Taxi занимается доставкой любых грузов. Мы сможем обеспечить быструю и своевременную перевозку. Наши профессиональные водители обладает колоссальным опытом в организации именно грузовых перевозок. Мы гарантируем высоко качество, надёжность и безопасность.</p>\n', 'type'),
(6745, 'Скорость и безопасность', '', '<p>Сегодня без такси многие не смогут представить жизни большого города. Ведь именно такси приходит на помощь когда надо быстро и оперативно решить задачу с перемещением и в кратчайшие сроки добраться до нужного места.</p>\n\n<p>Такси поможет существенно сэкономить время и вселит уверенность в том, что вы вовремя доберетесь до назначенного места.</p>\n\n<p>Жизнь в Одессе &ndash; крупном, курортном мегаполисе &ndash; движется в сумасшедшем ритме. Для активных и занятых людей каждая минута на счету. Рациональное распределение времени играет очень важную роль, так как от него отчасти зависит продуктивность человека. Мало кому захочется понапрасну тратить столь <a href="http://allotaxi.od.ua/luchshie-tsenyi">ценные</a> минуты на передвижение по городу, стоять в длинных пробках, особенно в часы пик, а также подолгу ждать нужную маршрутку до края забитую людьми, движущуюся далеко не в самом быстром темпе.</p>\n\n<p>Конечно, если у вас есть машина, то часть транспортных проблем просто исчезает, но и&nbsp; владельцы <a href="http://allotaxi.od.ua/peregon-avto">авто</a> прибегают к услугам такси. Ведь свой излюбленный автомобиль не хочется изнашивать лишний раз, когда есть возможность за те же деньги, а часто еще и дешевле с комфортом прокатиться на такси.</p>\n\n<p>В такси работают только опытные и профессиональные&nbsp; <a href="http://allotaxi.od.ua/taxi-work">водители</a>. Они досконально знают город и всегда выбирают самые короткие маршруты. Благодаря этому вы сможете в кратчайшие сроки добраться с одной точки города либо&nbsp; его окрестностей в другую, иногда совершенно противоположную. Это одно из самых главным преимуществ.</p>\n\n<p>Такси &ndash; очень распространённая сервис и в Одессе есть большое число компаний, которые предоставляют данную услугу. Кроме того, по улицам города&nbsp; ездят автомобили, не прикрепленные ни к одной службе такси, занимающиеся <a href="http://allotaxi.od.ua/taxi-price">пассажирскими перевозками</a>. Нередко люди в спешке пытаются на улице &laquo;поймать&raquo; такое такси, но это очень ненадежная затея, потому что она равна игре в рулетку и вы не знаете кто вызовется вас подвести.</p>\n\n<p>Лучшим вариантом будет выбрать проверенную службу, которой не страшно будет доверить свою безопасность и пунктуальность.</p>\n\n<p>Алло такси &ndash; надежная сервисная организация, работа которой базируется на оперативности и качестве. Мы гарантируем наличие свободного <a href="http://allotaxi.od.ua">такси</a> в каждой точке города в любое время дня и ночи. Работа диспетчеров отличается грамотностью, быстротой обработки заказа и слаженностью. В нашем такси вам быстро предоставят машину и еще быстрее довезут куда угодно. Высококвалифицированные водители, а также соответствующие всем техническим стандартам и нормам автомобили, которые регулярно тестируются на СТО, гарантируют безопасность транспортировки пассажиров. Мы занимаемся тщательным подбором кадров, чтобы наши клиенты чувствовали себя комфортно и были уверенны в нашем ответственном отношении к исполняемым обязанностям.</p>\n\n<p>Прибегнув к услугам Алло такси единожды, вы сможете оценить уровень сервиса, а также быстроту и безопасность транспортировки, после чего забудете, что в Одессе есть другие службы такси.</p>\n', 'type'),
(6746, 'Перегон авто', '', '<p>Такси &ndash; обязательная составляющая современной жизни. У большинства служба такси ассоциируется только с <a href="http://allotaxi.od.ua/taxi-price">пассажирскими перевозками</a>. Но на деле, в опытных и крупных компаниях спектр гораздо шире. Одной из таких малоизвестных, но набирающей популярность услуг является перегон авто.</p>\n\n<p>На первый взгляд может показаться, что перегон авто невостребованный и поэтому ненужный. На деле есть масса причин, которые способствуют тому, что люди прибегают к этому.</p>\n\n<p>Самым распространённым случаем, когда заказывают перегон авто является употребление алкоголя собственником машины. В данной ситуации &laquo;перегон авто&raquo; еще называют &laquo;пьяный/трезвый водитель&raquo;. Сейчас санкции за вождение в нетрезвом виде довольно жёсткие, тем более состояние, которое вызывает алкоголь, делает невозможным вождение и ставит под угрозу безопасность непосредственно водителя, пешеходов и собственников других авто. Прибегнуть к перегону авто в подобных случаях необходимо обязательно. Выпить за рулем, это не смертельный грех, ведь у всех бывали ситуации, когда они сами того не ожидая оказывались на банкете или на вечеринке с друзьями. Заказав перегон авто, вы можете не беспокоиться о безопасном возвращении домой и вам не придется оставлять авто без присмотра. Воспользовавшись данной услугой, клиент может не ограничивать себя в развлечениях.</p>\n\n<p>Есть кучу поводов заказать перегон авто. Во-первых, такая потребность возникает, когда заболел водитель, а вам срочно нужен автомобиль в определенное время и место. Во-вторых, если вы только купили авто и вам необходимо пригнать его домой, а у вас нету достаточно водительского опыта и вы боитесь самостоятельно ездить в большом городе по пробкам в большом потоке машин. В-третьих, когда надо перегнать авто в соседний регион, а вы плохо ориентируетесь в местности и к тому же у вас нет свободного времени этим заниматься.</p>\n\n<p>Алло <a href="http://allotaxi.od.ua/">такси</a> уже много лет оказывает услуги по перегону авто по Одессе и других регионах. Главным преимуществом нашей службы является бережное и ответственное отношение к вашему транспортному средству, доставка авто в указанное место в оговоренное время. Мы гарантируем высококачественный сервис, а также индивидуальный подход к потребностям и пожеланиям каждого клиента.</p>\n\n<p>У нас работают только профессиональные <a href="http://allotaxi.od.ua/taxi-work">водители</a>, у которых многолетний опыт вождения авто и безупречная водительская репутация. Мы очень тщательно проверяем каждого потенциального работника, потому что заботимся о своем авторитете и дорожим доверием наших клиентов.</p>\n\n<p>Еще одним нашим плюсом есть быстрота обработки и выполнения заказа, а также весьма простая и демократическая система расчёта, которая зависит от километража и прочих факторов.</p>\n\n<p>С Алло такси проблема перегона авто будет решена качественно, ответственно и оперативно.</p>\n', 'type');
INSERT INTO `type_block` (`type_block_id`, `type_block_name`, `type_block_action`, `type_block_content`, `type_block_template`) VALUES
(6747, 'Лучшие цены', '', '<p>Служба заказа &laquo;Алло такси&raquo; на сегодняшний день является лучшей службой на территории Одессы, которая предлагает пассажирские и грузовые перевозки, поездки по городу и за его пределами. Наша служба предлагает лучшие цены на <a href="http://allotaxi.od.ua/">такси в Одессе</a>. За время своего существования мы собрали молодую и энергичную команду, которая оказывает безопасные и быстрые пассажирские перевозки по всей территории Южной Пальмиры. Мы уделяем много времени подбору персонала. Все наши водители обладают высокими профессиональными навыками, стаж их вождения превышает три года. Мы предлагаем нашим клиентам комфортные условия, а такси цены соответствуют высокому качеству.</p>\n\n<p>В современных экономических условиях все больше одесситов и гостей нашего южного города выбирают именно такси. Данное средство передвижения намного комфортабельнее, быстрее, уютнее и безопаснее, чем общественный транспорт. Эксперты отмечают, что на данный момент стоимость такси в Одессе довольно демократичная. Именно это и является основной причиной того, что большинство украинцев и туристов выбирают именно такси для своих поездок. Сегодня такси может быть не только удобным, но даже экономным. Компания &laquo;Алло такси&raquo; предлагает выгодные цены и демократический подход. Наши постоянные клиенты могут рассчитывать на специальные акции и выгодные предложения.</p>\n\n<p>Мы делаем все, чтобы Ваша поездка была комфортной и выгодной. Успешность нашей службы заказов зависит от множества факторов: высокое качество оказываемых услуг, профессиональный подход, быстрая и безопасная перевозка, квалифицированные водители, демократичная и адекватная стоимость, современный автопарк. На нашем сайте каждый может ознакомиться с актуальными ценами. В соответствующем разделе сайта представлена цена такси в Одессе.&nbsp;</p>\n\n<p>Наш автопарк соответствует всем современным техническим нормам. Мы используем только современные и просторные автомобили, которые оснащены кондиционерами. Наши водители обладают большим опытом в оказании пассажирских перевозок. Мы внимательно подходим к подбору персонала. Большое внимание уделяем тому, чтобы наши водители владели английским языком, отлично знали город. Владение иностранным языком &nbsp;связано с тем, что нашу Жемчужину у моря посещают не только русскоговорящие туристы. Мы стараемся, чтобы в Одессе было комфортно каждому. Вежливые и обходительные операторы примут Ваш заказ и, если Вас интересует такси Одесса цена, то они с радостью ознакомят Вас с ней. Наши профессиональные водители оперативно его выполнят, подберут наиболее удобный и быстрый маршрут. Заказать такси у нас можно с помощью телефона или онлайн заявки. Время ожидания автомобиля может составить от 10 до 15 минут. Сотрудничество с &laquo;Алло такси&raquo; &ndash; это оперативное обслуживание, лучшие цены, комфортные условия и безопасность. Основное кредо нашей компании &ndash; это безопасная перевозка наших клиентов на выгодных условиях.</p>\n\n<p>Виды оплаты - наличный и безналичный расчет.</p>\n\n<p>Участие в выгодной бонусной программе с первого звонка!</p>\n', 'type'),
(6788, '', 'lastnews', '', 'Стандартный шаблон старшего модуля'),
(6796, '', 'lastvacancies', '', 'Стандартный шаблон старшего модуля'),
(6802, '', 'onevacancy', '', 'Стандартный шаблон старшего модуля'),
(6803, 'Работа водителем в Одессе', '', '<p style="line-height: 20.8px;"><img alt="Работа в такси Одесса" src="/upload/imgimages/taxi.png" style="height: 200px; width: 300px; float: left; margin: 10px;" /></p>\n\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">Компания &laquo;Алло такси&raquo; объявляет набор на работу водителей с личным авто и диспетчеров для выполнения заказов.&nbsp;</span></span></p>\n\n<p style="line-height: 20.8px;">&nbsp;</p>\n\n<p style="line-height: 20.8px;"><span style="font-size: 20px;">Для записи на собеседование звоните:</span></p>\n\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 048-733-5000</span></span></p>\n\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 093-638-3386</span></span></p>\n\n<p style="line-height: 20.8px;"><span style="font-size: 18px;">Контактное лицо:&nbsp;<strong>Владимир Васильевич</strong></span></p>\n\n<p style="line-height: 20.8px;">&nbsp;</p>\n\n<p style="line-height: 20.8px;">&nbsp;</p>\n\n<p style="line-height: 20.8px;"><strong style="line-height: 1.6em;">Требования к водителям:</strong></p>\n\n<ul style="line-height: 20.8px;">\n	<li>Наличие собственного автомобиля в хорошем состоянии</li>\n	<li>Уверенный и аккуратный стиль вождения&nbsp;</li>\n	<li>Водительский стаж и знание правил дорожного движения</li>\n	<li>Умение ориентироваться по городу либо отдельным районам</li>\n	<li>Ответственное отношение к работе&nbsp;</li>\n	<li>Пунктуальность</li>\n	<li>Умение работать с людьми, культура общения, вежливость</li>\n	<li>Желание работать и зарабатывать</li>\n</ul>\n\n<p style="line-height: 20.8px;"><strong>Компания &laquo;Алло такси&raquo; предлагает:</strong></p>\n\n<ul style="line-height: 20.8px;">\n	<li>Возможность совмещать работу с основным видом деятельности</li>\n	<li>Согласованный, удобный график</li>\n	<li>Выгодные тарифы</li>\n	<li>Возможность самостоятельно выбирать район города</li>\n	<li>Большое количество заказов и их рациональное распределение</li>\n	<li>Роботу через диспетчерскую службу с вежливыми и внимательными операторами</li>\n	<li>Стабильный и высокий доход</li>\n</ul>\n\n<p style="line-height: 20.8px;">&nbsp;</p>\n\n<h2>Вакансия диспетчер в службу вызова такси</h2>\n\n<p style="line-height: 20.8px;">&laquo;Алло&nbsp;такси&raquo; приглашает на работу диспетчеров со знанием города, желательно с опытом работы в службе такси и желанием учиться, которые обладают грамотной речью и четкой дикцией, способны оперативно принимать и обрабатывать заказы, давать четкие установки водителям и контролировать их работу.<br />\nМы ищем коммуникабельных, организованных, ответственных работников и предлагаем им выгодные условия труда, комфортный офис, дружный коллектив и достойную зарплату.&nbsp;</p>\n\n<p style="line-height: 20.8px;">Компания &laquo;Алло такси&raquo; дает реальную возможность повысить свой доход, &nbsp;работать в приятных условиях и по удобному графику.</p>\n\n<p style="line-height: 20.8px;">&nbsp;</p>\n\n<p style="line-height: 20.8px;"><span style="line-height: 1.6em;">Компания &laquo;Алло такси&raquo; предлагает работу водителям в нашей&nbsp;</span>службе такси<span style="line-height: 1.6em;">. Если Вас интересует работа водителем в Одессе, обращайтесь к нам прямо сейчас. На сегодняшний день наша компания продолжает стремительно развиваться и расти. Наш автопарк ежемесячно пополняется новыми автомобилями. Мы приглашаем на&nbsp;</span><span style="line-height: 1.6em;">работу водителем Одесса&nbsp;</span><span style="line-height: 1.6em;">всех, у кого есть собственный автомобиль, стаж вождения не меньше 3 лет. Кто заинтересовался работой в нашей службе такси, на постоянной или временной основе, звоните нам. Если Вы цените своё время и умело им распоряжаетесь, мы ждём Вас.&nbsp;Вакансии водителя в Одессе вы можете просмотреть на нашем сайте.</span></p>\n\n<p style="line-height: 20.8px;"><span class="hidd" style="float: right;">Читать полностью</span></p>\n\n<div class="sly" style="line-height: 20.8px;">\n<p>&laquo;Алло такси&raquo; - это компания, которая предлагает своим водителям выбирать район, в котором они будут работать. Работа в Одессе водителем в нашей компании &ndash; это выгодные условия сотрудничества. Наша компания предлагает работу в Одессе водителем по самым выгодным условиям:</p>\n\n<ul>\n	<li>удобный график;</li>\n	<li>удаленная работа, без необходимости регулярно посещать офис;</li>\n	<li>работа с помощью программы на мобильном&nbsp;<a href="http://allotaxi.od.ua/taxi-contact-us">телефоне</a>.</li>\n</ul>\n\n<p>Мы приглашаем к сотрудничеству ответственных, порядочных и пунктуальных людей, которые ценят своё время.&nbsp;<strong>Работа в Одессе водитель со своим авто&nbsp;</strong>&ndash; одна из самых востребованных вакансий в нашей службе&nbsp;<a href="http://allotaxi.od.ua/">такси</a>. Со своей стороны мы предоставляем нашим водителям заказы, не затратим лишнее время на процесс трудоустройства и предложим Вам удобный график работы<strong>.&nbsp;</strong>Работа водителем в Одессе в &laquo;Алло такси&raquo; займёт ровно столько времени, сколько Вы рассчитываете. Если у Вас есть в наличии собственный автомобиль и хороший стаж вождения, добро пожаловать в нашу службу такси! Мы с радостью примем Вас как на постоянную работу, так и на дополнительную.</p>\n\n<p>Каждый водитель, работающий в нашей службе такси, будет обеспечен необходимой для получения заказов техникой. Система GPS позволяет установить местоположение автомобиля и предоставить Вам заказ по тому адресу, который будет расположен ближе всего к Вашему месту пребывания. Такая система распределения заказов позволяет нам максимально экономить время и бензин. Работа водителем Одесса в компании &laquo;Алло такси&raquo; - это всегда самые выгодные и приятные условия. В случае необходимости наши диспетчеры соединяют клиентов с водителями.</p>\n\n<p>Качество выполнения заказа,&nbsp;<a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасность</a>&nbsp;пассажиров, количество выполненных заказов влияют на общий успех компании, поэтому мы заботимся о том, чтобы в нашей компании работали ответственные профессионалы. Мы позаботимся о том, чтоб Ваш автомобиль проходил регулярный технический осмотр. Один из главных принципов компании &laquo;Алло такси&raquo; - клиент всегда прав, поэтому мы внимательно следим за тем, чтобы все наши сотрудники обслуживали клиентов на самом высоком уровне. Работа водителем в Одессе &ndash; это большая ответственность при поездках, поэтому интересы всех водителей мы всегда учитываем в организации рабочего процесса нашей компании.</p>\n\n<h2>Преимущества работы водителем Одесса</h2>\n\n<p>В работе водителем Одесса есть множество преимуществ. В первую очередь, это свободный график работы, а также организация рабочего процесса с учетом интересов водителя и выгодные условия сотрудничества в целом. С нами Вы имеете постоянный источник дохода при удобных условиях работы.</p>\n</div>\n', 'content2'),
(6752, '', 'article', '', 'Стандартный шаблон старшего модуля'),
(6774, 'Бонусы и скидки', '', '<p><img alt="Акции и бонусы от Алло Такси Одесса" src="/upload/imgimages/bonus.jpg" style="width: 250px; height: 150px; margin: 10px; float: left;" />У каждого из нас слова &laquo;скидка, акция, распродажа&raquo; вызывают улыбку и радость. Ведь какой-бы ни была экономия &ndash; она всегда приятная. Особенно радостно получать скидки регулярно, пользуясь одним и тем же сервисом или услугой, например бесплатный маникюр от любимого мастера или подарочную мойку автомобиля на автомойке, где вы являетесь постоянным клиентом.</p>\n\n<p>Служба Алло такси уже несколько лет успешно функционирует в Одессе и предоставляет широкий спектр <a href="http://allotaxi.od.ua/taxi-price">услуг по перевозке</a>. Алло такси, как профессиональная <a href="http://allotaxi.od.ua">служба такси в Одессе</a>, очень ценит постоянных клиентов, поэтому помимо качественного обслуживания и оперативной транспортировки по всему городу, радо сообщает о приятных скидках.</p>\n\n<p>Теперь наши пассажиры на каждой десяток поездке будут экономить 10% от общей ее стоимости. Не важно, планируете вы проехаться из центра города на Фонтан либо вам необходимо доехать с поселка Котовского на Таирова, скидка будет действовать независимо от <a href="http://allotaxi.od.ua/luchshie-tsenyi">цены</a> и расстояния.</p>\n\n<p>Во время поездки вы сможете оценить уровень комфорта транспорта и самой поездки, профессионализм наших <a href="http://allotaxi.od.ua/taxi-work">водителей</a> и их знание города, а также оперативность работы всей службы и время перевозки из одной точки в другую.</p>\n\n<p>Служба Алло такси заботиться о своих клиентах и пытается сделать каждую поездку максимально удобной, приятной и выгодной.</p>\n', 'type'),
(6776, 'Безналичный расчет', '', '<p><img alt="безналичный расчёт за такси в Одессе" src="/upload/imgimages/beznal.jpg" style="width: 250px; height: 174px; margin: 10px; float: left;" />Сегодня абсолютно все <a href="http://allotaxi.od.ua/taxi-about-us">компании</a>, которые занимаются предоставлением услуг, стараются максимально упростить жизнь своим клиентам. Из-за высокой конкуренции на рынке приходится все время придумывать разнообразные способы сохранения постоянных клиентов и привлечения новых.</p>\n\n<p>Компьютеризация общества привела к популярности безналичного расчета. Его сейчас можно встретить в магазинах, аптеках, салонах красоты, кафе и других местах. В последнее время данная тенденция распространилась и на рынок такси услуг.</p>\n\n<p><a href="http://allotaxi.od.ua">Такси в Одессе</a> &ndash; важная составляющая жизни города, ведь большой современный мегаполис не может существовать без служб такси. <a href="http://allotaxi.od.ua/taxi-work">Водитель такси в Одессе</a> &ndash; отдельная каста, особый слой общества, который сочетает в себе неповторимую одесскую натуру с ее колоритным темпераментом и юмором, лучшего гида и первоклассного знатока города. Они предоставляют самые разнообразные услуги, ежедневно совершая <a href="http://allotaxi.od.ua/taxi-price">пассажирские перевозки</a>, грузовые, <a href="http://allotaxi.od.ua/peregon-avto">перегоны автомобилей</a> и многое другое.</p>\n\n<p>Стараясь работать оперативно и продуктивно, а также создать максимальный уровень удобств своим пассажирам, компания Алло такси расширила свои возможности и учла интересы своих клиентов, которые теперь могут оплачивать свои поездки по безналичному расчету.</p>\n\n<p>Компания приложила все усилия для разработки удобных и прозрачных условий при желании безналичного расчета на договорной основе, установив заманчивые тарифы и привлекательные <a href="http://allotaxi.od.ua/luchshie-tsenyi">цены на такси в Одессе</a>.</p>\n\n<p>Данная услуга лучше всего подойдет крупным компаниям для частных перевозок своих сотрудников или партнеров, значительно упростив оформление и ведение необходимой документации, а также существенно сэкономив денежные средства.</p>\n\n<p>Мы оперативно примем заказ и предоставим вам машину в любое время в любую точку города, а наши опытные и компетентные водители быстро и качественно доставят вас в нужное место.</p>\n', 'type'),
(6692, '', '', '<div class="span9" id="content"><!-- Begin Content -->\n<div class="item-page">\n<div class="page-header">\n<h1>&nbsp;</h1>\n</div>\n</div>\n\n<div id="breadcrumb">\n<div class="custom">\n<p>&nbsp;</p>\n</div>\n</div>\n<!-- End Content --></div>\n', 'content'),
(6784, '', 'main', '', 'Стандартный шаблон старшего модуля'),
(6786, '', 'price', '', 'Стандартный шаблон старшего модуля');

-- --------------------------------------------------------

--
-- Структура таблицы `type_blockcatalog`
--

CREATE TABLE IF NOT EXISTS `type_blockcatalog` (
  `type_blockcatalog_id` int(10) unsigned NOT NULL,
  `type_blockcatalog_pid` int(10) unsigned NOT NULL,
  `type_blockcatalog_name` varchar(500) NOT NULL,
  `type_blockcatalog_catalog` varchar(500) NOT NULL,
  `type_blockcatalog_desc` text NOT NULL,
  `type_blockcatalog_types` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_blockform`
--

CREATE TABLE IF NOT EXISTS `type_blockform` (
  `type_blockform_id` int(10) unsigned NOT NULL,
  `type_blockform_form_title` varchar(500) NOT NULL,
  `type_blockform_client_form` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_blog`
--

CREATE TABLE IF NOT EXISTS `type_blog` (
  `type_blog_id` int(10) unsigned NOT NULL,
  `type_blog_pid` int(10) unsigned NOT NULL,
  `type_blog_title` varchar(500) NOT NULL,
  `type_blog_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_blog_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_blogtag`
--

CREATE TABLE IF NOT EXISTS `type_blogtag` (
  `type_blogtag_id` int(10) unsigned NOT NULL,
  `type_blogtag_pid` int(10) unsigned NOT NULL,
  `type_blogtag_name` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_catalog`
--

CREATE TABLE IF NOT EXISTS `type_catalog` (
  `type_catalog_id` int(10) unsigned NOT NULL,
  `type_catalog_pid` int(10) unsigned NOT NULL,
  `type_catalog_name` varchar(500) NOT NULL,
  `type_catalog_catalog` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_clientform`
--

CREATE TABLE IF NOT EXISTS `type_clientform` (
  `type_clientform_id` int(10) unsigned NOT NULL,
  `type_clientform_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_clientform`
--

INSERT INTO `type_clientform` (`type_clientform_id`, `type_clientform_content`) VALUES
(222, '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_filter`
--

CREATE TABLE IF NOT EXISTS `type_filter` (
  `type_filter_id` int(10) unsigned NOT NULL,
  `type_filter_pid` int(10) unsigned NOT NULL,
  `type_filter_types` varchar(255) NOT NULL,
  `type_filter_group` varchar(255) NOT NULL,
  `type_filter_condition` varchar(500) NOT NULL,
  `type_filter_header1` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_filter`
--

INSERT INTO `type_filter` (`type_filter_id`, `type_filter_pid`, `type_filter_types`, `type_filter_group`, `type_filter_condition`, `type_filter_header1`) VALUES
(537, 0, 'shina,disc', ' {"shina":"manufacturer" , "disc": "manufacturer"}', '', ''),
(560, 0, 'shina', ' {"shina":"manufacturer"}', '', ''),
(564, 0, 'disc', ' {"disc": "manufacturer"}', '', ''),
(568, 0, 'shina', ' {"shina":"manufacturer"}', '', ''),
(583, 0, 'disc', ' { "disc": "manufacturer"}', '', ''),
(3156, 0, 'articles', '{"articles":"id"}', '', 'Полезная информация');

-- --------------------------------------------------------

--
-- Структура таблицы `type_folder`
--

CREATE TABLE IF NOT EXISTS `type_folder` (
  `type_folder_id` int(11) NOT NULL,
  `type_folder_title` varchar(500) NOT NULL,
  `type_folder_mkeys` varchar(500) NOT NULL,
  `type_folder_mdesc` text NOT NULL,
  `type_folder_aaccess` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_folder`
--

INSERT INTO `type_folder` (`type_folder_id`, `type_folder_title`, `type_folder_mkeys`, `type_folder_mdesc`, `type_folder_aaccess`) VALUES
(105, '', '', '', ''),
(106, '', '', '', ''),
(107, '', '', '', ''),
(109, '', '', '', ''),
(111, '', '', '', ''),
(2429, '', '', '', ''),
(147, '', '', '', ''),
(149, '', '', '', ''),
(151, '', '', '', ''),
(561, '', '', '', ''),
(184, '', '', '', ''),
(187, 'О нас', 'о, нас', 'О нас', ''),
(188, '', '', '', ''),
(200, 'Контакты', '', '', ''),
(225, '', '', '', ''),
(226, '', '', '', ''),
(227, '', '', '', ''),
(228, '', '', '', ''),
(231, 'авыа', 'ываыва', 'ываыва', 'on'),
(236, '', '', '', ''),
(261, '', '', '', ''),
(299, '', '', '', ''),
(557, '', '', '', ''),
(556, '', '', '', ''),
(512, '', '', '', ''),
(538, '', '', '', ''),
(449, '', '', '', ''),
(7, '', '', '', ''),
(513, '', '', '', ''),
(514, '', '', '', ''),
(528, '', '', '', ''),
(565, '', '', '', ''),
(569, '', '', '', ''),
(579, '', '', '', ''),
(575, '', '', '', ''),
(576, '', '', '', ''),
(580, '', '', '', ''),
(584, '', '', '', ''),
(3212, '', '', '', ''),
(2736, '', '', '', ''),
(6787, '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_form`
--

CREATE TABLE IF NOT EXISTS `type_form` (
  `type_form_id` int(11) NOT NULL,
  `type_form_title` varchar(500) NOT NULL,
  `type_form_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_form`
--

INSERT INTO `type_form` (`type_form_id`, `type_form_title`, `type_form_content`) VALUES
(8, 'Форма добавления типа', 'a:1:{s:14:"form_structure";s:3628:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a...","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","id":"type_desc","class":"b-field","name":"type_desc","table":"types","field":"type_desc","default":"","filter":""},"vlds":["requred"]},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u0438\\u043f\\u0430... [a-z]","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"type_name","class":"b-field","name":"type_name","table":"types","field":"type_name","default":"","filter":""},"vlds":["requred","regexp"]},{"type":"select","values":{"label":"\\u0420\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c\\u0441\\u043a\\u0438\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u044b","id":"type_parent_elements","class":"b-select multiple","name":"type_parent_elements","method":"loadAllTypes"},"multiple":"undefined","options":{"1":{"value":"all","baseline":"undefined"},"2":{"value":"none","baseline":"undefined"},"3":{"value":"folder","baseline":"undefined"},"4":{"value":"site","baseline":"undefined"},"5":{"value":"page","baseline":"undefined"},"6":{"value":"form","baseline":"undefined"}}},{"type":"select","values":{"label":"\\u0414\\u043e\\u0447\\u0435\\u0440\\u043d\\u0438\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u044b","id":"type_children_elements","class":"b-select multiple","name":"type_children_elements","method":"loadAllTypes"},"multiple":"undefined","options":{"1":{"value":"all","baseline":"undefined"},"2":{"value":"none","baseline":"undefined"},"3":{"value":"folder","baseline":"undefined"},"4":{"value":"site","baseline":"undefined"},"5":{"value":"page","baseline":"undefined"},"6":{"value":"form","baseline":"undefined"}}},{"type":"file","values":{"label":"\\u0418\\u043a\\u043e\\u043d\\u043a\\u0430","id":"icon","class":"b-file","name":"icon","table":"","field":"","default":"","filter":"","multiupload":""}},{"type":"checkbox","values":{"label":"HMVC","id":"ck-hmvc","class":"ck-hmvc","name":"ck_hmvc"},"options":{"1":{"value":"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u043c\\u043e\\u0434\\u0443\\u043b\\u044c HMVC \\u0434\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u0442\\u0438\\u043f\\u0430","baseline":"undefined"}}},{"type":"radio","values":{"label":"\\u0421\\u0443\\u043f\\u0435\\u0440\\u0442\\u0438\\u043f","id":"stype","class":"stype","name":"stype"},"options":{"1":{"value":"\\u041e\\u0431\\u044b\\u0447\\u043d\\u044b\\u0439","baseline":"checked"},"2":{"value":"\\u041f\\u0443\\u0441\\u0442\\u044b\\u0448\\u043a\\u0430 (\\u043d\\u0435 \\u0431\\u0443\\u0434\\u0443\\u0442 \\u0441\\u043e\\u0437\\u0434\\u0430\\u0432\\u0430\\u0442\\u0441\\u044f \\u0438\\u043d\\u0442\\u0435\\u043c\\u044b \\u0434\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u0442\\u0438\\u043f\\u0430)","baseline":"undefined"},"3":{"value":"\\u0425\\u043e\\u043b\\u0434\\u0435\\u0440 (\\u0441\\u0430\\u043c \\u0432 \\u0441\\u0435\\u0431\\u0435 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u0442 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u043e \\u0438\\u0442\\u0435\\u043c\\u043e\\u0432 \\u043e\\u0434\\u043d\\u043e\\u0433\\u043e \\u0442\\u0438\\u043f\\u0430)","baseline":"undefined"}}},{"type":"formbuilder","values":{"label":"\\u041f\\u043e\\u043b\\u044f","name":"type_fields"}},{"type":"submit","values":{"label":"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c","id":"add_button","class":"b-button greyishBtn submitForm add_type_button","name":"add_button"}},{"type":"reset","values":{"label":"\\u041e\\u0447\\u0438\\u0441\\u0442\\u0438\\u0442\\u044c","id":"clear","class":"b-button greyishBtn submitForm","name":"clear"}}]";}'),
(9, 'Форма редактирования типа', 'a:1:{s:14:"form_structure";s:1256:"[{"type":"select","values":{"label":"\\u0422\\u0438\\u043f \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430","id":"tree_type","class":"b-select","name":"tree_type","method":"loadTypes"},"vlds":["requred"],"multiple":"undefined","options":{"1":{"value":"","baseline":"undefined"}}},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430...","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","id":"tree_title","class":"b-field","name":"tree_title","table":"tree","field":"tree_title","default":"","filter":""},"vlds":["requred"]},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430... [a-z0-9-]","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"tree_name","class":"b-field","name":"tree_name","table":"tree","field":"tree_name","default":"","filter":""},"vlds":["requred"]},{"type":"submit","values":{"label":"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c","id":"add_button","class":"b-button greyishBtn submitForm add_node_button","name":"add_button"}}]";}'),
(10, '', 'a:1:{s:14:"form_structure";s:896:"[{"type":"input_text","values":{"placeholder":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430...","label":"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a","id":"node_name","class":"b-field","name":"tree_title","table":"tree","field":"tree_title","default":"","filter":""},"vlds":["requred"]},{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u0430...","label":"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435","id":"tree_name","class":"b-field","name":"tree_name","table":"tree","field":"tree_name","default":"","filter":""}},{"type":"submit","values":{"label":"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c","id":"update-button","class":"b-button greyishBtn submitForm","name":"update_button"}}]";}'),
(90, '', 'a:1:{s:14:"form_structure";s:810:"[{"type":"input_text","values":{"placeholder":"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u043a\\u0440\\u0430\\u0442\\u043a\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435...","label":"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435","id":"type_desc","class":"b-field","name":"type_desc","table":"types","field":"type_desc","default":"","filter":""},"vlds":["requred"]},{"type":"formbuilder","values":{"label":"\\u041f\\u043e\\u043b\\u044f","name":"type_fields"}},{"type":"submit","values":{"label":"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c","id":"add_button","class":"b-button greyishBtn submitForm add_type_button","name":"add_button"}},{"type":"reset","values":{"label":"\\u041e\\u0447\\u0438\\u0441\\u0442\\u0438\\u0442\\u044c","id":"clear","class":"b-button greyishBtn submitForm","name":"clear"}}]";}'),
(144, '', ''),
(110, '', ''),
(232, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_image`
--

CREATE TABLE IF NOT EXISTS `type_image` (
  `type_image_id` int(10) unsigned NOT NULL,
  `type_image_name` varchar(500) NOT NULL,
  `type_image_image` varchar(500) NOT NULL,
  `type_image_desc` text NOT NULL,
  `type_image_link` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_image`
--

INSERT INTO `type_image` (`type_image_id`, `type_image_name`, `type_image_image`, `type_image_desc`, `type_image_link`) VALUES
(189, 'Египет', '2074b295b94f3f1d998de2f7648e9e92.png', '<strong>Египет - страна пирамид и коралловых рифов</strong><br />За окном +30', ''),
(190, 'shina', '4d0f66e9456fd594067fbbaee96439e8.png', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_link`
--

CREATE TABLE IF NOT EXISTS `type_link` (
  `type_link_id` int(10) unsigned NOT NULL,
  `type_link_description` varchar(500) NOT NULL,
  `type_link_address` varchar(500) NOT NULL,
  `type_link_content` varchar(500) NOT NULL,
  `type_link_class` varchar(500) NOT NULL,
  `type_link_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_list`
--

CREATE TABLE IF NOT EXISTS `type_list` (
  `type_list_id` int(10) unsigned NOT NULL,
  `type_list_pid` int(10) unsigned NOT NULL,
  `type_list_types` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_list`
--

INSERT INTO `type_list` (`type_list_id`, `type_list_pid`, `type_list_types`) VALUES
(637, 0, 'shinadiametr'),
(768, 0, 'page,cpage,list,folder'),
(704, 0, ''),
(3167, 0, 'block,blockform,alias,submenublock,blockcatalog,gallery'),
(6654, 0, 'news'),
(6698, 0, 'block'),
(6748, 0, 'articles'),
(6750, 0, 'page'),
(6797, 0, 'vacancy');

-- --------------------------------------------------------

--
-- Структура таблицы `type_menulink`
--

CREATE TABLE IF NOT EXISTS `type_menulink` (
  `type_menulink_id` int(10) unsigned NOT NULL,
  `type_menulink_pid` int(10) unsigned NOT NULL,
  `type_menulink_name` varchar(500) NOT NULL,
  `type_menulink_reslink` varchar(500) NOT NULL,
  `type_menulink_hide` varchar(500) NOT NULL,
  `type_menulink_keywords` varchar(500) NOT NULL,
  `type_menulink_title` varchar(500) NOT NULL,
  `type_menulink_description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_news`
--

CREATE TABLE IF NOT EXISTS `type_news` (
  `type_news_id` int(10) unsigned NOT NULL,
  `type_news_pid` int(10) unsigned NOT NULL,
  `type_news_content` text NOT NULL,
  `type_news_header` varchar(255) NOT NULL,
  `type_news_img` varchar(500) NOT NULL,
  `type_news_date` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `type_news`
--

INSERT INTO `type_news` (`type_news_id`, `type_news_pid`, `type_news_content`, `type_news_header`, `type_news_img`, `type_news_date`) VALUES
(6711, 0, '<p>Как отмечают эксперты, в Одессе и во всей Украине бензин может очень скоро подорожать. Подорожание ожидается в первой декаде августа. Отмечается, что <a href="http://allotaxi.od.ua/luchshie-tsenyi">цена</a> на бензин может повыситься на 25- 30 копеек за&nbsp; 1 литр топлива. Такие данные предоставил начальник отдела топливно-энергетического рынка ГП &laquo;Держзовнишинформ&raquo; Олег Мельник.</p>\r\n\r\n<p>Сотрудники данного отдела прогнозируют, что подорожание цены на бензин произойдет в несколько этапов. Основная причина повышения стоимости&nbsp; топлива &ndash; значительное увеличение курса доллара, который на прошлой неделе уже перешел рубеж в 12 гривен. Безусловно, повышение цены на бензин в Одессе повлечет за собой повышение тарифов на пассажирские перевозки и на <a href="http://allotaxi.od.ua/taxi-price">грузоперевозки по Одессе</a>. На прошлой неделе стоимость бензина в крупном опте, предлагаемом на доставку на внутренний рынок Украины, была повышена.&nbsp; Так бензин А-95&nbsp; уже предлагался по стоимости 19&nbsp;750 гривен&nbsp; за тонну (это 400 &ndash; 500 гривен больше чем цена, которая была предложена на позапрошлой неделе). Дизельное топливо предлагалось 15820&minus;16500 гривен за тонну (это на 300 гривен больше чем предложенная ранее цена). Уже 29 июля стоимость бензина А-95 и А- 92 на&nbsp;Кременчугском нефтеперерабатывающем заводе была повышена на 800 и 550 гривен за тонну. Стоит отметить, что при этом цена на дизель осталась без изменений.</p>\r\n\r\n<p>Эксперты заявляют, что предпосылки данного подорожания наблюдались и раньше. Это связано с тем, что за последние месяцы величина и количество предложений на продажу внушительно сократился, а также значительно возросли закупочные цены на стоимость топлива из Беларуси. Таким образом, подорожают не только тарифы на <a href="http://allotaxi.od.ua/perevozka-gruzov">грузоперевозки</a>, но другие украинские тарифные планы изменятся. Отмечается, что увеличение цены на 25- 30 копеек &ndash; это минимальная цена.&nbsp;</p>\r\n', 'Бензин может подорожать в августе ', '7fef1a75cfe95885c6a3576f78bfad56.jpg', '2015-01-26 15:31'),
(6716, 0, '<p>Если вы привыкли к комфорту и общественный транспорт вам не подходит, самые разные службы такси предоставляют услугу <a href="http://allotaxi.od.ua/taxi-price">пассажирских перевозок в Одессе</a>. Сегодня использования услуг <a href="http://allotaxi.od.ua/">такси</a> в курортном городе у Чёрного моря очень актуально. В городе всегда много отдыхающих и молодёжи.</p>\r\n\r\n<p>Средняя <a href="http://allotaxi.od.ua/luchshie-tsenyi">стоимость такси в Одессе</a> составляет около 4 грн. километр. Но даже в том случае, если вам необходимо проехать всего пару километров, придется заплатить минимальную ставку &ndash; около 20-25 грн. Но, как правило, в спальных районах далеко не всегда можно найти желающих выполнять заказ на такие маленькие расстояния. В праздничные дни в Одессе стоит осуществлять заказ такси заранее, так как может не оказаться свободных автомобилей.</p>\r\n\r\n<p>Как правило, отдельной услугой в других городах является услуга перевозки багажа или животных, в Одессе подобные перевозки, чаще всего, осуществляются бесплатно. Если вы выбрали для постоянного использования одну или две службы такси, уже со второй поездки вам могут быть предоставлены <a href="http://allotaxi.od.ua/bonusi-i-skidki">бонусы</a>. В таких случаях, стоимость проезда будет ниже на 5-10%. Кроме пассажирских перевозок в Одессе предоставляются услуга <a href="http://allotaxi.od.ua/perevozka-gruzov">грузовых перевозок</a>, доставка цветов, лекарств или других товаров.</p>\r\n', 'Цены на такси в Одессе', '1f52dfc5c1eba27c3fb66c34dc177e10.png', '2015-02-23 15:27'),
(6666, 0, '<p>На выставке SEMA в 2011 году Рикки Кармайкл представил свою первую версию модели Sonic All Activity Vehicle. Теперь два года спустя, Кармайкл возвращается на SEMA с новой моделью Sonic. На этот раз, она оснащена пакетом модернизаций от Chevrolet Performance.</p>\r\n\r\n<p>Наружные части <a href="http://allotaxi.od.ua/peregon-avto">авто</a> концепта окрашены в атласный черный цвет в сочетании с синими акцентами и графикой. Аэродинамический обвес включает в себя новый задний спойлер, затемненные фары, подсветку под автомобилем, уникальную решетку радиатора и стойки крыши. Для некоторых это может быть немного чрезмерно, но интересный контраст темных и светлых оттенков выглядит довольно свежо и стильно.<br />\r\nДля салона, Кармайкл выбрал темно-зеленую и черную кожу на приборной панели. Обивка дверных панелей также выполнена из черно-зеленой отделки.</p>\r\n\r\n<p>Кроме того, необходимо также отметить плоский руль и обновленную звуковую систему.<br />\r\nПроизводительность Chevrolet увеличилась благодаря комплекту Turbo Kit, который характеризуется добавлением катализаторов высокой текучести, выхлопной системой и системой впуска холодного воздуха на 1.4-литровый 4-цилндровый двигатель с турбонаддувом. Концепт стоит на 18-дюймовых дисках, которые окрашены в глянцевый черный цвет с зелеными акцентами.</p>\r\n\r\n<p>Chevrolet не предоставил подробную информацию о расходе топлива и производительности, но мы считаем, что мощность будет составлять от 138 до 160 &laquo;лошадок&raquo;. Автомобиль также оснащен новым комплектом подвесок, который дает дорожный просвет. Завершают модный новый пакет тормоза с передними суппортами от Wilwood.<br />\r\nChevrolet Sonic является одним из самых продаваемых автомобилей в США, несмотря на свой лимитированный тираж.<br />\r\nВ 2014 году клиенты будут иметь возможность выбрать между двумя двигателями. Базовая версия включает 1.8-литровый 4-цилиндровый двигатель с коробкой VVT. Дополнительной опцией станет 1.4-литровый двигатель с турбонаддувом. Оба двигателя производят мощность 138 л.с., но 1.4-литровый агрегат является более популярным, поскольку он позволяет разогнать этот компактный хэтчбек до 100 км/ч за 7,9 секунды, в то время как 1.8-литровому двигателю требуется 9,7 секунд.<br />\r\n<a href="http://allotaxi.od.ua/luchshie-tsenyi">Стоимость</a> 2014 Chevrolet Sonic начинается от $14.185.</p>\r\n', 'Концепт Chevrolet Sonic Ricky', '3ea64b6097322580130c9550cf73974b.jpg', '2014-12-08 15:50'),
(6715, 0, '<p>В будущем году на украинских дорогах ожидаются существенные изменения. Теперь вместо сотрудников ГАИ за порядком будет следить электронная система &ndash; видеокамеры. Видеонаблюдение сможет обеспечить постоянную фиксацию всех нарушений на дороге. <a href="http://allotaxi.od.ua/taxi-work">Водители</a> не смогут &laquo;договориться&raquo; с инспекторами. По предварительному проекту планируется, что в течение 30 секунд нарушитель будет осведомлён по СМС о своих нарушениях, вместе со списком нарушений будет указан размер штрафа.</p>\r\n\r\n<p>Подобная система эффективно действует сегодня на территории Грузии и во многих других странах. На данный момент камеры слежения за водителями в тестовом режиме уже были установлены в пяти местах столичного города. Подобная система имеет множество преимуществ для упорядочивания автотранспортного движения. Водители не конфликтуют на дорогах, не имеют возможности дать взятку за нарушение. Эффективность такой системы уже была доказана современными странами Европы, и сегодня она будет введена и в городах Украины.</p>\r\n\r\n<p>В Европейских стран фиксация нарушений сотрудниками милиции осуществляется только в 10% случаев, в Украине &ndash; во всех 100%. Автоматическая система уже вводилась в украинских городах&nbsp; 3 года назад. Нарушители получали извещения о штрафах по почте. Но в 2010 году Конституционным судом было принято решение об отмене данного закона. На сегодняшний день уже определены 2 тысячи мест, где будут расположены камеры наблюдения. В первую очередь, под надзором будут находиться областные центры, позже и дороги общегосударственного значения. Систему фиксации нарушений на дорогах планируют усовершенствовать таким образом, чтобы она фиксировала и номерной знак машины, и водителя автомобиля.</p>\r\n', 'В 2015 году инспекторы ГАИ в Украине будут заменены камерами', '33a35dadffff32da4ea506d55a1176b4.png', '2015-02-16 15:28'),
(6676, 0, '<p><span style="line-height: 1.6em;">На веб-сайте компании Apple появилась характеристика оригинального автоматического устройства, и эта новость будет представлять интерес не только для владельцев смартфонов iPhone от Apple. Устройство может разблокировать бортовой компьютер, функционируя умнее, чем <a href="http://allotaxi.od.ua/taxi-work">водитель</a> и автомобиль.</span></p>\r\n\r\n<p>Почти каждый современное <a href="http://allotaxi.od.ua/peregon-avto">авто</a> оснащен OBD-портом&nbsp;интерфейсом, к которому сервисная служба может подключить свои компьютеры. Следовать указаниям самодиагностики теперь можно при помощи простого устройства и смартфона, со времением, таким устройством могут оборудовать <a href="http://allotaxi.od.ua/">такси в Одессе</a>.</p>\r\n\r\n<p>Автоматический небольшой модуль подключается к диагностическому разъему OBD-порта в машине, а вам необходимо скачать приложение смартфона и начать жизнь заново. Автоматически устройство собирает всевозможные данные об автомобиле и представляет их в удобной для вас форме. Хитрость заключается в том, что компьютер хранит много полезной информации, которой он не делится с нами. Автоматический помощник предназначен для устранения этой несправедливости. Необходимо отметить, что этот гаджет работает только с iPhone, но Android обещает присоединиться к нему через пару месяцев.</p>\r\n\r\n<p>Возможности автоматического устройства можно кратко перечислить. Например, оно учит водителя экономить топливо, контролировать давление на педаль тормоза, частоту переключений передач и внезапное ускорение. Система советует, как избежать ошибок в управлении автомобилем. Это полезно не только для начинающих. Если&nbsp;автомобиль&nbsp;попадает в аварию, устройство автоматически отправит сообщение на заранее введенные <a href="http://allotaxi.od.ua/taxi-contact-us">номера</a> и поможет вызвать помощь без участия водителя (работает пока только в США).</p>\r\n\r\n<p>С автоматической обработкой данных с бортового компьютера, он способен заменить панель приборов. Смартфон подает сигналы о нехватке топлива, о проблемах с двигателем или другие нюансы. Беспроводное устройство также оснащено GPS-датчиком, который показывает расположение машины на расстоянии. Новинка <a href="http://allotaxi.od.ua/luchshie-tsenyi">стоит</a> $100 и предназначена, по словам производителя, для самоконтроля и развития навыков экономичного вождения.</p>\r\n\r\n<p>Жаль только, что это оборудование предназначено только для Соединенных Штатов. В конце концов, этот гаджет в сочетании с небольшим планшетом может открыть второе дыхание у наших автомобилей. Инженеры работают над адаптацией устройства в других странах.</p>\r\n\r\n<p>Как только на рынок Украины выйдет сие чудо техники, служба <a href="http://allotaxi.od.ua/taxi-about-us">Алло такси</a> в Одессе сразу проведёт оснащение всех своих автомобилей.</p>\r\n', 'Сделать автомобиль умнее', 'ac18cae6ff5fc32a0fbedb484d541237.jpg', '2014-12-01 15:53'),
(6677, 0, '<p>С наступлением зимы всем <a href="http://allotaxi.od.ua/taxi-work">водителям</a> рекомендуется своевременно позаботиться о замене покрышек. Приходят первые заморозки и вместе с этим в службах такси вступают в силу новые тарифы.</p>\r\n\r\n<p>Зимой стоит не только заказывать автомобиль заблаговременно, но и учесть ввод более высокой стоимости на услуги <a href="http://allotaxi.od.ua/taxi-price">перевозок</a>. В этот период не все могут выехать, а те таксисты, которые работают в этот период, могут повысить цены в полтора-два раза.</p>\r\n\r\n<p style="text-align: left;">Подорожание объясняется еще так называемым &laquo;новогодним тарифом&raquo;. Но стоимость услуг <a href="http://allotaxi.od.ua/">такси</a> будет повышена не только в ночь с 31 декабря на 1 января, а уже начиная с 20 декабря. На данный момент еще нет согласованных тарифов на праздники. Но по прогнозам представителей служб такси ожидается минимум три недели застоя. Начиная с 20 января, в силу вступают стандартные <a href="http://allotaxi.od.ua/luchshie-tsenyi">тарифы</a>. По предварительным прогнозам в новогоднюю ночь тарифы будут увеличены в полтора раза. С 2-ого января тарифы будут немного снижены.</p>\r\n', 'В Украине тарифы такси повысятся', '2967ac330c6f2822b1f2c93ae312c4ce.png', '2014-11-24 15:54'),
(6678, 0, '<div><span style="line-height: 1.6em;">Renault - крупнейшая французская автомобильная <a href="http://allotaxi.od.ua/taxi-about-us">компания</a>, принадлежащая государству, выпускает легковые, </span><a href="http://allotaxi.od.ua/taxi-price">грузовые такси</a><span style="line-height: 1.6em;"> и спортивные автомобили.</span></div>\r\n\r\n<div>История Renault началась в 1898 году с маленького автомобильчика с двигателем мощностью меньше одной лошадиной силы. Зато следующая машина (&laquo;модель A&raquo;) вышла настолько удачной, что Луи Рено с братьями основал компанию &laquo;Братья Рено&raquo; (Renault Freres). Именно Луи Рено изобрел коробку передач, в которой крутящий момент передавали не цепи, а карданный вал. Такой принцип используется и у современных заднеприводных автомобилей.</div>\r\n\r\n<div>С 1900 года фирма переходит на выпуск больших машин, а в 1906 году представляет и автобус.</div>\r\n\r\n<div>В числе первых &laquo;Братья Рено&raquo; выпускают специальные машины для <a href="http://allotaxi.od.ua">такси</a>, которые покрыли себя славой и удостоились памятника из-за событий Первой мировой войны, когда 600 таких авто перебросили 5 тысяч солдат на важный участок фронта. Для армии компания собирала суда, авиационные двигатели и даже танки.</div>\r\n\r\n<div>&laquo;Братья Рено&raquo; вели свой бизнес и с Россией. Автомобили этой фирмы были у Николая II и даже у царевича Алексея. На Renault ездили руководители большевиков, в том числе и сам Ленин. По улицам Москвы одно время ездили такси этой марки, а французское оборудование и технологии положили основу АЗЛК.</div>\r\n\r\n<div>Вторая мировая война нанесла компании большой ущерб. Заводы были разрушены, а самого Луи Рено обвинили в сотрудничестве с нацистами, и он умер в тюрьме. В 1945 году его детище было национализировано, а уже в 1946 году появляется модель для массового производства 4CV.</div>\r\n\r\n<div>В 1958 Renault 4 становится популярным народным автомобилем (его выпустили в количсевте свыше 8 миллионов). Renault 16 в 1965 стала первым в мире авто с кузовом &laquo;хэтчбек&raquo;.</div>\r\n\r\n<div>В 1970-е годы появляются новые заводы компании, совместные предприятия с Peugeot. Модели Renault 5 и Renault 12 - самые продаваемые в мире машины из Франции.</div>\r\n\r\n<div>В 1979 году компания делает шаги на американский рынок.</div>\r\n\r\n<div>В 80-е в числе продукции Renault большое место занимают <a href="http://allotaxi.od.ua/perevozka-gruzov">грузовики</a>. В частности, в компанию вошел отдел тяжелых грузовиков Citroen.</div>\r\n\r\n<div>Очередное поколение Renault под индексом 21 появилось в 1986 году. Универсал Nevada, имел удлиненный кузов. Renault 21/ Nevada производили до 1995 года, когда ее заменила Laguna.</div>\r\n\r\n<div>Летом 1988 года Renault представил хэтчбек Renault 19, который в модели Europa (седан) стал одним из наиболее популярных новых импортных машин в России.</div>\r\n\r\n<div>В 1990 начато производства Clio, остающейся одной из самых продаваемых моделей во Франции, а в 1991 году презентуется концептуальный Scenic.</div>\r\n\r\n<div>В 1999 году после заключения договора о сотрудничестве с Nissan была показана модель Avantime, сделанная на базе Renault Espace. Это была настоящая новация: из микроавтобуса был сделан представительский автомобиль.</div>\r\n\r\n<div>Без компании Renault невозможно представить мировой автомобильный спорт. С заводской командой сотрудничал легендарный Михаель Шумахер, представители компании не один раз выходили победителями в ралли Париж-Дакар.</div>\r\n', 'Компания авто Renault', '522e651d656b61608e239d897193e9fb.jpg', '2014-11-17 15:56'),
(6733, 0, '<p>Украинские дороги тяжело назвать идеальными. При постоянном передвижении на автомобиле сохранить свою машину в сохранности непросто, особенно при работе в <a href="http://allotaxi.od.ua/">такси</a>. Сегодня мы вам расскажем как уберечь свой автомобиль от возможных повреждений из-за недостатков на дорогах.</p>\r\n\r\n<p>Существует несколько известных правил, которые полезно знать каждому <a href="http://allotaxi.od.ua/taxi-work">водителю</a>. В том случае, если вы идете по разбитой дороге, следует ехать при минимальной тяге и медленно, чтобы машины преодолевала ямы и бугры очень мягко. При необходимости, если у вас небольшое <a href="http://allotaxi.od.ua/peregon-avto">авто</a>, включите самую низкую передачу.</p>\r\n\r\n<p>Если вы едете на большой <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">скорости</a> и пропустили препятствие, резко тормозить надо не в яме, а до неё. В противном случае под действием инерции автомобиля пружины передней подвески сожмутся и &laquo;нос&raquo; глубоко опустится в яму. Так вы повредите не только подвеску, но и радиатор и кузов. Если же снизить скорость вы всё-таки не успели, нажимайте на газ, чтобы инерция разгоняемого кузова разгрузила пружины передней подвески. Но сразу после этого вам придется торопиться, чтобы уберечь от удара подвеску задних колес и их самих. Поэтому резко тормозите за ямой, но не до полной остановки.</p>\r\n\r\n<p>Если на вашем пути встретятся трамвайные рельсы или канава, необходимо смягчить удары по кузову. Такие препятствия нужно преодолевать перпендикулярно, под острым углом. Конечно, данные рекомендации не описаны в учебниках и пособиях, но со временем каждый водитель вырабатывает для себя подобные приемы. Главное &ndash; всегда оставаться внимательным на дороге и помнить о том, что кроме вас есть ещё и другие водители.</p>\r\n', 'Как сохранить авто после езды по нашим дорогам', '36f7e15eb12b64b3f5dce4164e688f03.jpg', '2015-06-15 15:04'),
(6756, 0, '<p>Процедуру регистрации автомобиля в МРЕО и получение номерных знаков теперь можно совершить &nbsp;в сети Интернет. ІТ-специалисты разработали портал iGov, который предоставляет определенные государственные услуги в электронном виде. Теперь, при содействии руководства МВД портал пополнился еще одной функцией &ndash; регистрация <a href="http://allotaxi.od.ua/peregon-avto">авто</a> с пробегом в МРЕО. Пока что данная услуга работает в Киеве и Днепропетровске, но уже в ближайшее время ее планируют ввести во всех городах Украины.</p>\r\n\r\n<p>Если вы хотите зарегистрировать автомобиль, то зайдя на сайт нужно заполнить специальную форму, а также выбрать время и дату визита в МРЕО. После этого вам на электронную почту придет <a href="http://allotaxi.od.ua/beznalichnii-raschet">счет для оплаты</a>, осуществить которую можно в любом банке. В выбранное вами время, имея на руках необходимый пакет документов, &nbsp;нужно приехать в МРЕО, где проведут осмотр авто, проверят документы и выдадут номер и техпаспорт.</p>\r\n\r\n<p>Данное нововведение направлено на упрощение процедуры и минимизации коррупции. По словам экспертов, годовой&nbsp; коррупционный оборот &nbsp;от этой услуги составляет 200-500 млн. грн. Причем есть несколько схем вымогательства, которые станут невозможными при помощи Интернет регистрации.</p>\r\n\r\n<p>В скором времени планируется регистрировать всех граждан, которые обращаются в МРЕО, не зависимо от того, зарегистрировался этот человек предварительно через Интернет или пришел без интернет-регистрации. Также будет создана система учета номерных знаков и бланков техпаспортов.</p>\r\n\r\n<p>В разработчиков есть много идей и предложений, которые они планируют ввести в ближайшем будущем, чтобы упростить &laquo;жизнь&raquo; <a href="http://allotaxi.od.ua/taxi-work">водителям</a> и ликвидировать коррупцию.</p>\r\n', 'Регистрация авто в МРЕО через Интернет', 'e9ee5acc7217716d8861dadda323e11a.jpg', '2015-08-03 16:43'),
(6731, 0, '<p>Компания Fiat-Chrysler преступает к разработке самого большого внедорожника, который займет достойную позицию среди лидеров других марок данного класса. Основной задачей представителей <a href="http://allotaxi.od.ua/taxi-about-us">компании</a> Jeep в ближайшее время будет разработка премиального кроссовера, который будет способен конкурировать с известными внедорожниками марки Range Rover и Mercedes-Benz GL. Планируется, что новый кроссовер теперь будет более совершенным и на уровень выше в сравнении с Grand Wagoneer, который запустят в серию ближе к 2018 году.</p>\r\n\r\n<p>Глава концерна Fiat-Chrysler Серджио Маркионне отметил, что стоимость новой модели будет не менее 100 тыс. долларов. <a href="http://allotaxi.od.ua/luchshie-tsenyi">Цена</a> будет уровнена с конкурентами. Главными конкурентами нового автомобиля будут Audi Q7, Mercedes-Benz GL, Cadillac Escalade, Lincoln Navigator и другие.</p>\r\n\r\n<p>Подобная информация о новинке пока не разглашается. На данный момент компания Jeep не нуждается в дополнительном авторитете и свободно конкурирует с выдающимися брендами.</p>\r\n', 'Jeep выпустит самый большой внедорожник за всю историю', 'a30aa9a612638f0a01094b7aeefc0d52.jpg', '2015-06-01 00:00'),
(6732, 0, '<p><a href="http://allotaxi.od.ua/taxi-about-us">Компания</a> SPTek разработала новую систему кругового обзора 3D-AVMS, которая позволит осмотреть окружающую автомобиль обстановку в реальном времени. Усовершенствованная система использует четыре широкоугольные камеры, угол обзора которых 190&deg; по бокам, сзади и спереди транспортного средства, в отличие от систем помощи при парковке.</p>\r\n\r\n<p>Видео с камер обрабатывается блоком управления и отправляется на экран бортового компьютера, который, в свою очередь, в режиме реального времени генерирует 3D-картинку вокруг машины. Таким образом, <a href="http://allotaxi.od.ua/taxi-work">водитель</a> может получить не ограниченный обзор сверху, а полноценный вид во всех направлениях, почти под любым углом, избегая проблему &laquo;мёртвых зон&raquo;.</p>\r\n\r\n<p>На данный момент система уже испытывается на туристическом автобусе. Компания SPTek планируют запустить продажи системы 3D-AVMS в августе 2015 года.</p>\r\n', 'Улучшенная система обзора в автомобиле позволяет установить обзор без «мёртвых зон»', 'aca46308043f6766f5783b5a14e72e67.jpg', '2015-06-08 15:06'),
(6680, 0, '<p><span style="line-height: 1.6em;">Первое такси появилось во Франции, в 18-ом веке. Родоначальником такого вида транспорта были наёмные общественные экипажи под названием &laquo;Фиакры&raquo;, организованные французом в первом общественном дворе.</span></p>\r\n\r\n<p>И в наше время на улицах можно встретить такси, представляющее собой экипаж для туристов.</p>\r\n\r\n<p>Единственный в мире музей такси открылся в Москве был создан в 1975 году. Там выставлены такие известные автомобили как &laquo;Победа&raquo;, &laquo;ГАЗ&raquo;, &laquo;Волга&raquo;, ГАЗ-А, ГАЗ-М1 и другие.</p>\r\n\r\n<p>Самое <a href="http://allotaxi.od.ua">дешёвое такси</a> можно заказать в Китае. За 10 долларов Вы сможете отправиться в любую часть города.</p>\r\n\r\n<p>Традиционным цветом для такси во всем мире считается &ndash; жёлтый. Это правило было введено компанией Рено, чтобы такси было всегда легко найти.</p>\r\n\r\n<p>Автомобили красили не только в жёлтый, но и красный цвет. Традиционный цвет для такси у англичан &ndash; чёрный.</p>\r\n\r\n<p>Самый необычный вид такси действует во Вьетнаме. Здесь в роли такси выступает слон. Среди туристов поездки на слоне пользуются популярностью.</p>\r\n\r\n<p>Самым часто забываемым предметом в такси считается мобильный <a href="http://allotaxi.od.ua/taxi-contact-us">телефон</a>. На втором месте &ndash; кошелёк.</p>\r\n\r\n<p>Чаще всего свои личные вещи в такси забывают жители Лондона. Однако и процент возврата забытых вещей в Англии самый высокий &ndash; 96 %.</p>\r\n', 'Несколько интересных фактов о такси', 'b160571027d4113b907fa3fdb5b70347.jpeg', '2014-11-10 15:59'),
(6755, 0, '<p>Разработчиками&nbsp; австралийского подразделения творцов бренда Lexus была представлена новая модель спорткара RC F, которая синхронизируется с сердцем своего <a href="http://allotaxi.od.ua/taxi-work">водителя</a>.</p>\r\n\r\n<p>Спортивный автомобиль имеет уникальные светодиодные панели. К водителю прикрепляют обычный монитор человеческого сердцебиения, которые может отправлять беспроводные данные на специальную плату управления в машине. Ритм сердца трансформируется в специальные сигналы платой, которые и могут управлять панелями в автомобиле. Таким образом, машина может светиться в ритме сердцебиения своего владельца.</p>\r\n\r\n<p>До тех пор пока машина не заведена, она стандартного однотонного цвета. И только во время движения RC F пульсирует в ритме сердца своего хозяина благодаря разработке компании Lumilor. Вся светодиодная система питается от отдельного аккумулятора. Максимальная <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">скорость</a> такого автомобиля может достигать до 270 км/ч, а мощность <a href="http://allotaxi.od.ua/peregon-avto">авто</a> RC F - 477 л/с.</p>\r\n', 'Новая модель автомобиля Lexus будет работать от сердца водителя', '014f56624b663947e6d5e0484c4c0fd1.jpg', '2015-07-27 15:00'),
(6730, 0, '<p>В современном мире тяжело себе представить <a href="http://allotaxi.od.ua/taxi-work">водителя такси</a> без музыки. Кто-то утверждает, что музыка ему необходима во время вождения <a href="http://allotaxi.od.ua/peregon-avto">авто</a>, кто-то наоборот считает, что она мешает. А задумывались ли вы, какое влияние оказывает &nbsp;на самом деле музыка на человека в процессе вождения? Действительно она благоприятно сказывается на самочувствии и внимательности человека за рулем или может стать причиной аварийной ситуации?</p>\r\n\r\n<p>Если попытаться разобраться в данном вопросе, можно узнать, что как утверждают эксперты, музыка действительно обладает способностью успокаивать, способствует расслаблению и повышает интерес человека к жизни. Приятная музыка будет полезна водителям, а также будет способствовать концентрации внимания. В том же случае, если вам предстоит долгое путешествие, музыка может наоборот взбодрить и поможет скоротать время в пути.</p>\r\n\r\n<p>Однако есть один недостаток в прослушивании музыки на дороге. В современных акустических системах уровень звука может достигать до 100 децибел, а для уха человека вполне достаточно 20 децибел. Эксперты утверждают, что слишком громкое прослушивание музыки может вогнать человека в состояние стресса, который приведет к сильной усталости. К тому же, если вы слушаете музыку слишком громко, возникает вероятность того, что вы не услышите сигнал автомобиля, что впоследствии может привести к аварийной ситуации. Конечно, данный вопрос ещё не изучен досконально, но стоит оставаться аккуратным и не включать в салоне автомобиля громкую музыку.</p>\r\n', 'Как влияет музыка на вождение автомобиля', '3eb5d94c3917fbef7c9d343756561540.jpg', '2015-05-25 15:11'),
(6681, 0, '<p>Услуги такси предоставляются многими службами. У всех примерно одинаковый уровень ценовой политики и достойное обслуживание. То есть очень большая конкуренция среди такси в Одессе. Но &quot;Алло такси&quot; вышло на должный уровень и не сдаёт позиции. Быстрый отклик на заявку, отличные водители и современные автомобили &ndash; всё это в такси в Одессе &ndash; Алло. Так что <a href="http://allotaxi.od.ua/">заказать такси в Одессе</a> по телефону через диспетчера или на сайте в режиме он-лайн лучше всего в службе такси Алло Такси.</p>\r\n\r\n<p>Наше экономноe такси &laquo;Алло taxi&raquo; - это пунктуальность и невысокая стоимость перевозок различных видов. Достаточно только сделать заказ, удобным для вас способом, и всего через несколько минут под вашими окнами Вас будет ожидать наше эконом такси Одесса.</p>\r\n\r\n<p>Различные виды транспорта позволят заказать <a href="http://allotaxi.od.ua/taxi-price">грузовое такси</a> и организовать междугородние перевозки.&nbsp;<br />\r\nЗаказ такси в Одессе бывает сложным в любое время года, в других компаниях зачастую завышены <a href="http://allotaxi.od.ua/luchshie-tsenyi">цены</a>, приходиться долго ждать ответа оператора, или просто неудобно звонить на городской телефон с мобильного.</p>\r\n\r\n<p>С нами эти вопросы легко решаются при помощи разнообразного выбора телефонных операторов, также Вы можете вызвать online такси Одесса, что несомненно очень удобно.</p>\r\n\r\n<p>Грузовое такси поможет в Вашем переезде, пассажирские перевозки достявят вас в любую точку города быстро и с комфортом, <a href="http://allotaxi.od.ua/peregon-avto">перегон автомобиля</a> поможет перевезти автомобиль не только в пределах города, но и с разных городов Украины.</p>\r\n\r\n<p>Частые заторы и пробки на дорогах не страшны нашим клиентам &ndash; опытные <a href="http://allotaxi.od.ua/taxi-work">водители</a> &laquo;Алло taxi&raquo; всегда смогут найти запасной путь и решат эту проблемную ситуацию.</p>\r\n', 'Такси в Одессе', '52ac98ca2af049d64e3ec86411193223.jpg', '2014-10-27 16:09');
INSERT INTO `type_news` (`type_news_id`, `type_news_pid`, `type_news_content`, `type_news_header`, `type_news_img`, `type_news_date`) VALUES
(6682, 0, '<p>&quot;Алло такси Одесса&quot; это сочетание экономного такси в Одессе и качественной службы перевозки пассажиров. <a href="http://allotaxi.od.ua/">Экономное такси в Одессе</a> вызвать достаточно просто &ndash; набрав легко запоминающийся номер и моментально Вам перезвонят приняв заказ. Посмотреть расценки на экономное такси в Одессе&nbsp;в любое время можно на сайте Алло такси, или созвонившись с оператором &ndash; узнать точную <a href="http://allotaxi.od.ua/luchshie-tsenyi">стоимость проезда</a>, которую высчитывает программа.</p>\r\n\r\n<p>Алло такси - это лучшее экономное такси. Все наши услуги&nbsp;и тарифы созданы в соответствии с пожеланиями наших клиентов и с ритмом нашего города. Вы можете заказать такси из любой точки города в любое место Одессы или за пределами города. У нас есть автомобили во всех районах города.</p>\r\n\r\n<p>Наше экономноe такси Одессa это всегда высокое качество и сравнительно низкая стоимость. Недорого такси Одесса не означает низкий сервис и качество услуг. В &laquo;Алло taxi&raquo;, эконом такси Одесса &ndash; это означает философию нашей компании.</p>\r\n\r\n<p>У нас Вы не платите за приятную атмосферу во время поездки, класс авто, профессионализм <a href="http://allotaxi.od.ua/taxi-work">водителей</a>, комфорт, <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасность и надежност</a>ь &ndash; это само-собой разумеющиеся вещи.&nbsp;<br />\r\nПроверьте прямо сейчас &mdash; дешевое такси Одессa может быть удобным и качественным, наши водители всегда аккуратны и вежливы, поездки с нами приятны для души и кошелька.</p>\r\n\r\n<p>&laquo;Алло такси&raquo; &mdash; это эконом такси Одесса, которое всегда приедет вовремя и довезет Вас до места назначения безопасно и с комфортом. Для Вас мы предоставляем самые различные транспортные услуги по адекватным ценам.</p>\r\n\r\n<p>Можно заказать такси недорого прямо сейчас &ndash; написать оператору в чате, позвонить по скайпу или по нашим <a href="http://allotaxi.od.ua/taxi-contact-us">телефонам</a>. Выгодные тарифы и высокий уровень сервиса приятно удивят Вас, и Вы обязательно станете постоянным клиентом &laquo;Алло taxi&raquo;.</p>\r\n\r\n<p>Алло такси Одесса &mdash; это экономная служба такси для тех, кто ценит время и комфорт. Мы доставим Вам машину в течении 10-15 минут после заказа. Принцип нашей компании - это внимание и забота к каждому нашему клиенту. Звоните нам прямо сейчас по телефонам +38(093)-970-32-22, (048)733-50-00, (048)700-60-11.&nbsp;</p>\r\n', 'Экономное такси в Одессе', '05562e8cc302c1c3d9ac33b7fc5cfbc9.jpg', '2014-11-03 16:06'),
(6729, 0, '<p>С каждым годом на подиум различных автошоу регулярно попадают специализированные автомобили-такси. К таким моделям предъявляются специфические требования, которые являются благодатной почвой для дизайнерских экспериментов. Для новых концептов основными являются требования к удобству салона и посадки. Такие модели должны иметь высокий потолок и ровный пол для того, быть просторными и высокими для маломобильных пассажиров. Важно, чтобы такое <a href="http://allotaxi.od.ua/">такси</a> было недорогим и простым в эксплуатации.</p>\r\n\r\n<p>Одна из смелых моделей от советских специалистов ВНИИТЭ-ПТ (&laquo;Всесоюзного научно-исследовательского института технической эстетики Перспективное Такси&raquo;) от 1964 года. Прототип обладал однообъёмным кузовом, разработка которого принадлежала легендарному дизайнеру Юрию Долматовскому. Эта модель отличались необычной формой, большой площадью остекления и визуальным разделением кузова на две части &ndash; нижнюю и верхнюю. Футуристический экстерьер был дополнен интересными деталями, такими как передние фары, которые были сведены в передней оси и скрывались за щитом.</p>\r\n\r\n<p>Один из самых популярных автомобилей у <a href="http://allotaxi.od.ua/taxi-about-us">таксомоторных компаний</a> Франции конца 60-х годов &ndash; Peugeot <a href="http://allotaxi.od.ua/luchshie-tsenyi">ценили</a> за практичный салон и дизельные двигатели. Представленный в 1972 году Peugeot 204 Taxi H4 Heuliez удивил всех своим внешним видом с наклоном лобового стекла и плоскими поверхностями. Модель создал дизайнер Ив Дюбернар. Отличительной чертой автомобиля была панорамная крыша, которая позволяла пассажирам рассматривать достопримечательности Парижа.</p>\r\n\r\n<p>В 70-х годах музей современного искусства и департамент транспорта администрации Нью-Йорка выступили организаторами конкурса создания абсолютно нового автомобиля для осуществления <a href="http://allotaxi.od.ua/taxi-price">пассажирских перевозок</a>. В результате мир увидел очень интересный концепт Alfa Romeo New York Taxi, длина которого составляла 4 метра. Модель обладала пассажирским отсеком длиной около 2 метров. Автомобиль имел независимую подвеску, панорамную крышу и был приспособлен для <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозки</a> инвалидов-колясочников.</p>\r\n', 'Экзотические такси по всему миру', '0911bfe172dfeb1cfcaf8fa39409314c.jpg', '2015-05-18 15:12'),
(6683, 0, '<p>Грузовые перевозки в Одессе можно заказать в службе вызова такси Алло такси Одесса. Самые приемлемые цены на услугу грузовые перевозки Одессы найдёте на сайте Алло <a href="http://allotaxi.od.ua/">такси Одесса</a>. Закажите услугу и будете приятно удивлены компетентностью, быстротой, надежностью грузовой перевозки. Запланировали переезд - тогда услуга <a href="http://allotaxi.od.ua/taxi-price">грузовые перевозки в Одессе</a> от службы Алло Такси к Вашим услугам. Хороший транспорт, опытные <a href="http://allotaxi.od.ua/taxi-work">водители</a> &ndash; залог беспроблемной перевозки любых вещей &ndash; от мебели до хрупких стекол.</p>\r\n\r\n<p>Алло такси &mdash; это Ваш надёжный партнёр. Вы можете заказать такси в любое время и наши сотрудники не заставят Вас ждать. У нас Вы можете заказать такие услуги:</p>\r\n\r\n<ul>\r\n	<li><strong><span style="line-height: 1.6em;">подача авто (в течении 10-15 минут);</span></strong></li>\r\n	<li><strong>доставка продуктов;</strong></li>\r\n	<li><strong>перегон автомобилей;</strong></li>\r\n	<li><strong>курьерская доставка;</strong></li>\r\n	<li><strong><a href="http://allotaxi.od.ua/perevozka-gruzov">перевозка любых грузов</a>.</strong></li>\r\n</ul>\r\n\r\n<p>Если Вам необходимо произвести грузовую перевозку мебели, переезжая в другую квартиру или офис, Вам будут необходимы услуги нашей компании. Грузовые перевозки в&nbsp;Одессе&nbsp;с Алло такси приятно удивят Вас <a href="http://allotaxi.od.ua/luchshie-tsenyi">ценами</a> и качеством работы. Мы берёмся за работу любой сложности и выполняем её на высшем уровне.</p>\r\n', 'Грузовые перевозки в Одессе', '3fc9f11381eb602428eab8f4bf4917ba.jpg', '2014-10-20 16:15'),
(6728, 0, '<p>Специалистам немецкой автомобилестроительной <a href="http://allotaxi.od.ua/taxi-about-us">компании</a> Audi представилась возможность ещё на один шаг подойти к своей мечте и создать синтетическое дизельное топливо из экологически чистых материалов &ndash; воды и углекислого газа. Новое топливо было названо E-Diesel. Под аплодисменты представителей компании и журналистов&nbsp; федеральный министр образования Германии Йохана заправил новым топливом свой автомобиль Audi A8.</p>\r\n\r\n<p><a href="http://allotaxi.od.ua/taxi-work">Работа</a> над изготовлением синтетического топлива началась в Дрездене. Основа топлива называется &laquo;голубая нефть&raquo;. Изготовление начинается с извлечения электроэнергии из таких источников как ветер или солнце. Электричество используется для получения водорода из воды с помощью электролиза. Водород смешивают с СО2, в результате получают вещество, которое получило название &laquo;голубая нефть&raquo;, из него и производится синтетическое топливо E-Diesel.</p>\r\n\r\n<p>Полученное топливо легко можно объединять с другим дизелем, как это уже делали в случае с биодизельными топливами на основе животных и растительных жиров. Руководитель Sunfire Кристиан Ольшаузен утверждает: &laquo;Двигатель может работать значительно тише и выделяет в атмосферу меньше загрязняющих веществ&raquo;.</p>\r\n', 'Создали дизельное топливо из воздуха и воды', '89be815c6689b72a2d5b9da464ec1b9e.jpg', '2015-05-11 15:13'),
(6700, 0, '<p>Министерством регионального развития и строительства Украины были разработаны изменения правил парковки транспортных средств, а также изменения <a href="http://allotaxi.od.ua/beznalichnii-raschet">способов оплаты</a>. Теперь украинцы смогут оплачивать автомобильную парковку при помощи мобильного <a href="http://allotaxi.od.ua/taxi-contact-us">телефона</a>. Данные изменения были одобрены правительством на заседании 25 июня.</p>\r\n\r\n<p>В Министерстве регионального развития и строительства Украины разъяснили, что на данный момент украинские автовладельцы, покупая абонемент, оплачивают парковку через паркомат или терминал. Данные приспособления для оплаты парковочных средств вносят некоторые неудобства в деятельность коммунальных служб, а также, по словам сотрудников местных органов самоуправления и сотрудников коммунальных предприятий, установка этих паркоматов и терминалов требует значительных средств из местных бюджетов.</p>\r\n\r\n<p>Стоит отметить, что период окупаемости этих приспособлений довольно длительный. Сотрудники Минрегоина провели аналитическое исследование, которое показало, что на сегодняшний день Украина нуждается как минимум в 2100 таких установок. Средняя <a href="http://allotaxi.od.ua/luchshie-tsenyi">цена</a> одного паркомата составляет 30 тысяч гривен. Для того чтобы удовлетворить потребность в данных терминалах во всех украинских городах, нужно потратить 63 млн. гривен. В</p>\r\n\r\n<p>то время как оплата парковочного места через мобильный телефон не требует бюджетного финансирования. Данный способ оплаты будет удобным как для <a href="http://allotaxi.od.ua/taxi-work">водителей</a>, так и для сотрудников органов местного самоуправления. Внедрение &laquo;мобильной парковки&raquo; позволит ежегодно пополнять бюджет на 500 млн. гривен, стоит отметить, что на данный момент данная цифра составляет 85 млн. гривен. С помощью данных денежных средств можно будет развивать дорожно-транспортную инфраструктуру.</p>\r\n', 'Появление  «мобильной парковки» в Украине', '0782e050efcc69a1e4b4d6742c8b3f83.jpg', '2014-10-13 16:27'),
(6684, 0, '<p>Хорошее такси Одесса &ndash; это Алло такси. Вызывайте посредством звонка с перезвоном диспетчера, который точно укажет сроки прибытия машины, марку номер и сумму &ndash; которая будет затрачена на проезд. Хорошее такси Одесса &ndash; это то такси, которое приезжает раньше назначенного срока, всегда чистая машина и вежливый и при этом профессиональный <a href="http://allotaxi.od.ua/taxi-work">водитель</a>. Хотите ехать комфортно и <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасно</a> &ndash; к Вашим услугам самое хорошее такси Одессы.</p>\r\n\r\n<p>Одесса - это один из самых прекрасных и живописных городов Украины. Гости этого города могут осуществить осмотр достопримечательностей, используя такси в Одессе. Поскольку общественный транспорт менее удобен, предлагаем Вам заказ дешевого такси. В том случае, если Вы не располагаете большим количеством времени, Вам подойдёт дешёвое такси. Гостям города и местным жителям мы предлагаем услуги компании Алло такси. С нами Вы всегда без проблем и попадёте в нужную точку города. Алло такси &mdash; это <a href="http://allotaxi.od.ua/luchshie-tsenyi">доступные цены</a> и высокое качество обслуживания.</p>\r\n\r\n<p>Пользуясь транспортными услугами в нашем городе, важно найти<a href="http://allotaxi.od.ua/"> хорошее такси Одесса</a>.</p>\r\n\r\n<p>Мы заботимся о своих клиентах, постоянно поддерживая качество услуг на должном уровне. Конечно мы очень рады, что количество наших постоянных клиентов растет с каждым днем.</p>\r\n\r\n<p>Заказывая недорого такси Одесса у нас, Вы получаете высокий уровень обслуживания за небольшие деньги. Мы очень дорожим своей репутацией, в нашем автопарке только хорошие и надежные автомобили, все наши сотрудники специалисты своего дела &ndash; отзывчивые и внимательные диспетчера, опытные и вежливые водители</p>\r\n\r\n<p>Многие из наших таксистов владеют иностранными языками и помогут качественно встретить иностранных гостей нашего города и бизнес-партнёров на железнодорожном вокзале, автовокзале или аэропорту.</p>\r\n\r\n<p>Служба заказа такси круглосуточно принимает заказы, в короткое время за Вами приедет автомобиль, водитель такси безопасно довезет Вас в любую точку города.</p>\r\n\r\n<p>&laquo;Алло Taxi&raquo; &mdash; хорошее такси, ведь мы уверены в высоком качестве предоставляемых услуг, а наш персонал &ndash; отзывчивые, внимательные и вежливые сотрудники с большим опытом работы.</p>\r\n', 'Хорошее такси Одесса', '6fc0430dbf5e701d1a9e4a648dd305be.jpg', '2014-12-15 15:49'),
(6757, 0, '<p>В Политехническом университете Виргинии на кафедре машиностроения была разработана новая технология сбора энергии, которая вырабатывается автомобильными амортизаторами.</p>\r\n\r\n<p>С появлением данной технологии ямы и кочки на дорогах теперь будут способствовать увеличению запаса энергии аккумулятора или обеспечению питанием приборов в салоне <a href="http://allotaxi.od.ua/peregon-avto">авто</a>. Специалистами университета была создана небольшая аккумулирующая система, способная собирать энергию и переводить вертикальное и хаотичное движение подвески во вращательное движение ротора, на котором <a href="http://allotaxi.od.ua/taxi-work">работает</a> генератор. Такая система может давать 100-400 Вт энергии на обычных дорогах и немного больше на сильно поврежденных трассах. В мировых масштабах такие амортизаторы могут сэкономить 13-19 миллиардов долларов на топливные расходы.</p>\r\n\r\n<p>Первые прототипы данного устройства уже были протестированы в студенческом городке Политехнического университета, они показали 60% КПД. Новое устройство компактно и может быть установлено на любой автомобиль.</p>\r\n', 'Использование ям на дорогах для экономии бензина', 'ed24f44b9bb151261dbd7c3e9820685d.jpg', '2015-08-10 12:04'),
(6686, 0, '<p>Все пользуются&nbsp;услугами такси в Одессе. И ещё сложнее найти человека, который знает о правилах поездок в такси. В частности, о <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозках</a>.</p>\r\n\r\n<p>Казалось бы, достаточно набрать <a href="http://allotaxi.od.ua/taxi-contact-us">телефонный номер</a> любой известной службы и заказать&nbsp;такси. Назвать адрес и пункт назначения. Но не всё так просто. Каждый должен знать свои права и бороться с тем, чтобы услуги оказывали по чётким правилам.</p>\r\n\r\n<p>Такси &ndash; это вид транспорта, предназначенный для <a href="http://allotaxi.od.ua/taxi-price">перевозки пассажиров</a>. Главное &ndash; индивидуальной перевозки.</p>\r\n\r\n<p>Прежде всего, такси &ndash; это легковой автомобиль, который должен быть оснащён опознавательной &laquo;шашкой&raquo; и &laquo;счётчиком&raquo;.</p>\r\n\r\n<p><a href="http://allotaxi.od.ua/taxi-work">Водитель такси</a> должен быть действительно специалистом в вождении - для обеспечения <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасной, комфортной и максимально быстрой</a> перевозки&nbsp;пассажира до пункта назначения.</p>\r\n\r\n<p>Открывать дверь и багажник такси, быть вежливым и называть <a href="http://allotaxi.od.ua/luchshie-tsenyi">тарифы</a> в начале поездки &ndash; основные правила для водителя такси.</p>\r\n\r\n<p>Правила проезда в такси не односторонние &ndash; для пассажира основные требование &ndash; иметь сумму наличными, достаточную для того, чтобы <a href="http://allotaxi.od.ua/beznalichnii-raschet">расплатиться</a> за услуги такси.</p>\r\n\r\n<p><a href="http://allotaxi.od.ua/">Заказать такси&nbsp;в Одессе</a>, и в любом городе, лучше с некоторым запасом времени ввиду возможных дорожных ситуаций.</p>\r\n\r\n<p>Нужно помнить, что услуги&nbsp;предоставляют многие службы. Поэтому для водителя такси соблюдение правил перевозки &ndash; это гарант того, что пассажир останется доволен и в будущем, при необходимости, будет пользоваться услугами именно этой службы такси.</p>\r\n\r\n<p>В Одессе услугами такси Вы можете воспользоваться у лучшей службы Такси Одесса. Вас доставят быстро, вежливо и безопасно!</p>\r\n\r\n<p>В &laquo;Алло Такси Одесса&raquo; самые низкие тарифы, при этом гарантированно предоставляется качественный сервис.</p>\r\n', 'Заказ такси', '8a20a8b6c736a8048e3fbcc0cbf24683.jpg', '2014-12-22 15:45'),
(6727, 0, '<p>Министр инфраструктуры Украины Андрей Пивоварский передал журналистам, что первые проекты строительства бетонных дорог в Украине могут быть уже через два месяца. Андрей Пивоварский отметил: &laquo;Если всё будет нормально, месяца через два появятся проекты по обустройству дорог. Они будут касаться припортовых зон и прифронтовой зоны. В припортовой зоне осуществляется много зерновых <a href="http://allotaxi.od.ua/taxi-price">перевозок</a> на автомобилях, которые не соответствуют весовым стандартам, а бетонная дорога может выдержать большие <a href="http://allotaxi.od.ua/perevozka-gruzov">нагрузки</a>&raquo;.</p>\r\n\r\n<p><span style="line-height: 1.6em;">Что касается финансирования данного проекта, министр заявил, что финансировать строительство может &laquo;Укравтодор&raquo;, порты или местные власти.</span></p>\r\n\r\n<p><span style="line-height: 1.6em;">В феврале 2015 года Мининфраструктуры заявило, что изучает строительство бетонных дорог. Как заявил замминистра Владимир Омелян:&nbsp;&laquo;В строительстве бетонных дорог велика импортная составляющая&raquo;. При строительстве новых бетонных дорог ситуация может измениться в пользу украинского производителя. Планируется, что скоро украинские <a href="http://allotaxi.od.ua/taxi-work">водители</a> смогут убедиться в высоком качестве новых дорог.</span></p>\r\n', 'Первые проекты строительства бетонных дорог будут уже летом', '630f9db88a5d60356db678142c0831ce.jpg', '2015-05-04 15:15'),
(6758, 0, '<p>Компания Apple приступила к разработке собственного беспилотного автомобиля. Эти данные были представлены британским изданием The Guardian. Как выяснилось, в мае этого года компания Apple вела переговоры с полигоном GoMentum Station. Многие производители автомобилей предпочитают арендовать полигон для проведения секретных тестов новых разработок. Полигон, с которым вела переговоры компания Apple, представляет собой закрытую охраняемую территорию, которая была обустроена на бывшей базе&nbsp;военно-морских сил США.</p>\r\n\r\n<p>Для разработки данного проекта были приглашены исследователи из подразделений Tesla Motors и Mercedes Benz. Пока подробности о разработке проекта не были разглашены. Однако, по опубликованным данным, сегодня <a href="http://allotaxi.od.ua/taxi-about-us">компания</a> уже подготовила готовый к дорожным испытаниям прототип.</p>\r\n\r\n<p>В феврале компания заявляла о планах подготовки своего электромобиля к 2020 году. Тогда же было оглашено название данной модели &ndash; Titan.</p>\r\n', 'The Guardian были представлены документы о секретном тестировании умного автомобиля Apple', 'a6a39eb24f63b81ba3e25ba0b64a549b.jpg', '2015-08-17 16:21'),
(6717, 0, '<p>Сегодня на дорогах Львова впервые появились электромобили. Данный эксперимент по внедрению экологически чистого такси был успешно проведён на городских дорогах. Теперь жители Львова могут осуществить <a href="http://allotaxi.od.ua/">заказ такси</a> и воспользоваться инновационной услугой электромобиля-такси. Львов &ndash; это первый украинский город, в котором опробованы <a href="http://allotaxi.od.ua/taxi-price">пассажирские перевозки</a> на автомобиле с электрическим двигателем. Новейший вид транспорта претендует на звание лучшего такси, предлагая пассажирам самое комфортное и безопасное передвижение по городу.</p>\r\n\r\n<p>Данные нововведения были осуществлены в рамках проекта SHOOTER, который популяризирует электромобили. Новый вид автотранспорта заряжается и от специальной станции на автозаправках (на протяжении часа), и от обычной розетки (на протяжении семи-восьми часов). Стоимость проезда на электромобиле не отличается от <a href="http://allotaxi.od.ua/luchshie-tsenyi">цены на проезд</a> в обычном автомобиле &ndash; около 2-3 грн./км. Цену проезда на электромобиле можно отнести к разряду дешевого такси. Существенным отличием от проезда в обычных машинах является полное отсутствие вреда для окружающей среды.</p>\r\n\r\n<p>Несмотря на немаленькую стоимость подобного вида автотранспорта, эксперты отмечают, что использование электромобиля имеет множество преимуществ. Прежде всего, заправка экологически чистого автомобиля имеет стоимость около 5-7 грн. на 100 км. А также первые пассажиры отмечают, что <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозкам</a> на подобном автотранспорте свойствена мягкость и отсутствие шума. В том случае, если проект будет удачно завершен, новый вид автотранспорта появится и в других крупных городах Украины.</p>\r\n', 'В Украине появились электромобили', '046bc9e8da34aff5495b27edca991f59.png', '2015-03-02 15:26'),
(6687, 0, '<p><span style="line-height: 1.6em;">Согласно историческим данным, впервые такси колесницы были в Древнем Риме. Где на оси колесницы был закреплен &laquo;таксометр&raquo;, похожий обычный таз, в который (после примерного расстояния в 200 метров) падал камешек. Оплата осуществлялась по числу камешков, оказавшихся в тазу в конце поездки.</span></p>\r\n\r\n<p>Первые моторизированные экипажи, фиакры появились во Франции в 1890 году. Бедным они были не по карману, а у богачей имелись личные экипажи, средний класс пользовался их услугами лишь в исключительных случаях.</p>\r\n\r\n<div>В 1891 году немецкий учёный Брюн изобрёл первый таксометр.</div>\r\n\r\n<div>А в 1907 году на улицах Лондона появились первые таксомоторы оборудованные &quot;таксометрами&quot;, спрос на услуги <a href="http://allotaxi.od.ua/">такси</a> резко возрос.</div>\r\n', 'История такси', '59cf1d67847c21f4d27e993f81bce6a9.jpg', '2014-12-29 15:40'),
(6726, 0, '<p>На выездном заседании Кабинета министров были анонсированы перемены для автомобилистов. ГАИ вводит штрафные баллы для <a href="http://allotaxi.od.ua/taxi-work">водителей</a> и упростит систему платы штрафов. Замглавы МВД Украины Эка Згуладзе, министра внутренних дел Арсен Аваков и премьер-министр Арсений Яценюк на выездном заседании Кабмина озвучили планы по реформированию украинской милиции.</p>\r\n\r\n<p>Помимо системы предупреждений и денежных штрафов, будет введена новая система штрафных баллов. Каждый автомобилист получит 150 баллов &laquo;в кредит&raquo;, которые сможет израсходовать на &laquo;выплату&raquo; за нарушения в течение переходного периода. Когда баллы закончатся, штрафы будут выплачиваться деньгами.</p>\r\n\r\n<p>Фиксация нарушений будет осуществляться различными способами, в том числе дистанционно. Количество видеорегистраторов будет увеличено в несколько раз. В сообщении нарушителю будет выслан код, по которому на сайте можно будет получить информацию о нарушении, просмотреть фото или видео.</p>\r\n\r\n<p>Наложенный штраф необходимо будет оплатить в течение 30 дней. В случае просрочки, налагается пеня в двойном размере. Обжалование штрафа может быть осуществлено в течение 10 дней. Оплатить штраф патрульному будет возможно <a href="http://allotaxi.od.ua/beznalichnii-raschet">безналично</a>, при помощи банковской карты. Наличные операции будут запрещены.</p>\r\n', 'В Украине ГАИ введет новую систему штрафов', '73a5e78b878ab877c26552f31a13a8d3.jpg', '2015-04-27 15:18'),
(6689, 0, '<p><span style="line-height: 1.6em;">В новом законопроекте говориться о контроле над </span><a href="http://allotaxi.od.ua/taxi-price">перевозчиками</a><span style="line-height: 1.6em;"> который будет осуществлять ГАИ, а <a href="http://allotaxi.od.ua/luchshie-tsenyi">тарифы</a> устанавливать местные органы управления. Но сами <a href="http://allotaxi.od.ua/taxi-work">таксисты</a> от таких идей введений&nbsp;не в восторге. Они считают, что принятие нового законопроекта не решит проблему с нелегальными перевозчиками, а всех легальных уведет в черный рынок, в тень</span></p>\r\n\r\n<div>Ожидание таксистов вполне предсказуемы, ведь указанные в законопроекте нормы сильно могут изменить рынок такси <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозок</a>. Ведь водителю <a href="http://allotaxi.od.ua/peregon-avto">авто</a> необходимо оборудовать автомобиль, а это дорого, <a href="http://allotaxi.od.ua/beznalichnii-raschet">платить</a> налоги и отбиваться от регулярных ГАИ проверок.</div>\r\n\r\n<div>Нужно обратить пристальное внимание на то, что данным законопроектом пытаются ввести в рамки закона деятельность Информационно-Диспетчерских Служб и заставить их работать в правовом направлении, с соблюдением закона рынка.</div>\r\n\r\n<div>Одного решения по управлению рынка заказа <a href="http://allotaxi.od.ua/">такси Одесса</a>, таксомоторных перевозок, также в государстве Украине нет, а для качественной, &nbsp;реформы&nbsp;вариант &quot;шаблонности&quot; не подойдет.</div>\r\n', 'Новый законопроект "О такси в Украине"', 'f28a676cff10392b34d7892b7b84f5d3.jpg', '2015-01-05 15:35'),
(6778, 0, '<p>Возможно, что патрульные полицейские должны будут изучить новую науку &ndash; украинские стандарты качества дорог. Это произойдет в том случае, если Верховная Рада примет законопроект №3130, который будет направлен на то, чтобы освобождать от ответственности водителей в случае, если правонарушение было совершено из-за неудовлетворительного состояние дороги, улицы или железнодорожного переезда. Правоохранители должны будут выучить многочисленные госстандарты, которые предъявляют требования не только к качеству покрытия дороги, но также к разметке, светофорам, дорожным знакам другим средствам.</p>\r\n\r\n<p>На данный момент законопроект №3130 уже подготовлен к рассмотрению в Верховной Раде. Владимир Караваев, известный защитник, так комментирует эту ситуацию: &laquo;Если парламент его одобрит, то будет установлена солидарная ответственность между участниками дорожного движения и его организаторами&raquo;.</p>\r\n', 'Украинской полиции придется осваивать новые стандарты качества дорог', 'f91d230630ba348e185d9f319d478cc4.jpg', '2015-12-21 15:49'),
(6779, 0, '<p>Теперь заказывать и оплачивать такси смогут более 1,6 млн пользователей Privat24 Android с помощью мобильного приложения. По словам сотрудников банка, новая функция была внедрена в рамках смены концепции Privat24 &mdash; от классического к многофункциональному платежному приложению.</p>\r\n\r\n<p>Заместитель Председателя Правления Приватбанка Александр Витязь заявил, что самый популярный мобильный банк в Украине Privat24 на данный момент находится на переходном этапе и <a href="http://allotaxi.od.ua/taxi-price">услуга</a> вызова такси стала началом для расширения функциональности Privat24.</p>\r\n\r\n<p>С помощью новой услуги пользователь Privat24 может <a href="http://allotaxi.od.ua/">заказать такси</a>, осуществить расчет стоимости поездки, выбрать класс автомобиля. А также вы можете в приложении оплатить поездку со своей карты.</p>\r\n', 'Новая услуга вызова и оплаты такси появилась в мобильном приложении Privat24', 'ca8f3f8f957a197e1f72cdd6ff5b291c.jpg', '2016-01-19 13:34'),
(6725, 0, '<p>В нашем регионе приход весны связан не только с тёплыми вечерами и отдыхом на природе, но ещё и с дождливой, ненастной погодой. Водителям <a href="http://allotaxi.od.ua/taxi-price">пассажирских и грузовых</a> автомобилей стоит помнить об основных правилах <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасной</a> езды в такую погоду.</p>\r\n\r\n<p>Паркуя автомобиль, необходимо удостовериться в том, что двери и окна в машине закрыты. Ведь даже в небольшую щёлочку может попасть дождь, что может привести к выводу из строя бортовой электроники. Перед выездом в дождливую погоду стоит обратить внимание на состояние стеклоочистителей. В том случае, если машина какое-то время стояла на улице, под дворники могли попасть ветки или листья, и это обстоятельство помешает очистки стекла.</p>\r\n\r\n<p>В дороге стоит избегать наезда на лужи. Поскольку лужи не только могут скрывать ямы разного размера, но и брызги от них могут попасть в вентилятор, могут залить высоковольтные провода, свечи. Ездить в дождь может быть опасно по пересеченной местности и по трассе. Эффект аквапланирования может возникнуть на скорости 70 км/ч. Для того, чтобы избежать аварийную ситуацию, нельзя двигаться по сильно мокрой трассе и набирать скорость более 90 км/ч.</p>\r\n', 'Правила безопасной езды на автомобиле в дождь', '5748ae4ee2f0fd3c488aa0b6db78747e.jpg', '2015-04-20 15:19');
INSERT INTO `type_news` (`type_news_id`, `type_news_pid`, `type_news_content`, `type_news_header`, `type_news_img`, `type_news_date`) VALUES
(6718, 0, '<p>В 2015 году на украинском рынке планируется появление около сотни новых автомобилей. О некоторых новинках, которые появятся в этом году, рассказали автомобильные импортеры.</p>\r\n\r\n<p>От компании Audi в 2015 году не стоит ожидать появление кардинально новых моделей. Ожидается появление рестайлинговых автомобилей. Для осуществления <a href="http://allotaxi.od.ua/taxi-price">комфортных перевозок</a> выйдет обновленное семейство A6, хэтчбек А1, появление которого планируется ближе к середине года.</p>\r\n\r\n<p>От BMW &amp; MINI в новом году ожидается множество интересных премьер, таких как BMW 7-й серии и кроссовер Х1. А также появятся горячие версии кроссоверов BMW Х5М и Х6М. Интересными новинками является первый переднеприводный высокий хэтчбек BMW 2-й серии Grand Tourer. От MINI ожидается только одна новинка - &nbsp;MINI Clubman.</p>\r\n\r\n<p>Во второй половине года от <a href="http://allotaxi.od.ua/taxi-about-us">компании</a> Chevrolet, которая у нас представлена корпорацией &laquo;УкрАвто&raquo;, ожидают обновление семейства Chevrolet Cruze. Новинка компании Opel &ndash; это современный, стильный городской хэтчбек Adam Rocks с защитным обвесом.</p>\r\n\r\n<p>Компания Ford порадует автолюбителей множеством интересных новинок. В первом квартале 2015 года появится компактный кроссовер EcoSport и новый Mondeo, появление которого ожидалось в течение последних двух лет. Во втором квартале ожидается появление обновлённого компактвэн C-Max, абсолютно нового минивэна S-Max и более крупного Galaxy.</p>\r\n\r\n<p>В 2015 году ожидается ещё много интересных новинок, которые смогут порадовать украинских автолюбителей. Нам остается с нетерпением наблюдать за <a href="http://allotaxi.od.ua/taxi-novosti">новостями</a> авторынка.</p>\r\n', 'Новые автомобили в 2015 году', 'eeb5a578a9e431f0c4e4b63727291d05.jpg', '2015-03-09 15:24'),
(6695, 0, '<p style="text-align: justify;">Крупная транспортная компания Uber (США) заявила о своем намерении закупить 2500 беспилотных автомобилей от Google для <a href="http://allotaxi.od.ua/taxi-work">работы в службе такси</a>. Автомобили будут оборудованы пилотом третьего поколения. Компания Uber намерена инвестировать 375 миллионов долларов для закупки инновационных транспортных средств.</p>\r\n\r\n<p style="text-align: justify;">В ходе пробной эксплуатации самоходных автомобилей было установлено, что данные автомобили являются более <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасным</a> средством передвижения. Автомобиль-робот безукоризненно соблюдает все правила дорожного движения, стиль вождения такого <a href="http://allotaxi.od.ua/peregon-avto">авто</a> более плавный и безопасный. Эти данные были получены в результате пробегов самоходных автомобилей, суммарное расстояние которых составляет сотни тысяч километров. Пробные заезды осуществлялись на дорогах Калифорнии и Невады. &nbsp;</p>\r\n\r\n<p style="text-align: justify;">Впервые самоходные автомобили от <a href="http://allotaxi.od.ua/taxi-about-us">компании</a> Google вышли на дороги в 2010 году. Во время пробный заездов данных автомобилей, на месте водителя всегда находился человек для того, чтобы при необходимости взять на себя управление. В 2012 году власти Калифорнии легализовали беспилотный автомобиль от компании Google.</p>\r\n\r\n<p style="text-align: justify;">На основе исследований данных автомобилей был сделан вывод, что&nbsp; программное обеспечение беспилотных, автономных автомобилей всегда сохраняет безопасную дистанцию по отношению к впереди идущему транспорту, совершает плавные маневры. Исследователи компании Google утверждают, что данная система способна обеспечить более эффективное использование топлива и общественных дорог, а также значительно снизит количество ДТП, смертей и травм на дорогах.</p>\r\n\r\n<p style="text-align: justify;">На панели приборов самоходного автомобиля будет отображаться информация, которая даст понять человеку, что в данный момент делает автомобиль и в случае необходимости, человек всегда может перехватить управление. Беспилотные автомобили полностью электрические, а запас хода одного заряда превышает расстояние в 1000 км. А в режиме ожидания автомобиль может обойтись без зарядки до 48 часов. В тот момент, когда автомобиль не осуществляет <a href="http://allotaxi.od.ua/taxi-price">пассажирские перевозки</a>, он самостоятельно находит зарядную станцию и отправляется на зарядку.</p>\r\n\r\n<p style="text-align: justify;">Когда в эксплуатации введут данные автомобили и <a href="http://allotaxi.od.ua/">служба заказа такси</a> начнёт использовать инновационные технологии пока не известно. Но так как первые беспилотные автомобили уже были приобретены, без сомнения можно прогнозировать незамедлительное появление автомобилей-роботов на общественных дорогах. &nbsp;</p>\r\n', 'Самоуправляемый автомобиль Google в службе такси', 'f1ec93057cfaa2345febc3312bdeea43.jpg', '2015-01-19 15:32'),
(6712, 0, '<p>Сотрудники моторно (транспортного) страхового бюро заверяют, что теперь получить компенсацию по страховке станет намного проще. Это хорошая новость как для опытных автовладельцев и профессиональных водителей, так и для тех, кто только задумывается о том, что <a href="http://allotaxi.od.ua/taxi-work">работа водителем</a> его призвание. Украинское правительство в лице Верховной Рады Украины, а именно комитета по вопросам финансов и банковской деятельности одобрил проект закона, где говорится о страховании гражданско-правовой ответственности обладателей наземных транспортных средств.</p>\r\n\r\n<p>Данный законопроект значительно упростит процедуру получения страхового возмещения пострадавшим в результате дорожно-транспортного происшествия из различных фондов МТСБУ. Планируется, что данный законопроект будет выноситься на сессию украинского парламента в начале августа, если его одобрят, то к концу года он может быть принят. Автор данного законопроекта заявляет, что данный проект закона находится в приоритете, ведь в документе говорится о гарантировании выплат пострадавшим от обанкротившихся страховщиков ОСАГО.</p>\r\n\r\n<p>Этот законопроект улучшит процедуру не только столичного страхования, но и улучшит ситуацию во всех украинских городах. Теперь в Одессе и в других украинских городах люди будут получать компенсации за несколько месяцев, а не за несколько лет, как это происходит сейчас. Стоит отметить, что это касается не только частных автовладельцев. Например: <a href="http://allotaxi.od.ua/">такси в Одессе</a> будет подвергаться обязательному страхованию, чтобы обезопасить своих <a href="http://allotaxi.od.ua/taxi-price">пассажиров</a>. Теперь, если житель Южной Пальмиры захочет заказать такси в Одессе, он может быть уверен в своей <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасности</a>, ведь его жизнь будет застрахована. Если данный законопроект будет принят, то он значительно расширит сферу деятельности &nbsp;МТСБУ.&nbsp;</p>\r\n', 'Правила страховки автомобиля могут измениться ', '1282fc2e65e0ebfc3307af98e2fe68c3.jpg', '2015-02-02 15:30'),
(6719, 0, '<p>По данным &laquo;Continental Mobility Study 2015&raquo;, охватывающим страны Азии, США и Европы, сегодня наличия собственного автомобиля &ndash; это приоритет, а иногда и необходимость для большинства автолюбителей.</p>\r\n\r\n<p>При условии наличия необходимого бюджета для удовлетворения всех потребностей, собственным автотранспортом предпочитает владеть 86% опрошенных из Германии и Франции, 93% респондентов из США и Китая и 75% в Японии. На данный момент наблюдается тенденция общего использования ресурсов, но количество автолюбителей, которые предпочитает брать машину напрокат, сегодня крайне мала, в США и Германии число представителей данной группы составляет всего 1%.</p>\r\n\r\n<p>Несмотря на то, что с каждым годом на дорогах появляется всё больше автомобилей, автолюбители всё равно предпочитают покупать необходимый автотранспорт. Как показывает опрос, современные <a href="http://allotaxi.od.ua/taxi-work">водители</a> не просто считают необходимостью ежедневно совершать <a href="http://allotaxi.od.ua/taxi-price">перевозки</a>, но и получают удовольствие от вождения автомобиля. Использования собственного авто для ежедневных потребностей приносит водителям радость и оказывает релаксирующее воздействие. Собственный автомобиль дает своему владельцу ощущение свободы. В будущем не ожидается уменьшения числа автотранспорта на дорогах.</p>\r\n', 'Приобретение автомобилей в будущем', 'ab9166e0e4ad219d630da88c7d3301ed.jpg', '2015-03-16 15:24'),
(6720, 0, '<p>Победителем конкурса 2015 года в Украине стала&nbsp; Mazda3. 12 февраля были объявлены итоги конкурса &laquo;Автомобиль Года 2015&raquo; в зале Национального транспортного университета в Украине. Автомобилем года была признана Mazda3.</p>\r\n\r\n<p>На треке спорткомплекса Чайка был проведен конкурс, в результате которого были выбраны такие финалисты: Citroen C4 Picasso, Acura MDX, Infiniti Q50, Hyundai Elantra, Lexus NX, Mercedes-Benz GLA, Mazda3, Nissan Qashqai, Skoda Spaceback, Peugeot 2008.</p>\r\n\r\n<p>Премьера нового автомобиля Mazda3 состоялась осенью 2013 года на автошоу в Франкфурте. В Украине данная модель была представлена с тремя разными двигателями &ndash; классическим MRZ 1.6 с механической коробкой передач, SKYACTIV-G 1,5, а также SKYACTIV-G 2.0 с автоматической трансмиссией.</p>\r\n\r\n<p>В конкурсе &quot;Автомобиль Года 2015&quot; были выбраны такие победители:</p>\r\n\r\n<ul>\r\n	<li><span style="line-height: 1.6em;">Дизайн &ndash; Audi A7 Sportback</span></li>\r\n	<li>Компактый класс &ndash; Hyundai Elantra</li>\r\n	<li>Малый класс &ndash; Skoda Spaceback</li>\r\n	<li>Бизнес-класс &ndash; Toyota Camry</li>\r\n	<li>По соотношению <a href="http://allotaxi.od.ua/luchshie-tsenyi">цена</a>/качество &ndash; Nissan Qashqai</li>\r\n	<li>Полноразмерный SUV &ndash; BMW X6</li>\r\n</ul>\r\n', ' Автомобиль 2015 года в Украине', '3ef791601d7c4e83c232f78a3d15f3ec.jpg', '2015-03-23 15:23'),
(6721, 0, '<p>В первых числах марта <a href="http://allotaxi.od.ua/luchshie-tsenyi">цены</a> на бензин всё ещё остаются на высоких позициях. Однако тенденция к резкому подорожанию постепенно начинает отступать. Стремительный рост цен на бензин, обусловленный беспрецедентной девальвацией гривны, прекратился. Некоторые заправки в Украине сегодня уже снижают цены на 0,5-1 грн.</p>\r\n\r\n<p>В результате, за прошедшие выходные средневзвешенная стоимость &laquo;второго&raquo; и&nbsp; &laquo;пятого&raquo; бензина снизилась на 6 копеек &ndash; до 26,6 грн/л и 27,1 грн/л. Данные предоставлены Консалтинговой группой &laquo;А-95&raquo; в результате проведенного недавно мониторинга.</p>\r\n\r\n<p>Тем не менее, на данный момент, крупные розничные сети оставляют стоимость бензина на высоких позициях. Ведущие заправщики продают &laquo;двойку&raquo; по 27,50 грн/л, &laquo;пятёрку&raquo; - по 28 грн/л, так же, как и в последние дни февраля. В экономных сетях можно найти топливо для вашего автомобиля на 1,5- 2 грн. дешевле.</p>\r\n\r\n<p>На сегодняшний день, по оценкам экспертов, средний уровень цен на бензин соответствует курсу &ndash; 30 грн/доллар. Поскольку 90% бензина в Украину импортируют, в условиях дальнейшей девальвации гривны стоимость топлива продолжит расти.</p>\r\n', 'Волна резкого подорожания бензина постепенно утихает', '813c23b53f7a8464b6c39d721a03ddce.jpg', '2015-03-30 15:22'),
(6722, 0, '<p>Услуги будут представлены ГП &laquo;Управлением по эксплуатации имущественного комплекса&raquo; Минфина. Были заказаны услуги внедорожника Folkswagen Touareg, выпуска после 2007 года. Автомобиль будет оснащен подогревом сидений, климат-контролем. В арендную плату входят <a href="http://allotaxi.od.ua/taxi-work">услуги водителя</a>, уборка, бензин, техническое обслуживание и ремонт авто. <a href="http://allotaxi.od.ua/luchshie-tsenyi">Цена</a> услуг данного автомобиля составит 17 грн.</p>\r\n\r\n<p>Минфин акцептовал предложение по услугам <a href="http://allotaxi.od.ua/">такси</a> на 1,25 млн грн. На тендер поступило предложение стоимостью 0,72 млн грн., однако оно было отклонено в связи с отсутствием некоторых документов и справок.</p>\r\n\r\n<p>Как сообщает заказчик, внедорожный автомобиль будет использован не только на благоустроенных дорогах с твёрдым асфальтовым покрытием. В прошлом году для услуг такси Минфоном было использовано десять автомобилей: Фольксваген Пассат, Фольксваген Туарег, Мерседес-Бенц. Услуги данных автомобилей обошлись в 4,75 млн грн. Год назад правительством было ограничено количество легковых автомобилей, которые используются органами исполнительной власти. Для министров предусмотрено по одному автомобилю, остальные машины должны быть распроданы.</p>\r\n', 'Министерством финансов Украины были заказаны услуги такси на 1,25 миллионов гривен', '05eeb1a9e958c61deef5cac0560ef170.jpg', '2015-04-06 15:20'),
(6723, 0, '<p>В 2016 году украинские дороги общего пользования ожидает возрождение. В противном случае Украина потеряла бы большую часть транспортного потенциала и дорожной сети. Такие выводы сделали члены общественного совета при Государственном агентстве автомобильных дорог Украины в процессе очередного заседания.</p>\r\n\r\n<p><span style="line-height: 1.6em;">Председатель Всеукраинского объединения организаций <a href="http://allotaxi.od.ua/taxi-work">работодателей</a> транспорта &laquo;Федерация работодателей транспорта Украины&raquo; Орест Климпуш заявил, что дорога является рабочим местом <a href="http://allotaxi.od.ua/taxi-price">перевозчиков</a>, и от основных её характеристик зависит качество, скорость&nbsp;<a href="http://allotaxi.od.ua/perevozka-gruzov">перевозок</a>, а главное &ndash; <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасность</a> водителей и пассажиров.</span></p>\r\n\r\n<p>Укравтодор должен обеспечить ямочный ремонт, в результате которого будут предупреждены разрушения, а также текущий средний и капитальный ремонты и реконструкции для реанимирования автомобильных&nbsp; дорог. Проведение данных работ необходимо, поскольку из-за неудовлетворительного состояния дорог водители не могут гарантировать безопасность, оперативность и своевременность перевозок. Подобное состояние дорог противоречит всем международным нормам, что делает Украину неконкурентоспособной в качестве международного перевозчика. &nbsp;</p>\r\n\r\n<p>Одним из возможных вариантов решения вышеперечисленных проблем руководство Укравтодора видит в возобновлении финансирования дорожного хозяйства, а затем &ndash; создание защищённого Государственного дорожного фонда.&nbsp;</p>\r\n', 'Украинские дороги в 2016 будут кардинально ремонтироваться', 'aa1d0d154c852a3ace84abaea3af6a1e.jpg', '2015-04-13 15:20'),
(6734, 0, '<p>Первые тестовые <a href="http://allotaxi.od.ua/taxi-price">поездки</a> на автомобиле Bloodhound будут совершены уже в ноябре этого года, как сообщила команда разработчиков сверхзвукового <a href="http://allotaxi.od.ua/peregon-avto">авто</a>. Команда готовится к новому мировому рекорду скорости на поверхности земли. <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">Максимальная скорость</a> должна составлять 1,000 миль/ч (1,609 км/с).</p>\r\n\r\n<p>Данный проект&nbsp; возглавляют директор Ричард Нобл и <a href="http://allotaxi.od.ua/taxi-work">водитель</a> Энди Грин. Они уже сотрудничали вместе и работали над сверхзвуковыми автомобилями. Это был знаменитый проект Thrust, на котором Грин установил мировой рекорд&nbsp; скорости 15 октября 1997 года в пустыне Блэк-Рок, штат Невада, США, достигнув скорость - 1,227.985 км/ч.</p>\r\n\r\n<p>О своем намерении установить новый мировой рекорд команда заявила в 2008 году. Уже был проведен ряд основных экспериментов: тесты ракетного двигателя, тесты связи, а также была представлена кабина пилота. Первый заезд произойдёт 17 ноября 2015 &nbsp;на базе аэропорта Ньюквей в Корнуолле со скоростью всего 322 км/ч. В том случае, если первые испытания пройдут удачно, автомобиль будет оснащен крыльями и воздушными тормозами.</p>\r\n', 'В конце года начнутся испытания сверхзвукового автомобиля Bloodhound', '998ca0c0b1108c0247bbb33b9364f6e6.jpg', '2015-06-23 15:02'),
(6735, 0, '<p>Лето этого года радует автовладельцев непостоянной погодой. Ваше <a href="http://allotaxi.od.ua/peregon-avto">авто</a> может попасть как под яркие солнечные лучи, так и под проливной дождь.</p>\r\n\r\n<p>Нередко происходят такие ситуации, когда оставить машину возможно только на солнцепеке. Если у вас сложились такие обстоятельства, следует позаботиться о салоне автомобиля. Пластиковые детали салона очень быстро нагреваются и затем могут потрескаться. Если вы оставляете автомобиль на солнце, прикройте пластиковые детали подручными материалами или используйте солнцеотражающий экран под стекло.</p>\r\n\r\n<p>Под воздействием солнечных лучей, вследствие перенагревания, шины&nbsp; быстрее стареют. Образование микротрещин может привести к преждевременному разрыву шины. Если авто стоит на длительном хранении, колеса следует обязательно чем-то накрыть. Машина, припаркованная на солнечной площадке, также нуждается в защите от солнца. При кратковременных стоянках, старайтесь оставлять машину таким образом, чтобы солнце меньше попадало на колеса.</p>\r\n\r\n<p>Вода, накопившаяся во время ливня, может стать причиной коррозии, а также отказа дверных механизмов, центрального замка и стеклоподъёмников. Сразу после ливня необходимо открыть двери и подождать пока вода вытечет через дренажные отверстия. Гидроудар для двигателя &ndash; это самое страшное. Как правило, такое случается чаще всего с моделями, у которых низко расположен воздухозаборник. Будьте осторожны во время ливня за рулем, вода может попасть от волны встречного грузовика. Лучше всего в такую погоду не садиться за руль.</p>\r\n', 'Влияние жары и дождя на автомобиль', '4e7d4ee6c4c2ae0d239738712e62a12e.jpg', '2015-07-01 15:01'),
(6736, 0, '<p>Рынок <a href="http://allotaxi.od.ua/peregon-avto">авто</a> всё время эволюционирует. Производители регулярно презентуют всему миру новые модели. Какие-то автомобили не становятся популярными и востребованными, другие же остаются на рынке надолго, приобретая настоящий успех и спрос у покупателей.</p>\r\n\r\n<p>Мы предлагаем вам вспомнить самые удачные модели всех времен от знаменитых производителей.</p>\r\n\r\n<p>Rolls-Royce Phantom: 90 лет. Первый автомобиль Rolls-Royce Phantom появился на свет в 1925 году и сразу стал популярным среди аристократов тех времен. Привязанность почитателей этой марки сохранилась и до сих пор.</p>\r\n\r\n<p>Fiat 500: 79 лет. Первое появление на рынке Fiat 500 произошло ещё в 1936 году. Итальянцы сразу придумали этой машине оригинальное прозвище Topolino (мышка). Эта модель была одной из самых компактных в мире.</p>\r\n\r\n<p>Volkswagen Beetle: 69 лет. Впервые&nbsp; Volkswagen Beetle был представлен миру в 1933 году. Дизайн &laquo;Жука&raquo; был разработан Адольфом Гитлером, и подразумевалось, что этот автомобиль будет доступен небогатым немецким семьям. Однако массовое производство этого авто так и не началось. Официально &laquo;Жук&raquo; появился на свет в 1946 году, когда руководство над заводом Volkswagen перешло к англичанам.</p>\r\n\r\n<p>Ford Mustang: 51 год. Культовый автомобиль появился в 1964 году и в наши дни остаётся идеалом для любителей мощных моторов и <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">скорости</a>. Интересно, что название данного авто связано не с лошадью, а с воздушным истребителем второй мировой войны - P-51 Mustang.</p>\r\n', 'Выдающиеся долгожители автомобильной индустрии', '5fdd7adb98c81c395314b4a9936ddcc7.jpg', '2015-07-07 15:00'),
(6737, 0, '<p>Премьер-министр Украины Арсений Яценюк во время одного из своих выступлений предложил провести очень интересный и нацеленный на результат эксперимент. Его суть заключается в том, чтобы отдавать Одесской области половину поступлений, которые приносит сверхплановая работа региональной таможни.</p>\r\n\r\n<p>Премьер-министр на совещании в Государственной фискальной службе объяснил, что по Одесской региональной таможне есть плановые поступления, которые регулярно идут в государственный бюджет. Правительство предложило все денежные средства, которые поступили выше плана разделять пополам. 50 % будет как обычно поступать в казну государства, а другая половина будет идти Одессе. Таким образом, у Одессы будет существенный дополнительный доход, который можно использовать для лучшего обустройства региона.</p>\r\n\r\n<p>На сегодняшний день известно, куда пойдут первые поступления. Кабинет Министров Украины провел переговоры с Михаилом Саакашвили, который является председателем Одесской обладминистрации, и обе стороны приняли решения направить дополнительные денежные средства от <a href="http://allotaxi.od.ua/taxi-work">работы</a> региональной таможни на строительство дороги Одесса-Рени.</p>\r\n', 'Дополнительные финансовые поступления на строительство дороги Одесса-Рени', 'b8f756a1900fba6bcc29714d7f5cbf3f.jpeg', '2015-07-14 14:57'),
(6738, 0, '<p>Китайские ученые уже провели первые испытания по управлению автомобилем силой мысли. Эксперимент был проведен исследовательской группой, которая состояла из ученых &nbsp;Нанькайского университета в Тяньцзине и экспертов <a href="http://allotaxi.od.ua/taxi-about-us">компании</a> Great Wall, как сообщило агентство &laquo;Синьхуа&raquo;.</p>\r\n\r\n<p>Первое испытание было проведено 15 июля 2015 года. Во время эксперимента в автомобиле находился <a href="http://allotaxi.od.ua/taxi-work">водитель</a>, к голове которого было подключено 16 датчиков. Распознавая сигналы, подаваемые мозгом, сенсоры передавали их в специальную систему, которая расшифровывала их и переадресовывала на механизмы управления автомобилем.</p>\r\n\r\n<p>На данный момент экспериментальное <a href="http://allotaxi.od.ua/peregon-avto">авто</a> способно распознать и выполнить только несколько простых команд, которые были отданы силой мысли, таких как движение вперед-назад или открытие-закрытие замка. Ученые полагают, что положенное начало является неплохим результатом, что со временем приведет к колоссальным открытиям. Однако на данный момент системе потребуется ряд доработок.</p>\r\n', 'В Китае разработали систему управления автомобилем силой мысли', '13535c53a8b0001471cca7b010841998.jpg', '2015-07-21 14:56'),
(6759, 0, '<p>Украинская <a href="http://allotaxi.od.ua/taxi-about-us">компания</a> Rentechno приступила к созданию домашних солнечных зарядных станций для электромобилей. Данная станция вполне может конкурировать с аналогами американского производства, а её стоимость в 5 раз ниже.</p>\r\n\r\n<p>Домашний вариант такой станции для электромобилей выполнен в виде &laquo;крыши&raquo;. За один день она накапливает энергию, а ночью от неё заряжают <a href="http://allotaxi.od.ua/peregon-avto">авто</a>. На сегодняшний день такие станции изготавливают по индивидуальному заказу, планируется, что в будущем будет налажено серийное производство таких машин.</p>\r\n\r\n<p>Компания Rentechno также занимается сбором настенных станций. Их <a href="http://allotaxi.od.ua/luchshie-tsenyi">стоимость</a> начинается с 24&nbsp;000 грн. цена станций-колонок составляет около 30&nbsp;000 &ndash; 60&nbsp;000 грн. Как правило, стоимость зависит от скорости зарядки и необходимой мощности. Предлагают 2 типа зарядных станций: на 3 и на 5 кВт. Станция на 3 кВт подходит для зарядки одного автомобиля, а станция на 5 кВт подходит для двух авто. Станции для зарядки электрокара служат от 5 до 20-25 лет. Для того, чтобы использовать такую станцию, специальное разрешение не требуется, как утверждают представители компании Rentechno.</p>\r\n', 'Украина может быть конкурентом США в производстве солнечных заправок', 'bf67345f2f03b8535c5ea1085a4cc25e.jpg', '2015-08-31 15:39'),
(6760, 0, '<p>Начиная с 2016 года, ежегодный техосмотр <a href="http://allotaxi.od.ua/peregon-avto">авто</a>&nbsp;снова должен будет производиться в обязательном порядке. Данную информацию предоставил Олег Назаренко, глава Всеукраинской ассоциации автомобильных импортеров и дилеров, ссылаясь на внутренние источники в Минфине. По его словам проект о внедрении обязательного ТО сейчас находится на этапе согласования в министерстве финансов.</p>\r\n\r\n<p>Вероятность того, что решение о возврате обязательного ТО будет поддержано министерством, довольно высока по ряду следующих причин:</p>\r\n\r\n<ol>\r\n	<li>Проведение обязательного ТО было предусмотрено в Соглашении об ассоциации с ЕС. С 1 января 2015 года в странах Евросоюза действует Директива ЕС о всеобщем техосмотре. А украинское правительство обязано ввести аналогичную норму в начале 2016 или 2017 года.</li>\r\n	<li>Отсутствие ТО затрудняет контроль <a href="http://allotaxi.od.ua/beznalichnii-raschet">выплат</a> транспортного налога.</li>\r\n</ol>\r\n\r\n<p>Обязательный техосмотр был отменен ещё в 2011 году. Несмотря на то, что данная процедура была сопряжена с коррупционными схемами и сотрудники ГАИ не справлялись с ежегодной проверкой из-за большого числа автомобилей, проведение ежегодного ТО помогает оптимизировать ситуацию на дорогах.</p>\r\n', 'Обязательный техосмотр может стать необходимостью', '2a2c70f9848d51aec4b53cf90b855e05.jpg', '2015-09-07 10:59'),
(6761, 0, '<p>Компания Geely будет первым производителем, чьи автомобили обеспечат поддержку мультимедийными системами оболочки Apple CarPlay, таким образом будет организована максимальная совместимость с iPhone и другими продуктами Apple.</p>\r\n\r\n<p><a href="http://allotaxi.od.ua/taxi-about-us">Компания</a> Geely ориентируется на широкую интеграцию с интернет-сервисами и на внедрение технологий автономного управления, как заявил основатель Geely - Ли Шуфу. Целью компании становится соответствие наивысшим мировым стандартам автомобилестроения в области <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасности</a> и комфорта.</p>\r\n\r\n<p>Планируется, что первой моделью Geely с Apple CarPlay станет кроссовер NL-3. Дебют данной модели запланирован на конец 2015 года. А первые автомобили появятся в салонах уже в начале 2016 года. Пока судить о будущем кроссовере позволяют тизеры и неофициальная информация о том, что в данных машинах будут установлены 1,8-литровые бензиновые моторы в атмосферной и турбированной версиях и 2,4-литровый двигатель также бензиновый.</p>\r\n', 'До конца 2015 года ожидается появление нового кроссовера Geely, который будет поддерживать Apple CarPlay', 'cc28dca230f21b2d2f807a8cb9284069.jpg', '2015-09-14 11:56'),
(6762, 0, '<p>Купные авто-производители будут оснащать свои машины системами автоматического торможения даже в базовых комплектациях. Грядет революция <a href="http://allotaxi.od.ua/skorost-i-bezopasnost">безопасности</a>. Данное нововведение можно сравнить по его масштабам с массовым внедрением подушек безопасности в 80-х годах.</p>\r\n\r\n<p>Автоматическое аварийное торможение &ndash; это проверенная и распространенная система, которая способна контролировать обстановку на дороге с помощью радара, камеры и лазера. В случае возникновения опасной ситуации, она автоматически срабатывает и машина тормозит. На сегодняшний день такая система <a href="http://allotaxi.od.ua/taxi-work">работает</a> только как дополнительная опция. Поэтому правительством США и ведущими автопроизводителями было принято решение сделать эту функцию обязательной. Инициативу поддерживают такие <a href="http://allotaxi.od.ua/taxi-about-us">компании</a>: Volkswagen, BMW, Audi,&nbsp; Ford, Volvo, General, Mazda, Mercedes-Benz, Daimler, Tesla и Toyota.</p>\r\n', 'Системы автоматического торможения скоро станут нормой для всех автолюбителей', 'da840c0bdf79c9d877106edfc213ccb0.jpg', '2015-09-21 15:49'),
(6763, 0, '<p>В ВР Украины был зарегистрирован законопроект № 3130 от 17.09.2015 о внесении изменений в Кодекс Украины об административных правонарушениях.</p>\r\n\r\n<p>Согласно предложенному законопроекту, <a href="http://allotaxi.od.ua/taxi-work">водителей</a> за нарушения ПДД, которые спровоцированы необходимостью объезда разбитой дороги, в том числе выезда при этом на встречную полосу не будут привлекать к ответственности.</p>\r\n\r\n<p>В законопроекте уточняется, что не все случаи подобных нарушений подлежат аннулированию, а лишь те, которые зафиксированы на соответственные камеры фото- или видеофиксации.</p>\r\n\r\n<p>&nbsp;Законопроектом урегулирован порядок привлечения к административной ответственности за такие нарушения, а также места, где можно и нужно устанавливать фиксирующие камеры.</p>\r\n\r\n<p>Законодатели объяснили необходимость принятия законопроекта критическим состоянием автодорог во множестве населенных пунктов Украины. Плачевная ситуация с качеством дорог вынуждает водителей нарушать ПДД. После принятия законопроекта водители будут привлекаться к админ ответственности за нарушения ПДД, зафиксированные на специальные устройства, исключительно на дорогах, которые соответствуют украинским госстандартам.</p>\r\n', 'Штрафы за нарушения ПДД на плохих дорогах хотят отменить', 'd91649e038c302df1031ee5d8a9abada.jpg', '2015-09-28 16:33'),
(6764, 0, '<p>В музее авиации, возле киевского аэропорта &laquo;Жуляны&raquo; прошел фестиваль ретро-автомобилей под названием &laquo;Old Car Fest&raquo;.</p>\r\n\r\n<p>Открытие фестиваля было отмечено 2 октября в музее авиации. Здесь вниманию всех посетителей было представлено множество самых разных моделей ретро-автомобилей, а также авиамоделей, мотоциклов, военной техники. На данной территории проходили всевозможные выступления, <a href="http://allotaxi.od.ua/bonusi-i-skidki">конкурсы</a> и концерты. В частности зрителей порадовало выступление байкеров-экстремалов. Все желающие имели уникальную возможность окунуться в волшебный мир раритетных <a href="http://allotaxi.od.ua/peregon-avto">авто</a> и уникальных моделей. Аналогичные мероприятия планируют проводить и в других городах Украины.</p>\r\n', 'В столице состоялся фестиваль ретро-автомобилей', '0a902c4534bd5c25336b043a8b614b6a.jpg', '2015-10-05 16:20');
INSERT INTO `type_news` (`type_news_id`, `type_news_pid`, `type_news_content`, `type_news_header`, `type_news_img`, `type_news_date`) VALUES
(6765, 0, '<p>Список самых качественных автомобилей был составлен с помощью опросов автомобилистов спустя 90 дней после приобретения машины. На основе исследования <a href="http://allotaxi.od.ua/taxi-about-us">компания</a> J.D. Power and Associates выяснила, какие автомобили сегодня являются наиболее качественными и имеют меньше всего каких-либо неисправностей.</p>\r\n\r\n<p>Представителями компании J.D. Power and Associates было опрошено около 84 тысяч <a href="http://allotaxi.od.ua/taxi-work">водителей</a>&nbsp;из числа тех, кто недавно приобрел автомобиль. Распространённые дефекты были связаны с бортовой электроникой. А также нередко проблемы встречались с проблемой распознавания голосов команд навигации.</p>\r\n\r\n<p>Самым надежным производителем был признан Porsche, в результате проведения опроса. Следующей машиной, впервые в истории, стала KIA. Jaguar стала следующей в рейтинге, а затем идет Hyundai. Рейтинг Initial Quality Study проводится уже 29-ый раз.</p>\r\n', 'Самые качественные автомобили 2015 года', '37f1861b334283c4875f573a70293b22.jpg', '2015-10-12 15:33'),
(6766, 0, '<p>Первое поколение Volkswagen Phaeton появилось на рынке в 2002 году и представляло собой один из любимых проектов Фердинанда Пиеха. Однако в Европе этот автомобиль не стал особо популярным. Его опередили Mercedes класса S и BMW 7-ой серии. Наибольшую популярность Volkswagen Phaeton приобрел в странах Востока. Более 70% данной марки <a href="http://allotaxi.od.ua/peregon-avto">автомобиля</a> продается в Азии.</p>\r\n\r\n<p>Сегодня на рынок выходит Volkswagen Phaeton нового поколения. Флагман компании Вольфсбурга получит электрическую силовую установку, рассчитанную на напряжение 800 Вольт, она позволит автомобилю проезжать на одном заряде 500 км. А заряжать аккумулятор Volkswagen Phaeton можно будут всего лишь за 15 минут. Место проведения презентации и другие подробности о новом автомобиле пока неизвестны.</p>\r\n', 'Volkswagen Phaeton станет электромобилем', '6dba2db136cf95cb05597f257aa38b68.jpg', '2015-10-19 12:44'),
(6767, 0, '<p>Нередко, с наступлением холодов, возникает необходимость в утеплении двигателя автомобиля. Как правило, <a href="http://allotaxi.od.ua/taxi-work">водители</a> используют термоизолирующий материал, который устанавливается между радиатором и решеткой. Бывает, что автолюбители, которые наспех хотят решить данный вопрос, используют картон, более ответственные автомобилисты приобретают синтетические материалы для утепления.</p>\r\n\r\n<p>Заслонку устанавливают собственноручно, используя минеральную вату, фольгированный полипропилен и другие материалы. Производители автомобилей выпускают новые модели с системой теплоизоляции двигателя.</p>\r\n\r\n<p>В зимний период утепление автомобиля необходимо. Снег, растаявший на капоте, может попасть внутрь. Затем вода может образовать слой льда внутри на деталях. Специальные системы теплоизоляции помогут защитить ваше <a href="http://allotaxi.od.ua/peregon-avto">авто</a> от непредвиденных последствий. Для устранения продувания вы можете уплотнить стыки между капотом и кузовными деталями.</p>\r\n', 'Утепление двигателя', '00dc1cf4aa7a6da94919a39090296007.jpg', '2015-10-26 14:35'),
(6768, 0, '<p>Дорожный адвокат и правозащитник Владимир Караваев оповестил, что законодатели отменили презумпцию невиновности.</p>\r\n\r\n<p>Во время обсуждения законодательных реформ для создания полиции правительство было намерено прямо указать в Админкодексе, что презумпция невиновности не распространяется на <a href="http://allotaxi.od.ua/taxi-work">водителей</a>. Однако депутаты не согласились с поправкой, и она не прошла. Но затем изменения все равно были введены.</p>\r\n\r\n<p>По законодательству, сотрудники полиции, в отличие от ГАИ, не обязаны составлять Протокол по делу об админправонарушении. А сразу оформляется Постановление, без указания доказательств и пояснений обвиняемого. Все пояснения происходят уже в суде. Однако в соответствии с требованиями ст. 213 КУоАП: &quot;Справи про адміністративні правопорушення розглядаються: органами внутрішніх справ&hellip;&quot;. А поскольку полиция является &quot;органом виконавчої влади&quot;, сотрудники полиции вообще не имеют права рассматривать такие дела. Но законодательное несоответствие было проигнорировано депутатами, сообщает Владимир Караваев.</p>\r\n', 'Презумпция невиновности водителей была отменена', 'fccacdd3fdeaf66e54fda777e84c064e.jpg', '2015-11-02 11:49'),
(6769, 0, '<p>Украина полностью отказалась от милиции, и теперь в нашей стране действует только полиция. Нововведения непосредственным образом коснутся граждан Украины. Для того, чтобы не выплачивать штраф, автомобилисты должны будут беречь 150 баллов, которые станут начисляться ежегодно. За каждое нарушения будет сниматься 50 баллов. Таким образом, 3 раза нарушив правила, <a href="http://allotaxi.od.ua/taxi-work">водитель</a> вынужден будет выплачивать штраф. В том случае, если за год нарушения не будут совершены, в будущем году будет начислено также 150 баллов, накопительная система к данному закону не применяется, прошлогодний лимит будет обнуляться.</p>\r\n\r\n<p>К числу нарушений будут отнесены: проезд по встречной полосе, проезд по тротуару или пешеходным дорожкам, превышение скорости, проезд на запрещающие сигналы, парковка в запрещенном месте, проезд по полосе для общественного транспорта.</p>\r\n', 'С сегодняшнего дня для автомобилистов вступают в силу новые правила', '97005f515c8ec4179e4fe1c56ede2a67.jpg', '2015-11-09 14:12'),
(6770, 0, '<p>С 7 ноября в ПДД появились изменения, направленные на то, чтобы облегчить жизнь автомобилистам. Нововведения в основном касаются &laquo;штрафных баллов&raquo; фиксации нарушения, а также некоторых других изменений, которые были внесены в систему штрафов.</p>\r\n\r\n<p>С настоящего момента все граждане Украины, которые получили право на вождение транспортного средства, ежегодно будут получать 150 баллов, которые будут сниматься в случае правонарушений &ndash; по 50 баллов за один раз. Те баллы, что не были потрачены, потом учитываться не будут.</p>\r\n\r\n<p>На дорогах Украины опять появится автоматическая система фото- и видеофиксации правил дорожного движения. Обработку результатов автофиксации будут проводить сотрудники полиции. Информацию о тех нарушениях, что были автоматически зафиксированы, <a href="http://allotaxi.od.ua/taxi-work">водитель</a> получит на электронную почту или на мобильный телефон.</p>\r\n\r\n<p>А также теперь в нашей стране действует система поощрения для тех, кто своевременно оплачивает штрафы. Оплачивая нарушение, зафиксированное в автоматическом режиме, в течение пяти дней со дня получения постановления, водитель может внести половину суммы штрафа. Станет возможна <a href="http://allotaxi.od.ua/beznalichnii-raschet">безналичная оплата</a> &mdash;&nbsp; через терминал, на месте, где было совершено нарушение.</p>\r\n', 'Нововведения в правилах дорожного движения', 'cb0652acc06aa54ef2b456538f1e7385.png', '2015-11-23 12:44'),
(6771, 0, '<p>Теперь справку о ДТП полицейские не выдают. Соответственно, нести ее в страховую <a href="http://allotaxi.od.ua/taxi-about-us">компанию</a> также нет необходимости.</p>\r\n\r\n<p>От управления национальной полиции было разослано письмо, в котором было уведомление об отмене первичных справок о ДТП. Письмо от Управления национальной полиции было отправлено в Национальную комиссию по регулированию рынка страховых <a href="http://allotaxi.od.ua/taxi-price">услуг</a>, Лигу страховых организаций, а также в Моторное бюро.</p>\r\n\r\n<p>В письме сообщается о том, что согласно Закону о национальной полиции в тех городах, где есть новая патрульная полиция, после аварий не выдаются первичные справки о ДТП. В письме также говорится о том, что страховые компании не должны требовать данную справку, в особенности в тех городах, где действует новая полиция (Киев, Одесса, Львов и Харьков). В тех городах, где еще <a href="http://allotaxi.od.ua/taxi-work">работает</a> бывшая ГАИ, справки еще выдаются, но после замены правоохранителей на полицейских, первичная справка выдаваться не будет.</p>\r\n', 'Справка о ДТП для водителей в Украине была отменена', '7aa9df856586bd2bc03802d8c2e15c4f.jpg', '2015-11-30 16:09'),
(6772, 0, '<p>С 1 февраля 2016 года в Украине планируют увеличить <a href="http://allotaxi.od.ua/luchshie-tsenyi">суммы</a> выплат за ущерб имуществу тех, кто пострадал от ДТП, в случае оформления по европротоколу без участия полиции. Нацкомфинуслуг утвердила соответствующий проект.</p>\r\n\r\n<p>В соответствии с данным проектом распоряжения, с использованием европротокола максимальные выплаты будет увеличены с 25 тысяч гривен до 50 тыс. грн. Планируется, что такие изменения позволят частично <a href="http://allotaxi.od.ua/perevozka-gruzov">разгрузить</a> патрульную полицию от оформления ДТП и предоставить возможность полицейским уделить время более важным задачам.</p>\r\n\r\n<p>По данным Моторного страхового бюро Украины, сумма в заявленных страховых случаях с европротоколом постоянно растет. В 2013 году максимальный размер страховой <a href="http://allotaxi.od.ua/beznalichnii-raschet">выплаты</a> был увеличен с 10 тыс. грн. до 25 тыс. грн.</p>\r\n\r\n<p>Европротоколы ввели в Украине в 2011 году. Оформляя ДТП с таким протоколом, <a href="http://allotaxi.od.ua/taxi-work">водители</a> могут получить страховые выплаты, не вызывая полицейских к месту аварии.</p>\r\n', 'Страховые выплаты для автомобилистов будут увеличены в два раза', '31725cd62e6a5fe53e0808f7a2af881a.jpg', '2015-12-10 10:17'),
(6777, 0, '<p>В верховной Раде был зарегистрирован законопроект &laquo;О внесении изменений в некоторые законодательные акты относительно урегулирования работы <a href="http://allotaxi.od.ua/">такси</a>, легковых автомобилей на заказ и информационно-диспетчерских служб&raquo;, согласно которому все машины должны быть оснащены таксометрами, обклеены шашечками и опознавательными знаками. Также депутаты предлагают оснастить автомобили огоньками &laquo;занят/свободен&raquo;.</p>\r\n\r\n<p>В пояснительной записке к данному проекту говорится о том, что на сегодняшний день численность лиц, задействованных в <a href="http://allotaxi.od.ua/taxi-price">перевозках</a>, составляет около 200&nbsp;000 человек. Столько же человек ездят нелегально. Также отмечается, что около 85% участников рынка <a href="http://allotaxi.od.ua/perevozka-gruzov">перевозок на такси</a> по Украине занимаются этой деятельностью вне правового поля. Для того, чтобы решить данную проблему, депутаты предлагают начать выдавать лицензии субъектом этого рынка.</p>\r\n', 'Депутаты планируют урегулировать работу такси', '884e707fb7628ba161707cadf28fac82.jpg', '2015-12-14 15:18'),
(6780, 0, '<p>В Одессе приступила к работе первая служба такси для инвалидов-колясочников, которая называется &laquo;Турбота&raquo;. Идея создания данной службы принадлежит переселенцу из зоны АТО Виталию Кравченко, который сам является человеком с ограниченными физическими возможностями, и знает, как тяжело вести полноценный образ в жизни людям в колясках.</p>\r\n\r\n<p>Средства для покупки специализированного автомобиля были предоставлены спонсорами в рамках программы малого бизнеса и самозанятости внутренне перемещенных лиц &laquo;Новый отсчет&raquo;. Автомобиль-такси был оснащен складным пандусом для размещения внутри максимального количества колясок. Таким образом, здесь могут разместиться 8 <a href="http://allotaxi.od.ua/taxi-price">пассажиров</a> в восьми колясках. На оборудование микроавтобуса понадобилось более 200 тысяч гривен.</p>\r\n\r\n<p>Тарифы на проезд в новом такси &laquo;Турбота&raquo; такие же, как для обычного <a href="http://allotaxi.od.ua/">такси</a>.</p>\r\n', 'В Одессе появилась служба такси для инвалидов-колясочников', 'fa995430482b38e06a303e80f1654036.jpg', '2016-01-25 16:19'),
(6781, 0, '<p>Теперь грузовой транспорт имеет возможность проезжать по трассе Одесса-Рени. Эту информацию предоставил пресс-центр Службы автомобильных дорог в Одесской области.</p>\r\n\r\n<p>1 февраля в 14:00 на трассе М-15 снялись ограничения на перемещение грузового транспорта. Данные ограничения были установлены в связи с погодными условиями. С того момента, как снег растаял, <a href="http://allotaxi.od.ua/taxi-price">грузовые</a> автомобили могут перемещаться по любым трассам области.</p>\r\n\r\n<p>Во время снегопадов ситуация на трассе Одесса-Рени была катастрофической. Автомобили не могли проехать и застревали вдоль нерасчищенной дороги.</p>\r\n', 'Открывается трасса Одесса-Рени для грузовых автомобилей', 'c1214166c3089986c1c8b36c46c7a3f4.JPG', '2016-02-01 14:45'),
(6782, 0, '<p>После того, как Госавтоинспекция была закрыта, в сервисных центрах &nbsp;МВД произошла реформа, неизвестно, кто будет выдавать разрешения учебным заведениям. На данный момент украинские автошколы столкнулись с проблемой аккредитации.</p>\r\n\r\n<p>Аттестация преподавателей и выдача сертификатов об аккредитации приостановилась еще в октябре 2015 года. Информация об этом была предоставлена Всеукраинским объединением автошкол. После того, как произошла ликвидация ГАИ, выдавать разрешения должны были сервисные центры МВД, но пока такие полномочия они не получили.</p>\r\n\r\n<p>Сейчас те заведения, у которых уже закончилась пятилетняя аккредитация, отправляют сотрудников в отпуск за свой счет. Если неясная ситуация во внутренних приказах Министерства внутренних дел и государственных органов не будет решена, около 2800 автошкол &nbsp;по всей Украине останутся без работы.</p>\r\n\r\n<p>Наблюдается еще одна проблема, связанная с отсутствием аккредитации в автошколах. Ученики не могут получить свидетельство об окончании курсов. В МВД обещают исправить возникшие проблемы в ближайшее время.</p>\r\n', 'Автошколы оказались на грани закрытия', 'af40a6d783daac5e3fbe1a061e2872cd.jpg', '2016-02-08 15:44');

-- --------------------------------------------------------

--
-- Структура таблицы `type_node`
--

CREATE TABLE IF NOT EXISTS `type_node` (
  `type_node_id` int(10) unsigned NOT NULL,
  `type_node_pid` int(10) unsigned NOT NULL,
  `type_node_title` varchar(500) NOT NULL,
  `type_node_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_node`
--

INSERT INTO `type_node` (`type_node_id`, `type_node_pid`, `type_node_title`, `type_node_content`) VALUES
(539, 0, '', ''),
(541, 0, '', ''),
(3210, 0, '', ''),
(3234, 0, '', ''),
(3241, 0, '', ''),
(2393, 0, '', ''),
(2430, 0, '', ''),
(2572, 0, '', ''),
(6637, 0, '', ''),
(6655, 0, '', ''),
(6664, 0, '', ''),
(6694, 0, '', ''),
(6714, 0, '', ''),
(6753, 0, '', ''),
(6783, 0, '', ''),
(6785, 0, '', ''),
(6790, 0, '', ''),
(6795, 0, '', ''),
(6800, 0, '', ''),
(6804, 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_page`
--

CREATE TABLE IF NOT EXISTS `type_page` (
  `type_page_id` int(11) NOT NULL,
  `type_page_title` varchar(500) NOT NULL,
  `type_page_mkeys` varchar(500) NOT NULL,
  `type_page_mdesc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_page`
--

INSERT INTO `type_page` (`type_page_id`, `type_page_title`, `type_page_mkeys`, `type_page_mdesc`) VALUES
(510, '', '', ''),
(555, '', '', ''),
(559, '', '', ''),
(563, '', '', ''),
(567, '', '', ''),
(571, '', '', ''),
(578, '', '', ''),
(582, '', '', ''),
(696, '', '', ''),
(769, 'ewrwer', 'werwer', 'werwer'),
(2663, '', '', ''),
(6650, 'Алло такси - везет всегда!', 'алло, такси, одесса, о компании', 'Компания АЛЛО Такси - самая многопрофильная служба заказа такси в Одессе.'),
(3209, 'Алло такси - хорошее недорогое такси в Одессе, тел 733-5000', 'заказ, такси, в одессе, одесса, алло, дешевое, недорого, служба, заказать, хорошее, экономное, онлайн, online, taxi, услуги, автомобили', 'Если Вы хотите заказать хорошее недорогое такси в Одессе - Алло такси именно такое такси. Звоните в службу заказа или оставляйте онлайн заявку на сайте.\n'),
(3245, '', '', ''),
(6656, 'Автомобильные новости от службы заказа  АЛЛО такси', 'автомобильные, новости, одессы, украины, автопром', 'Самые актуальные новости мира автомобилей от службы заказа АЛЛО такси\n'),
(6661, '', '', ''),
(6667, 'Вакансии, работа водителем.', 'работа, водитель, такси, со своим авто, в, одессе, одесса, водителем', 'Ищете работу водителя такси со своим авто в Одессе? В такси АЛЛО всегда найдется несколько вакансий. Звоните.\n'),
(6739, '', '', ''),
(6740, '', '', ''),
(6741, '', '', ''),
(6742, '', '', ''),
(6751, '', '', ''),
(6670, 'Тарифы на грузовые перевозки от компании АЛЛО такси', 'грузовое, такси, перевозки, междугородние, пассажирские, грузовые, услуги, трансфер, перегон, автомобиля, драйвера, одесса', 'Стоимость услуг перевозки в Одессе - грузовое такси, пассажирские перевозки, грузовые перевозки, междугородние перевозки, перегон автомобиля, услуги драйвера Одесса\n'),
(6773, '', '', ''),
(6775, '', '', ''),
(6691, 'Карта сайта службы заказа такси Алло Такси', 'службы, заказа, такси, алло такси, карта сайта, навигация', 'Карта сайта службы заказа такси Алло Такси - быстрая и удобная навигация по всему сайту\n'),
(6801, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `type_site`
--

CREATE TABLE IF NOT EXISTS `type_site` (
  `type_site_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_site`
--

INSERT INTO `type_site` (`type_site_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Структура таблицы `type_vacancy`
--

CREATE TABLE IF NOT EXISTS `type_vacancy` (
  `type_vacancy_id` int(10) unsigned NOT NULL,
  `type_vacancy_pid` int(10) unsigned NOT NULL,
  `type_vacancy_name` varchar(500) NOT NULL,
  `type_vacancy_text` text NOT NULL,
  `type_vacancy_img` varchar(500) NOT NULL,
  `type_vacancy_phones` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_vacancy`
--

INSERT INTO `type_vacancy` (`type_vacancy_id`, `type_vacancy_pid`, `type_vacancy_name`, `type_vacancy_text`, `type_vacancy_img`, `type_vacancy_phones`) VALUES
(6798, 0, 'Работа водителем в Одессе', '<p style="line-height: 20.8px;"><span style="font-size: 20px; line-height: 32px;">Компания &laquo;Алло такси&raquo; объявляет набор на работу водителей с личным авто</span></p>\r\n\r\n<p style="line-height: 20.8px;"><strong style="line-height: 1.6em;">Требования к водителям:</strong></p>\r\n\r\n<ul style="line-height: 20.8px;">\r\n	<li>Наличие собственного автомобиля в хорошем состоянии</li>\r\n	<li>Уверенный и аккуратный стиль вождения&nbsp;</li>\r\n	<li>Водительский стаж и знание правил дорожного движения</li>\r\n	<li>Умение ориентироваться по городу либо отдельным районам</li>\r\n	<li>Ответственное отношение к работе&nbsp;</li>\r\n	<li>Пунктуальность</li>\r\n	<li>Умение работать с людьми, культура общения, вежливость</li>\r\n	<li>Желание работать и зарабатывать</li>\r\n</ul>\r\n\r\n<p style="line-height: 20.8px;"><strong>Компания &laquo;Алло такси&raquo; предлагает:</strong></p>\r\n\r\n<ul style="line-height: 20.8px;">\r\n	<li>Возможность совмещать работу с основным видом деятельности</li>\r\n	<li>Согласованный, удобный график</li>\r\n	<li>Выгодные тарифы</li>\r\n	<li>Возможность самостоятельно выбирать район города</li>\r\n	<li>Большое количество заказов и их рациональное распределение</li>\r\n	<li>Роботу через диспетчерскую службу с вежливыми и внимательными операторами</li>\r\n	<li>Стабильный и высокий доход</li>\r\n</ul>\r\n\r\n<h2>Преимущества работы водителем Одесса</h2>\r\n\r\n<p style="line-height: 20.8px;">В работе водителем Одесса есть множество преимуществ. В первую очередь, это свободный график работы, а также организация рабочего процесса с учетом интересов водителя и выгодные условия сотрудничества в целом. С нами Вы имеете постоянный источник дохода при удобных условиях работы.</p>\r\n\r\n<p style="line-height: 20.8px;">&nbsp;</p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;">Для записи на собеседование звоните:</span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 048-733-5000</span></span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 093-638-3386</span></span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 18px;">Контактное лицо:&nbsp;<strong>Владимир Васильевич</strong></span></p>\r\n', '', ''),
(6799, 0, 'Вакансия диспетчер в службу вызова такси', '<p style="line-height: 20.8px;">&laquo;Алло&nbsp;такси&raquo; приглашает на работу диспетчеров со знанием города, желательно с опытом работы в службе такси и желанием учиться, которые обладают грамотной речью и четкой дикцией, способны оперативно принимать и обрабатывать заказы, давать четкие установки водителям и контролировать их работу.<br />\r\nМы ищем коммуникабельных, организованных, ответственных работников и предлагаем им выгодные условия труда, комфортный офис, дружный коллектив и достойную зарплату.&nbsp;</p>\r\n\r\n<p style="line-height: 20.8px;">Компания &laquo;Алло такси&raquo; дает реальную возможность повысить свой доход, &nbsp;работать в приятных условиях и по удобному графику.</p>\r\n\r\n<p style="line-height: 20.8px;">&nbsp;</p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;">Для записи на собеседование звоните:</span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 048-733-5000</span></span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 20px;"><span style="line-height: 1.6em;">☏ 093-638-3386</span></span></p>\r\n\r\n<p style="line-height: 20.8px;"><span style="font-size: 18px;">Контактное лицо:&nbsp;<strong>Владимир Васильевич</strong></span></p>\r\n', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `user_login` varchar(40) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(40) NOT NULL,
  `user_email` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_name`, `user_password`, `user_email`) VALUES
(102, 'manager', 'Менеджер', '2179991a72b9e5112f09f78fbca2644b', 'manager@ukr.net'),
(103, 'sadmin', 'Супер Админ', '4c4681986c1c89c675e844bcb8051091', 'sadmin@ukr.net');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
`usrol_id` int(11) NOT NULL,
  `usrol_user_id` int(11) DEFAULT NULL,
  `usrol_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_roles`
--

INSERT INTO `users_roles` (`usrol_id`, `usrol_user_id`, `usrol_role_id`) VALUES
(12, 102, 48),
(3, 103, 45);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog_tags`
--
ALTER TABLE `blog_tags`
 ADD UNIQUE KEY `bt_blog_id_bt_tag_id` (`bt_blog_id`,`bt_tag_id`), ADD KEY `bt_blog_id` (`bt_blog_id`), ADD KEY `bt_tag_id` (`bt_tag_id`);

--
-- Индексы таблицы `clientform_data`
--
ALTER TABLE `clientform_data`
 ADD PRIMARY KEY (`clientform_data_id`), ADD KEY `clientform_data_type` (`clientform_data_type`(333)), ADD KEY `clientform_data_date` (`clientform_data_date`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `comment_name` (`comment_name`), ADD KEY `comment_email` (`comment_email`), ADD KEY `comment_new` (`comment_new`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `privilege`
--
ALTER TABLE `privilege`
 ADD PRIMARY KEY (`privilege_id`), ADD UNIQUE KEY `name_UNIQUE` (`privilege_name`);

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
 ADD PRIMARY KEY (`region_id`);

--
-- Индексы таблицы `resource`
--
ALTER TABLE `resource`
 ADD PRIMARY KEY (`resource_id`), ADD UNIQUE KEY `name_UNIQUE` (`resource_name`), ADD KEY `fk_resource_resource1` (`resource_parent_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`role_id`), ADD UNIQUE KEY `name_UNIQUE` (`role_acl_key`), ADD UNIQUE KEY `role_name` (`role_name`), ADD KEY `fk_role_role1` (`role_parent_id`);

--
-- Индексы таблицы `rule`
--
ALTER TABLE `rule`
 ADD PRIMARY KEY (`rule_id`), ADD UNIQUE KEY `rule_role_id` (`rule_role_id`,`rule_resource_id`,`rule_privilege_id`), ADD KEY `fk_rule_role1` (`rule_role_id`), ADD KEY `fk_rule_resource1` (`rule_resource_id`), ADD KEY `fk_rule_privilege1` (`rule_privilege_id`);

--
-- Индексы таблицы `tree`
--
ALTER TABLE `tree`
 ADD PRIMARY KEY (`tree_id`);

--
-- Индексы таблицы `tree_rule`
--
ALTER TABLE `tree_rule`
 ADD PRIMARY KEY (`tree_rule_id`), ADD UNIQUE KEY `tree_rule_role_id` (`tree_rule_role_id`,`tree_rule_resource_id`,`tree_rule_privilege_id`), ADD KEY `fk_rule_role1` (`tree_rule_role_id`), ADD KEY `fk_rule_resource1` (`tree_rule_resource_id`), ADD KEY `fk_rule_privilege1` (`tree_rule_privilege_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
 ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `type_alias`
--
ALTER TABLE `type_alias`
 ADD PRIMARY KEY (`type_alias_id`);

--
-- Индексы таблицы `type_articles`
--
ALTER TABLE `type_articles`
 ADD PRIMARY KEY (`type_articles_id`);

--
-- Индексы таблицы `type_beaforafter`
--
ALTER TABLE `type_beaforafter`
 ADD PRIMARY KEY (`type_beaforafter_id`);

--
-- Индексы таблицы `type_block`
--
ALTER TABLE `type_block`
 ADD PRIMARY KEY (`type_block_id`);

--
-- Индексы таблицы `type_blockcatalog`
--
ALTER TABLE `type_blockcatalog`
 ADD PRIMARY KEY (`type_blockcatalog_id`);

--
-- Индексы таблицы `type_blockform`
--
ALTER TABLE `type_blockform`
 ADD PRIMARY KEY (`type_blockform_id`);

--
-- Индексы таблицы `type_blog`
--
ALTER TABLE `type_blog`
 ADD PRIMARY KEY (`type_blog_id`);

--
-- Индексы таблицы `type_blogtag`
--
ALTER TABLE `type_blogtag`
 ADD PRIMARY KEY (`type_blogtag_id`);

--
-- Индексы таблицы `type_catalog`
--
ALTER TABLE `type_catalog`
 ADD PRIMARY KEY (`type_catalog_id`);

--
-- Индексы таблицы `type_clientform`
--
ALTER TABLE `type_clientform`
 ADD PRIMARY KEY (`type_clientform_id`);

--
-- Индексы таблицы `type_filter`
--
ALTER TABLE `type_filter`
 ADD PRIMARY KEY (`type_filter_id`);

--
-- Индексы таблицы `type_folder`
--
ALTER TABLE `type_folder`
 ADD PRIMARY KEY (`type_folder_id`);

--
-- Индексы таблицы `type_form`
--
ALTER TABLE `type_form`
 ADD PRIMARY KEY (`type_form_id`);

--
-- Индексы таблицы `type_image`
--
ALTER TABLE `type_image`
 ADD PRIMARY KEY (`type_image_id`);

--
-- Индексы таблицы `type_link`
--
ALTER TABLE `type_link`
 ADD PRIMARY KEY (`type_link_id`);

--
-- Индексы таблицы `type_list`
--
ALTER TABLE `type_list`
 ADD PRIMARY KEY (`type_list_id`);

--
-- Индексы таблицы `type_menulink`
--
ALTER TABLE `type_menulink`
 ADD PRIMARY KEY (`type_menulink_id`);

--
-- Индексы таблицы `type_news`
--
ALTER TABLE `type_news`
 ADD PRIMARY KEY (`type_news_id`);

--
-- Индексы таблицы `type_node`
--
ALTER TABLE `type_node`
 ADD PRIMARY KEY (`type_node_id`);

--
-- Индексы таблицы `type_page`
--
ALTER TABLE `type_page`
 ADD PRIMARY KEY (`type_page_id`);

--
-- Индексы таблицы `type_site`
--
ALTER TABLE `type_site`
 ADD PRIMARY KEY (`type_site_id`);

--
-- Индексы таблицы `type_vacancy`
--
ALTER TABLE `type_vacancy`
 ADD PRIMARY KEY (`type_vacancy_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `users_roles`
--
ALTER TABLE `users_roles`
 ADD PRIMARY KEY (`usrol_id`), ADD UNIQUE KEY `usrol_user_id` (`usrol_user_id`,`usrol_role_id`), ADD KEY `usrol_role_id` (`usrol_role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clientform_data`
--
ALTER TABLE `clientform_data`
MODIFY `clientform_data_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `privilege`
--
ALTER TABLE `privilege`
MODIFY `privilege_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `regions`
--
ALTER TABLE `regions`
MODIFY `region_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `resource`
--
ALTER TABLE `resource`
MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT для таблицы `rule`
--
ALTER TABLE `rule`
MODIFY `rule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT для таблицы `tree`
--
ALTER TABLE `tree`
MODIFY `tree_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6805;
--
-- AUTO_INCREMENT для таблицы `tree_rule`
--
ALTER TABLE `tree_rule`
MODIFY `tree_rule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
MODIFY `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT для таблицы `users_roles`
--
ALTER TABLE `users_roles`
MODIFY `usrol_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
