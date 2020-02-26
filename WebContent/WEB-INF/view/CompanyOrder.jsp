<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>訂單管理</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>
<style>
.small {
	display: flex;
	align-self: center;
}

.small a {
	font-size: 16px;
	font-weight: 400;
	color: #888;
	font-family: 111.otf;
}

.small a+a {
	margin-left: 15px;
}

.row {
	margin-left: 2%;
}

div.panel, td.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: gray;
	border: solid 1px #c3c3c3;
	max-width: 1400px;
}

td.flip h3 {
    cursor: pointer;
}

div.panel {
	height: auto;
	display: none;
	max-width: 1400px;
}

.wrapper {
	padding: 3em 0 2em 0;
}

p {
	margin: 0 0 0 0;
}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="index.jsp">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
								<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
								<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息與活動+</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息與活動管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
								<li><a href="/Bartenders/ManageBar">管理活動</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>

		<article id="main">
			<section class="wrapper style5">
				<!-- 				<div class="inner"> -->
				<section>
					<div class="row">
						<div class="col-6 col-12-medium">
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
											<!-- <th nowrap="nowrap">收件人</th> -->
											<th nowrap="nowrap">配送方式</th>
											<th nowrap="nowrap">配送詳情/QRcode載點</th>
											<!-- <th nowrap="nowrap">配送電話</th> -->
											<th nowrap="nowrap">訂單狀態</th>
											<th nowrap="nowrap">購買時間</th>
											<!-- <th nowrap="nowrap">物流編號</th> -->
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
														value="${Corders[current.index].orderId}">${Corders[current.index].orderId.substring(3,6)}${Corders[current.index].orderId.substring(12,19)}</a>
													</td>
													<td align="center" nowrap="nowrap">${user[current.index].account}</td>
													<td align="center" nowrap="nowrap"><div class="flip"
															style="cursor: pointer;">${productData[current.index][0].productName}...</div>
														<div class="panel">
															<c:forEach items="${productData[current.index]}"
																var="list" step="1" varStatus="current1">
																<p>${productData[current.index][current1.index].productName}</p>
															</c:forEach>
														</div></td>
													<td align="center" nowrap="nowrap">$${Corders[current.index].amount}</td>
												<!--  <td align="center" nowrap="nowrap">${Corders[current.index].recipient}</td>-->	

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
															<td align="center" nowrap="nowrap"><a
																href="<c:url value="/orderShippingDetail.controller"/>?orderId=${Corders[current.index].orderId}"
																value="${Corders[current.index].orderId}">配送詳情</a></td>
														</c:otherwise>
													</c:choose>
												<!-- <td align="center" nowrap="nowrap">${Corders[current.index].phone}</td> -->	
													<td align="center" nowrap="nowrap">${statusNumToStr[Corders[current.index].status]}</td>
													<td align="center" nowrap="nowrap">${Corders[current.index].createTime.substring(0,10)}<br>${Corders[current.index].createTime.substring(11,19)}</td>
												<!-- <td align="center" nowrap="nowrap">${Corders[current.index].shippingNumber}</td> -->	

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
				</section>
				<!-- 				</div> -->
			</section>
		</article>
	</div>
	<script type="text/javascript">
		$(".flip").click(function() {
	<%--$(".panel").slideToggle("slow");--%>
		$(this).siblings().slideToggle("slow");
		});
	</script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>

</html>