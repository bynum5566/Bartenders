<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>
	<div align="center">

		<form action="<c:url value="/OrderList.controller"/>" method="post">
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


</body>
</html>