<?php include "includes/config.php";
	    include "includes/header.php";

$email = $_POST["email"];
$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$username = $_POST["username"];
$password = $_POST["password"];
$age = $_POST["age"];
$phone = $_POST["phone"];
$address = $_POST["address"];
$city = $_POST["city"];
$state = $_POST["state"];
$zip = $_POST["zip"];
$newsletter = $_POST["newsletter"];
$date = (Y-m-d);

$sql = "INSERT INTO members (email, first_name, last_name, user_name, password, age, phone, address, city, state, zip, newsletter, date)

VALUES ('$email', '$firstname', '$lastname', '$username', '$password', '$age', '$phone','$address', '$city', '$state', '$zip', '$newsletter', NOW());";


$status = '0';

if(isset($_POST['newsletter']) && $_POST['newsletter'] == '1'){
	$status = $_POST['newsletter'];
}

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
          <h1>New Member</h1><br />
          <hr>
        </div>
          <div class="left box">
            <h1>New record created successfully in Friends of Noise.</h1>
          </div>
          <div class="right box">
            <div class="image">
                  <img src="../web/images/fon-02.jpg">
            </div>
          </div>
    </div>
  </section>

<?php require('includes/footer.php'); ?>
