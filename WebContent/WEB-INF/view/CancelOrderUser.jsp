<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Order For User</title>
</head>
<body>
	<div align="center">
		<h2>${msg}</h2>
		<form action="<c:url value="/CancelOrderUser.controller"/>" method="POST">
			<h3>
				<a href="<c:url value="/userOrder.controller"/>">返回訂單頁面 </a>
			</h3>
		</form>
	</div>
</body>
</html>