<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>討論列表</title>
<%--豪--%>
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>
<!-- 小鈴鐺 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<style>
div.panel, img.flip {
	margin: 0px;
	padding: 5px;
	background: rgba(0, 0, 0, 0.6);
	border: solid 1px #c3c3c3;
}

div.panel {
	/* 			height: 300px; */
	height: auto;
	width: 300px;
	display: none;
}

.sigmaTd1 img {
	width: 100px;
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

#barName {
	font-size: 50px;
	font-weight: 600;
}

#favbT, img.myMenu {
	width: 100px;
	height: 100px;
	cursor: pointer;
}

#myBtn:hover {
	color: #ECECED;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	color: #9F9BA0;
}

.modal-content {
	position: relative;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 40%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s;
}

#modal-content1 {
	width: 80%;
	height: 80%;
}

@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
.close, #close1 {
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus, #close1:hover, #close1:focus {
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #443E44;
}

.modal-body {
	background-color: #A19CA8;
	padding: 2px 16px;
	/* 		color: #0F0E0F; */
	color: #FFFFFF;
}

#myBtn1 {
	width: 100px;
	height: 100px;
}

#map {
	height: 90%;
}

.accordion {
	background-color: #443E44;
	/*  	color: #9F9BA0; */
	color: #FFFFFF;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 22px;
	font-weight: 600;
	transition: 0.4s;
	border: 1px solid #554F55;
}

.active, .accordion:hover {
	background-color: #554F55;
	/* 		color: #ECECED; */
	color: #FFFFFF;
}

.accordion:after {
	content: '\002B';
	/*  	color: #ECECED; */
	color: #FFFFFF;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.thePanels {
	padding: 0 18px;
	background-color: #76727B;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	/* 		color: #ECECED; */
	color: #FFFFFF;
}

.social {
	width: 40px;
	height: 40px;
	cursor: pointer;
}

.B1 {
	display: flex;
	align-items: center;
	justify-content: left;
	font-size: 20px;
	line-height: 24px;
	text-align: left;
}

.swiper-container {
	width: 640px;
	height: 360px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

div.swiper-slide img {
	width: 100%;
	height: 100%;
	margin: auto;
	object-fit: cover;
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

<!--
-->
.PoetryContent {
	width: 1.5em;
	float: right;
	line-height: 2em;
	padding-top: 30px;
	font-size: 15px;
	text-align: center;
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
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a
									href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
								<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
								<li class="small"><a
									href="/Bartenders/Welcome.UserFirstPage">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>

		<article id="main">
			<section class="wrapper style5" >
				<div class="inner">
					<section>
						<div class=mydiv>
							<section>
								<ul class="actions" >

									<li><img id="myBtn1" src="/Bartenders/images/map.png"></li>
									<li>&emsp;&emsp;</li>
									<li style="display: none;"><img id="myBtn" class="myMenu" src="/Bartenders/images/menu_icon.png"></li>
									<li>&emsp;&emsp;</li>
								</ul>
								<ul class="alt">
									<li><h4>
											[<a href=<c:url value="/messageBoardShowList.controller"/>>主題列表</a>]
											</h4></li>

									<li>
										<h4>最熱文章</h4>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<img src="${famousMessageRank1PitcureUrl}" />
													<div class="PoetryContent"
														style="color: black; padding: 8px">${famousMessageRank1title}</div>
													<div class="PoetryContent" style="color: black;">&emsp;&emsp;</div>
												</div>
												<div class="swiper-slide">
													<img src="${famousMessageRank2PitcureUrl}" />
													<div class="PoetryContent"
														style="color: black; padding: 8px">${famousMessageRank2title}</div>
													<div class="PoetryContent" style="color: black;">&emsp;&emsp;</div>
												</div>
												<div class="swiper-slide">
													<img src="${famousMessageRank3PitcureUrl}" />
													<div class="PoetryContent"
														style="color: black; padding: 8px">${famousMessageRank3title}</div>
													<div class="PoetryContent" style="color: black;">&emsp;&emsp;</div>
												</div>

											</div>
											<div class="swiper-pagination"></div>
											<div class="swiper-button-next"></div>
											<div class="swiper-button-prev"></div>
										</div>
									</li>
									
							
									

									<div id="contents" style="color: WhiteSmoke; margin: 20px;">
										<h3 align="center">列表模式</h3>
										<form action="xxx" method="post">
											<table width="1000" height="80">
												<tbody>
													<tr style="align: center;">
														<td>&nbsp;<b>帳號</b>&nbsp;
														</td>
														<td>&nbsp;<b>標題</b>&nbsp;
														</td>
														<td>&nbsp;<b>發文者</b>&nbsp;
														</td>
														<td>&nbsp;<b>回應數</b>&nbsp;
														</td>
														<td>&nbsp;<b>日期</b>&nbsp;
														</td>
													</tr>
													<c:forEach var="messageBoard" items="${newest}">
														<tr style="align: center;">
															<td>&nbsp;${messageBoard.account}&nbsp;</td>
															<td style="color: bisque;"><h4><a
																href="<c:url value="/submessageBoardShow.controller"/>?resId=${messageBoard.id}&resAccount=${messageBoard.account}">&nbsp;${messageBoard.title}&nbsp;</a></h4></td>
															<td>&nbsp;${messageBoard.userName}&nbsp;</td>
															<td>&nbsp;${messageBoard.subMessageAmount}&nbsp;</td>
															<td>&nbsp;${messageBoard.time}&nbsp;</td>
														</tr>
													</c:forEach>


												</tbody>
											</table>



										</form>


									</div>






								</ul>
								<ul>
									<li>
										<div id="myModal" class="modal">
											<div class="modal-content">
												<div class="modal-header">
													<span class="close">&times;</span>
													<h2>Menu</h2>
												</div>
												<div class="modal-body">
													<p>${myBarX.barMenu}</p>
												</div>
											</div>
										</div>
									</li>
								</ul>

								<div id="myModal1" class="modal">
									<div id="modal-content1" class="modal-content">
										<div class="modal-header">
											<span id="close1">&times;</span>



										</div>


									</div>
								</div>
							</section>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script src="/Bartenders/JS/forBarPage.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQSxkb9GTtPwminPpk88vuulGQFJVMvQA&callback=initMap"></script>
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


	<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>

</body>

</html>