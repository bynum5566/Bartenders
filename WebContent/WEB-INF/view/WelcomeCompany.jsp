<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<style type="text/css">
body {
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-position: top;
	background-image: url(/Bartenders/images/bg16.png);
}

.welcome {
	top: 80px;
	position: relative;
	margin-top: 10px;
	text-align: center;
	margin: auto;
	color: white;
	padding: 117px;
}
#logo{
position: relative;
width: 150px; 
margin: 20px;
}
</style>

</head>
<body>
	<div class="welcome">
		<img id="logo" src="img/Logo.png" style="width: 150px; margin: 20px" />
		<h1>
			歡迎回來，${CName}。
		</h1>
	</div>

	<%@ include file="menu.jsp"%>

	<!-- 聊天通知 -->
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>

</body>
</html>