<?php include "includes/config.php";
      include "includes/header.php";

$cardname = $_POST["cardname"];
$cardnumber = $_POST["cardnumber"];
$expmonth = $_POST["expmonth"];
$expyear = $_POST["expyear"];
$cvs = $_POST["cvs"];
$date = "Y-m-d H:i:s"; 

$sql = "INSERT INTO guestPayment(cardname, cardnumber, expmonth, expyear, cvs, Date)

VALUES('$cardname', '$cardnumber', '$expmonth', '$expyear', '$cvs', NOW());";

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
          <h1>Guest Checkout</h1><br />
          <hr>
        </div>
          <div class="left box"> 
            <h1>New record created successfully in Friends of Noise.</h1>
          </div> 
          <div class="right box">
            <div class="image"> 
                  <img src="../web/images/fon-04.jpg"> 
            </div>
          </div>
    </div>
  </section>

<?php require('includes/footer.php'); ?>