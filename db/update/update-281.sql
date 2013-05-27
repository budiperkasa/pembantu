--	Comment
--	Previous Version = 2.8.0
--	Working Version = 2.8.1

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Administrator
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `privilege`
--

ALTER TABLE `$prefix_privilege` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_privilege`	CHANGE `privilege_name` `privilege_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `privilege_description` `privilege_description` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `module_name` `module_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `controller_name` `controller_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
									

-- --------------------------------------------------------

-- 
-- 	Table structure for table `resource`
--

ALTER TABLE `$prefix_resource` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_resource`	CHANGE `resource_description` `resource_description` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `module_name` `module_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `controller_name` `controller_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
									

-- --------------------------------------------------------

-- 
-- 	Table structure for table `rule`
--

ALTER TABLE `$prefix_rule` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_rule`	CHANGE `obj_type` `obj_type` ENUM( 'user', 'role' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'role',
							CHANGE `resource_name` `resource_name` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;












-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Members
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `roles`
--

ALTER TABLE `$prefix_roles` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_roles` ADD `auto_approve` ENUM( '1', '0' ) NOT NULL DEFAULT '1' AFTER `form_id`;

ALTER TABLE `$prefix_roles` ADD `auto_publish_article` ENUM( '1', '0' ) NOT NULL DEFAULT '1' COMMENT 'When users submit a new post, property or listing, publish to my site immediately. ' AFTER `auto_approve`;

ALTER TABLE `$prefix_roles` ADD `access_file_image_manager` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow access to navigate through global file manager and image galleries. ' AFTER `auto_publish_article` ;

ALTER TABLE `$prefix_roles` ADD `access_other_user_profile` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow user to access to other user’s profile also. ' AFTER `access_file_image_manager` ;

ALTER TABLE `$prefix_roles` ADD `access_other_user_article` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow user to access to other user’s article also. ' AFTER `access_other_user_profile`; 

ALTER TABLE `$prefix_roles` ADD `allow_register_to_this_role` ENUM( '1', '0' ) NOT NULL DEFAULT '1' COMMENT 'to allow visitors to register for this role' AFTER `access_other_user_article`;

ALTER TABLE `$prefix_roles` ADD `role_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL AFTER `role_name` , ADD UNIQUE ( `role_title` ) ;

ALTER TABLE `$prefix_roles` ADD `allow_change_user_role` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow to change user role in admin panel' AFTER `allow_register_to_this_role` ;

ALTER TABLE `$prefix_roles` ADD `allow_change_own_profile_role` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow to change own profile role' AFTER `allow_change_user_role` ;

ALTER TABLE `$prefix_roles` ADD `allow_change_user_packages` ENUM( '1', '0' ) NOT NULL DEFAULT '0' AFTER `allow_change_own_profile_role` ;

ALTER TABLE `$prefix_roles` ADD `allow_reset_user_password` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow to reset user password.' AFTER `allow_change_user_packages`;

ALTER TABLE `$prefix_roles` ADD `allow_login_from_frontend` ENUM( '1', '0' ) NOT NULL DEFAULT '1' COMMENT 'Allow Login From Frontend' AFTER `allow_reset_user_password` ;

ALTER TABLE `$prefix_roles` ADD `redirect_to_page_after_login` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Administrator/index/index' COMMENT 'Redirect To Page After Login' AFTER `allow_login_from_frontend` ;

ALTER TABLE `$prefix_roles` ADD `redirect_to_page_after_logout` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Redirect To Page After Logout' AFTER `redirect_to_page_after_login` ;

ALTER TABLE `$prefix_roles` ADD `allow_to_send_email` ENUM( '1', '0' ) NOT NULL DEFAULT '1' COMMENT 'Allow to send email to this role''s users' AFTER `redirect_to_page_after_logout` ;

ALTER TABLE `$prefix_roles` ADD `allow_to_change_ownership` ENUM( '1', '0' ) NOT NULL DEFAULT '0' COMMENT 'Allow to change ownership of product item' AFTER `allow_to_send_email` ;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `user_profile`
--

ALTER TABLE `$prefix_user_profile` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_user_profile`	CHANGE `firstName` `firstName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `title` `title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `lastName` `lastName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `username` `username` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `password` `password` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `gender` `gender` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `dob` `dob` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `companyName` `companyName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `postalCode` `postalCode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `address` `address` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `phone` `phone` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `mobile` `mobile` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `fax` `fax` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `website` `website` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `state` `state` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `country` `country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `city` `city` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `salt` `salt` CHAR(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;





-- --------------------------------------------------------

-- 
-- 	Table structure for table `forms`
--

ALTER TABLE `$prefix_forms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_forms` 	CHANGE `form_name` `form_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `login_set` `login_set` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
								CHANGE `db_set` `db_set` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `email_set` `email_set` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `email_to` `email_to` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `email_cc` `email_cc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `email_bcc` `email_bcc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `support_tags` `support_tags` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `support_attribs` `support_attribs` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `editor_fields` `editor_fields` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `attach_file_path` `attach_file_path` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `attach_file_delete` `attach_file_delete` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `attach_file_type` `attach_file_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `form_type` `form_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `front_desc` `front_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `meta_desc` `meta_desc` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `label_class` `label_class` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'label_class', 
								CHANGE `label_style` `label_style` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `star_class` `star_class` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'star_class', 
								CHANGE `star_style` `star_style` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `active` `active` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1';

-- --------------------------------------------------------

-- 
-- 	Table structure for table `forms_fields`
--

ALTER TABLE `$prefix_forms_fields` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_forms_fields`	CHANGE `field_name` `field_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_group` `field_group` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_id` `field_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_class` `field_class` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_type` `field_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_width` `field_width` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_height` `field_height` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_separator` `field_separator` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_label` `field_label` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_title` `field_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_desc` `field_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_option` `field_option` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `field_default_value` `field_default_value` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `regexpr` `regexpr` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `display_admin` `display_admin` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `display_frontend` `display_frontend` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `required` `required` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0';


-- --------------------------------------------------------

-- 
-- 	Table structure for table `forms_fields_values`
--

ALTER TABLE `$prefix_forms_fields_values` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_forms_fields_values` CHANGE `field_value` `field_value` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `forms_general`
--

ALTER TABLE `$prefix_forms_general` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_forms_general`	CHANGE `active` `active` ENUM( '2', '1', '0' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '2',
										CHANGE `coment_type` `coment_type` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Articles
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `articles`
--

ALTER TABLE `$prefix_articles` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_articles` CHANGE `article_name` `article_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
CHANGE `article_title` `article_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
CHANGE `article_content` `article_content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
CHANGE `article_meta_title` `article_meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
CHANGE `article_meta_key` `article_meta_key` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
CHANGE `article_meta_desc` `article_meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `cities`
--

ALTER TABLE `$prefix_cities` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_cities` CHANGE `city` `city` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `countries`
--

ALTER TABLE `$prefix_countries` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_countries` CHANGE `value` `value` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `states`
--

ALTER TABLE `$prefix_states` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_states` CHANGE `state_name` `state_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: COMMENT
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `comment`
--

ALTER TABLE `$prefix_comment` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_comment` 	CHANGE `table_name` `table_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `page_url` `page_url` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `guest_name` `guest_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `guest_email` `guest_email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `comment_title` `comment_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `comment_desc` `comment_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `active` `active` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0';
							
-- --------------------------------------------------------

-- 
-- 	Table structure for table `comment_setting`
--

ALTER TABLE `$prefix_comment_setting` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_comment_setting` 	CHANGE `module` `module` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `active` `active` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `who_view` `who_view` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `who_comment` `who_comment` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `publish_on_add` `publish_on_add` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `sorting_date` `sorting_date` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: CONTACT
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `contact_info`
--

ALTER TABLE `$prefix_contact_info` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_contact_info` 	CHANGE `contact_title` `contact_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `contact_desc` `contact_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_title` `meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_key` `meta_key` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;


-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: SETTINGS
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `dynamic_search_settings`
--

ALTER TABLE `$prefix_dynamic_search_settings` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_dynamic_search_settings` 	CHANGE `group_form_id_field` `group_form_id_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `group_table` `group_table` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `static_table` `static_table` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `text_search_field` `text_search_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `text_search_type` `text_search_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `text_search_option` `text_search_option` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
												CHANGE `numeric_search_field` `numeric_search_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `numeric_search_type` `numeric_search_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `numeric_search_option` `numeric_search_option` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
												CHANGE `date_search_field` `date_search_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `date_search_type` `date_search_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
												CHANGE `date_search_option` `date_search_option` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings`
--

ALTER TABLE `$prefix_global_settings` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_global_settings` ADD `site_direction` ENUM( 'ltr', 'rtl' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr' COMMENT 'Direction of pages' AFTER `site_url` ;

ALTER TABLE `$prefix_global_settings`	CHANGE `site_title` `site_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `site_name` `site_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `site_url` `site_url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_key` `meta_key` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `default_language` `default_language` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `default_locale` `default_locale` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `seo_on` `seo_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `price_margine` `price_margine` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `global_email` `global_email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_email` `payment_email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `email_mailer_protocol` `email_mailer_protocol` ENUM('sendmail','mail','smtp') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'mail', 
										CHANGE `email_smtp_from` `email_smtp_from` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `email_smtp_host` `email_smtp_host` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `email_smtp_username` `email_smtp_username` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `email_smtp_password` `email_smtp_password` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `admin_header_logo` `admin_header_logo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `admin_favicon` `admin_favicon` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `frontend_favicon` `frontend_favicon` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `admin_footer` `admin_footer` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `admin_footer_url` `admin_footer_url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `frontend_footer` `frontend_footer` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `frontend_footer_url` `frontend_footer_url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `analytics_code` `analytics_code` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `hit_counter_code` `hit_counter_code` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_price_margine`
--

ALTER TABLE `$prefix_global_price_margine` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_global_price_margine` 	CHANGE `short_desc` `short_desc` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
												CHANGE `amount_type` `amount_type` ENUM( '0', '1', '2' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;






-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: GALLERY
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `gallery_category`
--

ALTER TABLE `$prefix_gallery_category` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_gallery_category`	CHANGE `category_name` `category_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `category_title` `category_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `category_code` `category_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `category_price` `category_price` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `category_thumb` `category_thumb` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `gallery_group`
--

ALTER TABLE `$prefix_gallery_group` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_gallery_group`	CHANGE `gallery_name` `gallery_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `gallery_type` `gallery_type` ENUM('image','video','music','chart') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'image', 
										CHANGE `category_on_off` `category_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `category_panel` `category_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `horizontal_panel` `horizontal_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `cat_sort` `cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `cat_order` `cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_cat_on` `latest_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_cat_sort` `latest_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_cat_order` `latest_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `fearured_cat_on` `fearured_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `fearured_cat_sort` `fearured_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `fearured_cat_order` `fearured_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_sort` `file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_order` `file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `light_box_on` `light_box_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_file_on` `latest_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_file_sort` `latest_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_file_order` `latest_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `featured_file_on` `featured_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `featured_file_sort` `featured_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `featured_file_order` `featured_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_type` `file_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_cat_thumb_type` `file_cat_thumb_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_cat_thumb_resize_func` `file_cat_thumb_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_thumb_type` `file_thumb_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_thumb_resize_func` `file_thumb_resize_func` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `img_big_resize_func` `img_big_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `watermark_enabled` `watermark_enabled` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `watermark_on_edit` `watermark_on_edit` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `watermarkimage_path` `watermarkimage_path` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/adminImages/watermark/Sample-trans.png', 
										CHANGE `wm_size` `wm_size` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'full', 
										CHANGE `h_position` `h_position` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'center', 
										CHANGE `v_position` `v_position` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'center', 
										CHANGE `font_path` `font_path` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'images/adminImages/watermark/arial.ttf';


-- --------------------------------------------------------

-- 
-- 	Table structure for table `gallery_product`
--

ALTER TABLE `$prefix_gallery_product` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_gallery_product`	CHANGE `product_name` `product_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_title` `product_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_thumb_primary` `product_thumb_primary` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_thumb` `product_thumb` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_file_primary` `product_file_primary` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_file` `product_file` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_desc` `product_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `product_code` `product_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `related_items` `related_items` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `featured` `featured` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
									CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

										
										









-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: MENU
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu`
--

ALTER TABLE `$prefix_menu` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_menu`	CHANGE `menu_name` `menu_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '', 
							CHANGE `menu_title` `menu_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '', 
							CHANGE `menu_image` `menu_image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `menu_template` `menu_template` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `target` `target` ENUM('_self','_blank','_parent','_top') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '_self', 
							CHANGE `menu_default` `menu_default` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
							CHANGE `menu_status` `menu_status` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
							CHANGE `external_link` `external_link` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `show_after_login` `show_after_login` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0';

-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu_assign`
--

ALTER TABLE `$prefix_menu_assign` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_menu_assign`	CHANGE `module_name` `module_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `controller_name` `controller_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `action_name` `action_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `page_id` `page_id` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu_group`
--

ALTER TABLE `$prefix_menu_group` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_menu_group` CHANGE `group_name` `group_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;




										
										









-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: NEWS
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `news_category`
--

ALTER TABLE `$prefix_news_category` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_news_category`	CHANGE `category_name` `category_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `category_title` `category_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `category_thumb` `category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_title` `meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_keywords` `meta_keywords` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `news_group`
--

ALTER TABLE `$prefix_news_group` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_news_group`	CHANGE `news_name` `news_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `news_type` `news_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `calendar_on_off` `calendar_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `category_on_off` `category_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `cat_sort` `cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `cat_order` `cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `latest_cat_on` `latest_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
								CHANGE `latest_cat_sort` `latest_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `latest_cat_order` `latest_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `fearured_cat_on` `fearured_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
								CHANGE `fearured_cat_sort` `fearured_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `fearured_cat_order` `fearured_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `news_sort` `news_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `news_order` `news_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `latest_news_on` `latest_news_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
								CHANGE `latest_news_sort` `latest_news_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `latest_news_order` `latest_news_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `featured_news_on` `featured_news_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `featured_news_sort` `featured_news_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `featured_news_order` `featured_news_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `img_type` `img_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `news_cat_thumb_resize_func` `news_cat_thumb_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `news_thumb_resize_func` `news_thumb_resize_func` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `num_category_box_string` `num_category_box_string` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `category_panel` `category_panel` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
								CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
								CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `news_page`
--

ALTER TABLE `$prefix_news_page` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_news_page`	CHANGE `page_name` `page_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `page_title` `page_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `page_thumb` `page_thumb` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `related_items` `related_items` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `featured` `featured` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
							CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
							CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
							CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;







-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: NEWSLETTER
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `email_format`
--

ALTER TABLE `$prefix_email_format` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_email_format` 	CHANGE `e_format` `e_format` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `e_text` `e_text` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `newsletter_templates`
--

ALTER TABLE `$prefix_newsletter_templates` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_newsletter_templates`		CHANGE `templates_name` `templates_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
												CHANGE `templates_title` `templates_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
												CHANGE `templates_page` `templates_page` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
												CHANGE `templates_desc` `templates_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL; 


-- --------------------------------------------------------

-- 
-- 	Table structure for table `subscribers`
--

ALTER TABLE `$prefix_subscribers` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_subscribers` 	CHANGE `name` `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `email` `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
	



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: PROJECT
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `files`
--

ALTER TABLE `$prefix_files` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_files` 	CHANGE `file_title` `file_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `file_name` `file_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `file_name_path` `file_name_path` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `file_system`
--

ALTER TABLE `$prefix_file_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_file_system` 	CHANGE `folder_name` `folder_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `folder_path` `folder_path` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `file_type` `file_type` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
	



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: POLL
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `poll_answer`
--

ALTER TABLE `$prefix_poll_answer` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_poll_answer`	CHANGE `content` `content` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `thumb` `thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `active` `active` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1';

-- --------------------------------------------------------

-- 
-- 	Table structure for table `poll_category`
--

ALTER TABLE `$prefix_poll_category` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_poll_category`	CHANGE `category_name` `category_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `category_title` `category_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `category_thumb` `category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_title` `meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_keywords` `meta_keywords` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `poll_group`
--

ALTER TABLE `$prefix_poll_group` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_poll_group`	CHANGE `group_name` `group_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `multiple_vote` `multiple_vote` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `category_on_off` `category_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `category_panel` `category_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `horizontal_panel` `horizontal_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `cat_sort` `cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `cat_order` `cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `latest_cat_on` `latest_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
									CHANGE `latest_cat_sort` `latest_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `latest_cat_order` `latest_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `featured_cat_on` `featured_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
									CHANGE `featured_cat_sort` `featured_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `featured_cat_order` `featured_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_sort` `file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_order` `file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `light_box_on` `light_box_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
									CHANGE `latest_file_on` `latest_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
									CHANGE `latest_file_sort` `latest_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `latest_file_order` `latest_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `featured_file_on` `featured_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
									CHANGE `featured_file_sort` `featured_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `featured_file_order` `featured_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_type` `file_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_cat_thumb_type` `file_cat_thumb_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_cat_thumb_resize_func` `file_cat_thumb_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_thumb_type` `file_thumb_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `file_thumb_resize_func` `file_thumb_resize_func` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
									CHANGE `img_big_resize_func` `img_big_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `poll_question`
--

ALTER TABLE `$prefix_poll_question` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_poll_question`	CHANGE `question` `question` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `question_title` `question_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `thumb` `thumb` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `never_end` `never_end` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `active` `active` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `multiple_option` `multiple_option` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;




-- --------------------------------------------------------

-- 
-- 	Table structure for table `poll_voter`
--

ALTER TABLE `$prefix_poll_voter` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_poll_voter` CHANGE `ip` `ip` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;











-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: REVIEW
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `review_settings`
--

ALTER TABLE `$prefix_review_settings` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_review_settings`	CHANGE `group_name` `group_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `auto_publish` `auto_publish` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `name_title_field` `name_title_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `primary_image_field` `primary_image_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `secondary_image_field` `secondary_image_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `short_desc_field` `short_desc_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `broad_desc_field` `broad_desc_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `item_id_field` `item_id_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `item_name_field` `item_name_field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `item_table_name` `item_table_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `short_page_fields` `short_page_fields` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'comma separated', 
										CHANGE `details_page_fields` `details_page_fields` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'comma separated', 
										CHANGE `rating_fields` `rating_fields` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'comma separated', 
										CHANGE `order_by` `order_by` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `sort_type` `sort_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'DESC';










-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: THEME
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `jtheme`
--

ALTER TABLE `$prefix_jtheme` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_jtheme` 	CHANGE `theme_thumb` `theme_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_name` `theme_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_folder` `theme_folder` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_desc` `theme_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_default` `theme_default` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0';


-- --------------------------------------------------------

-- 
-- 	Table structure for table `site_template`
--

ALTER TABLE `$prefix_site_template` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_site_template`	CHANGE `theme_name` `theme_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_folder` `theme_folder` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
								CHANGE `theme_author` `theme_author` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Md Najrul Islam',
								CHANGE `theme_developer` `theme_developer` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'Mahamud hussain Noman,Joel Norman',
								CHANGE `theme_default` `theme_default` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0';




-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: VOTE
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `vote_banned_ips`
--

ALTER TABLE `$prefix_vote_banned_ips` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_vote_banned_ips` CHANGE `ip` `ip` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `vote_closed_items`
--

ALTER TABLE `$prefix_vote_closed_items` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_vote_closed_items` CHANGE `table_name` `table_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `vote_voting`
--

ALTER TABLE `$prefix_vote_voting` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_vote_voting`	CHANGE `table_name` `table_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `article_title` `article_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
									CHANGE `ip` `ip` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;











-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: INVOICE
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_items`
--

ALTER TABLE `$prefix_invoice_items` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_invoice_items`	CHANGE `object_value` `object_value` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `item_details` `item_details` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
										

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_order`
--

ALTER TABLE `$prefix_invoice_order` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_invoice_order`	CHANGE `payment_method` `payment_method` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `status` `status` ENUM( '0', '1', '2' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `ipaddress` `ipaddress` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
										

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_quote`
--

ALTER TABLE `$prefix_invoice_quote` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_invoice_quote`	CHANGE `quote_customer_notes` `quote_customer_notes` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `quote_admin_notes` `quote_admin_notes` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `invoice_subject` `invoice_subject` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `invoice_desc` `invoice_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `payment_method` `payment_method` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
										CHANGE `stage` `stage` ENUM( '0', '1', '2' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1',
										CHANGE `ipaddress` `ipaddress` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;
										

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_quote_items`
--

ALTER TABLE `$prefix_invoice_quote_items` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_invoice_quote_items`	CHANGE `object_value` `object_value` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
											CHANGE `item_details` `item_details` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

										

-- --------------------------------------------------------

-- 
-- 	Table structure for table `invoice_table`
--

ALTER TABLE `$prefix_invoice_table` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_invoice_table`	CHANGE `invoicenum` `invoicenum` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `invoice_subject` `invoice_subject` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `invoice_desc` `invoice_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `status` `status` ENUM('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '2', 
										CHANGE `payment_method` `payment_method` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `module_name` `module_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `create_action` `create_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'comma seperated', 
										CHANGE `update_action` `update_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `delete_action` `delete_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `query_action` `query_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `paid_action` `paid_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `unpaid_action` `unpaid_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `cancel_action` `cancel_action` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;















-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: PROPERTY
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_business_type`
--

ALTER TABLE `$prefix_property_business_type` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_property_business_type` CHANGE `business_type` `business_type` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_category`
--

ALTER TABLE `$prefix_property_category` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_property_category`	CHANGE `category_name` `category_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `category_title` `category_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `category_thumb` `category_thumb` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `category_desc` `category_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
											CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_expire`
--

ALTER TABLE `$prefix_property_expire` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_group`
--

ALTER TABLE `$prefix_property_group` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_property_group`	CHANGE `property_name` `property_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `group_type` `group_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `calendar_on_off` `calendar_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `category_on_off` `category_on_off` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `category_panel` `category_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `horizontal_panel` `horizontal_panel` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `cat_sort` `cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `cat_order` `cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_cat_on` `latest_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_cat_sort` `latest_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_cat_order` `latest_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `fearured_cat_on` `fearured_cat_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `fearured_cat_sort` `fearured_cat_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `fearured_cat_order` `fearured_cat_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_sort` `file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_order` `file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `light_box_on` `light_box_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_file_on` `latest_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `latest_file_sort` `latest_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `latest_file_order` `latest_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `featured_file_on` `featured_file_on` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `featured_file_sort` `featured_file_sort` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `featured_file_order` `featured_file_order` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_type` `file_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_cat_thumb_resize_func` `file_cat_thumb_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `file_thumb_resize_func` `file_thumb_resize_func` VARCHAR(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `img_big_resize_func` `img_big_resize_func` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;



-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_page`
--

ALTER TABLE `$prefix_property_page` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE `$prefix_property_page`	CHANGE `property_name` `property_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_title` `property_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_owner` `property_owner` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_code` `property_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ESL-1213', 
										CHANGE `property_primary_image` `property_primary_image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_image` `property_image` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_desc` `property_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_tipology` `property_tipology` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Country Houses or Hamlets', 
										CHANGE `related_items` `related_items` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `featured` `featured` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `active` `active` ENUM('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1', 
										CHANGE `meta_title` `meta_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_keywords` `meta_keywords` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meta_desc` `meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_no` `house_no` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_name` `house_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_phone` `house_phone` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_fax` `house_fax` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_email` `house_email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `house_location` `house_location` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `post_code` `post_code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `property_address` `property_address` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_reception` `feature_reception` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_dinning_space` `feature_dinning_space` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_kitchen` `feature_kitchen` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_toilets` `feature_toilets` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_garden` `feature_garden` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_conservatory` `feature_conservatory` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_garage` `feature_garage` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_parking` `feature_parking` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_glazing` `feature_glazing` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, 
										CHANGE `feature_primary_floor_image` `feature_primary_floor_image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_floor_plan_image` `feature_floor_plan_image` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_google_map` `feature_google_map` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_additional` `feature_additional` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_highlights` `feature_highlights` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Parking | Fitness | Swimming pool | Play area | Garden | Security', 
										CHANGE `feature_balcony` `feature_balcony` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_courtyard` `feature_courtyard` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_furnishing` `feature_furnishing` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Drop Down', 
										CHANGE `feature_amenities` `feature_amenities` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `feature_other_amenities` `feature_other_amenities` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `brochure_title` `brochure_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `brochure_desc` `brochure_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meter_electric` `meter_electric` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meter_gas` `meter_gas` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `meter_energy` `meter_energy` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_quote_id` `payment_quote_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_cycle` `payment_cycle` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Drop Down', 
										CHANGE `payment_rate_lock` `payment_rate_lock` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_due_in` `payment_due_in` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_payment_penalty` `payment_payment_penalty` ENUM('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'No', 
										CHANGE `payment_desc` `payment_desc` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_monthly_interest` `payment_monthly_interest` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_monthly_taxes` `payment_monthly_taxes` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_monthly_homeowners` `payment_monthly_homeowners` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `payment_monthly_mortgage` `payment_monthly_mortgage` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `other_nearby_school` `other_nearby_school` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `other_neighborhood` `other_neighborhood` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `other_landmark` `other_landmark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL, 
										CHANGE `activation_never` `activation_never` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0', 
										CHANGE `available_information` `available_information` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `property_saved`
--

ALTER TABLE `$prefix_property_saved` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;