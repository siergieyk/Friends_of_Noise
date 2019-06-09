<?php
$servername = "mysql.themcmorrislife.com";
$username = "eatlunchnow";
$password = "746vG3a2Fs94";
$dbname = "database_stuff";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT memberID, First_Name, Last_Name, Status, eventName, eventDate, address, city, state, zip FROM members, events";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $memberID = ($row["memberID"]);
			$First_Name= ($row["First_Name"]); 
			$Last_Name = ($row["Last_Name"]);
			$Status = ($row["Status"]);
		$eventName = ($row["eventName"]);
			$eventDate = ($row["eventDate"]); 
			$address = ($row["address"]);
			$city = ($row["city"]);
		$state = ($row["state"]);
			$zip = ($row["zip"]);
		
		
    }
	
} else {
    echo "0 results";
}
$conn->close();
?> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Friends Of Noise - Member Page</title>
  <link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>     
      <div class="top">
		  <h4>Hello, <?=$First_Name;?>!</br>
		  Member ID: <?=$memberID;?></h4>
      </div>
	
	<div class="middle">
		<img class="logo" src="images/FoNlogo.png">
	</div>

      <nav class="main">
        <ul>
          <li><a href="#">Home</a></li>
		    <li class="separator">|</li>
          <li><a href="#">Events</a></li>
	     	<li class="separator">|</li>
	      <li><a href="#">Merchandise</a></li>
	     	<li class="separator">|</li>
          <li><a href="login.html">Buy/Renew Membership</a></li>
	     	<li class="separator">|</li>
          <li><a href="login.html">Friends Of Noise</a></li>
        </ul>
      </nav>         
  
 <section id="account" class="width">
    <div class="container">      
       	<div class="content">
			<h1></h1>
			<hr>
		</div>		
		
		
		<div class="status">
			
				<h2>Member Status</h2>			
				<p class="mem_status"><?=$Status;?></p><br/>
			           
       </div>

       <!--	<div class="">
			<h2>Your Membership</h2>
			<p><img class="flyer" src="images/flyer.png"><a href="">DJ Myrie, Romero, Mahogany Menefee, Sensation Collective, JasonUndefined, Dmarx, Spit Infinity</a><br>
				Disjecta<br>
				Friday, March 8, 2019<br>
				6:30PM - 10:30PM PST<br>
				
			</p>
			
		
        </div>-->
			<div class="upcoming">
			<h2>Your Upcoming Events</h2>
			<p><img class="flyer" src="images/flyer.png"><a href=""><?=$eventName;?></a><br>
				<?=$eventDate;?><br>
				<?=$address;?><br>
				<?=$city;?>, <?=$state;?> <?=$zip;?><br>
				
			</p>
	
        </div>
		
		</div>
			<div class="renew">
				 <input type="submit" value="Renew Membership" class="renew_btn">
			<p>
				
			</p>
	
        </div>
		
      </div>
    </div>
  </section>
  
</body>
</html>
