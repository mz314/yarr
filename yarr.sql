-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 08 Sty 2014, 20:30
-- Wersja serwera: 5.6.14-log
-- Wersja PHP: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `yarr`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add torrent', 7, 'add_torrent'),
(20, 'Can change torrent', 7, 'change_torrent'),
(21, 'Can delete torrent', 7, 'delete_torrent'),
(22, 'Can add category', 8, 'add_category'),
(23, 'Can change category', 8, 'change_category'),
(24, 'Can delete category', 8, 'delete_category'),
(25, 'Can add menu', 9, 'add_menu'),
(26, 'Can change menu', 9, 'change_menu'),
(27, 'Can delete menu', 9, 'delete_menu'),
(28, 'Can add menu item', 10, 'add_menuitem'),
(29, 'Can change menu item', 10, 'change_menuitem'),
(30, 'Can delete menu item', 10, 'delete_menuitem');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$jqWHkcSG4lq2$MgBznB2Mkp9TGuHiO5/32TNaDVcDF0+ywombKqYtBj0=', '2014-01-02 20:10:16', 1, 'root', 'tha', 'boss', 'boss@niggas.xxx', 1, 1, '2013-12-28 09:50:12'),
(2, 'pbkdf2_sha256$12000$YuhPA3CU0Fdn$hr4oI61rUrfgyY6WOiuZAoquo8bLA6oyjn1fNH3OyvY=', '2014-01-02 20:09:59', 0, 'maciek', 'M', 'Z', 'm@il.xxx', 0, 1, '2014-01-01 15:14:56');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-12-31 11:17:35', 1, 7, '1', 'Torrent object', 1, ''),
(2, '2013-12-31 11:27:02', 1, 7, '1', 'Torrent object', 2, 'Changed torrent_file.'),
(3, '2013-12-31 11:28:06', 1, 7, '1', 'Torrent object', 2, 'Changed torrent_file.'),
(4, '2013-12-31 11:40:16', 1, 8, '1', 'Category object', 1, ''),
(5, '2013-12-31 11:57:41', 1, 7, '1', 'test file', 1, ''),
(6, '2013-12-31 14:39:28', 1, 8, '2', 'child of test', 1, ''),
(7, '2013-12-31 14:52:28', 1, 8, '3', 'Music', 1, ''),
(8, '2013-12-31 14:52:36', 1, 8, '4', 'Movies', 1, ''),
(9, '2013-12-31 14:52:40', 1, 8, '5', 'Books', 1, ''),
(10, '2013-12-31 14:52:47', 1, 8, '6', 'Software', 1, ''),
(11, '2013-12-31 14:52:52', 1, 8, '7', 'XXX', 1, ''),
(12, '2013-12-31 14:53:00', 1, 8, '8', 'Methul', 1, ''),
(13, '2013-12-31 14:53:15', 1, 8, '9', 'Adult games', 1, ''),
(14, '2013-12-31 14:53:47', 1, 8, '10', 'Erotikk games for kids', 1, ''),
(15, '2013-12-31 14:54:28', 1, 7, '2', 'Sexy duck', 1, ''),
(16, '2013-12-31 14:55:13', 1, 7, '3', 'Bobroczochracz', 1, ''),
(17, '2013-12-31 14:55:36', 1, 8, '1', 'test', 3, ''),
(18, '2013-12-31 15:13:46', 1, 7, '4', 'Windows XP', 1, ''),
(19, '2013-12-31 15:20:43', 1, 7, '2', 'Sexy duck', 2, 'No fields changed.'),
(20, '2013-12-31 15:20:50', 1, 7, '2', 'Sexy duck', 2, 'No fields changed.'),
(21, '2013-12-31 15:48:54', 1, 7, '5', 'KrólDramtoo 6', 1, ''),
(22, '2013-12-31 17:15:17', 1, 9, '1', 'Menu object', 1, ''),
(23, '2013-12-31 17:17:26', 1, 10, '1', 'MenuItem object', 1, ''),
(24, '2013-12-31 17:18:26', 1, 10, '2', 'Upload torrent', 1, ''),
(25, '2013-12-31 17:28:10', 1, 10, '2', 'Upload torrent', 2, 'Changed menu.'),
(26, '2013-12-31 17:28:13', 1, 10, '2', 'Upload torrent', 2, 'No fields changed.'),
(27, '2013-12-31 17:28:15', 1, 10, '1', 'Home', 2, 'No fields changed.'),
(28, '2013-12-31 18:20:59', 1, 7, '7', 'fffx', 3, ''),
(29, '2013-12-31 18:20:59', 1, 7, '6', 'fff', 3, ''),
(30, '2013-12-31 18:27:29', 1, 7, '16', 'fffx', 3, ''),
(31, '2013-12-31 18:27:29', 1, 7, '15', 'fffx', 3, ''),
(32, '2013-12-31 18:27:29', 1, 7, '14', 'fffx', 3, ''),
(33, '2013-12-31 18:27:29', 1, 7, '13', 'fffx', 3, ''),
(34, '2013-12-31 18:27:29', 1, 7, '12', 'fffx', 3, ''),
(35, '2013-12-31 18:27:29', 1, 7, '11', 'fffx', 3, ''),
(36, '2013-12-31 18:27:29', 1, 7, '10', 'fffx', 3, ''),
(37, '2013-12-31 18:27:29', 1, 7, '9', 'fffx', 3, ''),
(38, '2013-12-31 18:27:29', 1, 7, '8', 'fffx', 3, ''),
(39, '2013-12-31 18:29:43', 1, 7, '5', 'KrólDramtoo 6', 2, 'Changed approved.'),
(40, '2013-12-31 18:29:47', 1, 7, '5', 'KrólDramtoo 6', 2, 'No fields changed.'),
(41, '2013-12-31 18:35:34', 1, 7, '18', 'test', 3, ''),
(42, '2013-12-31 18:35:34', 1, 7, '17', 'vejder', 3, ''),
(43, '2013-12-31 18:36:15', 1, 7, '19', 'test', 2, 'Changed approved.'),
(44, '2013-12-31 18:36:22', 1, 7, '19', 'test', 2, 'Changed approved.'),
(45, '2013-12-31 18:36:26', 1, 7, '19', 'test', 2, 'Changed approved.'),
(46, '2013-12-31 18:36:46', 1, 7, '20', 'x', 2, 'Changed approved.'),
(47, '2013-12-31 18:36:53', 1, 7, '21', 'dggdfgfd', 1, ''),
(48, '2013-12-31 18:36:58', 1, 7, '21', 'dggdfgfd', 2, 'Changed approved.'),
(49, '2013-12-31 18:37:04', 1, 7, '21', 'dggdfgfd', 3, ''),
(50, '2013-12-31 18:37:04', 1, 7, '20', 'x', 3, ''),
(51, '2013-12-31 18:37:04', 1, 7, '19', 'test', 3, ''),
(52, '2013-12-31 18:41:23', 1, 7, '4', 'Windows XP', 2, 'Changed approved.'),
(53, '2013-12-31 20:02:58', 1, 10, '2', 'Upload torrent', 2, 'Changed href.'),
(54, '2013-12-31 20:03:33', 1, 10, '3', 'Torrent list', 1, ''),
(55, '2013-12-31 21:24:21', 1, 7, '22', 'Sisiok', 2, 'Changed approved.'),
(56, '2013-12-31 21:26:27', 1, 7, '22', 'siusok', 2, 'Changed title.'),
(57, '2014-01-01 00:07:54', 1, 10, '4', 'Login', 1, ''),
(58, '2014-01-01 15:14:56', 1, 4, '2', 'maciek', 1, ''),
(59, '2014-01-01 15:15:09', 1, 4, '2', 'maciek', 2, 'No fields changed.'),
(60, '2014-01-01 15:29:58', 1, 4, '2', 'maciek', 2, 'Changed first_name, last_name and email.'),
(61, '2014-01-01 15:30:21', 1, 4, '1', 'root', 2, 'Changed first_name, last_name and email.'),
(62, '2014-01-01 15:37:06', 1, 10, '4', 'User panel', 2, 'Changed title and href.'),
(63, '2014-01-02 19:38:44', 1, 7, '23', 'dsafad', 1, ''),
(64, '2014-01-02 19:57:24', 1, 7, '24', 'test', 1, ''),
(65, '2014-01-02 19:59:12', 1, 7, '25', 'test2', 1, ''),
(66, '2014-01-02 19:59:51', 1, 7, '26', 'vvv', 1, ''),
(67, '2014-01-02 20:00:12', 1, 7, '27', 'fff', 1, ''),
(68, '2014-01-02 20:03:00', 1, 7, '28', 'dgdsgdsf', 1, ''),
(69, '2014-01-02 20:09:41', 1, 7, '31', 'x123', 1, ''),
(70, '2014-01-02 20:15:02', 1, 7, '1', 'test', 1, ''),
(71, '2014-01-02 20:15:07', 1, 7, '1', 'test', 2, 'Changed approved.'),
(72, '2014-01-03 19:08:10', 1, 7, '1', 'x', 1, ''),
(73, '2014-01-03 19:15:32', 1, 10, '5', 'Search', 1, ''),
(74, '2014-01-03 19:25:59', 1, 7, '2', 'test', 1, ''),
(75, '2014-01-03 19:26:09', 1, 7, '3', 'test2', 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'torrent', 'torrents', 'torrent'),
(8, 'category', 'torrent_categories', 'category'),
(9, 'menu', 'menu', 'menu'),
(10, 'menu item', 'menu', 'menuitem');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('884hm9q55bdqmom72hanis17in3c6vty', 'ZmVhZTczNjVlODU0YmU1ZmQ2ZGE0NjkwMTRkOWRkNDBmZTYwNjU5NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2014-01-15 15:30:40'),
('orv8da6wle9cbug76vajkkpszvtdtsnd', 'NjgzZjdmMTdkNjIyNTJhNDIxYTZkMGQyNWMzNTA3OWQyZjhjMjQwNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-01-16 20:10:16'),
('xcwulal48fe1cc2t2hvstib9zsxs43hf', 'NjgzZjdmMTdkNjIyNTJhNDIxYTZkMGQyNWMzNTA3OWQyZjhjMjQwNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-01-15 15:21:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_menu`
--

DROP TABLE IF EXISTS `menu_menu`;
CREATE TABLE IF NOT EXISTS `menu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `menu_menu`
--

INSERT INTO `menu_menu` (`id`, `title`) VALUES
(1, 'Main menu');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_menuitem`
--

DROP TABLE IF EXISTS `menu_menuitem`;
CREATE TABLE IF NOT EXISTS `menu_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `href` varchar(255) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_menuitem_08fd5523` (`menu_id`),
  KEY `menu_menuitem_410d0aac` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `menu_menuitem`
--

INSERT INTO `menu_menuitem` (`id`, `title`, `href`, `menu_id`, `parent_id`) VALUES
(1, 'Home', '/', 1, NULL),
(2, 'Upload torrent', '/torrent/add', 1, NULL),
(3, 'Torrent list', '/cat', 1, NULL),
(4, 'User panel', '/user', 1, NULL),
(5, 'Search', '/torrent/search', 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `torrents_category`
--

DROP TABLE IF EXISTS `torrents_category`;
CREATE TABLE IF NOT EXISTS `torrents_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `torrent_categories_category_18eb35da` (`parent_cat_id`),
  KEY `torrents_category_18eb35da` (`parent_cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `torrents_category`
--

INSERT INTO `torrents_category` (`id`, `name`, `parent_cat_id`) VALUES
(3, 'Music', NULL),
(4, 'Movies', NULL),
(5, 'Books', NULL),
(6, 'Software', NULL),
(7, 'XXX', 4),
(8, 'Methul', 3),
(9, 'Adult games', 6),
(10, 'Erotikk games for kids', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `torrents_comments`
--

DROP TABLE IF EXISTS `torrents_comments`;
CREATE TABLE IF NOT EXISTS `torrents_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `torrent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrents_comments_6340c63c` (`user_id`),
  KEY `torrents_comments_dacd18be` (`torrent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `torrents_rates`
--

DROP TABLE IF EXISTS `torrents_rates`;
CREATE TABLE IF NOT EXISTS `torrents_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  `torrent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrents_rates_6340c63c` (`user_id`),
  KEY `torrents_rates_dacd18be` (`torrent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `torrents_torrent`
--

DROP TABLE IF EXISTS `torrents_torrent`;
CREATE TABLE IF NOT EXISTS `torrents_torrent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `torrent_file` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `rate_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `torrents_torrent_6f33f001` (`category_id`),
  KEY `torrents_torrent_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `torrents_torrent`
--

INSERT INTO `torrents_torrent` (`id`, `title`, `description`, `torrent_file`, `category_id`, `approved`, `user_id`, `rating`, `rate_count`) VALUES
(1, 'x', 'x', 'torrent_files/gas_edit_47.xml', 3, 1, 1, NULL, NULL),
(2, 'test', 'fdgfadgadf', 'torrent_files/gas_edit_48.xml', 3, 1, 1, NULL, NULL),
(3, 'test2', 'ggfdsgs', 'torrent_files/gas_edit_49.xml', 4, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `torrent_categories_category`
--

DROP TABLE IF EXISTS `torrent_categories_category`;
CREATE TABLE IF NOT EXISTS `torrent_categories_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `torrent_categories_category_18eb35da` (`parent_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `menu_menuitem`
--
ALTER TABLE `menu_menuitem`
  ADD CONSTRAINT `menu_id_refs_id_6041d605` FOREIGN KEY (`menu_id`) REFERENCES `menu_menu` (`id`),
  ADD CONSTRAINT `parent_id_refs_id_28054f8c` FOREIGN KEY (`parent_id`) REFERENCES `menu_menuitem` (`id`);

--
-- Ograniczenia dla tabeli `torrents_comments`
--
ALTER TABLE `torrents_comments`
  ADD CONSTRAINT `torrent_id_refs_id_1ff8695e` FOREIGN KEY (`torrent_id`) REFERENCES `torrents_torrent` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c1f28ba4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `torrents_rates`
--
ALTER TABLE `torrents_rates`
  ADD CONSTRAINT `torrent_id_refs_id_a774856b` FOREIGN KEY (`torrent_id`) REFERENCES `torrents_torrent` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7513f3d1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `torrents_torrent`
--
ALTER TABLE `torrents_torrent`
  ADD CONSTRAINT `category_id_refs_id_97db5c37` FOREIGN KEY (`category_id`) REFERENCES `torrents_category` (`id`),
  ADD CONSTRAINT `user_id_refs_id_136ebf2e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `torrent_categories_category`
--
ALTER TABLE `torrent_categories_category`
  ADD CONSTRAINT `parent_cat_id_refs_id_bbd101eb` FOREIGN KEY (`parent_cat_id`) REFERENCES `torrent_categories_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
