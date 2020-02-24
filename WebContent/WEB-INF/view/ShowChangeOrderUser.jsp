<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<title>我的訂單</title>
<style type="text/css">
.mydiv {
min-width: auto;
max-width: 700px;
margin:100px auto;
top: 80px;
position: sticky;
text-align: center;
border-radius: 5px;
color: #E8CCFF;
font-size: 18px;
background-image: url(/Bartenders/images/bg21.png);
}

body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/bg11.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: 'Noto Sans TC', sans-serif;
}

.css_button {
	padding: 3.5px 7px;
	border: 1px solid #857C7C;
	background: -webkit-gradient(linear, left top, left bottom, from(#6D6C70),
		to(#615B5B));
	background: -webkit-linear-gradient(top, #6D6C70, #615B5B);
	background: -moz-linear-gradient(top, #6D6C70, #615B5B);
	background: -ms-linear-gradient(top, #6D6C70, #615B5B);
	background: -o-linear-gradient(top, #6D6C70, #615B5B);
	background-color: #615B5B;
	box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-moz-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	color: #CCBBFF;
	font-size: 16px;
	font-family: 111.otf;
	text-decoration: none;
	font-weight: bold;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	cursor: pointer;
}

.css_button:hover {
	background: none;
	background-color: #615B5B;
	box-shadow: 0px 0px 5px 0px #AAAAAA;
	-webkit-box-shadow: 0px 0px 5px 0px #AAAAAA;
	-moz-box-shadow: 0px 0px 5px 0px #AAAAAA;
	border: 1px solid #ffffff;
	color: #F2E4E4;
}

.css_button:active {
	top: 1px;
	position: relative;
}

td,th{
line-height: 25px;
padding-left: 5px;
padding-top: 5px;
padding-right: 5px;
}
</style>
</head>
<body>
<div class="mydiv">
	<div align="center">
		<h1>請填寫要修改的訂單資料</h1>
		<br>
		<form action="<c:url value="/doChangeOrderUser.controller"/>" method="POST">
			<table>
			
				<tr>
					<td>訂單編號:</td>
					<td><input type="text" size="40" name="orderId" value= "${orderId}"
						readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>商品名稱:</td>
					<td><input type="text" size="40" name="name" value="${productData[0].productName}等"
						readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>訂單總價:</td>
					<td><input type="text" size="40" name="price" value="${order.amount}"
						readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>收件人:</td>
					<td><input type="text" size="40" name="recipient" value="${order.recipient}" /><br></td>
				</tr>
					<tr>
					<td>原選擇之配送方式:</td>
					<td><input type="text" size="40" name="price" value="${ShippingNumToStr[order.shipping]}"
						readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>配送方式:</td>
					<td><select name="shippingType">
							<option value="HomeDelivery" width="10">1.宅配</option>
							<option value="ConvenienceStore" width="10">2.超商取貨</option>
					</select><br></td>
				</tr>
				<tr>
					<td>配送地址:</td>
					<td><input type="text" name="address" size="40" value="${attrAddress}" /><br></td>
				</tr>
				<tr>
					<td>收件人電話:</td>
					<td><input type="text" size="40" name="phone" value="${order.phone}" /><br></td>
				</tr>
						
		 	</table>
		 		<br><br>
		 	<input class="css_button" type="submit" value="確認送出" /> <input
						class="css_button" type="reset" value="清除重填" />
		</form>
	</div>
	</div>

</body>
</html>
<%@include file="UserMenu.jsp"%>