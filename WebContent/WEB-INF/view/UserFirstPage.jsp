<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<<<<<<< HEAD
=======
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/CSS/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<link rel="stylesheet" href="/Bartenders/CSS/forTabs.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<title>Bartenders</title>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Encode+Sans+Condensed:400,600');
	
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	outline: none;
	top: 0px;
	font-family: 'Noto Sans TC', sans-serif;
}

strong {
	font-weight: 600;
}

.page {
	width: 100%;
	height: 100vh;
	background: #fdfdfd;
	font-family: 111.otf;
	font-weight: 600;
	letter-spacing: .03em;
	color: white;
}

header {
	font-size: 20px;
	display: flex;
	position: fixed;
	width: 100%;
	height: 70px;
	background: #212121;
	justify-content: center;
	align-items: center;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	color: #FFEE99;
	font-family: 'Noto Sans TC', sans-serif;
	font-weight: 800;
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
	color: white;
}

main p {
	line-height: 1.5;
	font-weight: 200;
	margin: 20px 0;
}

main small {
	font-weight: 300;
	color: white;
}

#nav-container {
	position: fixed;
	height: 100vh;
	width: 100%;
	pointer-events: none;
}

#nav-container .bg {
	position: absolute;
	top: 70px;
	left: 0;
	width: 100%;
	height: calc(100% - 70px);
	visibility: hidden;
	opacity: 0;
	transition: .3s;
	background: #000;
}

#nav-container:focus-within .bg {
	visibility: visible;
	opacity: .6;
}

#nav-container * {
	visibility: visible;
}

.button {
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	z-index: 1;
	-webkit-appearance: none;
	border: 0;
	background: transparent;
	border-radius: 0;
	height: 70px;
	width: 30px;
	cursor: pointer;
	pointer-events: auto;
	margin-left: 25px;
	touch-action: manipulation;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.icon-bar {
	display: block;
	width: 100%;
	height: 3px;
	background: #aaa;
	transition: .3s;
}

.icon-bar+.icon-bar {
	margin-top: 5px;
}

#nav-container:focus-within .button {
	pointer-events: none;
}

#nav-container:focus-within .icon-bar:nth-of-type(1) {
	transform: translate3d(0, 8px, 0) rotate(45deg);
}

#nav-container:focus-within .icon-bar:nth-of-type(2) {
	opacity: 0;
}

#nav-container:focus-within .icon-bar:nth-of-type(3) {
	transform: translate3d(0, -8px, 0) rotate(-45deg);
}

#nav-content {
	margin-top: 70px;
	padding: 20px;
	width: 90%;
	max-width: 300px;
	position: absolute;
	top: 0;
	left: 0;
	height: calc(100% - 70px);
	background: #ececec;
	pointer-events: auto;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	transform: translateX(-100%);
	transition: transform .3s;
	will-change: transform;
	contain: paint;
}

#nav-content ul {
	height: 100%;
	display: flex;
	flex-direction: column;
}

#nav-content li a {
	padding: 10px 5px;
	display: block;
	text-transform: uppercase;
	transition: color .1s;
}

#nav-content li a:hover {
	color: #BF7497;
}

#nav-content li:not (.small ) +.small {
	margin-top: auto;
}

.small {
	display: flex;
	align-self: center;
}

.small a {
	font-size: 16px;
	font-weight: 400;
	color: #888;
	font-family: 'Noto Sans TC', sans-serif;
}

.small a+a {
	margin-left: 15px;
}

#nav-container:focus-within #nav-content {
	transform: none;
}



html, body {
	height: 100%;
	background-image: url("/Bartenders/images/userFirstPage1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	background-size: 100% 100%;
}

a, a:visited, a:focus, a:active, a:link {
	text-decoration: none;
	outline: 0;
}

a {
	color: currentColor;
	transition: .2s ease-in-out;
}

h1, h2, h3, h4 {
	margin: 0;
	color: #EEFFBB;
}

ul {
	padding: 0;
	list-style: none;
}

img {
	vertical-align: middle;
	height: auto;
	width: 100%;
}

input[type=text] {
	font-size: 70%;
	margin: 10px auto;
	padding: 10px;
	line-height: 18px;
	border-radius: 3px;
	border-color: transparent;
	background-color: rgb(12, 10, 10, 0.85);
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.75);
	border: none;
	color: rgb(198, 220, 241);
}

input[type=text]:focus {
	color: rgb(198, 220, 241);
	outline: none;
	border-radius: 3px;
	-webkit-box-shadow: 0 0 5px rgb(252, 243, 126);
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
	color: #FFEE99;
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

.ml9 {
	position: relative;
	font-weight: 900;
	font-size: 36px;
	white-space:nowrap;
}

.ml9 .text-wrapper {
	position: relative;
	display: inline-block;
	padding-top: 0.2em;
	padding-right: 0.05em;
	padding-bottom: 0.1em;
	overflow: hidden;
	text-shadow: 0px 8px 1px black,

                 0px 17px 10px rgba(0,0,0,0.15),

                 0px 24px 2px rgba(0,0,0,0.1),

                 0px 34px 30px rgba(0,0,0,0.1);
     -webkit-text-stroke: 1px #800000;
     color: #FFD700;
     font-weight: 800;
}

.ml9 .letter {
	display: inline-block;
	line-height: 2em;
	color: #FFD700;
	font-weight: 800;
}
</style>

<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1

<head>
	<meta charset="UTF-8">
	<title>User Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script> -->
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" href="/Bartenders/CSS/forTabs.css">
	
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Encode+Sans+Condensed:400,600');
		
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
		
		html, body {
			height: 100%;
			background-image: url("/Bartenders/images/userFirstPage.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			background-color: transparent;
			background-attachment: fixed;
		}
		
		.wrapper.style5{
			background-color: transparent;
		}
		
		input#sBar, input#sAlc{
			background-color: rgba(255, 255, 255, 0.375);
			color: #0F0E0F;
		}
		
		input#css_button1, input#css_button2{
			color: #FFFFFF;
		}
		
		input#css_button1:hover, input#css_button2:hover{
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
			font-weight: bold;
			font-size: 27px;
			text-shadow: 0px 2px 4px #222222;
		}
		
		.ml9 .text-wrapper {
			position: relative;
			display: inline-block;
			padding-top: 0.2em;
			padding-right: 0.05em;
			padding-bottom: 0.1em;
			overflow: hidden;
		}
		
		.ml9 .letter {
			transform-origin: 50% 100%;
			display: inline-block;
			line-height: 1em;
		}
	</style>
</head>

<<<<<<< HEAD
<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1><a href="index.jsp">Bartenders</a></h1>
			<nav id="nav">
=======
<body>

	<header tabindex="0">Welcome back! Let's get legless!酒吧歡迎光臨</header>
	<div id="nav-container">
		<div class="bg"></div>
		<div class="button" tabindex="0">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</div>
		<div id="nav-content" tabindex="0">
			<ul>
				<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
				<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
				<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
				<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
				<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
				<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
				<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
				<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
				<li class="small"><a href="UserFirstPage">返回首頁</a><a
					href="javascript:signOut()">登出</a>
			</ul>
		</div>
	</div>


	<main>
		<div class="content">
			<h2 align="center">
				<img src="img/Logo.png" style="width: 150px; margin: 20px" /> <br>
			</h2>
			<h1 class="ml9" align="center">
				<span class="text-wrapper"><span class="letters" nowrap="nowrap" style="font-weight:800">歡迎回來~~${userName}，今天想喝甚麼呢?</span>
				</span>
			</h1>
			<br>
			<div id="tabs">
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
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
								<li class="small"><a href="UserFirstPage">返回首頁</a><a href="javascript:signOut()">登出</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>

		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<main>
							<div class="content">
								<h2 align="center">
									<img src="img/Logo.png" style="width: 150px; margin: 20px"/>
									<br>
								</h2>
								<h2 class="ml9" align="center">
									<span class="text-wrapper">
										<span class="letters">歡迎回來~~${userName}，今天想喝甚麼呢?</span>
									</span>
								</h2>
								<br>
								
								<div id="tabs">
									<ul>
										<li><a href="#tab1" name="#tab1">Bar</a></li>
										<li><a href="#tab2" name="#tab2">Alcohol</a></li>
									</ul>
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
							</div>
						</main>
					</section>
				</div>
<<<<<<< HEAD
			</section>
		</article>
	</div>
	
=======
			</div>
		</div>
	</main>

	<script type="text/javascript" src="/Bartenders/JS/forTabs.js"></script>
	<script type="text/javascript">
	//Logout
	function signOut() {
  gapi.auth2.init().then( () => {
   var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
     console.log('User signed out.');
    });
  })
 document.location.href="http://localhost:8080/Bartenders/logout";
 }

 function onLoad() {
  gapi.load('auth2', function() {
   gapi.auth2.init();
  });
 }
</script>

	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>

>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
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
</body>

</html>