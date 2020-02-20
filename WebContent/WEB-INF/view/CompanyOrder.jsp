<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>

<style type="text/css">
a{
color: #E8CCFF;

}
a:hover {
color: 	#9F88FF;
}
.mydiv { 
min-width: auto;
top: 80px;
position: sticky;
text-align: center;
border-radius: 5px;
background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%); 
background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); 
-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); 
color: #E8CCFF;
font-size: 18px;
}


body {
margin:0;
padding:0;
background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat center center fixed;
-webkit-background-size: cover; 
-moz-background-size: cover; 
-o-background-size: cover; 
background-size: cover;
}

td{
line-height: 25px;
padding-left: 3px;
padding-right: 3px;
}

</style>
</head>
<body>
	<div class="mydiv">
	<div align="center">
		<h3>訂單管理</h3>
		<br>
		<form action="<c:url value="/companyOrder.controller"/>" method="post">
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
									value="${Corders[current.index].orderId}">${Corders[current.index].orderId}</a>
								</td>
								<td align="center" nowrap="nowrap">${user[current.index].account}</td>
								<td align="center" nowrap="nowrap">${productData[current.index].productName}等</td>
								<td align="center" nowrap="nowrap">$${Corders[current.index].amount}</td>
								<td align="center" nowrap="nowrap">${Corders[current.index].recipient}</td>
								<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping]}</td>
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
								<td align="center" nowrap="nowrap">${Corders[current.index].createTime.substring(0,19)}</td>
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
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	</div>
</body>
<%@include file="menu.jsp"%>
</html>