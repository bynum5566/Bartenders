<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<meta  http-equiv="Expires"  CONTENT="0">   
	<meta  http-equiv="Cache-Control"  CONTENT="no-cache">   
	<meta  http-equiv="Pragma"  CONTENT="no-cache">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forSlideShow.css">
	<title>${productName} / Bartenders</title>
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
			<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
			
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
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
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
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
								<li><a href="/Bartenders/ManageBar">管理活動</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a
									href="javascript:signOut()">登出</a></li>
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
								<li><h2>商品預覽</h2></li>
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
								<div class="col-6 col-12-medium">
									<div id="hideId" class="pdDataMain">
										<div>商品編號:</div>
										<input type="text" value="<c:out value="${productId}"/>" readonly="readonly">
									</div>
									<ul class="alt">
										<li>
											<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag1}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag1}</a>
											<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag2}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag2}</a>
											<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag3}"/>" style="text-decoration: none; text-decoration-color: transparent;">${Tag3}</a>
										</li>
										<li>價格: <span>${pdPri}</span></li>
										<li>庫存量: <span id="stk">${pdStk}</span></li>
										<li>有效期間: <span>${pdValD}</span></li>
										<li>購買數量: <input type="number" value="1" min="1" max="<c:out value="${pdStk}"/>"></li>
										<li id="sold" class="pdDataMain">
											<h4>缺貨中</h4>
										</li>
									</ul>
									<ul class="actions">
										<li><button class="button primary">加入購物車+</button></li>
										<li><button class="button primary">加入我的最愛+</button></li>
									</ul>
								</div>
							</div>
						<div class="row gtr-uniform">
							<ul>
								<li>
									<div>
										<p>${pdDetail}</p><br>
									</div>
								</li>
								<li>
									<button onclick="location.href = '/Bartenders/Dashboard.TkProducts';" class="button">回票券商品管理</button>
								</li>
							</ul>
						</div>
						</section>
					</div>
				</div>
			</section>
		</article>
	</div>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
		$('#sold').hide();
		$('#hideId').hide();
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