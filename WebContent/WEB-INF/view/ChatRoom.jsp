<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat Room</title>

<style type="text/css">
.mydiv {
	width: 100%;
	height: 500px;
	margin: 0px auto;
	top: 80px;
	position: relative;
	text-align: center;
	background-position: center;
	align-content: center;
}

html, body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/chatRoom.png") no-repeat center
		center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

h2 {
	align-content: center;
	color: #ACD6FF;
}

.onlineBox {
	background-color: rgb(255, 255, 255, 0.4);
	height: 75%;
	width: 35%;
	float: left;
	text-align: center;
	margin-left: 15%;
	height: 75%;
}

#onlineUser {
	margin: auto;
	width: 90%;
	height: 93%;
	border: 1.5px groove;
	align-content: center;
}

.sendBox {
	position: relative;
	background-color: rgb(255, 255, 255, 0.4);
	height: 75%;
	width: 35%;
	float: left;
	text-align: center;
	margin-right: 15%;
}

.countBox {
	clear: both;
	text-align: center;
	color: #73BF00;
}

.chatBox {
	height: 80%;
}

#message {
	margin: auto;
	width: 90%;
	height: 93%;
	border: 1.5px groove;
	align-content: center;
	overflow-x: hidden;
	overflow-y: auto;
	word-wrap: break-word;
	word-break: break-all;
}

#text {
	width: 50%;
	height: 7%;
}
</style>

</head>
<body>


	<div class="mydiv">
		<h2>哈囉，${userName} 歡迎來到聊天室</h2>
		<br />

		<div class="onlineBox">
			在線者
			<div id="onlineUser"></div>
		</div>

		<div class="sendBox">
			發送對象: <input id="username" type="text" width="50px"
				value="${targetName}" /> <br /> <br />

			<div class="chatBox">
				<div id="message"></div>

				<br /> 內容: <input id="text" type="text" />
				<button onclick="send()">發送消息</button>
			</div>

		</div>

		<div class="countBox">
			<h5>
				在線人數:
				<div id="onlineCount">0</div>
			</h5>
		</div>
	</div>


	<script type="text/javascript">
		var websocket = null;

		if ('WebSocket' in window) {
			websocket = new WebSocket(
					"ws://localhost:8080/Bartenders/websocketTest");
		} else {
			alert('當前瀏覽器不支持 websocket，請換瀏覽器開啟本網站')
		}

		websocket.onmessage = function(event) {
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
// 				alert(messageJson.data);
				document.getElementById('onlineUser').innerHTML += '<div id="targetName">'
						+ messageJson.data + '</div>';
			}

		}

		window.onbeforeunload = function() {
			closeWebSocket();
			signOut();
		}

		function setMessageInnerHTML(innerHTML) {
			document.getElementById('message').innerHTML += innerHTML + '<br/>';
		}

		function closeWebSocket() {
			websocket.close();
		}

		function send() {
			var message = document.getElementById('text').value;
			var username = document.getElementById('username').value;
			websocket.send(username + "@" + message);
			document.getElementById('text').value = "";
			document.getElementById('message').innerHTML += "me:"+message + '<br/>';
		}
	</script>

</body>
</html>
<%@include file="UserMenu.jsp"%>