<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<script type="text/javascript">
	function load() {
		Loginwindow = window
				.open(
						"http://localhost:8080/CustomerIDV/mainFlow",
						"Welcome",
						"directories=0,titlebar=1,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes,channelmode=yes");
		Loginwindow.focus();
		window.close();
	}
</script>
</head>
<body onload="load()">
</body>
</html>
