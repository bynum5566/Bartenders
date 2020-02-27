<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>聯絡我們</title>
<%-- 畫面version 20200213_1650--%>
<link rel="stylesheet" type="text/css"
	href="/Bartenders/CSS/add_editView.css">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>

<style type="text/css">
.sigmaGray {
	color: gray;
}

.sigmaTd1 {
	width: 100px;
	height: 50px;
	text-align: center;
}

.sigmaTd250 {
	width: 250px;
	height: 50px;
	text-align: center;
}

.sigmaTd6 {
	width: 600px;
	height: 50px;
	text-align: center;
}

.mydiv {
	width: auto;
	margin: auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
}

h {
	color: white;
}

td {
	border-width: 1px;
}

* {
	margin: 0;
	padding: 0;
	font-family: Microsoft JhengHei;
}

#allpage {
	width: 100%;
	margin: 0 auto;
}

header {
	width: 100%;
}

.logo-img {
	width: 100%;
}

.menu {
	width: 100%;
	overflow: auto;
	border-radius: 5px;
	list-style-type: none;
}

.menu li {
	width: 7em;
	line-height: 2.5em;
	float: left;
}

.menu li a {
	display: block;
	text-align: center;
	color: #005AB5;
}

.menu li a:link {
	text-decoration: none;
}

.menu li a:hover {
	background-color: #0080FF;
	color: #ffffff;
	border-radius: 5px;
}

#content {
	width: 100%;
	overflow: auto;
	/* border:1px solid gray; */
}

.article {
	width: 100%;
	float: left;
}

.section {
	background-color: #ffffff;
	border-radius: 5px;
	margin: 10px 0;
	padding: 20px 26px;
	line-height: 2em;
}

.aside {
	width: 28%;
	float: right;
}

footer {
	background-color: #ACD6FF;
	border-radius: 5px;
	text-align: center;
	line-height: 2.5em;
	color: #4F4F4F;
}

<!--
縮放用CSS，開始-->div.panel, img.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: #e5eecc;
	border: solid 1px #c3c3c3;
}

div.panel {
	height: 300px;
	width: 300px;
	display: none;
}
<!--
縮放用CSS，結束--
>
</style>

<!-- script src,開始 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<!-- script src,結束-->

</head>
<body>

	
		<div style="position: center; margin:  100px;">
			<form action="JavaMailController" method="post"
				enctype="multipart/form-data">
				收件人：<input type="text" name="to" size="50"
					value="11129henry@gmail.com" /><br> 寄件人：<input type="text"
					name="from" size="50" /><br> 主 旨：<input type="text"
					name="subject" size="50" /><br> 附 檔：<input type="file"
					name="file" size="50" /><br>
				<textarea name="text" rows="10" cols="50"></textarea>
				<br> <input type="submit" value="傳送" /><br>
			</form>
		</div>
	
</body>
</html>

<%--左側工具列，開始 --%>
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>
