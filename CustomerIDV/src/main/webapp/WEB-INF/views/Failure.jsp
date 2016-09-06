<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Failuer</title>
<link rel="stylesheet" type="text/css"
	href="/CustomerIDV/resources/login.css">
	<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function message() {
		$('h3').animate({
			fontSize : '30px'
		}, 2000);
	}
</script>
</head>
<body onload="message()">
	<%@ include file="Header.html"%>
	<h3 align="center" style="color: red;">Customer Verification
		Failed</h3>
	<h4 align="center">
		<a href="${flowExecutionUrl}&_eventId=toLogin" id="default">Click Here </a> to
		Search Again!!
	</h4>
</body>
<%@ include file="footer.jsp"%>
</html>