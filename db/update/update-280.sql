--	Comment
--	Previous Version = 2.7.0
--	Working Version = 2.8.0

-- --------------------------------------------------------
-- --------------------------------------------------------

--
--	Module Name: Settings
--

-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_settings`
--

ALTER TABLE `global_settings` ADD `price_margine` VARCHAR( 255 ) NULL DEFAULT NULL AFTER `seo_on` ;


-- --------------------------------------------------------

-- 
-- 	Table structure for table `global_price_margine`
--

CREATE TABLE IF NOT EXISTS `global_price_margine` (     
                           `id` int(11) NOT NULL AUTO_INCREMENT,      
                           `short_desc` varchar(255) DEFAULT NULL,    
                           `amount` double NOT NULL DEFAULT '0',      
                           `amount_type` enum('0','1','2') NOT NULL,  
                           PRIMARY KEY (`id`)                         
                         ) ENGINE=InnoDB DEFAULT CHARSET=utf8;     

insert into `global_price_margine` values 
(1,'Global Price Margine',500,'2'),
(2,'Global Commision',2,'2');                    