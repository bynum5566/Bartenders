<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>Orders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />	<noscript>
		<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>

	<style type="text/css">
		a {
			color: #E8CCFF;

		}

		a:hover {
			color: #9F88FF;
		}

		.mydiv {
			min-width: auto;
			top: 80px;
			position: sticky;
			text-align: center;
			border-radius: 5px;
			background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
			background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
			background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
			background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
			box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
			-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
			-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
			color: #E8CCFF;
		}


		body {
			margin: 0;
			padding: 0;
			background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat center center fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
	</style>

<style>
	.small {
		display: flex;
		align-self: center;
	}

	.small a {
		font-size: 16px;
		font-weight: 400;
		color: #888;
		font-family: 111.otf;
	}

	.small a+a {
		margin-left: 15px;
	}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h1 style="color:white;font-size:48px" align="center">物流登入</h1>
						<div align="center">
							<form action="<c:url value="/logistic/LogisticLogin.do" />" method="post" >
							<table>
								<tr>
									<td style="color:white;font-size:24px">物流帳號:</td>
									<td><input type="text" name="username"></td>
									<td>${errors.account}</td>
								</tr>
								<tr>
									<td style="color:white;font-size:24px">帳號密碼:</td>
									<td><input type="password" name="userpwd"></td>
									<td>${errors.password}</td>
								</tr>
								<tr>
									<td><input type="hidden" name="orderID" value="${orderID}"></td>
									<!-- 
									<td><input type="hidden" name="orderStatus" value="${orderStatus}"></td>
									 -->
								</tr>
								<tr>
									<td><input type="submit"></td>
									<td>${errors.msg}</td>
								</tr>
								<tr>
									<td>${msg}</td>
								</tr>
								<tr style="display:block;color:white;">
									<td>orderID:${orderID}</td>
								</tr>
								<tr style="display:block;color:white;">
									<td>orderStatus:${orderStatus}</td>
								</tr>
							</table>
							</form>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	</body>