<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>會員中心 / Bartenders</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>

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

.noticeBox{
	position: fixed;
	top: 60px;
	right: 20px;
	align: right; 
}

.bell .bellImg{
	height: 70px;
	width: 70px;
	float:right;
}

.notice {
	background-color: rgb(255, 255, 255, 0.4);
	width: 110%;
	height: auto;
	float:right;
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
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
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
								<li class="small"><a href="/Bartenders/Welcome.UserFirstPage">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<!-- <section class="wrapper style5"> -->
						<!-- <section> -->
						<!-- <div class="mydiv"> -->
						<h2>個人資料</h2>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								<!-- <div class="content"> -->
								<ul class="alt">
									<li>帳號:&nbsp;${showAccount}</li>
									<li>姓名:&nbsp;${showName}</li>
									<li>生日:&nbsp;${showBirthday}</li>
									<li>連絡電話:&nbsp;${showPhone}</li>
									<li>電子郵件:&nbsp;${showEmail}</li>
									<li>聯絡地址:&nbsp;${showAddress}</li>
								</ul>
								<ul class="actions">
									<li><a class="button primary" href="/Bartenders/resetInfo">修改個人資料</a>
									</li>
								</ul>
								<!-- </div> -->
								<!-- <div class="btn btn-three"> -->
								<!-- </div> -->
							</div>
						</div>
						<!-- </div> -->
						<!-- </section> -->
						<!-- </section> -->
					</section>
				</div>
			</section>
		</article>
	</div>

	<script type="text/javascript">
			$(".bell").click(function(){
				$(".notice").slideToggle("slow");
			})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>

	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>

</html>