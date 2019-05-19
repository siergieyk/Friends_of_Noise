<?php 

include "includes/config.php";

if ($page_name=='') {
	include $browser_t.'../web/index.html';
}
elseif ($page_name=='index.html') {
	include $browser_t.'../web/index.html';
}
elseif ($page_name=='admin_dash.html') {
	include $browser_t.'../web/admin_dash.html';
}
elseif ($page_name=='member.html') {
	include $browser_t.'../web/member.html';
}
elseif ($page_name=='single-event.html') {
	include $browser_t.'../web/single-event.html';
}
elseif ($page_name=='login.html') {
	include $browser_t.'../web/login.html';
}
elseif ($page_name=='register.html') {
	include $browser_t.'../web/register.html';
    include "../app/register.php";
}
elseif ($page_name=='checkout.html') {
	include $browser_t.'../web/checkout.html';
}
elseif ($page_name=='sell.html') {
	include $browser_t.'../web/sell.html';
}
elseif ($page_name=='forgot.html') {
	include $browser_t.'../web/forgot.html';
}
elseif ($page_name=='logout.html') {
	include $browser_t.'../web/logout.html';
}
else{
	include $browser_t.'../web/404.html';
}

?>
