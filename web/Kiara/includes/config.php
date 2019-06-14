<?php
//config.php

//this enables pages to know their own names
define('THIS_PAGE',basename($_SERVER['PHP_SELF']));
define('DEBUG',TRUE); #we want to see all errors

//this clears date errors of all sorts
date_default_timezone_set('America/Los_Angeles');

//this is inside of an H1 in header.php 
//$banner = "Banner Goes Here";
$banner = "Banner Goes Here";

//code below was an attempt to work on pageID for A7. It did not work. 
/*
$banner = "Our Work";
$banner = "Testimonials";
$banner = "Projects";
$banner = "Contact Us";
$banner = "Inquiry Form";

switch(THIS_PAGE)
{	
	case 'template.php':
		$title = "Home";
	break;
	case 'ourwork.php':
		$title = "Our Work";
	break;
	case 'testimonials.php':
		$title = "Testimonials";
	break;
	case 'projects.php':
		$title = "Projects";
	break;
	case 'contact.php':
		$title = "Contact Us";
	break;
	case 'inquiry.php':
		$title = "Inquiry Form";
	break;
	
	
	default:
		$title = THIS_PAGE;
		
}

function makeBanner($banner)
{	
	$myReturn = "";
	
	foreach($banner as $text){
		
		if(THIS_PAGE == $text)
		{
			$myReturn .= '<p>' . $text . '</p>';
			
		}else{
			
			$myReturn .= '<p>' . $text . '</p>';
		}
		
		
	}
	
	return $myReturn;

}

*/

$nav1['template.php'] = 'Home';
$nav1['whiskey_list.php'] = 'Whiskey Cocktails';
$nav1['dailypage.php'] = 'Daily Page';
$nav1['contact.php'] = 'Contact Us';
$nav1['inquiry.php'] = 'Inquiry Form';
$nav1['customers.php'] = 'Customers';

switch(THIS_PAGE)
{	
	case 'template.php':
		$title = "Home - Welcome To Sprockets!";
		$pageID = "Welcome To Sprockets!";
	break;
	case 'whiskey.php':
		$title = "Whiskey Cocktails";
		$pageID = "Whiskey Cocktails";
	break;
		case 'dailypage.php':
		$title = "Daily Page";
		$pageID = "Daily Page";
	break;
	case 'contact.php':
		$title = "Contact Us";
		$pageID = "Contact Us";
	break;
	case 'inquiry.php':
		$title = "Inquiry Form";
		$pageID = "Inquiry Form";
	break;
		case 'customers.php':
		$title = "Customers";
		$pageID = "Customers";
	break;
	
	
	default:
		$title = THIS_PAGE;
		$pageID = "Welcome!";
}

//stores log in info
include 'credentials.php';
include 'common.php'; //stores all unsightly application functions, etc.
include 'MyAutoLoader.php'; //loads class that autoloads all classes in include folder

/* use the following path settings for placing all code in one application folder, VIRTUAL_PATH - themcmorrislife.com/sprockets */ 
define('VIRTUAL_PATH', 'http://www.themcmorrislife.com/sprockets/'); # Virtual (web) 'root' of application for images, JS & CSS files

define('PHYSICAL_PATH', '/home/kmcmor01/themcmorrislife.com/sprockets/'); # Physical (PHP) 'root' of application for file & upload reference

define('INCLUDE_PATH', PHYSICAL_PATH . 'includes/'); # Path to PHP include files - INSIDE APPLICATION ROOT

ob_start();  #buffers our page to be prevent header errors. Call before INC files or ANY html!
header("Cache-Control: no-cache");header("Expires: -1");#Helps stop browser & proxy caching


function makeLinks($nav)
{	
	$myReturn = "";
	
	foreach($nav as $url => $text){
		
		if(THIS_PAGE == $url)
		{
			$myReturn .= '<li class="current"><a href="' . $url . '">' . $text . '</a></li>';
			
		}else{
			
			$myReturn .= '<li><a href="' . $url . '">' . $text . '</a></li>';
		}
		
		
	}
	
	return $myReturn;

}


/*function myerror($myFile, $myLine, $errorMsg)
{
    if(defined('DEBUG') && DEBUG)
    {
       echo "Error in file: <b>" . $myFile . "</b> on line: <b>" . $myLine . "</b><br />";
       echo "Error Message: <b>" . $errorMsg . "</b><br />";
       die();
    }else{
        echo "I'm sorry, we have encountered an error.  Would you like to buy some socks?";
        die();
    }
}*/


