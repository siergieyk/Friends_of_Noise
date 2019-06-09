<?php include "includes/config.php";
      include "includes/header.php";

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