//Searches for users in firebase
var user = firebase.auth().currentUser;
var name, email, photoUrl, uid, emailVerified;

if (user != null) {
  name = user.displayName;
  email = user.email;
  photoUrl = user.photoURL;
  emailVerified = user.emailVerified;
  uid = user.uid;  // The user's ID, unique to the Firebase project. Do NOT use
                   // this value to authenticate with your backend server, if
                   // you have one. Use User.getToken() instead.
}

// removes user from Firebase
var user = firebase.auth().currentUser;

user.delete().then(function() {
  // User deleted.
}).catch(function(error) {
  // An error happened.
});
