<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, user-scalable=no"/>
	<!-- <link rel="stylesheet" type="text/css" href="/Bartenders/CSS/productView.css"> -->
	<title>商品詳情 ${productName}／Bartenders</title>
	<%--豪--%>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<!-- 小鈴鐺 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
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
		
.noticeBox {
	position: fixed;
	top: 60px;
	right: 20px;
	align: right;
}

.bell .bellImg {
	height: 70px;
	width: 70px;
	float: right;
}

.notice {
	background-color: rgb(255, 255, 255, 0.4);
	width: 110%;
	height: auto;
	float: right;
	display: none;
}
		
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a>
			</h1>
			
<!-- 小鈴鐺 -->
			<div class="noticeBox">
				<div class="bell">
					<img class="bellImg" src="/Bartenders/images/bell.png">
				</div>
				<div class="notice">
					<ul id="notice"></ul>
				</div>
			</div>
			
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
								<li class="small"><a href="/Bartenders/Welcome.UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<div class="box alt">
							<div class="row gtr-50 gtr-uniform">
								<ul>
									<li><h2>商品詳情</h2></li>
									<li><h3>${productName}</h3></li>
								</ul>
								<ul>
									<li class="inwrap">
										<div class="col-4">
											<span class="image fit">
												<div>
													<img id="pdPicture" src="<c:out value="${pic}"/>">
												</div>
											</span>
										</div>
										<div class="row gtr-uniform">
											<div class="col-6 col-12-xsmall">
												<form action="/Bartenders/AddProductToCart.controller"
													method="GET">
													<div id="hideId" class="pdDataMain">
														<input type="text" name="PdId" value="<c:out value=" ${productId}"/>" readonly="readonly">
														<input type="number" name="PdStock" value="<c:out value="${pdStk}"/>" readonly="readonly">
														<input type="text" name="ProductName" value="<c:out value="${productName}"/>" readonly="readonly">
													</div>
													<div>
														<h2>${errorMsgOfAddToCartButton}</h2>
													</div>
													<ul class="alt">
														<li>價格:${pdPri}</li>
														<li>庫存量: <span id="stk">${pdStk}</span></li>
														<li id="sold" class="pdDataMain"><div>缺貨中</div></li>
													</ul>
													<div id="myFv" class="bt01">${bT}</div>
												</form>
												<div id="pdLk">
													<!-- 								<form action="/Bartenders/addMyFav" method="post"> -->
													<!-- 									<input id ="pdidckL" type="text" name="pdidck" class="pdidckLL" -->
													<%-- 										value="<c:out value="${productId}"/>" readonly="readonly"> --%>

													<!--<a href="/Bartenders/addMyFav?pdidck=<c:out value="${productId}"/>">-->
													<!--<input class="bT" type="submit" value="加入我的最愛+">-->
													<!--</a>-->
													<!-- </form> -->
												</div>
											</div>
										</div>
									</li>
								</ul>
								<ul>
									<li><div class="dtails"><p>${productX.pdDetail}</p></div></li>
									<li><h2><a class="button" href="<c:url value="/DisplayProductList.controller"/>?barAccount=${barAccount}">回到酒吧</a></h2></li>
								</ul>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script type="text/javascript">
		$('#sold').hide();
		$('#hideId').hide();
		$('#pdidckL').hide();
		var stock = document.getElementById("stk").value;
		if (stock <= 0) {
			$('#sold').show();
			$('#quant').hide();
		} else {
			$('#quant').show();
			$('#sold').hide();
		}
	</script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>

</body>

</html>