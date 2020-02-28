<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forSlideShow.css">
	<title>${productName} / Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
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
					<div class="box alt">
						<div class="row gtr-50 gtr-uniform">
							<ul>
								<li><h3>${productName}</h3></li>
							</ul>
						</div>
						<section>
							<div class="row">
								<div class="col-6 col-12-medium">
									<div class="col-4">
										<span class="image fit">
											<ul class="slides">
												<input type="radio" name="radio-btn" id="img-1" checked />
												<li class="slide-container">
													<div class="slide">
														<img src="<c:out value="${pic1}"/>"/>
													</div>
													<div class="nav">
														<label for="img-3" class="prev">&#x2039;</label>
														<label for="img-2" class="next">&#x203a;</label>
													</div>
												</li>
												<input type="radio" name="radio-btn" id="img-2"/>
												<li class="slide-container">
													<div class="slide">
														<img src="<c:out value="${pic2}"/>"/>
													</div>
													<div class="nav">
														<label for="img-1" class="prev">&#x2039;</label>
														<label for="img-3" class="next">&#x203a;</label>
													</div>
												</li>
												<input type="radio" name="radio-btn" id="img-3"/>
												<li class="slide-container">
													<div class="slide">
														<img src="<c:out value="${pic3}"/>"/>
													</div>
													<div class="nav">
														<label for="img-2" class="prev">&#x2039;</label>
														<label for="img-1" class="next">&#x203a;</label>
													</div>
												</li>
												<li class="nav-dots">
													<label for="img-1" class="nav-dot" id="img-dot-1"></label>
													<label for="img-2" class="nav-dot" id="img-dot-2"></label>
													<label for="img-3" class="nav-dot" id="img-dot-3"></label>
												</li>
											</ul>
										</span>
									</div>
								</div>
								<div class="col-6 col-12-xsmall">
									<form action="/Bartenders/AddProductToCart.controller" method="GET">
										<div id="hideId" class="pdDataMain">
											<input type="text" name="barAccount" value="<c:out value="${barAccount}"/>" readonly="readonly">
											<input type="text" name="PdId" value="<c:out value="${productId}"/>" readonly="readonly">
											<input type="number" name="PdStock" value="<c:out value="${pdStk}"/>" readonly="readonly">
											<input type="text" name="ProductName" value="<c:out value="${productName}"/>" readonly="readonly">
										</div>
										<div>
											<h2>${errorMsgOfAddToCartButton}</h2>
										</div>
										<ul class="alt">
											<li>
												<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag1}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag1}</a>
												<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag2}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag2}</a>
												<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag3}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag3}</a>
											</li>
											<li class="pdDataMain">
												<div>價格:${pdPri}</div>
											</li>
											<li>庫存量: <span id="stk">${pdStk}</span></li>
											<li id="vdTime" class="pdDataMain">${pdValD}</li>
											<li>購買數量: <input type="number" name="qty" value="1" min="1" max="<c:out value="${pdStk}"/>"></li>
											<li id="sold" class="pdDataMain">
												<div>缺貨中</div>
											</li>
										</ul>
										<ul class="actions">
											<li><div id="myFv" class="bt01">${bT}</div></li>
											<li>
												<div id="pdLk">
													<a class="button primary" href="/Bartenders/addMyFav?pdidck=<c:out value="${productId}"/>">加入我的最愛+</a>
												</div>
											</li>
										</ul>
									</form>
								</div>
							</div>
							<div class="row gtr-uniform">
								<ul>
									<li>
										<div class="dtails">
											<p>${pdDetail}</p>
										</div>
									</li>
									<li>
										<button onclick="location.href = '/Bartenders/Dashboard.MyFavorite';" class="button">回我的最愛</button>
									</li>
								</ul>
							</div>
						</section>
					</div>
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
</body>

</html>