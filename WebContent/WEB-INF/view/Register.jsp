<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊帳戶</title>

<style type="text/css">

html, body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/Register.jpg") no-repeat center
		center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.content{
	margin: auto;
}

</style>

</head>
<body>
	<div class="content" >
		<h1>請填寫基本資料</h1>
		<div>
			<h2>${errorMsg}</h2>
		</div>
		<form action="<c:url value="/register.do" />" method="POST">
			<table>
				<tr>
					<td>姓名:</td>
					<td><input type="text" name="userName" required="required"
						size="50" placeholder="請輸入您的姓名" pattern="^.{3,30}$" /><br></td>
				</tr>
				<tr>
					<td>帳號:</td>
					<td><input type="text" name="newAccount" autocomplete="off"
						size="50" placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td><input type="password" name="newPassword" size="50"
						placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>
				<tr>
					<td>確認密碼:</td>
					<td><input type="password" name="newPassword2" size="50"
						placeholder="請再輸入一次密碼" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>

				<tr>
					<td>手機:</td>
					<td><input type="tel" name="phone" autocomplete="off"
						size="50" placeholder="請填寫正確的手機號碼" required="required"
						pattern="^.{10}$" /><br></td>
				</tr>

				<tr>
					<td>生日:</td>
					<td><input type="date" name="birthday" size="50"
						autocomplete="off" required="required" /><br></td>
				</tr>

				<tr>
					<td>電子郵件:</td>
					<td><input type="email" name="email" autocomplete="off"
						size="50" placeholder="請填寫正確的郵件地址" required="required"
						pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /><br></td>
				</tr>

				<tr>
					<td>聯絡地址:</td>
					<td><input type="text" name="address" autocomplete="off"
						size="50" placeholder="請填寫正確的住址"
						pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required" /><br></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="確認送出" />&nbsp;&nbsp;
						<input type="reset" value="清除重填" /></td>
				</tr>
			</table>
		</form>
	</div>
	<a href="/Bartenders/login">返回</a>
	<br />
</body>
</html>