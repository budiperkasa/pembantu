-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 07, 2010 at 09:41 AM
-- Server version: 5.1.23
-- PHP Version: 5.2.4
-- 
-- Database: `zendcms`
-- 



-- --------------------------------------------------------

-- 
-- Table structure for table `cities`
-- 

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

-- 
-- Dumping data for table `cities`
-- 

INSERT INTO `cities` (`city_id`, `city`, `state_id`) VALUES 
(37, 'Archway', 9),
(38, 'Bounds Green', 10),
(39, 'Bethnal Green', 11),
(41, 'Clapton', 12),
(42, 'Camden', 13),
(43, 'Camden Town', 14),
(44, 'Caledonia Road', 15),
(46, 'Dalston', 16),
(47, 'Edmonton', 17),
(48, 'Enfield', 18),
(49, 'Finsbury Park', 19),
(52, 'Hackney', 20),
(53, 'Hoxton', 17),
(54, 'Hornsey', 22),
(55, 'Homerton', 23),
(56, 'Haringey', 24),
(58, 'Highbury', 25),
(59, 'Holloway', 26),
(60, 'Islington', 20),
(61, 'Leyton', 28),
(62, 'Leytonstone', 29),
(63, 'Manor House', 30),
(64, 'Newington Green', 31),
(65, 'Ponders End', 32),
(66, 'Palmers Green', 33),
(67, 'Stoke Newington', 34),
(68, 'Shoreditch', 35),
(69, 'Seven Sisters', 36),
(70, 'Stamford Hill', 37),
(71, 'Tottenham', 38),
(72, 'Turnpike Lane', 39),
(73, 'Wood Green', 40),
(80, 'E2', 41),
(81, 'E5', 42),
(82, 'E8,E9', 43),
(83, 'N1', 44),
(84, 'N5', 45),
(85, 'N7', 47),
(86, 'N16', 48),
(89, 'Walthamstow', 48),
(91, 'Hackney Fields', 49),
(92, 'Barnet', 50),
(93, 'Gulshan', 51),
(94, 'hfdhfdh', 53);


-- --------------------------------------------------------

-- 
-- Table structure for table `countries`
-- 

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=242 ;

-- 
-- Dumping data for table `countries`
-- 

INSERT INTO `countries` (`id`, `value`) VALUES 
(1, 'Afghanistan'),
(2, 'Aland Islands'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'American Samoa'),
(6, 'Andorra'),
(7, 'Angola'),
(8, 'Anguilla'),
(9, 'Antarctica'),
(10, 'Antigua and Barbuda'),
(11, 'Argentina'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Australia'),
(15, 'Austria'),
(16, 'Azerbaijan'),
(17, 'Bahamas'),
(18, 'Bahrain'),
(19, 'Bangladesh'),
(20, 'Barbados'),
(21, 'Belarus'),
(22, 'Belgium'),
(23, 'Belize'),
(24, 'Benin'),
(25, 'Bermuda'),
(26, 'Bhutan'),
(27, 'Bolivia'),
(28, 'Bosnia and Herzegovina'),
(29, 'Botswana'),
(30, 'Bouvet Island'),
(31, 'Brazil'),
(32, 'British Indian Ocean territory'),
(33, 'Brunei Darussalam'),
(34, 'Bulgaria'),
(35, 'Burkina Faso'),
(36, 'Burundi'),
(37, 'Cambodia'),
(38, 'Cameroon'),
(39, 'Canada'),
(40, 'Cape Verde'),
(41, 'Cayman Islands'),
(42, 'Central African Republic'),
(43, 'Chad'),
(44, 'Chile'),
(45, 'China'),
(46, 'Christmas Island'),
(47, 'Cocos (Keeling) Islands'),
(48, 'Colombia'),
(49, 'Comoros'),
(50, 'Congo'),
(51, 'Congo'),
(52, 'Democratic Republic'),
(53, 'Cook Islands'),
(54, 'Costa Rica'),
(55, 'Ivoire (Ivory Coast)'),
(56, 'Croatia (Hrvatska)'),
(57, 'Cuba'),
(58, 'Cyprus'),
(59, 'Czech Republic'),
(60, 'Denmark'),
(61, 'Djibouti'),
(62, 'Dominica'),
(63, 'Dominican Republic'),
(64, 'East Timor'),
(65, 'Ecuador'),
(66, 'Egypt'),
(67, 'El Salvador'),
(68, 'Equatorial Guinea'),
(69, 'Eritrea'),
(70, 'Estonia'),
(71, 'Ethiopia'),
(72, 'Falkland Islands'),
(73, 'Faroe Islands'),
(74, 'Fiji'),
(75, 'Finland'),
(76, 'France'),
(77, 'French Guiana'),
(78, 'French Polynesia'),
(79, 'French Southern Territories'),
(80, 'Gabon'),
(81, 'Gambia'),
(82, 'Georgia'),
(83, 'Germany'),
(84, 'Ghana'),
(85, 'Gibraltar'),
(86, 'Greece'),
(87, 'Greenland'),
(88, 'Grenada'),
(89, 'Guadeloupe'),
(90, 'Guam'),
(91, 'Guatemala'),
(92, 'Guinea'),
(93, 'Guinea-Bissau'),
(94, 'Guyana'),
(95, 'Haiti'),
(96, 'Heard and McDonald Islands'),
(97, 'Honduras'),
(98, 'Hong&nbsp;Kong'),
(99, 'Hungary'),
(100, 'Iceland'),
(101, 'India'),
(102, 'Indonesia'),
(103, 'Iran'),
(104, 'Iraq'),
(105, 'Ireland'),
(106, 'Israel'),
(107, 'Italy'),
(108, 'Jamaica'),
(109, 'Japan'),
(110, 'Jordan'),
(111, 'Kazakhstan'),
(112, 'Kenya'),
(113, 'Kiribati'),
(114, 'Korea (north)'),
(115, 'Korea (south)'),
(116, 'Kuwait'),
(117, 'Kyrgyzstan'),
(118, 'Lao People''s Democratic Republic'),
(119, 'Latvia'),
(120, 'Lebanon'),
(121, 'Lesotho'),
(122, 'Liberia'),
(123, 'Libyan Arab Jamahiriya'),
(124, 'Liechtenstein'),
(125, 'Lithuania'),
(126, 'Luxembourg'),
(127, 'Macao'),
(128, 'Macedonia'),
(129, 'Madagascar'),
(130, 'Malawi'),
(131, 'Malaysia'),
(132, 'Maldives'),
(133, 'Mali'),
(134, 'Malta'),
(135, 'Marshall Islands'),
(136, 'Martinique'),
(137, 'Mauritania'),
(138, 'Mauritius'),
(139, 'Mayotte'),
(140, 'Mexico'),
(141, 'Micronesia'),
(142, 'Moldova'),
(143, 'Monaco'),
(144, 'Mongolia'),
(145, 'Montserrat'),
(146, 'Morocco'),
(147, 'Mozambique'),
(148, 'Myanmar'),
(149, 'Namibia'),
(150, 'Nauru'),
(151, 'Nepal'),
(152, 'Netherlands'),
(153, 'Netherlands Antilles'),
(154, 'New Caledonia'),
(155, 'New Zealand'),
(156, 'Nicaragua'),
(157, 'Niger'),
(158, 'Nigeria'),
(159, 'Niue'),
(160, 'Norfolk Island'),
(161, 'Northern Mariana Islands'),
(162, 'Norway'),
(163, 'Oman'),
(164, 'Pakistan'),
(165, 'Palau'),
(166, 'Palestinian Territories'),
(167, 'Panama'),
(168, 'Papua New Guinea'),
(169, 'Paraguay'),
(170, 'Peru'),
(171, 'Philippines'),
(172, 'Pitcairn'),
(173, 'Poland'),
(174, 'Portugal'),
(175, 'Puerto Rico'),
(176, 'Qatar'),
(177, 'Reacute union'),
(178, 'Romania'),
(179, 'Russian Federation'),
(180, 'Rwanda'),
(181, 'Saint Helena'),
(182, 'Saint Kitts and Nevis'),
(183, 'Saint Lucia'),
(184, 'Saint Pierre and Miquelon'),
(185, 'Saint Vincent and the Grenadines'),
(186, 'Samoa'),
(187, 'San Marino'),
(188, 'Sao Tome and Principe'),
(189, 'Saudi Arabia'),
(190, 'Senegal'),
(191, 'Serbia and Montenegro'),
(192, 'Seychelles'),
(193, 'Sierra Leone'),
(194, 'Singapore'),
(195, 'Slovakia'),
(196, 'Slovenia'),
(197, 'Solomon Islands'),
(198, 'Somalia'),
(199, 'South Africa'),
(200, 'South Georgia and the South Sandwich Islands'),
(201, 'Spain'),
(202, 'Sri Lanka'),
(203, 'Sudan'),
(204, 'Suriname'),
(205, 'Svalbard and Jan Mayen Islands'),
(206, 'Swaziland'),
(207, 'Sweden'),
(208, 'Switzerland'),
(209, 'Syria'),
(210, 'Taiwan'),
(211, 'Tajikistan'),
(212, 'Tanzania'),
(213, 'Thailand'),
(214, 'Togo'),
(215, 'Tokelau'),
(216, 'Tonga'),
(217, 'Trinidad and Tobago'),
(218, 'Tunisia'),
(219, 'Turkey'),
(220, 'Turkmenistan'),
(221, 'Turks and Caicos Islands'),
(222, 'Tuvalu'),
(223, 'Uganda'),
(224, 'Ukraine'),
(225, 'United Arab Emirates'),
(226, 'United Kingdom'),
(227, 'United States of America'),
(228, 'Uruguay'),
(229, 'Uzbekistan'),
(230, 'Vanuatu'),
(231, 'Vatican City'),
(232, 'Venezuela'),
(233, 'Vietnam'),
(234, 'Virgin Islands (British)'),
(235, 'Virgin Islands (US)'),
(236, 'Wallis and Futuna Islands'),
(237, 'Western Sahara'),
(238, 'Yemen'),
(239, 'Zaire'),
(240, 'Zambia'),
(241, 'Zimbabwe');





-- --------------------------------------------------------

-- 
-- Table structure for table `global_settings`
-- 

DROP TABLE IF EXISTS `global_settings`;
CREATE TABLE IF NOT EXISTS `global_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `default_country` int(11) DEFAULT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `seo_on` enum('0','1') DEFAULT '0',
  `global_email` varchar(255) DEFAULT NULL,
  `payment_email` varchar(255) DEFAULT NULL,
  `email_mailer_protocol` enum('sendmail','mail','smtp') DEFAULT 'mail',
  `email_smtp_from` varchar(255) DEFAULT NULL,
  `email_smtp_host` varchar(255) DEFAULT NULL,
  `email_smtp_username` varchar(255) DEFAULT NULL,
  `email_smtp_password` varchar(255) DEFAULT NULL,
  `email_smtp_port` int(11) DEFAULT '21',
  `email_smtp_wordrap` int(11) DEFAULT '50',
  `admin_header_logo` varchar(255) DEFAULT NULL,
  `admin_footer` varchar(255) DEFAULT NULL,
  `admin_footer_url` varchar(255) DEFAULT NULL,
  `frontend_footer` varchar(255) DEFAULT NULL,
  `frontend_footer_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `global_settings`
-- 

INSERT INTO `global_settings` (`id`, `site_title`, `site_name`, `site_url`, `meta_key`, `meta_desc`, `default_country`, `default_language`, `seo_on`, `global_email`, `payment_email`, `email_mailer_protocol`, `email_smtp_from`, `email_smtp_host`, `email_smtp_username`, `email_smtp_password`, `email_smtp_port`, `email_smtp_wordrap`, `admin_header_logo`, `admin_footer`, `admin_footer_url`, `frontend_footer`, `frontend_footer_url`) VALUES 
(1, 'Eicrasoft Ltd', 'Eicrasoft Ltd', 'www.cms.com.bd', 'Eicrasoft Ltd', 'Eicrasoft Ltd', 226, 'en_US', '0', 'dev6@eicra.com', 'dev6@eicra.com', 'mail', 'info@eicra.com', 'mail.cms.com.bd', 'test@cms.com.bd', '666666', 26, 50, '', '', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `jtheme`
-- 

DROP TABLE IF EXISTS `jtheme`;
CREATE TABLE IF NOT EXISTS `jtheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_thumb` varchar(255) DEFAULT NULL,
  `theme_name` varchar(255) DEFAULT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_desc` text,
  `theme_date` date DEFAULT NULL,
  `theme_default` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `jtheme`
-- 

INSERT INTO `jtheme` (`id`, `theme_thumb`, `theme_name`, `theme_folder`, `theme_desc`, `theme_date`, `theme_default`) VALUES 
(1, 'theme_ui_dark.png', 'UI Darkness', 'ui-darkness', 'UI Darkness', '0000-00-00', '0'),
(2, 'theme_ui_light.png', 'UI Lightness', 'ui-lightness', '', '0000-00-00', '0'),
(3, 'theme_redmond.png', 'Redmond', 'redmond', '', '0000-00-00', '0'),
(4, 'theme_custom.png', 'Custom Theme', 'custom-theme', 'custom-theme', '0000-00-00', '0'),
(5, 'theme_start.png', 'Start', 'start', 'Start', '0000-00-00', '0'),
(6, 'theme_sunny.png', 'Sunny', 'sunny', '', '0000-00-00', '0'),
(7, 'theme_overcast.png', 'Overcast', 'overcast', '', '0000-00-00', '0'),
(8, 'theme_le-frog.png', 'Le Frog', 'le-frog', '', '0000-00-00', '0'),
(9, 'theme_flick.png', 'Flick', 'flick', '', '0000-00-00', '0'),
(10, 'theme_pepper-grinder.png', 'Pepper Grinder', 'pepper-grinder', '', '0000-00-00', '0'),
(11, 'theme_eggplant.png', 'Egg Plant', 'eggplant', '', '0000-00-00', '0'),
(12, 'theme_dark-hive.png', 'Dark Hive', 'dark-hive', '', '0000-00-00', '0'),
(13, 'theme_cupertino.png', 'Cupertino', 'cupertino', '', '0000-00-00', '1'),
(14, 'theme_south-street.png', 'South Street', 'south-street', '', '0000-00-00', '0'),
(15, 'theme_blitzer.png', 'Blitzer', 'blitzer', '', '0000-00-00', '0'),
(16, 'theme_humanity.png', 'Humanity', 'humanity', '', '0000-00-00', '0'),
(17, 'theme_hot-sneaks.png', 'Hot Sneaks', 'hot-sneaks', '', '0000-00-00', '0'),
(18, 'theme_excite-bike.png', 'Excite Bike', 'excite-bike', '', '0000-00-00', '0'),
(19, 'theme_vader.png', 'Vader', 'vader', '', '0000-00-00', '0'),
(20, 'theme_dot-luv.png', 'Dot Luv', 'dot-luv', '', '0000-00-00', '0'),
(21, 'theme_mint-choc.png', 'Mint Choc', 'mint-choc', '', '0000-00-00', '0'),
(22, 'theme_black-tie.png', 'Black Tie', 'black-tie', '', '0000-00-00', '0'),
(23, 'theme_trontastic.png', 'Trontastic', 'trontastic', '', '0000-00-00', '0'),
(24, 'theme_swanky-purse.png', 'Swanky Purse', 'swanky-purse', '', '0000-00-00', '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `menu`
-- 

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT,
  `group_id` tinyint(4) NOT NULL DEFAULT '0',
  `menu_name` varchar(255) NOT NULL DEFAULT '',
  `menu_title` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(5) NOT NULL DEFAULT '0',
  `parent` int(11) DEFAULT '0',
  `target` enum('_self','_blank','_parent','_top') DEFAULT '_self',
  `menu_default` enum('0','1') DEFAULT '0',
  `menu_status` enum('0','1') DEFAULT '1',                          
  `external_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- 
-- Dumping data for table `menu`
-- 

INSERT INTO `menu` (`menu_id`, `group_id`, `menu_name`, `menu_title`, `menu_order`, `parent`, `target`, `menu_default`, `menu_status`,`external_link`) VALUES 
(1, 1, 'Home', 'Home', 1, 0, '_self', '1', '1',''),
(2, 1, 'About Us', 'About Us', 2, 0, '_self', '0', '1',''),
(3, 1, 'Gallery', 'Gallery', 1, 4, '_self', '0', '1',''),
(4, 1, 'Image Gallery', 'Image Gallery', 6, 3, '_self', '0', '1',''),
(5, 1, 'Video Gallery', 'Video Gallery', 2, 10, '_self', '0', '1',''),
(6, 1, 'Sign Up', 'Sign Up', 4, 0, '_self', '0', '1',''),
(7, 1, 'Food', 'Food', 4, 3, '_self', '0', '1',''),
(8, 1, 'Chicken', 'Chicken', 5, 3, '_self', '0', '1',''),
(9, 1, 'Projects', 'Projects', 6, 0, '_self', '0', '1',''),
(10, 1, 'Gallery', 'Gallery', 5, 0, '_self', '0', '1',''),
(11, 1, 'Image Gallery', 'Image Gallery', 1, 10, '_self', '0', '1',''),
(22, 1, 'News', 'News', 7, 0, '_self', '0', '1',''),
(23, 1, 'Archive', 'Archive', 8, 0, '_self', '0', '1',''),
(24, 1, 'Feedback', 'Feedback', 9, 0, '_self', '0', '1',''),
(25, 1, 'Contact Us', 'Contact Us', 10, 0, '_self', '0', '1',''),
(26, 1, 'Business', 'Business', 1, 22, '_self', '0', '1',''),
(27, 1, 'Business Page', 'Business Page', 1, 26, '_self', '0', '1',''),
(28, 1, 'Sign In', 'Sign In', 3, 0, '_self', '0', '1',''),
(30, 1, 'Admin Login', 'Admin Login', 11, 0, '_self', '0', '1',''),
(31, 1, 'Open Gallery', 'Open Gallery', 12, 0, '_self', '0', '1','');

-- --------------------------------------------------------

-- 
-- Table structure for table `menu_assign`
-- 

DROP TABLE IF EXISTS `menu_assign`;
CREATE TABLE IF NOT EXISTS `menu_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `page_id` varchar(255) DEFAULT NULL,
  `assign_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- 
-- Dumping data for table `menu_assign`
-- 

INSERT INTO `menu_assign` (`id`, `menu_id`, `module_name`, `controller_name`, `action_name`, `page_id`, `assign_order`) VALUES 
(15, 2, 'Articles', 'frontend', 'view', '2', 0),
(18, 6, 'Members', 'frontend', 'register', '', 0),
(19, 4, 'Gallery', 'frontend', 'view', '1', 0),
(20, 5, 'Gallery', 'frontend', 'view', '2', 0),
(21, 7, 'Gallery', 'frontend', 'catagories', '1', 0),
(22, 8, 'Gallery', 'frontend', 'catagories', '14', 0),
(23, 9, 'Projects', 'index', 'filepreview', '', 0),
(24, 11, 'Gallery', 'frontend', 'view', '1', 0),
(35, 22, 'News', 'frontend', 'view', '1', 0),
(36, 23, 'News', 'frontend', 'archive', '1', 0),
(37, 24, 'News', 'feedback', 'list', '2', 0),
(40, 25, 'Contact', 'view', 'form', '', 0),
(52, 27, 'News', 'frontend', 'article', '19', 0),
(65, 1, 'Articles', 'frontend', 'view', '2,1', 0),
(66, 28, 'Members', 'frontend', 'login', '', 0),
(67, 26, 'News', 'frontend', 'categories', '6', 0),
(70, 30, 'Administrator', 'login', 'index', '', 0),
(71, 31, 'Gallery', 'frontend', 'view', '3', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `menu_group`
-- 

DROP TABLE IF EXISTS `menu_group`;
CREATE TABLE IF NOT EXISTS `menu_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `menu_group`
-- 

INSERT INTO `menu_group` (`id`, `group_name`, `active`) VALUES 
(1, 'Top Menu', 1),
(2, 'Vertical Menu', 0),
(3, 'Second Top Menu', 0),
(4, 'Second Vertical Menu', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `modules`
-- 

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `module_description` tinytext,
  `module_thumbnil` tinytext,
  `module_author` varchar(255) DEFAULT NULL,
  `module_email` varchar(255) DEFAULT NULL,
  `module_version` varchar(255) DEFAULT NULL,
  `module_license` varchar(255) DEFAULT NULL,
  `enable_disable` int(11) DEFAULT '1',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `modules`
-- 

INSERT INTO `modules` (`module_id`, `module_name`, `module_description`, `module_thumbnil`, `module_author`, `module_email`, `module_version`, `module_license`, `enable_disable`) VALUES 
(1, 'Members', 'Manage Users, Search Users, Add, Edit, Delete and Active Deactive Users', NULL, NULL, NULL, NULL, NULL, 1),
(2, 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'News', NULL, NULL, NULL, NULL, NULL, NULL, 1);



-- --------------------------------------------------------

-- 
-- Table structure for table `privilege`
-- 

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE IF NOT EXISTS `privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(255) DEFAULT NULL,
  `privilege_description` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

-- 
-- Dumping data for table `privilege`
-- 

INSERT INTO `privilege` (`privilege_id`, `privilege_name`, `privilege_description`, `module_name`, `controller_name`) VALUES 
(1, 'index', 'View the list of Users', 'Administrator', 'index'),
(2, 'add', 'Create new users', 'Administrator', 'index'),
(3, 'edit', 'Edit a users', 'Administrator', 'index'),
(9, 'list', 'View the list of User Group', 'Administrator', 'role'),
(10, 'lock', 'Lock this User Group', 'Administrator', 'role'),
(11, 'add', 'Add a new Group', 'Administrator', 'role'),
(12, 'delete', 'Delete this Group', 'Administrator', 'role'),
(13, 'rolelist', 'View Group permission list', 'Administrator', 'rule'),
(14, 'roleupdate', 'Update Group permission', 'Administrator', 'rule'),
(15, 'userlist', 'View User permission list', 'Administrator', 'rule'),
(16, 'userupdate', 'Update User permission', 'Administrator', 'rule'),
(18, 'add', 'Create new users', 'Members', 'index'),
(19, 'edit', 'Edit a users', 'Members', 'index'),
(20, 'ajaxdeleteusers', 'Delete a users', 'Members', 'index'),
(21, 'ajaxactivedeactiveusers', 'Active Deactive a users', 'Members', 'index'),
(22, 'ajaxsearchusers', 'Search users', 'Members', 'index'),
(24, 'add', 'Add new Privilege', 'Administrator', 'privilege'),
(25, 'delete', 'Delete a Privilege', 'Administrator', 'privilege'),
(27, 'add', 'Add this Resource', 'Administrator', 'resource'),
(28, 'delete', 'Delete this Resource(s)', 'Administrator', 'resource'),
(29, 'list', 'View the list of Privilege', 'Administrator', 'privilege'),
(30, 'change', 'Access Change Password Page', 'Members', 'password'),

(43, 'list', 'View the list of Menu', 'Menu', 'backend'),
(44, 'add', 'Create new Menu', 'Menu', 'backend'),
(45, 'edit', 'Edit a Menu', 'Menu', 'backend'),
(46, 'delete', 'Delete a Menu', 'Menu', 'backend'),
(47, 'publish', 'Active Deactive a Menu', 'Menu', 'backend'),
(48, 'primary', 'Default Menu', 'Menu', 'backend'),
(50, 'listgrp', 'View the list of Menu Group', 'Menu', 'backend'),
(51, 'addgrp', 'Create new Menu Group', 'Menu', 'backend'),
(52, 'editgrp', 'Edit a Menu Group', 'Menu', 'backend'),
(53, 'deletegrp', 'Delete a Menu Group', 'Menu', 'backend'),
(54, 'publishgrp', 'Active Deactive a Menu Group', 'Menu', 'backend'),


(79, 'list', 'View the list of Jquery Theme', 'Theme', 'backendjquery'),
(80, 'add', 'Create new Jquery Theme', 'Theme', 'backendjquery'),
(81, 'edit', 'Edit Jquery Theme', 'Theme', 'backendjquery'),
(82, 'delete', 'Delete a Jquery Theme', 'Theme', 'backendjquery'),
(83, 'primary', 'Default a Jquery Theme', 'Theme', 'backendjquery'),
(85, 'register', 'View Frontend Register', 'Members', 'frontend'),
(86, 'profile', 'View / edit User''s profile', 'Members', 'index'),

(132, 'send', 'Get New Password', 'Password', 'backend'),
(134, 'list', 'View the list of Users', 'Members', 'index');





-- --------------------------------------------------------

-- 
-- Table structure for table `resource`
-- 

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_description` text,
  `module_name` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

-- 
-- Dumping data for table `resource`
-- 

INSERT INTO `resource` (`resource_id`, `resource_description`, `module_name`, `controller_name`, `parent_id`) VALUES 
(3, 'Resource Manager', 'Administrator', 'resource', 0),
(4, 'User Group Manager', 'Administrator', 'role', 0),
(5, 'Permission Manager', 'Administrator', 'rule', 0),
(6, 'Manage users', 'Members', 'index', 0),
(7, 'Privilege Manager', 'Administrator', 'privilege', 0),
(13, 'Administration Panel', 'Administrator', 'index', 0),
(14, 'Change Password Manageer', 'Members', 'password', 0),
(17, 'Manage Menu', 'Menu', 'backend', 0),
(18, 'Frontend Articles', 'Articles', 'frontend', 0),
(25, 'Frontend Register', 'Members', 'frontend', 0),
(27, 'Project Manager', 'Projects', 'index', 0),
(28, 'Manage News Group', 'News', 'backendgrp', 0),
(29, 'Manage News Category', 'News', 'backend', 0),
(31, 'Manage News Page', 'News', 'backendpro', 0),
(32, 'Frontend News', 'News', 'frontend', 0),
(33, 'Feedback', 'News', 'feedback', 0),
(35, 'Manage Newsletter Template', 'Newsletter', 'templates', 0),
(36, 'Manage Global Settings', 'Settings', 'global', 0),
(37, 'Manage Subscribers', 'Newsletter', 'subscribers', 0),
(40, 'Forget Password Form', 'Password', 'backend', 0),
(41, 'Manage Email Variables', 'Newsletter', 'formats', 0),
(53, 'Manage Gallery Product', 'Gallery', 'backendpro', 0),
(55, 'Contact Form', 'Contact', 'view', 0),
(56, 'Manage Jquery Theme', 'Theme', 'backendjquery', 0),
(57, 'Manage Articles', 'Articles', 'backend', 0),
(63, 'Manage Gallery Group', 'Gallery', 'backendgrp', 0),
(64, 'Manage Gallery Category', 'Gallery', 'backend', 0),
(65, 'Manage Contact', 'Contact', 'backend', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `roles`
-- 

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_parent` int(11) DEFAULT '0',
  `role_lock` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

-- 
-- Dumping data for table `roles`
-- 

INSERT INTO `roles` (`role_id`, `role_name`, `role_desc`, `role_parent`, `role_lock`) VALUES 
(100, 'Developer', 'Developer', 0, 0),
(101, 'Administrator', 'Administrator', 0, 0),
(102, 'Member', 'Member', 0, 1),
(103, 'Visitor', 'Visitor', 0, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `roles_inheritance`
-- 

DROP TABLE IF EXISTS `roles_inheritance`;
CREATE TABLE IF NOT EXISTS `roles_inheritance` (
  `child_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`child_id`,`parent_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `roles_inheritance`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `rule`
-- 

DROP TABLE IF EXISTS `rule`;
CREATE TABLE IF NOT EXISTS `rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(50) NOT NULL,
  `obj_type` enum('user','role') DEFAULT 'role',
  `privilege_id` int(11) DEFAULT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  `resource_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1071 ;

-- 
-- Dumping data for table `rule`
-- 

INSERT INTO `rule` (`rule_id`, `obj_id`, `obj_type`, `privilege_id`, `allow`, `resource_name`) VALUES 
(206, 101, 'role', 27, 1, 'Administrator:resource'),
(207, 101, 'role', 28, 1, 'Administrator:resource'),
(214, 101, 'role', 30, 1, 'Members:password'),
(403, 101, 'role', 85, 1, 'Members:frontend'),
(426, 1, 'user', 56, 1, 'Articles:frontend'),
(533, 101, 'role', 1, 1, 'Administrator:index'),
(534, 101, 'role', 2, 1, 'Administrator:index'),
(535, 101, 'role', 3, 1, 'Administrator:index'),
(607, 101, 'role', 56, 1, 'Articles:frontend'),
(658, 101, 'role', 90, 1, 'Projects:index'),
(659, 101, 'role', 91, 1, 'Projects:index'),
(660, 101, 'role', 92, 1, 'Projects:index'),
(661, 101, 'role', 93, 1, 'Projects:index'),
(662, 101, 'role', 94, 1, 'Projects:index'),
(663, 101, 'role', 95, 1, 'Projects:index'),
(746, 101, 'role', 123, 1, 'Settings:global'),
(773, 102, 'role', 91, 1, 'Projects:index'),
(774, 102, 'role', 93, 1, 'Projects:index'),
(775, 102, 'role', 94, 1, 'Projects:index'),
(776, 102, 'role', 95, 1, 'Projects:index'),
(790, 101, 'role', 18, 1, 'Members:index'),
(791, 101, 'role', 19, 1, 'Members:index'),
(792, 101, 'role', 20, 1, 'Members:index'),
(793, 101, 'role', 21, 1, 'Members:index'),
(794, 101, 'role', 22, 1, 'Members:index'),
(795, 101, 'role', 86, 1, 'Members:index'),
(796, 101, 'role', 134, 1, 'Members:index'),
(823, 101, 'role', 43, 1, 'Menu:backend'),
(824, 101, 'role', 44, 1, 'Menu:backend'),
(825, 101, 'role', 45, 1, 'Menu:backend'),
(826, 101, 'role', 46, 1, 'Menu:backend'),
(827, 101, 'role', 47, 1, 'Menu:backend'),
(828, 101, 'role', 48, 1, 'Menu:backend'),
(829, 101, 'role', 50, 1, 'Menu:backend'),
(830, 101, 'role', 51, 1, 'Menu:backend'),
(831, 101, 'role', 52, 1, 'Menu:backend'),
(832, 101, 'role', 53, 1, 'Menu:backend'),
(833, 101, 'role', 54, 1, 'Menu:backend'),
(834, 101, 'role', 96, 1, 'News:backendgrp'),
(835, 101, 'role', 97, 1, 'News:backendgrp'),
(836, 101, 'role', 98, 1, 'News:backendgrp'),
(837, 101, 'role', 99, 1, 'News:backendgrp'),
(838, 101, 'role', 100, 1, 'News:backendgrp'),
(839, 101, 'role', 113, 1, 'News:frontend'),
(840, 101, 'role', 114, 1, 'News:frontend'),
(841, 101, 'role', 115, 1, 'News:frontend'),
(842, 101, 'role', 116, 1, 'News:frontend'),
(843, 101, 'role', 101, 1, 'News:backend'),
(844, 101, 'role', 102, 1, 'News:backend'),
(845, 101, 'role', 103, 1, 'News:backend'),
(846, 101, 'role', 104, 1, 'News:backend'),
(847, 101, 'role', 105, 1, 'News:backend'),
(848, 101, 'role', 106, 1, 'News:backend'),
(849, 101, 'role', 107, 1, 'News:backendpro'),
(850, 101, 'role', 108, 1, 'News:backendpro'),
(851, 101, 'role', 109, 1, 'News:backendpro'),
(852, 101, 'role', 110, 1, 'News:backendpro'),
(853, 101, 'role', 111, 1, 'News:backendpro'),
(854, 101, 'role', 112, 1, 'News:backendpro'),
(855, 101, 'role', 117, 1, 'News:feedback'),
(856, 101, 'role', 118, 1, 'Newsletter:templates'),
(857, 101, 'role', 119, 1, 'Newsletter:templates'),
(858, 101, 'role', 120, 1, 'Newsletter:templates'),
(859, 101, 'role', 121, 1, 'Newsletter:templates'),
(860, 101, 'role', 122, 1, 'Newsletter:templates'),
(861, 101, 'role', 124, 1, 'Newsletter:templates'),
(862, 101, 'role', 126, 1, 'Newsletter:subscribers'),
(863, 101, 'role', 127, 1, 'Newsletter:subscribers'),
(864, 101, 'role', 128, 1, 'Newsletter:subscribers'),
(865, 101, 'role', 129, 1, 'Newsletter:subscribers'),
(866, 101, 'role', 132, 1, 'Password:backend'),
(870, 101, 'role', 73, 1, 'Gallery:backendpro'),
(871, 101, 'role', 74, 1, 'Gallery:backendpro'),
(872, 101, 'role', 75, 1, 'Gallery:backendpro'),
(873, 101, 'role', 76, 1, 'Gallery:backendpro'),
(874, 101, 'role', 77, 1, 'Gallery:backendpro'),
(875, 101, 'role', 78, 1, 'Gallery:backendpro'),
(876, 101, 'role', 62, 1, 'Gallery:backendgrp'),
(877, 101, 'role', 63, 1, 'Gallery:backendgrp'),
(878, 101, 'role', 64, 1, 'Gallery:backendgrp'),
(879, 101, 'role', 65, 1, 'Gallery:backendgrp'),
(880, 101, 'role', 66, 1, 'Gallery:backendgrp'),
(881, 101, 'role', 67, 1, 'Gallery:backend'),
(882, 101, 'role', 68, 1, 'Gallery:backend'),
(883, 101, 'role', 69, 1, 'Gallery:backend'),
(884, 101, 'role', 70, 1, 'Gallery:backend'),
(885, 101, 'role', 71, 1, 'Gallery:backend'),
(886, 101, 'role', 72, 1, 'Gallery:backend'),
(887, 101, 'role', 37, 1, 'Articles:backend'),
(888, 101, 'role', 38, 1, 'Articles:backend'),
(889, 101, 'role', 39, 1, 'Articles:backend'),
(890, 101, 'role', 40, 1, 'Articles:backend'),
(891, 101, 'role', 41, 1, 'Articles:backend'),
(892, 101, 'role', 42, 1, 'Articles:backend'),
(895, 101, 'role', 79, 1, 'Theme:backendjquery'),
(896, 101, 'role', 80, 1, 'Theme:backendjquery'),
(897, 101, 'role', 81, 1, 'Theme:backendjquery'),
(898, 101, 'role', 82, 1, 'Theme:backendjquery'),
(899, 101, 'role', 83, 1, 'Theme:backendjquery'),
(901, 101, 'role', 139, 1, 'Contact:view'),
(902, 101, 'role', 140, 1, 'Contact:backend'),
(906, 101, 'role', 135, 1, 'Newsletter:formats'),
(907, 101, 'role', 136, 1, 'Newsletter:formats'),
(908, 101, 'role', 137, 1, 'Newsletter:formats'),
(909, 101, 'role', 138, 1, 'Newsletter:formats'),
(910, 100, 'role', 27, 1, 'Administrator:resource'),
(911, 100, 'role', 28, 1, 'Administrator:resource'),
(912, 100, 'role', 9, 1, 'Administrator:role'),
(913, 100, 'role', 10, 1, 'Administrator:role'),
(914, 100, 'role', 11, 1, 'Administrator:role'),
(915, 100, 'role', 12, 1, 'Administrator:role'),
(916, 100, 'role', 13, 1, 'Administrator:rule'),
(917, 100, 'role', 14, 1, 'Administrator:rule'),
(918, 100, 'role', 15, 1, 'Administrator:rule'),
(919, 100, 'role', 16, 1, 'Administrator:rule'),
(920, 100, 'role', 24, 1, 'Administrator:privilege'),
(921, 100, 'role', 25, 1, 'Administrator:privilege'),
(922, 100, 'role', 29, 1, 'Administrator:privilege'),
(923, 100, 'role', 1, 1, 'Administrator:index'),
(924, 100, 'role', 2, 1, 'Administrator:index'),
(925, 100, 'role', 3, 1, 'Administrator:index'),
(926, 100, 'role', 56, 1, 'Articles:frontend'),
(927, 100, 'role', 37, 1, 'Articles:backend'),
(928, 100, 'role', 38, 1, 'Articles:backend'),
(929, 100, 'role', 39, 1, 'Articles:backend'),
(930, 100, 'role', 40, 1, 'Articles:backend'),
(931, 100, 'role', 41, 1, 'Articles:backend'),
(932, 100, 'role', 42, 1, 'Articles:backend'),
(933, 100, 'role', 139, 1, 'Contact:view'),
(934, 100, 'role', 140, 1, 'Contact:backend'),
(935, 100, 'role', 73, 1, 'Gallery:backendpro'),
(936, 100, 'role', 74, 1, 'Gallery:backendpro'),
(937, 100, 'role', 75, 1, 'Gallery:backendpro'),
(938, 100, 'role', 76, 1, 'Gallery:backendpro'),
(939, 100, 'role', 77, 1, 'Gallery:backendpro'),
(940, 100, 'role', 78, 1, 'Gallery:backendpro'),
(941, 100, 'role', 62, 1, 'Gallery:backendgrp'),
(942, 100, 'role', 63, 1, 'Gallery:backendgrp'),
(943, 100, 'role', 64, 1, 'Gallery:backendgrp'),
(944, 100, 'role', 65, 1, 'Gallery:backendgrp'),
(945, 100, 'role', 66, 1, 'Gallery:backendgrp'),
(946, 100, 'role', 67, 1, 'Gallery:backend'),
(947, 100, 'role', 68, 1, 'Gallery:backend'),
(948, 100, 'role', 69, 1, 'Gallery:backend'),
(949, 100, 'role', 70, 1, 'Gallery:backend'),
(950, 100, 'role', 71, 1, 'Gallery:backend'),
(951, 100, 'role', 72, 1, 'Gallery:backend'),
(952, 100, 'role', 18, 1, 'Members:index'),
(953, 100, 'role', 19, 1, 'Members:index'),
(954, 100, 'role', 20, 1, 'Members:index'),
(955, 100, 'role', 21, 1, 'Members:index'),
(956, 100, 'role', 22, 1, 'Members:index'),
(957, 100, 'role', 86, 1, 'Members:index'),
(958, 100, 'role', 134, 1, 'Members:index'),
(959, 100, 'role', 30, 1, 'Members:password'),
(960, 100, 'role', 85, 1, 'Members:frontend'),
(961, 100, 'role', 43, 1, 'Menu:backend'),
(962, 100, 'role', 44, 1, 'Menu:backend'),
(963, 100, 'role', 45, 1, 'Menu:backend'),
(964, 100, 'role', 46, 1, 'Menu:backend'),
(965, 100, 'role', 47, 1, 'Menu:backend'),
(966, 100, 'role', 48, 1, 'Menu:backend'),
(967, 100, 'role', 50, 1, 'Menu:backend'),
(968, 100, 'role', 51, 1, 'Menu:backend'),
(969, 100, 'role', 52, 1, 'Menu:backend'),
(970, 100, 'role', 53, 1, 'Menu:backend'),
(971, 100, 'role', 54, 1, 'Menu:backend'),
(972, 100, 'role', 96, 1, 'News:backendgrp'),
(973, 100, 'role', 97, 1, 'News:backendgrp'),
(974, 100, 'role', 98, 1, 'News:backendgrp'),
(975, 100, 'role', 99, 1, 'News:backendgrp'),
(976, 100, 'role', 100, 1, 'News:backendgrp'),
(977, 100, 'role', 101, 1, 'News:backend'),
(978, 100, 'role', 102, 1, 'News:backend'),
(979, 100, 'role', 103, 1, 'News:backend'),
(980, 100, 'role', 104, 1, 'News:backend'),
(981, 100, 'role', 105, 1, 'News:backend'),
(982, 100, 'role', 106, 1, 'News:backend'),
(983, 100, 'role', 107, 1, 'News:backendpro'),
(984, 100, 'role', 108, 1, 'News:backendpro'),
(985, 100, 'role', 109, 1, 'News:backendpro'),
(986, 100, 'role', 110, 1, 'News:backendpro'),
(987, 100, 'role', 111, 1, 'News:backendpro'),
(988, 100, 'role', 112, 1, 'News:backendpro'),
(989, 100, 'role', 113, 1, 'News:frontend'),
(990, 100, 'role', 114, 1, 'News:frontend'),
(991, 100, 'role', 115, 1, 'News:frontend'),
(992, 100, 'role', 116, 1, 'News:frontend'),
(993, 100, 'role', 117, 1, 'News:feedback'),
(994, 100, 'role', 118, 1, 'Newsletter:templates'),
(995, 100, 'role', 119, 1, 'Newsletter:templates'),
(996, 100, 'role', 120, 1, 'Newsletter:templates'),
(997, 100, 'role', 121, 1, 'Newsletter:templates'),
(998, 100, 'role', 122, 1, 'Newsletter:templates'),
(999, 100, 'role', 124, 1, 'Newsletter:templates'),
(1000, 100, 'role', 126, 1, 'Newsletter:subscribers'),
(1001, 100, 'role', 127, 1, 'Newsletter:subscribers'),
(1002, 100, 'role', 128, 1, 'Newsletter:subscribers'),
(1003, 100, 'role', 129, 1, 'Newsletter:subscribers'),
(1004, 100, 'role', 135, 1, 'Newsletter:formats'),
(1005, 100, 'role', 136, 1, 'Newsletter:formats'),
(1006, 100, 'role', 137, 1, 'Newsletter:formats'),
(1007, 100, 'role', 138, 1, 'Newsletter:formats'),
(1008, 100, 'role', 132, 1, 'Password:backend'),
(1009, 100, 'role', 90, 1, 'Projects:index'),
(1010, 100, 'role', 91, 1, 'Projects:index'),
(1011, 100, 'role', 92, 1, 'Projects:index'),
(1012, 100, 'role', 93, 1, 'Projects:index'),
(1013, 100, 'role', 94, 1, 'Projects:index'),
(1014, 100, 'role', 95, 1, 'Projects:index'),
(1015, 100, 'role', 123, 1, 'Settings:global'),
(1016, 100, 'role', 79, 1, 'Theme:backendjquery'),
(1017, 100, 'role', 80, 1, 'Theme:backendjquery'),
(1018, 100, 'role', 81, 1, 'Theme:backendjquery'),
(1019, 100, 'role', 82, 1, 'Theme:backendjquery'),
(1020, 100, 'role', 83, 1, 'Theme:backendjquery'),
(1021, 101, 'role', 9, 1, 'Administrator:role'),
(1022, 101, 'role', 11, 1, 'Administrator:role'),
(1023, 101, 'role', 12, 1, 'Administrator:role'),
(1024, 102, 'role', 56, 1, 'Articles:frontend'),
(1025, 102, 'role', 37, 1, 'Articles:backend'),
(1026, 102, 'role', 38, 1, 'Articles:backend'),
(1027, 102, 'role', 39, 1, 'Articles:backend'),
(1028, 102, 'role', 40, 1, 'Articles:backend'),
(1029, 102, 'role', 41, 1, 'Articles:backend'),
(1030, 102, 'role', 42, 1, 'Articles:backend'),
(1063, 102, 'role', 30, 1, 'Members:password'),
(1064, 102, 'role', 85, 1, 'Members:frontend'),
(1065, 102, 'role', 132, 1, 'Password:backend'),
(1066, 102, 'role', 22, 1, 'Members:index'),
(1067, 102, 'role', 86, 1, 'Members:index'),
(1068, 102, 'role', 134, 1, 'Members:index'),
(1069, 101, 'role', 13, 1, 'Administrator:rule'),
(1070, 101, 'role', 14, 1, 'Administrator:rule');

-- --------------------------------------------------------

-- 
-- Table structure for table `states`
-- 

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

-- 
-- Dumping data for table `states`
-- 

INSERT INTO `states` (`state_id`, `country_id`, `state_name`) VALUES 
(9, 226, 'Archway'),
(10, 226, 'Bounds Green'),
(11, 226, 'Bethnal Green'),
(12, 226, 'Clapton'),
(13, 226, 'Camden'),
(14, 226, 'Camden Town'),
(15, 226, 'Caledonia Road'),
(16, 226, 'Dalston'),
(17, 226, 'Edmonton'),
(18, 226, 'Enfield'),
(19, 226, 'Finsbury Park'),
(20, 226, 'Hackney'),
(21, 226, 'Hoxton'),
(22, 226, 'Hornsey'),
(23, 226, 'Homerton'),
(24, 226, 'Haringey'),
(25, 226, 'Highbury'),
(26, 226, 'Holloway'),
(27, 226, 'Islington'),
(28, 226, 'Leyton'),
(29, 226, 'Leytonstone'),
(30, 226, 'Manor House'),
(31, 226, 'Newington Green'),
(32, 226, 'Ponders End'),
(33, 226, 'Palmers Green'),
(34, 226, 'Stoke Newington'),
(35, 226, 'Shoreditch'),
(36, 226, 'Seven Sisters'),
(37, 226, 'Stamford Hill'),
(38, 226, 'Tottenham'),
(39, 226, 'Turnpike Lane'),
(40, 226, 'Wood Green'),
(41, 226, 'E2'),
(42, 226, 'E5'),
(43, 226, 'E8,E9'),
(44, 226, 'N1'),
(45, 226, 'N5'),
(46, 226, 'N7'),
(47, 226, 'N16'),
(48, 226, 'Walthamstow'),
(49, 226, 'Hackney Fields'),
(50, 226, 'Barnet'),
(51, 19, 'Dhaka'),
(52, 19, 'Chittacong'),
(53, 19, 'Khulna');


-- --------------------------------------------------------

-- 
-- Table structure for table `user_profile`
-- 

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `address` text,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `salt` char(30) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  UNIQUE KEY `uid` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `user_profile`
-- 

INSERT INTO `user_profile` (`user_id`, `role_id`, `firstName`, `title`, `lastName`, `username`, `password`, `gender`, `dob`, `companyName`, `postalCode`, `address`, `phone`, `mobile`, `fax`, `website`, `state`, `country`, `city`, `status`, `salt`, `last_access`) VALUES 
(1, 100, 'Developer', 'Mr', 'Developer', 'dev@email.com', '54148928c6b62ee08a1eeaf782051888', NULL, NULL, 'Eicrasoft ltd', '1234', '6,Gulshan', '', '', '', 'www.cms.com.bd', 'Dhaka', '19', 'Dhaka', 1, 'uu]Aj', '2010-08-08 06:42:27'),
(2, 101, 'Administrator', 'Mr', 'Admin', 'welcome@yoursite.com', '02034497021b3f8c9b39cba2eab93e88', NULL, NULL, 'Eicrasoft ltd', '1219', '6,Gulshan', '', '', '', 'www.eicra.com', 'London', '226', 'London', 1, 'mmHbz', '2010-08-08 06:45:04'),
(3, 102, 'Dev4', 'Mr', 'dev4', 'dev4@eicra.com', '56f9a183b552e23892299ff4cda2cd9a', NULL, NULL, 'Eicrasoft ltd', '1215', '6,Gulshan', '', '', '', '', 'Dhaka', '19', 'Dhaka', 1, '`\\nT3', '2010-08-08 06:41:51');
