<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>訂單管理 / Bartenders</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
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
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header" class="alt_ver">
			<h1>
				<a href="index.jsp">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu" class="alt_ver">
							<ul>
								<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>

		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<!-- <section class="wrapper style5"> -->
						<!-- <section> -->
						<!-- <div class="mydiv"> -->
						<h2>訂單管理</h2>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								<!-- <div class="content"> -->
								<ul class="alt">
									<li style="font-size: 20px;">訂單編號:&nbsp;${orderId.substring(3,6)}${orderId.substring(12,19)}</li>
									<li style="font-size: 20px;">收件人:&nbsp;${order.recipient}</li>
									<li style="font-size: 20px;">配送方式:&nbsp;${ShippingNumToStr[order.shipping]}</li>
									<li style="font-size: 20px;">配送地址:&nbsp;${attrAddress}</li>
									<li style="font-size: 20px;">配送電話:&nbsp;${order.phone}</li>
									<li style="font-size: 20px;">物流編號:&nbsp;${order.shippingNumber}</li>
								</ul>
								<ul class="actions">
									<li><a class="button primary" href="<c:url value="/companyOrder.controller"/>">返回訂單頁面</a>
									</li>
								</ul>
								<!-- </div> -->
								<!-- <div class="btn btn-three"> -->
								<!-- </div> -->
							</div>
						</div>
						<!-- </div> -->
						<!-- </section> -->
						<!-- </section> -->
					</section>
				</div>
			</section>
		</article>
	</div>


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