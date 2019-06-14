 function validateForm()                                    
{ 
    var fname = document.forms["form"]["fame"].value;
	var lname = document.forms["form"]["lname"];
    var email = document.forms["form"]["email"];    
    var phone = document.forms["form"]["adr"];  
    var what =  document.forms["form"]["city"];  
    var password = document.forms["form"]["state"];  
    var address = document.forms["form"]["zip"];  
   
    if (fname.value == "")                                  
    { 
        window.alert("Please enter your first name."); 
        fname.focus(); 
        return false; 
    } 
	
	 if (lname.value == "")                                  
    { 
        window.alert("Please enter your last name."); 
        lname.focus(); 
        return false; 
    } 
   
       
    if (email.value == "")                                   
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (address.value == "")                           
    { 
        window.alert("Please enter your address."); 
        address.focus(); 
        return false; 
    } 
   
    if (city.value == "")                        
    { 
        window.alert("Please enter your city."); 
        city.focus(); 
        return false; 
    } 
   
	if (state.value < 2)                        
    { 
        window.alert("Please enter your state initials."); 
        state.focus(); 
        return false; 
    } 
	
    if (zip.value = "")                  
    { 
        alert("Please enter your zip code."); 
        zip.focus(); 
        return false; 
    } 
   
    return true; 