<?php 

include "includes/config.php";

if ($page_name=='') {
	include $browser_t.'/index.html';
}
elseif ($page_name=='index.html') {
	include $browser_t.'/index.html';
}
elseif ($page_name=='admin_dash.html') {
	include $browser_t.'/admin_dash.html';
}
elseif ($page_name=='member.html') {
	include $browser_t.'/member.html';
}
elseif ($page_name=='single-event.html') {
	include $browser_t.'/single-event.html';
}
elseif ($page_name=='login.html') {
	include $browser_t.'/login.html';
}
elseif ($page_name=='register.html') {
	include $browser_t.'/register.html';
	include "app/register.php";
}
elseif ($page_name=='checkout.html') {
	include $browser_t.'/checkout.html';
}
elseif ($page_name=='sell.html') {
	include $browser_t.'/sell.html';
}
elseif ($page_name=='forgot.html') {
	include $browser_t.'/forgot.html';
}
elseif ($page_name=='logout.html') {
	include $browser_t.'/logout.html';
}
else{
	include $browser_t.'/404.html';
}

?>