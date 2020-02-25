<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<<<<<<< HEAD

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>ChangeOrder</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
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
=======
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<title>我的訂單</title>
<style type="text/css">
.mydiv {
min-width: auto;
max-width: 700px;
margin:100px auto;
top: 80px;
position: sticky;
text-align: center;
border-radius: 5px;
color: #E8CCFF;
font-size: 18px;
background-image: url(/Bartenders/images/bg21.png);
}

body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/bg11.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: 'Noto Sans TC', sans-serif;
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
padding-top: 5px;
padding-right: 5px;
}
</style>
>>>>>>> 6b5a729a22323b3e68bd33ec51b58e4345211ee1
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
						</div></li>
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
										<li>訂單編號:</li>
										<li><input type="text" size="40" name="orderId" value="${orderId}" readonly="readonly"/><br></li>
										<li>商品名稱:</li>
										<li><input type="text" size="40" name="name" value="${productData[0].productName}等" readonly="readonly"/><br>
										</li>
										<li>訂單總價:</li>
										<li><input type="text" size="40" name="price" value="${order.amount}" readonly="readonly"/><br></li>
										<li>收件人:</li>
										<li><input type="text" size="40" name="recipient" value="${order.recipient}"/><br></li>
										<li>原選擇之配送方式:</li>
										<li><input type="text" size="40" name="price" value="${ShippingNumToStr[order.shipping]}" readonly="readonly"/><br></li>
										<li>配送方式:</li>
										<li><select name="shippingType">
												<option value="HomeDelivery" width="10">1.宅配</option>
												<option value="ConvenienceStore" width="10">2.超商取貨</option>
										</select><br></li>
										<li>配送地址:</li>
										<li><input type="text" name="address" size="40" value="${attrAddress}"/><br></li>
										<li>收件人電話:</li>
										<li><input type="text" size="40" name="phone" value="${order.phone}"/><br></li>
									</ul>
								</div>
							</div>
							<div class="col-6 col-12-medium">
								<ul class="actions">
									<li><input class="button" type="reset" value="清除重填"/></li>
									<li><input class="button primary" type="submit" value="確認送出"/></li>
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