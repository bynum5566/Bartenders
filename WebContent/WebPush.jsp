<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>推送通知 WebPush</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<h1>推送通知 WebPush</h1>
	<p>這網頁必須使用HTTPS或通過localhost。</p>
	<P>以下是Json</P>
	<p id="pushsubscription">None</p>
	<button disabled>Subscribe</button>
	<button id="bt1">send to server</button>
	
	<button onclick="sendSubscriptionToBackEnd()">Save</button>
	<!-- 
	<button id="start" onclick="start()">start</button>
	 -->
	 
	<div>
		<p>Data</p>
		<p class="data"></p>
	</div>

<script src="scripts/push.js"></script>
<script>

$("#bt1").on("click", function() {
	var data = document.getElementById("pushsubscription").innerHTML
	console.log(data);
	window.location.href = '<c:url value="/SaveData.do"/>?subscriptionData=' + data;
	})

</script>
</body>
</html>