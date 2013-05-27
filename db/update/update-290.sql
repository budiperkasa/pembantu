--	Comment
--	Previous Version = 2.8.5
--	Working Version = 2.9.0

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_global_setting`
--

DROP TABLE IF EXISTS `$prefix_global_setting`;
CREATE TABLE IF NOT EXISTS `$prefix_global_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`),
  UNIQUE KEY `field_name_2` (`field_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `$prefix_global_setting`
--

INSERT INTO `$prefix_global_setting` (`id`, `field_name`, `field_value`) VALUES
(1, 'site_name', 'Eicrasoft Ltd'),
(2, 'site_title', 'Eicrasoft Ltd'),
(3, 'site_url', 'localhost.com'),
(4, 'analytics_code', ''),
(5, 'hit_counter_code', ''),
(6, 'meta_key', 'Eicrasoft Ltd'),
(7, 'meta_desc', 'Eicrasoft Ltd'),
(8, 'default_country', '226'),
(9, 'default_language', 'en_US'),
(10, 'default_locale', 'en_US'),
(11, 'seo_on', '0'),
(12, 'login_ip_checking', '0'),
(13, 'captcha_enable', '1'),
(14, 'image_renaming_enable', '1'),
(15, 'site_direction', 'ltr'),
(16, 'price_margine', '1,2,3,4,5'),
(17, 'global_email', 'test@eicrasoft.com'),
(18, 'payment_email', 'test@eicrasoft.com'),
(19, 'payment_logo_url', 'https://billing.eicra.com/images/logo.jpg'),
(20, 'payment_pay_to_text', 'PAY TO : Mr xxxxxxxxxx\r\nBank Name : My Bank Ltd\r\nAccount Name  :  Eicra Soft Ltd\r\nAccount Number  : xxxxxxxxxxxx\r\nSWIFT Code       :  XXXXXX'),
(21, 'email_mailer_protocol', 'mail'),
(22, 'email_smtp_from', 'test@eicrasoft.info'),
(23, 'email_smtp_host', 'mail.eicrasoft.info'),
(24, 'email_smtp_username', 'email@eicrasoft.info'),
(25, 'email_smtp_password', '!@#$%^&*()'),
(26, 'email_smtp_port', '26'),
(27, 'email_smtp_wordrap', '50'),
(28, 'admin_footer', ''),
(29, 'admin_footer_url', ''),
(30, 'frontend_footer', ''),
(31, 'frontend_footer_url', ''),
(32, 'admin_header_logo', ''),
(33, 'admin_favicon', ''),
(34, 'frontend_favicon', ''),
(35, 'sft_version', ''),
(36, 'payment_system', 'On');



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Menu
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_menu`
--
ALTER TABLE `$prefix_menu` ADD `entry_by` INT NOT NULL DEFAULT '1';




-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Geo
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_countries`
--
ALTER TABLE `$prefix_countries` ADD UNIQUE ( `value` );