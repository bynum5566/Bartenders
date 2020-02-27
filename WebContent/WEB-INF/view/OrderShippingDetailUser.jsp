<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>我的訂單 / Bartenders</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

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
		<header id="header">
			<h1>
				<a href="index.jsp">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li class="small"><a href="UserFirstPage">返回首頁</a><a href="javascript:signOut()">登出</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h2>我的訂單</h2>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								<ul class="alt">
									<li>訂單編號:&nbsp;${orderId.substring(3,6)}${orderId.substring(12,19)}</li>
									<li>收件人:&nbsp;${order.recipient}</li>
									<li>配送方式:&nbsp;${ShippingNumToStr[order.shipping]}</li>
									<li>配送地址:&nbsp;${attrAddress}</li>
									<li>配送電話:&nbsp;${order.phone}</li>
									<li>物流編號:&nbsp;${order.shippingNumber}</li>
								</ul>
								<ul class="actions">
									<li><a class="button primary" href="<c:url value="/userOrder.controller"/>">返回訂單頁面</a>
									</li>
								</ul>
							</div>
						</div>
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>

</html>