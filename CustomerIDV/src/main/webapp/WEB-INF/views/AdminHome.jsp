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
	Welcome!!!


	<h2>Customers Identified !!!</h2>
	<form id="userDetails" method="post">
		<input type="hidden" name="_flowExecutionKey" value="" />
		<table class="info">
			<thead>
				<tr>
					<th colspan="2">Customer ID</th>
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
				<c:forEach items="${userBean}" var="userBean">
					<tr>
						<td><input type="radio" name="userSelect" class="radio" value="${userBean.customerid}"/></td>
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
				</c:forEach>
			</tbody>
		</table>
		<br/>
		<div>
			<input type="submit" name = "_eventId_editUserDetails" value="Edit" class="vbutton" />
			<input type="submit" name = "_eventId_deleteUser" value="Delete" class="vbutton"/>
		</div>
	</form>
</body>
<%@ include file="footer.jsp"%>
</html>