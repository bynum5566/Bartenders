<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>我的訂單 / Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>
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
		
		.wrapper {
			padding: 3em 0 2em 0;
		}
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="UserFirstPage">Bartenders</a>
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
								<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
								<li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<h2>請填寫要修改的訂單資料</h2>
						<form action="<c:url value="/doChangeOrderUser.controller"/>" method="POST">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<ul>
										<li><h3>原訂單資訊:</h3></li>
										<li>訂單編號:${orderId.substring(3,6)}${orderId.substring(12,19)}</li>
										<li><input type="hidden" size="40" name="orderId" value="${orderId}" readonly="readonly" /><br></li>
										<li>商品名稱:${productData[0].productName}…</li>
<%-- 										<li><input type="text" size="40" name="name" value="${productData[0].productName}等" readonly="readonly" /><br></li> --%>
										<li>訂單總價:$${order.amount}</li>
<%-- 										<li><input type="text" size="40" name="price" value="${order.amount}" readonly="readonly" /><br></li> --%>
										<li>原選擇之配送方式:${ShippingNumToStr[order.shipping]}</li>
<%-- 										<li><input type="text" size="40" name="price" value="${ShippingNumToStr[order.shipping]}"readonly="readonly" /><br></li> --%>
										<li><br><h3>修改訂單資訊:</h3></li>
										<li>收件人:</li>
										<li><input type="text" size="40" name="recipient" value="${order.recipient}" /><br></li>
										<li>配送方式:</li>
										<li>
											<select name="shippingType">
												<option value="HomeDelivery" width="10">1.宅配</option>
												<option value="ConvenienceStore" width="10">2.超商取貨</option>
											</select>
											<br>
										</li>
										<li>配送地址:</li>
										<li><input type="text" name="address" size="40" value="${attrAddress}" /><br></li>
										<li>收件人電話:</li>
										<li><input type="text" size="40" name="phone" value="${order.phone}" /><br></li>
									</ul>
								</div>
							</div>
							<div class="col-6 col-12-medium">
								<ul class="actions">
									<li><input class="button" type="reset" value="清除重填" /></li>
									<li><input class="button primary" type="submit" value="確認送出" /></li>
								</ul>
							</div>
						</form>
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