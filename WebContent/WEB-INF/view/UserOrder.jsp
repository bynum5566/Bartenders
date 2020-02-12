<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User's Orders</title>

<style type="text/css">
.mydiv {
	width: auto;
	margin: auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
}

html, body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	width: auto;
	background-image: url("/Bartenders/images/BarImg.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}
</style>

</head>
<body>
	<div class="mydiv">
		<div align="center">
			<h3>我的訂單</h3>
			<form action="<c:url value="/userOrder.controller"/>" method="post">
				<table>
					<thead>
						<tr align="center">
							<td nowrap="nowrap">訂單編號</td>
							<td nowrap="nowrap">賣家名稱</td>
							<td nowrap="nowrap">商品名稱</td>
							<td nowrap="nowrap">訂單金額</td>
							<td nowrap="nowrap">收件人</td>
							<td nowrap="nowrap">配送方式</td>
							<td nowrap="nowrap">配送地址/QRcode載點</td>
							<td nowrap="nowrap">配送電話</td>
							<td nowrap="nowrap">訂單狀態</td>
							<td nowrap="nowrap">購買時間</td>
							<td nowrap="nowrap">物流編號</td>
							<td nowrap="nowrap">我要付款</td>
							<td nowrap="nowrap">修改訂單</td>
							<td nowrap="nowrap">取消訂單</td>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<c:forEach items="${Corders}" var="list" step="1"
								varStatus="current">
								<tr>
									<td align="center" nowrap="nowrap"><a
										href="<c:url value="/OrderListUser.controller"/>?orderId=${Corders[current.index].orderId}"
										value="${Corders[current.index].orderId}">${Corders[current.index].orderId}</a>
									</td>
									<td align="center" nowrap="nowrap">${company[current.index].companyName}</td>
									<td align="center" nowrap="nowrap">${productData[current.index].productName}等</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].amount}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].recipient}</td>
									<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping]}</td>
									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td align="center" nowrap="nowrap"><a
												href="${attrAddress[current.index]}">${attrAddress[current.index]}</a></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap">${attrAddress[current.index]}</td>
										</c:otherwise>
									</c:choose>
									<td align="center" nowrap="nowrap">${Corders[current.index].phone}</td>
									<td align="center" nowrap="nowrap">${statusNumToStr[Corders[current.index].status]}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].createTime}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].shippingNumber}</td>
									<td align="center" nowrap="nowrap"><a
										href="<c:url value="/doLPay"/>?orderId=${Corders[current.index].orderId}">
											去付款</a></td>
									<!--<form:form action="doLPay" method="post">
									<table>
										<tr>
											<td><input type="submit" value="去付款"></td>
										</tr>
									</table>
								</form:form>-->
									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td nowrap="nowrap"><font color=gray>修改訂單</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='配送中'}">
											<td nowrap="nowrap"><font color=gray>修改訂單</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已到貨'}">
											<td nowrap="nowrap"><font color=gray>修改訂單</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已取消'}">
											<td nowrap="nowrap"><font color=gray>修改訂單</font></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap"><a
												href="<c:url value="/ShowChangeOrderUser.controller"/>?orderId=${Corders[current.index].orderId}"
												value="${Corders[current.index].orderId}">修改訂單</a></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='未付款'}">
											<td nowrap="nowrap"><a
												href="<c:url value="/CancelOrderUser.controller"/>?orderId=${Corders[current.index].orderId}&status=${Corders[current.index].status}"
												value="${Corders[current.index].orderId}">取消訂單</a></td>
										</c:when>
										<c:otherwise>
											<td nowrap="nowrap"><font color=gray>取消訂單</font></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="UserMenu.jsp"%>