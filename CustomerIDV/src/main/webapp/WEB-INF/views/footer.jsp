<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<br>
	<br>
	<hr>
	Copyright © 2014<br>
	<span class="lastlogin">
	<c:if test="${! empty loginBean.lastlogin}">

			Last Login on :
			<c:out value="${loginBean.lastlogin}"></c:out>

	</c:if>

	<c:if test="${empty loginBean.lastlogin}">
		This is your First Login

	</c:if>
	</span>
	
</body>
</html>