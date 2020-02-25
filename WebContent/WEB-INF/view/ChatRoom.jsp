<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>聊天室</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>

	<style type="text/css">
/* 		.mydiv { */
/* 			width: 100%; */
/* 			height: 500px; */
/* 			margin: 0px auto; */
/* 			top: 80px; */
/* 			position: relative; */
/* 			text-align: center; */
/* 			background-position: center; */
/* 			align-content: center; */
/* 		} */

/* 		html, */
/* 		body { */
/* 			margin: 0; */
/* 			padding: 0; */
/* 			background: url("/Bartenders/images/chatRoom.png") no-repeat center center fixed; */
/* 			-webkit-background-size: cover; */
/* 			-moz-background-size: cover; */
/* 			-o-background-size: cover; */
/* 			background-size: cover; */
/* 		} */

/* 		h2 { */
/* 			align-content: center; */
/* 			color: #ACD6FF; */
/* 		} */

/* 		.onlineBox { */
/* 			background-color: rgb(255, 255, 255, 0.4); */
/* 			height: 75%; */
/* 			width: 35%; */
/* 			float: left; */
/* 			text-align: center; */
/* 			margin-left: 15%; */
/* 			height: 75%; */
/* 		} */

/* 		#onlineUser { */
/* 			margin: auto; */
/* 			width: 90%; */
/* 			height: 93%; */
/* 			border: 1.5px groove; */
/* 			align-content: center; */
/* 		} */

/* 		.sendBox { */
/* 			position: relative; */
/* 			background-color: rgb(255, 255, 255, 0.4); */
/* 			height: 75%; */
/* 			width: 35%; */
/* 			float: left; */
/* 			text-align: center; */
/* 			margin-right: 15%; */
/* 		} */

/* 		.countBox { */
/* 			clear: both; */
/* 			text-align: center; */
/* 			color: #73BF00; */
/* 		} */

/* 		.chatBox { */
/* 			height: 80%; */
/* 		} */

/* 		#message { */
/* 			margin: auto; */
/* 			width: 90%; */
/* 			height: 93%; */
/* 			border: 1.5px groove; */
/* 			align-content: center; */
/* 			overflow-x: hidden; */
/* 			overflow-y: auto; */
/* 			word-wrap: break-word; */
/* 			word-break: break-all; */
/* 			display: block; */
/* 			clear: both; */
/* 		} */

/* 		#text { */
/* 			width: 100%; */
/* 			height: 25%; */
/* 		} */

/* 		.action { */
/* 			margin-left: 10%; */
/* 			/* margin-left: 25px; */ 
/* 		} */
	
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
<script type="text/javascript">
	$(document).ready(function(){
	$('#message').scrollTop( $('#message')[0].scrollHeight);
	});
</script>
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
	                <li><a href=<c:url value="/Users.Info" />>會員中心</a></li>
	                <li><a href=<c:url value="/DisplayBarList.controller" />>所有酒吧</a></li>
	                <li><a href=<c:url value="/DisplayRandomBarList.controller" />>精選酒吧</a></li>
	                <li><a href=<c:url value="/DisplayCartList.controller" />>我的購物車</a></li>
	                <li><a href=<c:url value="/userOrder.controller" />>我的訂單</a></li>
	                <li><a href=<c:url value="/Dashboard.MyFavorite" />>我的最愛</a></li>
	                <li><a href=<c:url value="/messageBoardShow.controller" />>討論區</a></li>
	                <li><a href=<c:url value="/room.chat" />>聊天室</a></li>
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
					<div class="row">
						<div class="col-6 col-12-medium">

<!-- 		<div class="mydiv"> -->
							<h2>哈囉，${userName} 歡迎來到聊天室</h2>
							<br />
				
							<div class="onlineBox">
								<h4>在線者</h4>
								<div id="onlineUser"></div>
								<div class="countBox">
									<h5>在線人數:</h5>
									<h5>
										<div id="onlineCount">0</div>
									</h5>
								</div>
							</div>
			
						</div>
						<div class="col-6 col-12-medium">

<<<<<<< HEAD
							<div class="sendBox">
								<h4>發送對象</h4>
								<input id="username" type="text" width="50px" value="${targetName}" /> <br /> <br />
				
								<div class="chatBox">
									<div id="message" style="overflow:auto;height:300px;"></div>
								</div>
								<h4>訊息內容</h4>
								<textarea rows="8" cols="10" id="text"></textarea>
								<div class="row">
									<div class="col-6 col-12-medium">
										<ul class="actions">
											<li class="action"><br><button class="button primary" onclick="send()">發送消息</button></li>
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

	<script type="text/javascript">
		var websocket = null;

		if ('WebSocket' in window) {
			websocket = new WebSocket(
				"ws://localhost:8080/Bartenders/websocketTest");
=======
	
	<script type="text/javascript">
 		var websocket = null;

		if ('WebSocket' in window) {
			websocket = new WebSocket(
					"ws://localhost:8080/Bartenders/websocketTest");
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
		} else {
			alert('當前瀏覽器不支持 websocket，請換瀏覽器開啟本網站')
		}

<<<<<<< HEAD
		websocket.onmessage = function (event) {
=======
		websocket.onmessage = function(event) {
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
			debugger
			var messageJson = eval("(" + event.data + ")");
			if (messageJson.messageType === "message") {
				setMessageInnerHTML(messageJson.data);
			}
			if (messageJson.messageType === "onlineCount") {
				document.getElementById('onlineCount').innerHTML = messageJson.data;
				document.getElementById('onlineUser').innerHTML = '';
			}

			if (messageJson.messageType === "onlineUser") {
<<<<<<< HEAD
				// 				alert(messageJson.data);
				document.getElementById('onlineUser').innerHTML += '<div id="targetName">'
					+ messageJson.data + '</div>';
=======
// 				alert(messageJson.data);
				document.getElementById('onlineUser').innerHTML += 
					'<div id="targetName">'+ messageJson.data + '</div>';
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
			}

		}

		window.onbeforeunload = function () {
			closeWebSocket();
			signOut();
		}

		function setMessageInnerHTML(innerHTML) {
			document.getElementById('message').innerHTML += innerHTML + '<br/>';
<<<<<<< HEAD
		}

		function closeWebSocket() {
			websocket.close();
=======
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
		}

		function send() {
			var message = document.getElementById('text').value;
			var username = document.getElementById('username').value;
			websocket.send(username + "@" + message);
			document.getElementById('text').value = "";
<<<<<<< HEAD
			document.getElementById('message').innerHTML += "me:" + message + '<br/>';
		}
	</script>

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
=======
			document.getElementById('message').innerHTML += "me:"+message + '<br/>';
		}
		
		window.onbeforeunload=function(){
			websocket.send('${userName}');
		}
	</script>	
	
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1

</html>