<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IDnV</title>
<link rel="stylesheet" type="text/css"
	href="/CustomerIDV/resources/login.css">
<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function message() {
		$('h2').animate({
			fontSize : '30px'
		}, 2000);
	}

	function validateForm() {
		var x = document.forms["myForm"]["customerid"].value;
		if (x == null || x == "") {
			document.getElementById("error").innerHTML = "Please Enter Customer Id";
			return false;
		}
	}
</script>

</head>

<body onload="message()">
	<%@ include file="Header.html"%>
	<br>
	<div id="loginform" align="left">
		<h2 class="title">Search Customer</h2>
		<form name="myForm" method="post"
			action="${flowExecutionUrl}&_eventId=customerIdEntered" id="login"
			onsubmit="return validateForm()" autocomplete="off">
			<input type="hidden" name="_flowExecutionKey" value="" />
			<table>
				<tr>
					<td>Enter Customer ID&nbsp;&nbsp;  <input type="text" name="customerid" id="customerid"></td>
					<td>&nbsp; &nbsp; &nbsp; </td>
					<td><input type="submit" value="Search" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="Cancel"
						onclick="document.location.href ='${flowExecutionUrl}&_eventId=cancel'"
						class="button"></td>
					<td>
				</tr>
			</table>

		</form>
		<div id="error"></div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>