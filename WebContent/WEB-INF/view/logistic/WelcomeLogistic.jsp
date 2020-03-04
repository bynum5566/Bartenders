<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>Welcome</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

	<style type="text/css">
		body {
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: cover;
			background-position: top;
			background-image: url(/Bartenders/images/bg16.png);
			background-color: transparent;
		}
		
		.wrapper.style5{
			background-color: transparent;
		}
		
		.welcome {
/* 			top: 80px; */
			position: relative;
			margin-top: 10px;
			text-align: center;
			margin: auto;
			color: white;
			padding: 117px;
		}

		#logo {
			position: relative;
			width: 150px;
			margin: 20px;
		}

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
		<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
							<li><a href="/Bartenders/logistic/searchPersonalOrder.do?sID=${getSenderId}">訂單管理</a></li>
							<li><a href="/Bartenders/logistic/OrderSearch.do/1">搜尋訂單</a></li>
							<li class="small"><a href="/Bartenders/logistic/WelcomeLogistic">首頁</a><a href="/Bartenders/logistic/LogisticLogout.do">登出</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header>
	
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
<!-- 					<section> -->
						<div class="welcome">
							<img id="logo" src="../img/Logo.png" style="width: 150px; margin: 20px"/>
							<h2>辛苦了，${senderName}。</h2>
						</div>
<!-- 					</section> -->
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
	<!-- 
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	 -->
	</body>

</html>