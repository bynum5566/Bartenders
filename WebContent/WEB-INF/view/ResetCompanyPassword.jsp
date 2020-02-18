<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="/Bartenders/CSS/add_editView.css">
<title>公司密碼重設</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>

<style>
h1.panel, form.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	border: solid 1px #c3c3c3;
}

form.panel {
	height: 600px;
	width: 900px;
	background-color: transparent;
}

#wordPicture {
	height: 200px;
	width: 800px;
}
</style>


</head>

<body>

	<main>
		<div align="center">
			<h3 style="color: WhiteSmoke;">酒吧使用者重設密碼</h3>
			<form action="<c:url value="/resetCompanyPassword.controller" />"
				method="post">
				<table>
					<tr>
						<td>公司帳號:</td>
						<td><input type="text" name="companyAccount"
							placeholder="請輸入您的帳號" /></td>
						<td>${errors.account}</td>
					</tr>

					<tr>
						<td>EMAIL帳號:</td>
						<td><input type="email" name="companyemail"
							autocomplete="off" size="50" placeholder="請填寫正確的郵件地址"
							required="required"
							pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /><br></td>
						<td>${errors.email}</td>
					</tr>

					<tr>
						<td>電話:</td>
						<td><input type="text" name="companyphone" autocomplete="off"
							size="50" required="required" placeholder="請輸入您的電話" /><br></td>
						<td>${errors.phone}</td>
					</tr>
					<tr>
						<td>統一編號:</td>
						<td><input type="text" name="taxId" autocomplete="off"
							size="50" required="required" placeholder="請輸入您的統一編號" /><br></td>
						<td>${errors.taxId}</td>
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
						<td>${errors.pswd}</td>
					</tr>

					<tr align="center">
						<td colspan="2"><button value="submit" style="color: black">送出</button></td>
					</tr>
				</table>
			</form>
			<h3>
				<a href="/Bartenders/CLogin">返回</a><br />
			</h3>
		</div>

		<h1 style="color: WhiteSmoke;" align="center">${errors.msg}</h1>

	</main>


</body>
</html>