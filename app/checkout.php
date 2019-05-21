<?php include "includes/config.php";
	    include "includes/header.php";

$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$address = $_POST["address"];
$addressoptional = $_POST["addressoptional"];
$city = $_POST["city"];
$state = $_POST["state"];
$zip = $_POST["zip"];
$email = $_POST["email"];

$sql = "INSERT INTO guestcheckout(first_name, last_name, address, addressoptional, city, state, zip, email)

VALUES('$firstname', '$lastname', '$address', '$addressoptional', '$city', '$state', '$zip', '$email');";

// Check connection
if ($conn->query($sql) === TRUE) {    
    echo "";

} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?> 

  <section id="account" class="width">
    <div class="container">      
        <div class="content">
          <h1>Guest Checkoutr</h1><br />
          <hr>
        </div>
          <div class="left box"> 
            <h1>New record created successfully in Friends of Noise.</h1>
          </div> 
          <div class="right box">
            <div class="image"> 
                  <img src="../web/images/fon-03.jpg"> 
            </div>
          </div>
    </div>
  </section>

<?php require('includes/footer.php'); ?>