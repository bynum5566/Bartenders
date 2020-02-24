<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<title>我的訂單</title>
<style type="text/css">
.mydiv {
	width: 100%;
	margin : 0 auto;
	top: 80px;
	position: sticky;
	text-align: center;
	color: #E8CCFF;
	margin-top: 25%;
	
}

body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/CancelOrder.jpg") no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow-y:hidden;
	overflow-y:hidden;
	font-family: 'Noto Sans TC', sans-serif;
}

.css_button {
	padding: 3.5px 7px;
	border: 1px solid #857C7C;
	background: -webkit-gradient(linear, left top, left bottom, from(#6D6C70),
		to(#615B5B));
	background: -webkit-linear-gradient(top, #6D6C70, #615B5B);
	background: -moz-linear-gradient(top, #6D6C70, #615B5B);
	background: -ms-linear-gradient(top, #6D6C70, #615B5B);
	background: -o-linear-gradient(top, #6D6C70, #615B5B);
	background-color: #615B5B;
	box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-moz-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	color: #CCBBFF;
	font-size: 16px;
	font-family: 111.otf;
	text-decoration: none;
	font-weight: bold;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	cursor: pointer;
}

.css_button:hover {
	background: none;
	background-color: #615B5B;
	box-shadow: 0px 0px 5px 0px #AAAAAA;
	-webkit-box-shadow: 0px 0px 5px 0px #AAAAAA;
	-moz-box-shadow: 0px 0px 5px 0px #AAAAAA;
	border: 1px solid #ffffff;
	color: #F2E4E4;
}

.css_button:active {
	top: 1px;
	position: relative;
}
</style>
</head>
<body>
	<div class="mydiv">
		<div align="center">
			<h2>${msg}</h2>
			<br>
			<form action="<c:url value="/CancelOrderUser.controller"/>"
				method="POST">
				<div align="center">
					<h3>
					<a href="<c:url value="/userOrder.controller"/>"> <input
							class="css_button" type="button" value="返回訂單頁面" />
						</a>
					</h3>
				</div>
			</form>
		</div>

	</div>
</body>
</html>
<%@include file="UserMenu.jsp"%>