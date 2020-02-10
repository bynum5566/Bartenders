<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

</head>
<body>

<h1>
This QRCode is invalid!
</h1>
<button id="bt1" class="Code" >返回</button><br>
<script>
$("#bt1").on("click", function() {
	window.location.href = '<c:url value="/logistic/loginSuccess"/>';
	})
</script>
</body>
</html>