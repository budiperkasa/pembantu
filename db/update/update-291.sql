--	Comment
--	Previous Version = 2.9.0
--	Working Version = 2.9.1

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Gallery
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_gallery_group`
--

ALTER TABLE `$prefix_gallery_group` ADD `file_path_category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/gallery/category_thumb' AFTER `file_size_max` ;

ALTER TABLE `$prefix_gallery_group` ADD `file_path_product_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/gallery/product_thumb' AFTER `file_cat_thumb_resize_func` ;

ALTER TABLE `$prefix_gallery_group` ADD `file_path_product_image` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/gallery/product_image' AFTER `file_thumb_resize_func` ;

ALTER TABLE `$prefix_gallery_group` ADD `file_path_product_video` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/gallery/video_file' AFTER `file_path_product_image` ;

ALTER TABLE `$prefix_gallery_group` ADD `file_path_product_audio` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/gallery/audio_file' AFTER `file_path_product_video` ;

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

--
-- Dumping data for table `$prefix_global_setting`
--

insert into `$prefix_global_setting` values 
('','watermark_enabled','0'),
('','watermark_on_edit','0'),
('','watermark_place_inside','true'),
('','watermark_background_color','F4F4F4'),
('','watermark_background_transparency','80'),
('','watermark_height','50'),
('','watermark_position','bottom'),
('','watermark_icons_show','yes'),
('','watermark_icons_files','heart.png,reg.png'),
('','watermark_icons_max_height_percentage','100'),
('','watermark_icons_align','right'),
('','watermark_icons_vertical_align','center'),
('','watermark_icons_offset_x','9'),
('','watermark_icons_offset_y','4'),
('','watermark_icons_spacing','9'),
('','watermark_icons_jpeg_quality','80'),
('','watermark_text_show','yes'),
('','watermark_text_value','Test'),
('','watermark_text_align','left'),
('','watermark_text_offset_x','9'),
('','watermark_text_offset_y','9'),
('','watermark_text_spacing','9'),
('','watermark_text_fonts_directory','data/frontImages/portfolio/watermark/fonts/'),
('','watermark_text_font','Designosaur-Regular.ttf'),
('','watermark_text_size','30'),
('','watermark_text_color','4A4A4A'),
('','image_renaming_prefix','eicra_'),
('','file_mime_type','All'),
('','file_archive_type','zip,gz'),
('','file_archive_not_supported_file_type','php,php3,php4,asp,jsp,pl,py,htm,shtml,sh,aspx,pjpg,bat,bin,class,cmd,cnm,com,cpl,dev,ocx,sys,vbe,vbs,vbx,wmf,msg,nws,scr,shs,smm,pcx,pgm,drv,eml,exe,hlp');

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Menu
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_menu_group`
--

ALTER TABLE `$prefix_menu_group` 	ADD `file_path_menu_image` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/menuImages' AFTER `group_name` ;

ALTER TABLE `$prefix_menu_group` 	ADD `file_type` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'jpg,png,gif' AFTER `file_path_menu_image` ,
									ADD `file_max_size` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '900' AFTER `file_type`; 




-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: News
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_news_group`
--

ALTER TABLE `$prefix_news_group` ADD `file_path_category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/news/category_thumb' AFTER `file_size_max` ;

ALTER TABLE `$prefix_news_group` ADD `file_path_page_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/news/page_thumb' AFTER `news_cat_thumb_resize_func` ;


-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Poll
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_poll_group`
--

ALTER TABLE `$prefix_poll_group` ADD `file_path_category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/poll/category_thumb' AFTER `img_big_resize_func` ;

ALTER TABLE `$prefix_poll_group` ADD `file_path_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/poll/poll_thumb' AFTER `file_path_category_thumb` ;



-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Property
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `$prefix_property_group`
--

ALTER TABLE `$prefix_property_group` 	ADD `file_path_category_thumb` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/property/category_thumb' AFTER `img_big_resize_func` ,
										ADD `file_path_property_image` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/property/property_image' AFTER `file_path_category_thumb` ,
										ADD `file_path_feature_floor_plan_image` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'data/frontImages/property/floor_plan_image' AFTER `file_path_property_image` ;
