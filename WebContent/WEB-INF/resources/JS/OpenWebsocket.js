var websocket = null;

if ('WebSocket' in window) {
	websocket = new WebSocket("ws://localhost:8080/Bartenders/websocketTest");
} else {
	alert('當前瀏覽器不支持 websocket，請換瀏覽器開啟本網站')
}

websocket.onmessage = function(event) {
	var messageJson = eval("(" + event.data + ")");

	if (messageJson.messageType === "message") {
		setMessageInnerHTML(messageJson.data);
	}

	if (messageJson.messageType === "onlineCount") {
		document.getElementById('onlineCount').innerHTML = messageJson.data;
		document.getElementById('onlineUser').innerHTML = '';
	}

	if (messageJson.messageType === "onlineUser") {
		// alert(messageJson.data);
		document.getElementById('onlineUser').innerHTML += '<div id="targetName">'
				+ messageJson.data + '</div>';
	}

	if (messageJson.messageType === "noticify") {
		alert(messageJson.data);
	}
}

function setMessageInnerHTML(innerHTML) {
	document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

function send() {
	var message = document.getElementById('text').value;
	var username = document.getElementById('username').value;
	websocket.send(username + "@" + message);
	document.getElementById('text').value = "";
	document.getElementById('message').innerHTML += "me:" + message + '<br/>';
}

window.onbeforeunload = function() {
	closeWebSocket();
}

function closeWebSocket() {
	websocket.close();
}