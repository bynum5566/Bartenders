<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Order List</title>
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
		<form action="<c:url value="/OrderListUser.controller"/>" method="post">
			<h2>訂單明細</h2>
			<table>
				<thead>
					<tr align="center">
						<td>產品名稱</td>
						<td>產品單價</td>
						<td>產品數量</td>
						<td>產品金額</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<c:forEach items="${oneOrderCarts}" var="list" step="1"
							varStatus="current">
							<tr>
								<td align="center">${productData[current.index].productName}</td>
								<td align="center">${oneOrderCarts[current.index].checkoutPrice}</td>
								<td align="center">${oneOrderCarts[current.index].quantity}</td>
								<td align="center">${productsPrice[current.index]}</td>
								<!--<td colspan="3">合計  ${totalPrice}</td> -->
						        
							</tr>
							<br>
						</c:forEach>

					</tr>
					<tr align="center">
						<td colspan="3">產品合計</td>
						<td>${totalPrice}</td>
					</tr>
					<tr align="center">
						<td colspan="3">運費</td>
						<td>${ShippingNumToPrice[order.shipping]}</td>
					</tr>
					<tr align="center">
						<td colspan="3">訂單總金額</td>
						<td>${finalTotalPrice}</td>
					</tr>
				</tbody>

			</table>

		</form>
	</div>
</div>
</body>
</html>
<%@include file="UserMenu.jsp"%>