firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    // User is signed in.
    document.getElementById("user_div").style.display= "block";
    document.getElementById("login_div").style.display= "none";
    document.getElementById("forgotPass-div").style.display="none";

    <!-- window.location = 'member.html' // comment this out to log out -->

    var user = firebase.auth().currentUser;
    if(user != null){
      var email_id = user.email;
      var u_id = user.uid;
      document.getElementById("user_para").innerHTML = "Welcome User: " + email_id +"!  Your user UID is: "+u_id;
    }
  } else {
    // No user is signed in.
    document.getElementById("user_div").style.display= "none";
    document.getElementById("login_div").style.display= "block";
    document.getElementById("forgotPass-div").style.display="none";

  }
});

function forgotPassPage(){

    document.getElementById("user_div").style.display= "none";
    document.getElementById("login_div").style.display= "none";
    document.getElementById("forgotPass-div").style.display="block"
}

function forgotPass(){
  var userEmail= document.getElementById("fP_email_field").value;
  var auth = firebase.auth();
  var emailAddress = userEmail;

  auth.sendPasswordResetEmail(emailAddress).then(function() {
    // Email sent.
        window.alert("Password reset email sent");
  }).catch(function(error) {
    // An error happened.
        window.alert("Error: Member does not exist or wrong input");
  });

}

//login function for sign up button- goes to membership page
function login(){
  //
  var userEmail= document.getElementById("email_field").value;
  var userPass= document.getElementById("password_field").value;

  firebase.auth().signInWithEmailAndPassword(userEmail, userPass).catch(function(error) {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;

    window.alert("Error: " + errorMessage);
    // ...
  });
}

function logout(){
  firebase.auth().signOut();
}
