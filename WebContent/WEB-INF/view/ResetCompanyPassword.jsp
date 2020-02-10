<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設密碼</title>
</head>
<body>

	<div align="center">
		<h3>重設密碼</h3>
		<form action="<c:url value="/resetCompanyPassword.controller" />" method="post">
			<table>
				<tr>
					<td>公司帳號:</td>
					<td><input type="text" name="companyAccount" /></td>
					<td>${errors.account}</td>
				</tr>

				<tr>
					<td>EMAIL帳號:</td>
					<td><input type="email" name="companyemail" autocomplete="off" size="50" placeholder="請填寫正確的郵件地址"
						required="required" pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /><br></td>
					<td>${errors.email}</td>
				</tr>
				
				<tr>
					<td>手機:</td>
					<td><input type="text" name="companyphone" autocomplete="off" size="50" required="required"  /><br></td>
					<td>${errors.phone}</td>
				</tr>
				<tr>
					<td>統一編號:</td>
					<td><input type="text" name="taxId" autocomplete="off" size="50" required="required"  /><br></td>
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
					<td colspan="2"><button value="submit">送出</button></td>
				</tr>
			</table>
		</form>
		<a href="/Bartenders/CLogin">返回</a><br />
	</div>

	<div align="center">${errors.msg}</div>

</body>
</html>