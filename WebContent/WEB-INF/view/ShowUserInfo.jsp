<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>

<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/bg15.png") no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.mydiv {
	width: 50%;
	height: 500px;
	margin: 0px auto;
	top: 80px;
	position: relative;
	text-align: center;
	background-position: center;
	align-content: center;
	background-color: rgb(255, 255, 255, 0.4);
}

.content{
	margin: auto;
	line-height:350%;
	font-size: 130%;
}

</style>

</head>

<body>

	<div class="mydiv">
		<h2>個人資料</h2>

	
		<table class="content">
			<tr>
				<td>帳號:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showAccount}</td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showName}</td>
			</tr>
			<tr>
				<td>生日:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showBirthday}</td>
			</tr>
			<tr>
				<td>連絡電話:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showPhone}</td>
			</tr>
			<tr>
				<td>電子郵件:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showEmail}</td>
			</tr>
			<tr>
				<td>聯絡地址:</td>
				<td>&emsp;&emsp;&emsp;&emsp;</td>
				<td>${showAddress}</td>
			</tr>

		</table>
		
		<button onclick="update();">修改個人資料</button>

	</div>

	<script type="text/javascript">
		function update() {
			document.location.href="http://localhost:8080/Bartenders/resetInfo";
		}
	</script>
</body>
</html>
<%@include file="UserMenu.jsp"%>