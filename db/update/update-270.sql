--	Comment
--	Previous Version = 2.4.5
--	Working Version = 2.7.0

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Articles
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `articles`
--

ALTER TABLE `articles` CHANGE `article_title` `article_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `article_content` `article_content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `article_meta_title` `article_meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `article_meta_key` `article_meta_key` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `article_meta_desc` `article_meta_desc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu`
--


ALTER TABLE `menu` CHANGE `menu_name` `menu_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '', CHANGE `menu_title` `menu_title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '', CHANGE `menu_image` `menu_image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `menu_template` `menu_template` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `target` `target` ENUM('_self','_blank','_parent','_top') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '_self', CHANGE `menu_default` `menu_default` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0', CHANGE `menu_status` `menu_status` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1', CHANGE `external_link` `external_link` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `show_after_login` `show_after_login` ENUM('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0';


-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu_assign`
--

ALTER TABLE `menu_assign` CHANGE `module_name` `module_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `controller_name` `controller_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `action_name` `action_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `page_id` `page_id` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `menu_group`
--

ALTER TABLE `menu_group` CHANGE `group_name` `group_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `site_template`
--

ALTER TABLE `site_template` CHANGE `theme_name` `theme_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `theme_folder` `theme_folder` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,

CHANGE `theme_author` `theme_author` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Md Najrul Islam',

CHANGE `theme_developer` `theme_developer` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Mahamud hussain Noman,Joel Norman',

CHANGE `theme_default` `theme_default` ENUM( '0', '1' ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0';
