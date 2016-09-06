

function validateForm() {
	var x = document.forms["myForm"]["username"].value;
	var y = document.forms["myForm"]["password"].value;
	if (x == null || x == ""|| x=="username") {
		document.getElementById("error").innerHTML = "Please Enter Username";
		return false;
	}
	if (y == null || y == "" || y == "password") {
		document.getElementById("error").innerHTML = "Please Enter Password";
		return false;
	}
	}

document.addEventListener('DOMContentLoaded', function() {
    var username = document.getElementById('username');
    var password = document.getElementById('password');
    // onClick's logic below:
    username.addEventListener('click', function() {
       username.value = "";
    });
    password.addEventListener('click', function(){
    	password.value = "";
    });
});
 

$(function() {
	$('#datepicker').datepicker({
		dateFormat:'d MM, y',
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: "1950:2014"
	});
});