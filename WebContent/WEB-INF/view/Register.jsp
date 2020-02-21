<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊帳戶</title>

<style type="text/css">

@font-face {
	font-family: FangBold;
	src: url(/Bartenders/CSS/方正卓越體-繁U-ExtraBold.TTF);
}



html, body {
	font-family: FangBold;
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
	margin:100px auto;
	text-align: center;
	background-color: rgb(255, 255, 255, 0.4);
	width: 50%;
	height:650px;
	border: 1.5px groove  rgb(255, 255, 255, 0.4);
	border-radius:2%;
	font-size: 140%;
	line-height:150%;

}

::-webkit-input-placeholder { 
  color: #ccc;
}

:-ms-input-placeholder { 
  color: #ccc;
}

::placeholder {
  color: #ccc;
}

table{
 	margin-left: 15%; 
	width:fit-content;
	text-align:left;
}

h5{
	color:red;
}

input[type=text],input[type=password],input[type=tel],input[type=date],input[type=email]{
  min-width:30%;
  width:75%;
  padding: 10px;
  line-height: 18px;
  border-radius: 3px;
  border-color: transparent;
  background-color: rgb(12, 10, 10,0.5);
  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.75);
  border: none;
  color: rgb(198, 220, 241);
}

</style>

</head>
<body>
	<div class="content" >
		<h1>請填寫基本資料</h1>
		<div>
			<h5>${errorMsg}</h5>
		</div>
		<form action="<c:url value="/register.do" />" method="POST">
			<table >
				<tr>
					<td>姓名:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="text" name="userName" required="required"
						size="50" placeholder="請輸入您的姓名" pattern="^.{3,30}$" /><br></td>
				</tr>
				<tr>
					<td>帳號:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="text" name="newAccount" autocomplete="off"
						size="50" placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="password" name="newPassword" size="50"
						placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>
				<tr>
					<td>確認密碼:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="password" name="newPassword2" size="50"
						placeholder="請再輸入一次密碼" required="required"
						pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" /><br></td>
				</tr>

				<tr>
					<td>手機:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="tel" name="phone" autocomplete="off"
						size="50" placeholder="請填寫正確的手機號碼" required="required"
						pattern="^.{10}$" /><br></td>
				</tr>

				<tr>
					<td>生日:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="date" name="birthday" size="50"
						autocomplete="off" required="required" /><br></td>
				</tr>

				<tr>
					<td>電子郵件:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="email" name="email" autocomplete="off"
						size="50" placeholder="請填寫正確的郵件地址" required="required"
						pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /><br></td>
				</tr>

				<tr>
					<td>聯絡地址:</td>
					<td>&emsp;&emsp;&emsp;&emsp;</td>
					<td><input type="text" name="address" autocomplete="off"
						size="50" placeholder="請填寫正確的住址"
						pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required" /><br></td>
				</tr>
			</table>
			
					<input type="submit" value="確認送出" />&nbsp;&nbsp;
						<input type="reset" value="清除重填" />
		</form>
		<br/>
	<a href="/Bartenders/login">回主頁</a>
	</div>
</body>
</html>