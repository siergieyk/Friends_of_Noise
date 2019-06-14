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