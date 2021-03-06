firebase.auth().onAuthStateChanged((user)=>{
    
    if(user){
    
    document.getElementById("users").style.display= "block";
    document.getElementById("div").style.display= "none";

    var user = firebase.auth().currentUser;
    
    if(user != null){
      var userEmail = user.email;
      document.getElementById("text").innerHTML = "Welcome to FON: " + userEmail;         
      document.getElementById("logged").innerHTML = '<img src="images/fon-green.jpg" />';                            
    }

  } else {
    document.getElementById("users").style.display= "none";
    document.getElementById("div").style.display= "block";
  }
});

function login(){
  var userEmail= document.getElementById("email").value;
  var userPassword= document.getElementById("password").value;

    firebase.auth().signInWithEmailAndPassword(userEmail, userPassword).catch((error)=>{

    var errorCode = error.code;
    var errorMessage = error.message;

    window.alert("Error: " + errorMessage);

  });
}

function logout(){
    firebase.auth().signOut();
}