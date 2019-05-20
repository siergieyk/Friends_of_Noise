 
 <?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "friendsofnoise";
$port = 3306;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $port);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$email = $_GET["email"];
$firstname = $_GET["firstname"];
$lastname = $_GET["lastname"];
$address = $_GET["address"];
$AddressOptional = $_GET["AddressOptional"];
$city = $_GET["city"];
$state = $_GET["state"];
$zip = $_GET["zip"];


$sql = "INSERT INTO guestcheckout(email, first_name, last_name, address, AddressOptional, city, state, zip)
VALUES('$email', '$firstname', '$lastname', '$address', '$AddressOptional', '$city', '$state', '$zip');";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?> 