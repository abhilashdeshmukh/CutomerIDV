<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verification</title>
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
	<h3 align="center">Select Verification Question</h3>
	<div align="left" id="form">
		<form method="post"
			action="${flowExecutionUrl}&_eventId=verificationDetailsEntered" autocomplete="off">

			<input type="hidden" name="_flowExecutionKey" value="" /> 
			<input type="hidden" name="customerid" value="${userBean.customerid}">
			<table id="question">
				<tr>
					<th>&nbsp;Questions</th>
					<th>&nbsp;&nbsp;&nbsp;Answers</th>
				</tr>
				<tr>
					<c:forEach items="${questions}" var="questions">
						<td>
							<input type="hidden" name="qid" value="${questions.qid}">
							<c:out value="${questions.qid}."></c:out>
							<c:out value="${questions.question}"></c:out>
						</td>
					</c:forEach>
					<td><input type="text" name="answer" class="answer" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Verify" class="vbutton" /><input
						type="button" value="Cancel"
						onclick="document.location.href ='${flowExecutionUrl}&_eventId=verificationCancel'"
						class="vbutton"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>