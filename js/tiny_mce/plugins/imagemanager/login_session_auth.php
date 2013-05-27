<?php
	// Some settings
	session_start();
	$_SESSION['isLoggedIn'] = true;
	$_SESSION['user'] = $_SESSION['userid'];
	header("location: " . $_REQUEST['return_url']);
	die;
?>