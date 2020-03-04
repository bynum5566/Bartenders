var websocket = null;
var i=0;

if ('WebSocket' in window) {
	websocket = new WebSocket("ws://localhost:8080/Bartenders/websocketTest");
} else {
	alert('當前瀏覽器不支持 websocket，請換瀏覽器開啟本網站')
}

websocket.onopen = function(event) {
	console.log("onopen:", event);
	
}

websocket.onmessage = function(event) {

	console.log("onmessage:", event);

	var messageJson = eval("(" + event.data + ")");

	if (messageJson.messageType === "message") {
		setMessageInnerHTML(messageJson.data);
	}

	if (messageJson.messageType === "onlineCount") {
		document.getElementById('onlineCount').innerHTML = messageJson.data;
		document.getElementById('onlineUser').innerHTML = '';
		i=0;
	}

	if (messageJson.messageType === "onlineUser") {
		i++;
		document.getElementById('onlineUser').innerHTML += '<li><a onclick="chatWith('+i+')" id="on'+i+'" href="#">'
				+ messageJson.data + '</a></li>';
	}

	if (messageJson.messageType === "noticify") {
//		alert(messageJson.data);
		var messArray = messageJson.data.split("*");
		document.getElementById('notice').innerHTML += 
			'<li><a href="/Bartenders/121room.chat?tarName='+messArray[1]+'&sourName='+messArray[0]+
			'" target="_blank" >'+ messArray[1]+messArray[2] + '</a></li>';
	}

	if (messageJson.messageType === "pushNews") {
//		alert(messageJson.data);
		var messArray = messageJson.data.split("*");
		document.getElementById('notice').innerHTML += '<li><a href="/Bartenders/DisplayProductList.controller?barAccount='+messArray[1]+'">'
				+ messArray[0] + '</a></li>';
	}
	
	if (messageJson.messageType === "pushAct") {
//		alert(messageJson.data);
		var messArray = messageJson.data.split("#");
		document.getElementById('notice').innerHTML += '<li><a href="/Bartenders/queryActivityByActivityId.do?activityId='+messArray[0]+'">'
				+ messArray[1] + '</a></li>';
	}
	
}

function setMessageInnerHTML(innerHTML) {
	document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

function send() {
	var message = document.getElementById('text').value;
	var username = document.getElementById('targetName').value;
	websocket.send(username + "@" + message);
	document.getElementById('text').value = "";
	document.getElementById('message').innerHTML += "me:" + message + '<br/>';
}

websocket.onerror = function(event) {
	console.log("onerror:", event);
}

websocket.onclose = function(event) {
	console.log("onclose", event);
	if (event.code != 4500) {
		// 4500為服務端在開啟多tab時主動關閉返回的編碼
		reconnect();// 重連
	}
}



// window.onbeforeunload = function() {
// closeWebSocket();
// }
//
// function closeWebSocket() {
// websocket.close();
// }
