//Searches for users in firebase using email
admin.auth().getUserByEmail(email)
  .then(function(userRecord) {
    // See the UserRecord reference doc for the contents of userRecord.
    console.log('Successfully fetched user data:', userRecord.toJSON());
  })
  .catch(function(error) {
   console.log('Error fetching user data:', error);
});

// updates user in Firebase
admin.auth().updateUser(uid, {
  email: 'modifiedUser@example.com',
  phoneNumber: '+11234567890',
  emailVerified: true,
  password: 'newPassword',
  displayName: 'Jane Doe',
  photoURL: 'http://www.example.com/12345678/photo.png',
  disabled: true
})
  .then(function(userRecord) {
    // See the UserRecord reference doc for the contents of userRecord.
    console.log('Successfully updated user', userRecord.toJSON());
  })
  .catch(function(error) {
    console.log('Error updating user:', error);
  });

// list all users
function listAllUsers(nextPageToken) {
// List batch of users, 1000 at a time.
admin.auth().listUsers(1000, nextPageToken)
  .then(function(listUsersResult) {
    listUsersResult.users.forEach(function(userRecord) {
      console.log('user', userRecord.toJSON());
    });
    if (listUsersResult.pageToken) {
      // List next batch of users.
      listAllUsers(listUsersResult.pageToken);
    }
  })
  .catch(function(error) {
    console.log('Error listing users:', error);
  });
}
// Start listing users from the beginning, 1000 at a time.
listAllUsers();

//remove user
admin.auth().deleteUser(uid)
  .then(function() {
    console.log('Successfully deleted user');
  })
  .catch(function(error) {
    console.log('Error deleting user:', error);
  });
