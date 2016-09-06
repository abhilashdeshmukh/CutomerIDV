<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Login Window</title>
<link href="/CustomerIDV/resources/main.css" rel="stylesheet">
<script src="/CustomerIDV/resources/login.js" ></script>

</head>
<body>
	<div id="loginform" align="right">
		<form action="${flowExecutionUrl}&_eventId=loginCredentialsEntered"
			method="post" onsubmit="return validateForm()" name="myForm" autocomplete="off">
			<input type="hidden" name="_flowExecutionKey" value="" /> 
			<input type="hidden" name="sessionID" value="<%=session.getId()%>">
			<table>
				<tr>
					<td><input type="text" id="username" name="username" value="username"/></td>
				</tr>
				<tr>
					<td><input type="password" id="password" name="password" value="password" onfocus="clear(this.id)"/></td>

				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login" class="button">
						<input type="button" value="Cancel" class="button"
						onclick="window.close()"></td>
				</tr>
			</table>
			<div id="error"></div>
		</form>
	</div>
</body>
</html>
