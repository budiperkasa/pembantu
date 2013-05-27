--	Comment
--	Previous Version = 2.8.1
--	Working Version = 2.8.3

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings`
--

ALTER TABLE `$prefix_global_settings` 	ADD `payment_logo_url` TEXT NULL DEFAULT NULL AFTER `payment_email` ,
										ADD `payment_pay_to_text` TEXT NULL DEFAULT NULL AFTER `payment_logo_url` ;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_price_margine`
--


ALTER TABLE `$prefix_global_price_margine` CHANGE `amount_type` `amount_type` ENUM( '0', '1', '2', '3', '4' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;

ALTER TABLE `$prefix_global_price_margine` CHANGE `amount` `amount` DOUBLE UNSIGNED NOT NULL DEFAULT '0';

INSERT INTO `$prefix_global_price_margine` (`id`, `short_desc`, `amount`, `amount_type`) VALUES
(3, 'Booking Fees', 10, '1'),
(4, 'Service Charge', 1.5, '2'),
(5, 'Deposit / Downpayment', 10, '2');

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Invoice
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_table`
--

ALTER TABLE `$prefix_invoice_table` ADD `service_charge` DOUBLE NOT NULL DEFAULT '0.0' AFTER `total` ;

ALTER TABLE `$prefix_invoice_table` ADD `deposit_charge` DOUBLE NOT NULL DEFAULT '0.0' AFTER `service_charge` ;

ALTER TABLE `$prefix_invoice_table` ADD `now_payable` DOUBLE NOT NULL DEFAULT '0.0' AFTER `deposit_charge` ;

ALTER TABLE `$prefix_invoice_table` ADD `now_payable_paid_status` INT NOT NULL DEFAULT '0' AFTER `now_payable`; 

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_email_template_settings`
--

DROP TABLE IF EXISTS `$prefix_invoice_email_template_settings`;
CREATE TABLE IF NOT EXISTS `$prefix_invoice_email_template_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `default_template_id` int(11) DEFAULT NULL,
  `paid_template_id` int(11) DEFAULT NULL,
  `unpaid_template_id` int(11) DEFAULT NULL,
  `cancel_template_id` int(11) DEFAULT NULL,
  `delete_template_id` int(11) DEFAULT NULL,
  `refund_template_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `$prefix_invoice_email_template_settings`
--

INSERT INTO `$prefix_invoice_email_template_settings` (`id`, `module_name`, `role_id`, `default_template_id`, `paid_template_id`, `unpaid_template_id`, `cancel_template_id`, `delete_template_id`, `refund_template_id`) VALUES
(1, 'Autos', 104, 34, 33, 32, 36, 35, NULL),
(2, 'Costcalculator', 104, 34, 33, 32, 36, 35, NULL),
(3, 'Flight', 104, 34, 33, 32, 36, 35, NULL),
(4, 'Hotels', 104, 34, 33, 32, 36, 35, NULL),
(5, 'Property', 104, 34, 33, 32, 36, 35, NULL),
(6, 'Tours', 104, 34, 33, 32, 36, 35, NULL),
(7, 'Vacationrentals', 104, 34, 33, 32, 36, 35, NULL);
                            


-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Paymentgateway
--

-- --------------------------------------------------------

--
-- Table structure for table `$prefix_payment_gateway`
--

DROP TABLE IF EXISTS `$prefix_payment_gateway`;
CREATE TABLE IF NOT EXISTS `$prefix_payment_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `$prefix_payment_gateway`
--

INSERT INTO `$prefix_payment_gateway` (`id`, `name`, `logo`, `payment_order`, `active`) VALUES
(1, 'Paypal', 'paypal.gif', '1', '0'),
(2, 'tocheckout', '2checkout_logo.jpg', '1', '1'),
(3, 'payza', 'payza.png', '3', '0'),
(4, 'moneybookers', 'moneybookers.gif', '4', '0'),
(5, 'worldpay', 'WorldPay.jpg', '5', '0'),
(6, 'googlecheckout', 'google_checkout.jpg', '6', '0'),
(7, 'bank', 'bank.jpg', '7', '0'),
(8, 'ccAvenue', 'ccavenue.gif', '8', '0');

-- --------------------------------------------------------

--
-- Table structure for table `$prefix_payment_gateway_settings`
--

DROP TABLE IF EXISTS `$prefix_payment_gateway`;
CREATE TABLE IF NOT EXISTS `$prefix_payment_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `$prefix_payment_gateway`
--

INSERT INTO `$prefix_payment_gateway` (`id`, `name`, `title`, `logo`, `payment_order`, `active`) VALUES
(1, 'Paypal', 'Paypal', 'paypal.gif', '1', '0'),
(2, 'tocheckout', '2Checkout', '2checkout_logo.jpg', '2', '0'),
(3, 'payza', 'Payza ( Old Alertpay)', 'payza.png', '3', '0'),
(4, 'moneybookers', 'Moneybookers', 'moneybookers.gif', '4', '0'),
(5, 'worldpay', 'World', 'WorldPay.jpg', '5', '0'),
(6, 'googlecheckout', 'Google Checkout', 'google_checkout.jpg', '6', '0'),
(7, 'bank', 'Bank Transfer (Offline Payment)', 'bank.jpg', '7', '1'),
(8, 'ccAvenue', 'CCAvenue', 'ccavenue.gif', '8', '0');

-- --------------------------------------------------------

--
-- Table structure for table `$prefix_payment_gateway_settings`
--

DROP TABLE IF EXISTS `$prefix_payment_gateway_settings`;
CREATE TABLE IF NOT EXISTS `$prefix_payment_gateway_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_id` int(11) NOT NULL,
  `setting` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;