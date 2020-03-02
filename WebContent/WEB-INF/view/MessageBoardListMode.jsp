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
<title>${CompanyName}／Bartenders</title>
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
								<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
								<li class="small"><a
									href="/Bartenders/Welcome.UserFirstPage">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>

		<body>

			<div>
				<div style="color: WhiteSmoke;">
					[<a href=<c:url value="/messageBoardShowList.controller"/>>主題列表</a>]
				</div>
			</div>


			<!-- 李昀陽/////////facebook登入 -->


			<div id="fb-root"></div>
			<script async defer crossorigin="anonymous"
				src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=198371544718507&autoLogAppEvents=1"></script>


			<div class="fb-login-button" data-width="" data-size="large"
				data-button-type="continue_with" data-auto-logout-link="false"
				data-use-continue-as="false"></div>




			<script>
				function checkLoginState() {
					FB.getLoginStatus(function(response) {
						statusChangeCallback(response);
					});
				}

				FB.getLoginStatus(function(response) {
					statusChangeCallback(response);
				});

				window.fbAsyncInit = function() {
					FB.init({
						appId : '{your-app-id}',
						cookie : true,
						xfbml : true,
						version : '{api-version}'
					});

					FB.AppEvents.logPageView();

				};

				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id)) {
						return;
					}
					js = d.createElement(s);
					js.id = id;
					js.src = "https://connect.facebook.net/en_US/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>


			<!-- 李昀陽/////////facebook登入 -->



<li>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="${famousMessageRank1PitcureUrl}" />
					</div>


					<div class="swiper-slide">
						<img src="${famousMessageRank2PitcureUrl}" />
					</div>

					<div class="swiper-slide">
						<img src="${famousMessageRank3PitcureUrl}" />
					</div>

					<div class="swiper-slide">
						<img src="${famousMessageRank3PitcureUrl}" />
					</div>

					<div class="swiper-slide">
						<img src="${famousMessageRank3PitcureUrl}" />
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
									<td style="color: bisque;"><a
										href="<c:url value="/submessageBoardShow.controller"/>?resId=${messageBoard.id}&resAccount=${messageBoard.account}">&nbsp;${messageBoard.title}&nbsp;</a></td>
									<td>&nbsp;${messageBoard.userName}&nbsp;</td>
									<td>&nbsp;${messageBoard.subMessageAmount}&nbsp;</td>
									<td>&nbsp;${messageBoard.time}&nbsp;</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>



				</form>


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