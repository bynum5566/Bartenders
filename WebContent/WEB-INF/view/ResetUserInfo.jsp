<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個人資訊</title>

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

.content {
	margin: auto;
	line-height: 340%;
	font-size: 130%;
}
</style>

</head>

<body>

	<div class="mydiv">
		<h2>修改個人資料</h2>

		<div>
			<h2>${errorMsg}</h2>
		</div>
		<form action="<c:url value="/resetInfo.do" />" method="POST">
			<table class="content">
				<tr>
					<td>姓名:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="text" name="userName" required="required"
						size="50" placeholder="請輸入您的姓名" pattern="^.{3,30}$" /><br></td>
				</tr>
				<tr>
					<td>帳號:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="text" size="50" placeholder="${account}"
						disabled="disabled" /><br></td>
				</tr>
				<tr>
					<td>手機:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="tel" name="phone" autocomplete="off"
						size="50" placeholder="請填寫欲更改的手機號碼" required="required"
						pattern="^.{10}$" /><br></td>
				</tr>

				<tr>
					<td>生日:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="date" name="birthday" size="50"
						autocomplete="off" required="required" /><br></td>
				</tr>

				<tr>
					<td>電子郵件:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="email" size="50" placeholder="${showEmail}"
						disabled="disabled" /><br></td>
				</tr>

				<tr>
					<td>聯絡地址:</td>
					<td>&emsp;&emsp;</td>
					<td><input type="text" name="address" autocomplete="off"
						size="50" placeholder="請填寫欲更改的的住址"
						pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required" /><br></td>
				</tr>
			</table>
			<input type="submit" value="確認送出" />&nbsp;&nbsp; <input type="reset" value="清除重填" />

		</form>

	</div>

</body>
</html>
<%@include file="UserMenu.jsp"%>