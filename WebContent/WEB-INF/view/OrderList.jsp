<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
<style type="text/css">
.mydiv {
	width:100%;
	margin:0 auto;
	top: 80px;
	position: relative;
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
	font-size: 17px;
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



img{
height:90;
width:130;
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
padding-right: 5px;
}

</style>
</head>
<body>
<div class="mydiv">
	<div align="center">

		<form action="<c:url value="/OrderList.controller"/>" method="post">
			<h2>訂單明細</h2>
			<table>
				<thead>
					<tr align="center">
						<th>產品縮圖</th>
						<th>產品名稱</th>
						<th>產品單價</th>
						<th>產品數量</th>
						<th>產品金額</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<c:forEach items="${oneOrderCarts}" var="list" step="1"
							varStatus="current">
							<tr>
								<td align="center" height="90" width="130"><img height="90" width="130" id="pdPicture"
       src="<c:out value="${productData[current.index].productImageUrl}" />"></td>
								<td align="center">${productData[current.index].productName}</td>
								<td align="center">$${oneOrderCarts[current.index].checkoutPrice}</td>
								<td align="center">${oneOrderCarts[current.index].quantity}</td>
								<td align="center">$${productsPrice[current.index]}</td>
								<!--<td colspan="3">合計  ${totalPrice}</td> -->
						        
							</tr>
							<br>
						</c:forEach>
					</tr>
					
					<tr align="center">
						<th colspan="4">產品合計</th>
						<td>$${totalPrice}</td>
					</tr>
					<tr align="center">
						<th colspan="4">運費</th>
						<td>$${ShippingNumToPrice[order.shipping]}</td>
					</tr>
					<tr align="center">
						<th colspan="4">訂單總金額</th>
						<td>$${finalTotalPrice}</td>
					</tr>
						
				</tbody>
			</table>
			<br>
				<div align="center">
					<h3>
					<a href="<c:url value="/companyOrder.controller"/>"> <input
							class="css_button" type="button" value="返回訂單頁面" />
						</a>
					</h3>
				</div>
		</form>
	</div>
</div>

</body>
<%@include file="menu.jsp"%>
</html>