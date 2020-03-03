<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>${tarName}(聊天室) / Bartenders</title>
<!-- 小鈴鐺 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>

<style type="text/css">
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#message').scrollTop($('#message')[0].scrollHeight);
	});
</script>
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
<!-- 			<nav id="nav"> -->
<!-- 				<ul> -->
<!-- 					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a> -->
<!-- 						<div id="menu"> -->
<!-- 							<ul> -->
<!-- 								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li> -->
<!-- 								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li> -->
<!-- 								<li><a -->
<!-- 									href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li> -->
<!-- 								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li> -->
<!-- 								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li> -->
<!-- 								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li> -->
<!-- 								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li> -->
<!-- 								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li> -->
<!-- 								<li class="small"><a href="/Bartenders/Welcome.UserFirstPage">首頁</a><a -->
<!-- 									href="javascript:signOut()">登出</a></li> -->
<!-- 							</ul> -->
<!-- 						</div></li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
		</header>

		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<div class="row">
						<div class="col-6 col-12-medium">

							<!-- 		<div class="mydiv"> -->
							<h2>
								哈囉，${sourName}<br /> 歡迎來到聊天室
							</h2>
							<br />

							<div class="onlineBox" >
								<h4>在線者</h4>
								<ul id="onlineUser"></ul>
								<div class="countBox">
									<h5>在線人數:</h5>
									<h5>
										<div id="onlineCount">0</div>
									</h5>
								</div>
							</div>

						</div>
						<div class="col-6 col-12-medium">

							<div class="sendBox">
								<h4>發送對象</h4>
								<input id="targetName" type="text" width="50px" value="${tarName}"
									 /> <br /> <br />

								<div class="chatBox">
									<div id="message" style="overflow: auto; height: 300px;"></div>
								</div>
								<h4>訊息內容</h4>
								<textarea rows="8" cols="10" id="text" value="${tarName}:${content}"></textarea>
								<div class="row">
									<div class="col-6 col-12-medium">
										<ul class="actions">
											<li class="action"><br>
												<button class="button primary" onclick="send()">發送消息</button></li>
										</ul>
									</div>
								</div>
							</div>


							<!-- 		</div> -->
						</div>
					</div>
				</div>
			</section>
		</article>

		<script src="/Bartenders/JS/OpenWebsocket.js"></script>
		<script type="text/javascript">
			window.onbeforeunload = function() {
				websocket.send('${sourName}');
			}
		</script>
		
		<script type="text/javascript">
		
			function chatWith(x){
				var id="on"+x;
				var tarName=document.getElementById(id).innerHTML;
				$('#targetName').val(tarName);
			}
		</script>
		
		<!-- 小鈴鐺 -->
		<script type="text/javascript">
			$(".bell").click(function() {
				$(".notice").slideToggle("slow");
			})
		</script>

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