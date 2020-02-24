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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>	

	
<title>訂單管理</title>

<style type="text/css">
a {
	color: #E8CCFF;
}

a:hover {
	color: #9F88FF;
}

.mydiv {
	min-width: auto;
	max-width: 1500px;
	margin: 100px auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	color: #E8CCFF;
	font-size: 18px;
	background-image: url(/Bartenders/images/bg21.png);
}

body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: 'Noto Sans TC', sans-serif;
}

td {
	line-height: 25px;
	padding-left: 5px;
	padding-right: 5px;
}

div.panel, td.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: gray;
	border: solid 1px #c3c3c3;
	max-width: 1400px;
}

div.panel {
	height: 120px;
	display:none;
	max-width: 1400px;
}
</style>
</head>
<body>
	<div class="mydiv">
		<div align="center">
			<h2>訂單管理</h2>
			<br>
			<form action="<c:url value="/companyOrder.controller"/>"
				method="post">
				<table>
					<thead>
						<tr align="center">
							<th nowrap="nowrap">訂單編號</th>
							<th nowrap="nowrap">買家帳號</th>
							<th nowrap="nowrap">訂單內容</th>
							<th nowrap="nowrap">金額</th>
							<th nowrap="nowrap">收件人</th>
							<th nowrap="nowrap">配送方式</th>
							<th nowrap="nowrap">配送地址/QRcode載點</th>
							<th nowrap="nowrap">配送電話</th>
							<th nowrap="nowrap">訂單狀態</th>
							<th nowrap="nowrap">購買時間</th>
							<th nowrap="nowrap">物流編號</th>
							<th nowrap="nowrap">修改</th>
							<th nowrap="nowrap">取消</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<c:forEach items="${Corders}" var="list" step="1"
								varStatus="current">
								<tr>
									<td align="center" nowrap="nowrap"><a
										href="<c:url value="/OrderList.controller"/>?orderId=${Corders[current.index].orderId}"
										value="${Corders[current.index].orderId}">${Corders[current.index].orderId.substring(9,19)}</a>
									</td>
									<td align="center" nowrap="nowrap">${user[current.index].account}</td>
								<td align="center" nowrap="nowrap"><div class="flip">${productData[current.index][0].productName}...</div>
									<div class="panel">
									<c:forEach items="${productData[current.index]}" var="list" step="1"
								varStatus="current1">
										<p>${productData[current.index][current1.index].productName}</p></c:forEach>
									</div>
									</td>
								<td align="center" nowrap="nowrap">$${Corders[current.index].amount}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].recipient}</td>

									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping].substring(0,6)}<br>${ShippingNumToStr[Corders[current.index].shipping].substring(6,10)}</td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping]}</td>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td align="center" nowrap="nowrap"><a
												href="${attrAddress[current.index]}">QRcode載點</a></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap">${attrAddress[current.index]}</td>
										</c:otherwise>
									</c:choose>
									<td align="center" nowrap="nowrap">${Corders[current.index].phone}</td>
									<td align="center" nowrap="nowrap">${statusNumToStr[Corders[current.index].status]}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].createTime.substring(0,10)}<br>${Corders[current.index].createTime.substring(11,19)}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].shippingNumber}</td>

									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='配送中'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
									 	<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已到貨'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已取消'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap"><a
												href="<c:url value="/ShowChangeOrder.controller"/>?orderId=${Corders[current.index].orderId}"
												value="${Corders[current.index].orderId}">修改</a></td>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='未付款'}">
											<td nowrap="nowrap"><a
												href="<c:url value="/CancelOrder.controller"/>?orderId=${Corders[current.index].orderId}&status=${Corders[current.index].status}"
												value="${Corders[current.index].orderId}">取消</a></td>
										</c:when>
										<c:otherwise>
											<td nowrap="nowrap"><font color=gray>取消</font></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>

					</tbody>
				</table>
			</form>
		</div>
	</div>

 <script type="text/javascript">
  $(".flip").click(function() {
   <%--$(".panel").slideToggle("slow");--%>
   $(this).siblings().slideToggle("slow");
  });
	</script>
</body>
<%@include file="menu.jsp"%>
</html>