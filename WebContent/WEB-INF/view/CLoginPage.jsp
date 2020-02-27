<!-- 本頁已棄用 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta charset="UTF-8">
<title>註冊登入</title>
</head>
<body>

	<div align="center">
		<h3>老闆登入</h3>
		<form action="<c:url value="/CcheckLogin.controller"/>" method="post">
			<table>
				<tr>
					<td>帳號:</td>
					<td><input type="text" name="companyAccount"/></td>
					<td>${errors.Caccount}</td>
				</tr>

				<tr>
					<td>密碼:</td>
					<td><input type="password" name="companyPwd"/></td>
					<td>${errors.Cpassword}</td>
				</tr>
				<tr align="center">
					<td colspan="2"><button value="submit">登入</button></td>
					<td>${msg}</td>
				</tr>
			</table>
		</form>

		<div class="g-signin2" data-onsuccess="onSignIn"></div>

		<a href="/Bartenders/ResetCompanyPassword">忘記密碼</a><br /> 
		<a href="/Bartenders/CRegister">我要當老闆</a><br />
        <a href="/Bartenders/login">返回</a><br /> 
	</div>


	<script>
		function onSignIn(googleUser) {
			var id_token = googleUser.getAuthResponse().id_token;

			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'http://localhost:8080/Bartenders/googleVerify');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.send('idtokenstr=' + id_token);
			xhr.onload = function() {
				console.log('Signed in as: ' + xhr.responseText);
				document.location.href = "http://localhost:8080/Bartenders/checkCGLogin";
			};

		}
	</script>
</body>
</html>