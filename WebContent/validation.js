/**
 * author:"xang"
 * 
 */
function validation() {
	//CLEAN-UP Process.
	document.getElementById("usernameAlert").innerHTML="";
	document.getElementById("passwordAlert").innerHTML="";
	document.getElementById("firstNameAlert").innerHTML="";
	document.getElementById("lastNameAlert").innerHTML="";
	document.getElementById("emailAlert").innerHTML="";
	
	var form = document.registration;
	
	var username = form.username;
	if( username.value.length == 0 ) {
		document.getElementById("usernameAlert").innerHTML="**Username is required.";
		username.focus();
		return false;
	}
	
	var password = form.password;
	if( password.value.length == 0 ) {
		document.getElementById("passwordAlert").innerHTML="**Password is required.";
		password.focus();
		return false;
	}
	else if( password.value.length < 8 ) {
		document.getElementById("passwordAlert").innerHTML="**Length of password is minimum 8 characters.";
		password.focus();
		return false;
	}
	
	var firstName = form.firstName;
	if( firstName.value.length == 0 ) {
		document.getElementById("firstNameAlert").innerHTML="**First Name is required.";
		firstName.focus();
		return false;
	}
	
	var lastName = form.lastName;
	if( lastName.value.length == 0 ) {
		document.getElementById("lastNameAlert").innerHTML="**Last Name is required.";
		lastName.focus();
		return false;
	}
	
	var email = form.email;
	if( email.value.length == 0 ) {
		document.getElementById("emailAlert").innerHTML="**Email is required.";
		email.focus();
		return false;
	}
	
	var atPos=email.value.indexOf("@");
	var dotPos=email.value.lastIndexOf(".");
	if ( atPos<1 || dotPos<atPos+2 || dotPos+2>=email.value.length ) {
		document.getElementById("emailAlert").innerHTML="**Enter a valid email address";
		return false;
	}
}

function loginValidation() {
	//CLEAN-UP Process.
	document.getElementById("usernameAlert").innerHTML="";
	document.getElementById("passwordAlert").innerHTML="";
	
	var form = document.login;
	
	var username = form.username;
	if( username.value.length == 0 ) {
		document.getElementById("usernameAlert").innerHTML="**Username is required.";
		username.focus();
		return false;
	}
	
	var password = form.password;
	if( password.value.length == 0 ) {
		document.getElementById("passwordAlert").innerHTML="**Password is required.";
		password.focus();
		return false;
	}
	else if( password.value.length < 8 ) {
		document.getElementById("passwordAlert").innerHTML="**Length of password is minimum 8 characters.";
		password.focus();
		return false;
	}
}

function blogValidation() {
	//CLEAN-UP Process.
	document.getElementById("headlineAlert").innerHTML="";
	document.getElementById("blogAlert").innerHTML="";
	
	var form = document.blog;
	
	var headline = form.headline;
	if( headline.value.length == 0 ) {
		document.getElementById("headlineAlert").innerHTML="**Headline is required.";
		headline.focus();
		return false;
	}
	
	var blog = form.blog;
	if( blog.value.length == 0 ) {
		document.getElementById("blogAlert").innerHTML="**Blog is required.";
		blog.focus();
		return false;
	}
}