<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>

<style type="text/css">
@font-face {
	font-family: FangBold;
	src: url(/Bartenders/CSS/方正卓越體-繁U-ExtraBold.TTF);
}

html, body {
	font-family: FangBold;
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/bg15.png") no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.mydiv {
	width: 50%;
	height: 500px;
	margin: 0px auto;
	padding: 15px;
	top: 80px;
	position: relative;
	text-align: center;
	background-position: center;
	align-content: center;
	background-color: rgb(255, 255, 255, 0.4);
	border-radius: 3px;
	font-family: FangBold;
}

.content {
	font-family: FangBold;
	margin: 15px auto;
	line-height: 300%;
	font-size: 130%;
}

.btn-three {
	color: #FFF;
	transition: all 0.5s;
	position: relative;
	width: 250px;
	height: 80px;
	font-family: FangBold;
	line-height: 50px;
	font-size: 20px;
	margin: auto;
}

.btn-three::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.1);
	transition: all 0.3s;
}

.btn-three:hover::before {
	opacity: 0;
	transform: scale(0.5, 0.5);
}

.btn-three::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	transition: all 0.3s;
	border: 1px solid rgba(255, 255, 255, 0.5);
	transform: scale(1.2, 1.2);
}

.btn-three:hover::after {
	opacity: 1;
	transform: scale(1, 1);
}
</style>

</head>

<body>

	<div class="mydiv">
		<h2>個人資料</h2>


		<table class="content">
			<tr>
				<td>帳號:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showAccount}</td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showName}</td>
			</tr>
			<tr>
				<td>生日:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showBirthday}</td>
			</tr>
			<tr>
				<td>連絡電話:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showPhone}</td>
			</tr>
			<tr>
				<td>電子郵件:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showEmail}</td>
			</tr>
			<tr>
				<td>聯絡地址:</td>
				<td>&emsp;&emsp;&emsp;</td>
				<td>${showAddress}</td>
			</tr>

		</table>

		<div class="btn btn-three">
			<a style="line-height: 80px; font-family: FangBold"
				href="/Bartenders/resetInfo"> 修改個人資料 </a>
		</div>
	</div>

	<!-- 聊天通知 -->
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>

</body>
</html>

<%@include file="UserMenu.jsp"%>