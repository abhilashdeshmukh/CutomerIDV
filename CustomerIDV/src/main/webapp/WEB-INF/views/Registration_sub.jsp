<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
<link rel="stylesheet" type="text/css" href="/CustomerIDV/resources/login.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript">
	function message() {
		$('h3').animate({
			fontSize : '30px'
		}, 2000);
	}
	
	$(function() {
		$('#datepicker').datepicker({
			dateFormat:'d MM, y',
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			yearRange: "1950:2014"
		});
	});


	function validateForm() {
		debugger;
		var x = document.forms["myForm"]["name"].value;
		var y = document.forms["myForm"]["address"].value;
		if (x == null || x == "") {
			document.getElementById("error").innerHTML = "Please Enter Name";
			return false;
		} else if (y == null || y == "") {
			document.getElementById("error").innerHTML = "Please Enter Address";
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body onload="message()">
	<%@ include file="Header.html"%>
	<div align="left" id="form">
		<h6 align="center">Sorry No Record Found!</h6>
		<h3 align="center">Registration Form</h3>
		<form name="myForm" id="registrationForm" method="post"
			action="${flowExecutionUrl}&_eventId=registrationCredentialsEntered"
			onsubmit="return validateForm()" autocomplete="off">

			<input type="hidden" name="_flowExecutionKey" value="" />
			<table id="registration">
				<tr>
					<td>Birthday</td>
					<td>&nbsp;&nbsp;&nbsp;<input name="birthday" id="datepicker"
						type="text"></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td>&nbsp;&nbsp;&nbsp;<input name="phoneno" id="phoneno"
						type="text"></td>
				</tr>
				<tr>
					<td>Email ID</td>
					<td>&nbsp;&nbsp;&nbsp;<input name="emailID" id="emailID"
						type="text"></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="Male" class="radio">Male 
					 <input type="radio" name="gender" value="Female" class="radio">Female
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="submit" value="Register"
						id="registrationButton" class="vbutton" /></td>
					<td><input type="reset" class="vbutton" /> <input
						type="button" value="Cancel"
						onclick="document.location.href ='${flowExecutionUrl}&_eventId=registrationCancel'"
						class="vbutton" /></td>
				</tr>
			</table>
			<div id="error"></div>
		</form>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>