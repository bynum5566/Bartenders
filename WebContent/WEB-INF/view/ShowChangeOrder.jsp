<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangeOrder</title>
<style type="text/css">
.mydiv {
	width:100%;
	margin:0 auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(15, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	color: #E8CCFF;
}

body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/bg11.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body>
<div class="mydiv">
	<div align="center">
		<h1>請填寫要修改的訂單資料</h1>
		<form action="<c:url value="/doChangeOrder.controller"/>" method="POST">
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
				<tr>
					<td colspan="2"><input type="submit" value="確認送出" /> <input
						type="reset" value="清除重填" /></td>
				</tr>
				
		 	</table>
		</form>
	</div>
	</div>

</body>
<%@include file="menu.jsp"%>
</html>