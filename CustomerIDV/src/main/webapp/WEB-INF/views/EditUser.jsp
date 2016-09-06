<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html xmlns:form="http://www.springframework.org/tags/form">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IDnV</title>
<link rel="stylesheet" type="text/css"
	href="/CustomerIDV/resources/login.css">
<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="/CustomerIDV/resources/login.js"></script>
<script type="text/javascript">
	function message() {
		$('h2').animate({
			fontSize : '30px'
		}, 2000);
	}

</script>
</head>

<body onload="message()">
	<%@ include file="Header.html"%>
	<h2>Customer Details : </h2>
	<form id="userDetails" method="post" action="${flowExecutionUrl}&_eventId=updateUserDetails">
		<input type="hidden" name="_flowExecutionKey" value="" />
		<table class="edit">
				<tr>
					<td>Customer ID</td>
					<td>${userBean.customerid}<input type = "hidden" name="customerid" value = "${userBean.customerid}"/></td>
				</tr>
				<tr>
					<td>Account Type</td>
					<td><input type = "text" name= "accounttype" value = "${userBean.accounttype}" /></td>
				</tr>
				<tr>
					<td>Name</td>					
					<td><input type = "text" name = "name" value = "${userBean.name}" /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type = "text" name = "address" value = "${userBean.address}" /></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><input type = "text" name="birthday" value = "${userBean.userDetails.birthday}" id="datepicker"/></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><input type = "text" name="phoneno" value = "${userBean.userDetails.phoneno}" /></td>
				</tr>
				<tr>
					<td>Email ID</td>
					<td><input type = "text" name="emailID" value = "${userBean.userDetails.emailID}" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type = "text" name="gender" value = "${userBean.userDetails.gender}" /></td>
				</tr>
				<tr>
					<td>Balance</td>
					<td><input type = "text" name = "balance" value = "${userBean.userDetails.balance}$" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update" class="vbutton" /></td>
				</tr>
		</table>
		
	</form>
</body>
<%@ include file="footer.jsp"%>
</html>