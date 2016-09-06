<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" type="text/css"
	href="/CustomerIDV/resources/login.css">
<script src="/CustomerIDV/resources/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function message() {
		$('h3').animate({
			fontSize : '30px'
		}, 2000);
	}
	function validateForm() {
		var x = document.forms["myForm"]["answer"].value;
		if (x == null || x == "") {
			document.getElementById("error").innerHTML = "Please Enter Answer";
			return false;
		}

	}
</script>
</head>
<body onload="message()">
	<%@ include file="Header.html"%>
	<h3 align="center">Registration Form</h3>
	<h4 align="center">Select the Security Question and Give answer
		(Answers are Case Sensitive)</h4>
	<div align="left" id="form">
		<form name="myForm" method="post"
			action="${flowExecutionUrl}&_eventId=securityQuestionSelected"
			onsubmit="return validateForm()" autocomplete="off">
			<input type="hidden" name="_flowExecutionKey" value="" /> <input
				type="hidden" name="customerid" value="${userBean.customerid}">
			<table id="question">
				<tr>
					<th>&nbsp;Questions</th>
					<th>&nbsp;&nbsp;&nbsp;Answers</th>
				</tr>

				<tr>
					<td>
						<select name="qid">
								<c:forEach items="${questions}" var="questions">
									<option value="${questions.qid}">${questions.question}</option>
								</c:forEach>
						</select>
					</td>
					<td><input type="text" name="answer" class="answer" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Submit" class="vbutton" /><input
						type="button" value="Cancel"
						onclick="document.location.href ='${flowExecutionUrl}&_eventId=registerCancel'"
						class="vbutton"></td>
				</tr>
			</table>
		</form>
		<div id="error"></div>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>