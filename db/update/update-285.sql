--	Comment
--	Previous Version = 2.8.4
--	Working Version = 2.8.5

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Members
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_forms`
--

ALTER TABLE `$prefix_forms` CHANGE `captcha_gc_freq` `captcha_gc_freq` INT( 11 ) NOT NULL DEFAULT '1';

ALTER TABLE `$prefix_forms` CHANGE `captcha_height` `captcha_height` INT( 11 ) NOT NULL DEFAULT '60';

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Paymentgateway
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_payment_gateway`
--

insert into `$prefix_payment_gateway` (`id`, `name`, `title`, `logo`, `payment_order`, `active`) values (9,'WebPay','UBA WEBPAY (Bank of Africa )','webpay.jpg','9','0');

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings`
--

ALTER TABLE `$prefix_global_settings` ADD `login_ip_checking` ENUM( '0', '1', '2' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' AFTER `seo_on` ;

ALTER TABLE `$prefix_global_settings` ADD `captcha_enable` ENUM( '1', '0' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' AFTER `login_ip_checking` ,
									   ADD `image_renaming_enable` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' AFTER `captcha_enable` ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings_ip_ban`
--


DROP TABLE IF EXISTS `$prefix_global_settings_ip_ban`;
CREATE TABLE IF NOT EXISTS `$prefix_global_settings_ip_ban` (                                      
																 `id` int(11) NOT NULL AUTO_INCREMENT,                                         
																 `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,                       
																 `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',          
																 `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,                  
																 PRIMARY KEY (`id`)                                                            
															   ) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Administrator
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `roles`
--

ALTER TABLE `$prefix_roles` ADD `allow_ip_checking_to_login` ENUM( '1', '0' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0';