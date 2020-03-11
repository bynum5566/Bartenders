<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	
	<!-- 小鈴鐺 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
	<title>Drinkers</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script> -->
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" href="/Bartenders/CSS/forTabs.css">
	
	<style type="text/css">
		@import
			url('https://fonts.googleapis.com/css?family=Encode+Sans+Condensed:400,600')
			;
		
		.welcome {
			position: relative;
			text-align: center;
			margin: auto;
			color: white;
		}
		
		main {
			padding: 70px 20px 0;
			display: flex;
			flex-direction: column;
			height: 100%;
		}
		
		main>div {
			margin: auto;
			max-width: 600px;
		}
		
		main h2 span {
			color: #CCBBFF;
		}
		
		main p {
			line-height: 1.5;
			font-weight: 200;
			margin: 20px 0;
		}
		
		main small {
			font-weight: 300;
			color: #CCBBFF;
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
		
		#content {
		    margin-top: 0;
		}
		
		html, body {
			height: 100%;
			background-image: url("/Bartenders/images/userFirstPage1.jpg");
 			background-repeat: no-repeat; 
			background-size: cover;
			background-position: center;
			background-color: transparent;
			background-attachment: fixed;
/* 			background-size: 100% 100%; */
		}
		
		.wrapper.style5 {
			background-color: transparent;
		}
		
		input#sBar, input#sAlc {
			background-color: rgba(255, 255, 255, 0.375);
			color: #0F0E0F;
		}
		
		input#css_button1, input#css_button2 {
			color: #FFFFFF;
		}
		
		input#css_button1:hover, input#css_button2:hover {
			color: #FFFFFF;
		}
		
		a, a:visited, a:focus, a:active, a:link {
			text-decoration: none;
			outline: 0;
		}
		
		a {
			color: currentColor;
			transition: .2s ease-in-out;
		}
		
		h2, h3, h4 {
			margin: 0;
			color: #CCBBFF;
		}
		
		.ml9 {
			position: relative;
			font-size: 35px;
			white-space: nowrap;
			text-align: center;
		}
		
		.ml9 .text-wrapper {
			position: relative;
			display: inline-block;
			padding-top: 0.2em;
			padding-right: 0.05em;
			padding-bottom: 0.1em;
			overflow: hidden;
			text-shadow: 0px 8px 1px black, 0px 17px 10px rgba(0, 0, 0, 0.15), 0px
				24px 2px rgba(0, 0, 0, 0.1), 0px 34px 30px rgba(0, 0, 0, 0.1);
			-webkit-text-stroke: 0.001px #FFF;
			color: #FFF;
			font-weight: 350;
		}
		
		.ml9 .letter { 
			transform-origin: 50% 100%;
			display: inline-block;
			line-height: 1em;
			color: #FFF;
			font-weight: 600;
		}
		
		.wrapper {
			padding: 1em 0 0 0;
		}
		
		main {
			padding: 40px 0px 0;
		}
		
		.noticeBox {
			position: fixed;
			top: 60px;
			right: 20px;
			align: right;
		}
		
		.bell .bellImg {
			height: 70px;
			width: 70px;
			float: right;
		}
		
		.notice {
			background-color: rgb(255, 255, 255, 0.4);
			width: 110%;
			height: auto;
			float: right;
			display: none;
		}
	
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a>
			</h1>
			
			<!-- 小鈴鐺 -->
			<div class="noticeBox">
				<div class="bell">
					<img class="bellImg" src="/Bartenders/images/bell.png">
				</div>
				<div class="notice">
					<ul id="notice"></ul>
				</div>
			</div>
			
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
								<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
								<li class="small"><a href="/Bartenders/Welcome.UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>

		<article id="main">
			<section class="wrapper style5">
				<div class="col-6 col-6-medium">
					<main>
						<div class="welcome" align="center">
							<img src="img/Logo.png" style="width: 150px; margin: 20px"/> <br>
							<h2 class="ml9" align="center">
								<span class="text-wrapper">
									<span class="letters">歡迎回來~~${userName}，<br>今天想喝甚麼呢?</span>
								</span>
							</h2>
							<br>

							<div id="tabs">
								<ul>
									<li><a class="tab" href="#tab1" name="#tab1">Bar</a></li>
									<li><a class="tab" href="#tab2" name="#tab2">Alcohol</a></li>
								</ul>
							</div>
							<div id="content">
								<div id="tab1">
									<form action="/Bartenders/search.Bar" method="GET">
										<ul class="actions">
											<li><input type="text" size="45" name="KWord" id="sBar"/></li>
											<li>&nbsp;&nbsp;</li>
											<li><input id="css_button1" type="submit" value="Search"/></li>
										</ul>
									</form>
								</div>
								<div id="tab2">
									<form action="/Bartenders/search.Product" method="GET">
										<ul class="actions">
											<li><input type="text" size="45" name="keyword" id="sAlc"/></li>
											<li>&nbsp;&nbsp;</li>
											<li><input id="css_button2" type="submit" value="Search"/></li>
										</ul>
									</form>
								</div>
							</div>
						</div>
					</main>
				</div>
			</section>
		</article>
	</div>

	<script type="text/javascript">
		//Wrap every letter in a span
		var textWrapper = document.querySelector('.ml9 .letters');
		textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

		anime.timeline({ loop: true })
			.add({
				targets: '.ml9 .letter',
				scale: [0, 1],
				duration: 1500,
				elasticity: 600,
				delay: (el, i) => 45 * (i + 1)
			}).add({
				targets: '.ml9',
				opacity: 0,
				duration: 1000,
				easing: "easeOutExpo",
				delay: 1000
			});
		
		//測試是否可以接收到登入參數
		var user = '${getUserId}';
		var company = '${getCompanyId}';

		console.log('preUrl=','${preUrl}');
		var currentId = '${getCompanyId}${getUserId}';
		console.log('currentId is: ',currentId);
		//設定currentId給超連結
		$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);
		
	</script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/Bartenders/JS/forTabs.js"></script>

	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
</body>

</html>