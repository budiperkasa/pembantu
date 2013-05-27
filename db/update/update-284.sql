--	Comment
--	Previous Version = 2.8.3
--	Working Version = 2.8.4

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings`
--

ALTER TABLE `$prefix_global_settings` ADD `sft_version` VARCHAR( 255 ) NULL DEFAULT NULL AFTER `hit_counter_code` ;


-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Members
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_forms`
--

ALTER TABLE `$prefix_forms`	ADD `captcha_enable` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' AFTER `active`,  
								ADD `captcha_field_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'captcha_security' COMMENT 'It must be unique.' AFTER `captcha_enable`,  
								ADD `captcha_word_length` INT NOT NULL DEFAULT '5' AFTER `captcha_field_name`,  
								ADD `captcha_width` INT NOT NULL DEFAULT '145' AFTER `captcha_word_length`,  
								ADD `captcha_height` INT NOT NULL DEFAULT '40' AFTER `captcha_width`,  
								ADD `captcha_dot_noise_level` INT NOT NULL DEFAULT '10' AFTER `captcha_height`,  
								ADD `captcha_line_noise_level` INT NOT NULL DEFAULT '2' AFTER `captcha_dot_noise_level`,  
								ADD `captcha_gc_freq` INT NOT NULL DEFAULT '0' AFTER `captcha_line_noise_level`,  
								ADD `captcha_font_color_r` INT NOT NULL DEFAULT '0' AFTER `captcha_gc_freq`,  
								ADD `captcha_font_color_g` INT NOT NULL DEFAULT '62' AFTER `captcha_font_color_r`,  
								ADD `captcha_font_color_b` INT NOT NULL DEFAULT '116' AFTER `captcha_font_color_g`,  
								ADD `captcha_background_color_r` INT NOT NULL DEFAULT '255' AFTER `captcha_font_color_b`,  
								ADD `captcha_background_color_g` INT NOT NULL DEFAULT '255' AFTER `captcha_background_color_r`,  
								ADD `captcha_background_color_b` INT NOT NULL DEFAULT '255' AFTER `captcha_background_color_g`,  
								ADD `captcha_font` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'images/adminImages/captcha/monofont.ttf' AFTER `captcha_background_color_b`,  
								ADD `captcha_font_size` INT NOT NULL DEFAULT '30' AFTER `captcha_font`,  
								ADD `captcha_img_dir` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'temp/cache' AFTER `captcha_font_size`,  
								ADD `captcha_img_url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'temp/cache' AFTER `captcha_img_dir`,  
								ADD `captcha_timeout` INT NOT NULL DEFAULT '500' AFTER `captcha_img_url`;