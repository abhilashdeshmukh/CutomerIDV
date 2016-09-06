<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Customer Identified</title>
<link rel="stylesheet" type="text/css"
	href="/CustomerIDV/resources/login.css">
<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
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
	<div id="userinfo" align="left">
		<form id="hubScreenForm" method="post"
			action="${flowExecutionUrl}&_eventId=displayView">
			<h2 align="center">Customer Registered Successfully</h2>
			<table class="info">

				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Account Type</th>
						<th>Name</th>
						<th>Address</th>
						<th>Birthday</th>
						<th>Phone Number</th>
						<th>Email ID</th>
						<th>Gender</th>
						<th>Balance</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<td>${userBean.customerid}</td>
						<td>${userBean.accounttype}</td>
						<td>${userBean.name}</td>
						<td>${userBean.address}</td>
						<td>${userBean.userDetails.birthday}</td>
						<td>${userBean.userDetails.phoneno}</td>
						<td>${userBean.userDetails.emailID}</td>
						<td>${userBean.userDetails.gender}</td>
						<td>${userBean.userDetails.balance}$</td>
					</tr>
				</tbody>
			</table>
			<div align="right" class="buttondiv">
				<input type="submit" value="Home" class="hubbutton">
			</div>
		</form>
	</div>
</body>

<%@ include file="footer.jsp"%>
</html>