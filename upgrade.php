<?php
if(!function_exists('ioncube_license_properties')) {
	 die('<style type="text/css">
			<!--
			body {
				font-family: Arial, Helvetica, sans-serif;
				font-size: 14px;
				text-decoration: none;
				text-align: center;
			}
			div#container {
				margin-left: auto;
				margin-right: auto;
				width: 760px;
				text-align: left;
			}
			.boxerror {
				background-color: #FFE1E1;
				border: 1px solid #FF9393;
				font-family: "Courier New", Courier, monospace;
				width: 720px;
				padding: 5px;
			}
			-->
			</style>
			<div style="line-height:35px; border-top:3px solid #FFA6A6;border-bottom:3px solid #FFA6A6;background-color:#FFF4F4;color:#750000;font-family:Verdana, Arial, Helvetica, sans-serif;font-weight:bold;text-align:center;"><span style="font-size:18px;">ERROR:</span> Ioncube Loader is NOT installed at your server to run this application</div>
			<div id="container"> 
			  <p>This program file is encoded -- in order to decode and run it, your web server needs the Ioncube Loader to be installed. </p>
			
			  <p>Most web hosting servers are already configured to run the Ioncube Loader, however it seems that your server is not correctly set up and has a problem. Don\'t worry -- it can be easily fixed.</p>
			  <h2>What is the Ioncube Loader?</h2>
			  <p>The Ioncube Loader is a free, industry standard program that runs on your web server. It is used to decode files like this one that are encoded with the Ioncube PHP Encoder.</p>
			  <p>If you are a do-it-yourself person, you can run the <a href="http://www.ioncube.com/loader_installation.php">Ioncube Loader Diagnostic Utility</a> and try to fix the problem.</p>
			  <p>Otherwise, you should send your web hosting provider a link to this page and ask them to fix the problem. (It should take them about 10 seconds to fix it.)</p>
			
			  <h2>What if my hosting provider will not fix the problem?</h2>
			  <p>There are no technical or security  reasons to prevent the Ioncube Loader from running on your web server. If your web hosting provider can not (or will not)  fix the problem, then you should switch to a more competent hosting provider.</p><p></p><p></p>
			</div>
			<div style="line-height:35px; border-top:3px solid #FFA6A6;border-bottom:3px solid #FFA6A6;background-color:#FFF4F4;color:#750000;font-family:Verdana, Arial, Helvetica, sans-serif;font-weight:bold;text-align:center;"><span style="font-size:18px;"><a href="http://www.httpsdoc.com/How-to-Install-configure-ionCube-loader_19.html">Click here</a></span> to know how to Install or configure ionCube loader to your server</div>');
}

define('DS', 				DIRECTORY_SEPARATOR);
define('PS', 				PATH_SEPARATOR);

 // Define base path obtainable throughout the whole application
    defined('BASE_PATH')
        || define('BASE_PATH', realpath(dirname(__FILE__)));
  
// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

//Application Library Path
define('LIBRARY_PATH', realpath(APPLICATION_PATH . '/../library') );

define('MODULE_PATH', realpath(dirname(__FILE__) . '/application/modules'));
  
if(!is_dir(dirname(__FILE__) . '/_SESSION'))
{		
	if (!mkdir(dirname(__FILE__) . '/_SESSION', 0755, true)) 
	{
    	die('Failed to create folders "_SESSION" under' . realpath(dirname(__FILE__) . '/_SESSION'));
	}
}
define('SESSION_PATH', realpath(dirname(__FILE__) . '/_SESSION' ));

/** Zend_Application */
require_once 'Zend/Application.php';  

// Create application, bootstrap, and run
$application = new Zend_Application(
    APPLICATION_ENV, 
    array(
    	'phpsettings' => array(
    		'display_startup_errors' => 0,
			'display_errors' 		 => 0,
    	),
    	'autoloadernamespaces' => array(
    		'cms_global' => 'Eicra_',
    	),
		'bootstrap' => array(
    		'path' 	=> APPLICATION_PATH . DS . 'Updates.php',
			'class' => 'Updates',
    	),
		'resources' => array(
			'frontController' => array(
				'controllerDirectory' => APPLICATION_PATH . DS . 'controllers',
				'moduleDirectory' 	  => APPLICATION_PATH . DS . 'modules'
    			),
    		),    	
    )
);
$application->bootstrap()
            ->run();