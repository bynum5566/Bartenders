<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<title>票券管理/Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forTabs.css">
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
	
	.wrapper.style5 h4.bT3 {
		cursor: pointer;
		color: #A5DEE4;
		text-shadow: 1px 2px 0px #0F2540;
	}
	
	.wrapper.style5 h4.bT3:hover {
		color: #DAC9A6;
		text-shadow: 1px 2px 0px #8E354A; 
	}
	
	.Tl{
		text-align: left;
	}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1><a href="WelcomeCompany">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
							<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
								<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
								<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息+</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
								<li><a href="/Bartenders/ManageBar">管理活動</a></li>
								<li class="small"><a href="WelcomeCompany">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<div class="row">
							<div class="col-10 col-12-medium">
								<ul class="actions">
									<li class="flos1">
										<a class="f1" href="/Bartenders/TicketProduct.Add">
											<div class="btn btn-one">
												<input class="button" type="button" value="新增票券+">
											</div>
										</a>
									</li>
									<li class="flos2">
										<a class="f1" href="/Bartenders/Dashboard.Products">
											<div class="btn btn-one">
												<input class="button" type="button" value="商品管理"/>
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col-10 col-12-medium">
								<div id="tabs">
									<ul class="fav">
										<li><a href="#tab1" name="#tab1">上架中</a></li>
										<li><a href="#tab2" name="#tab2">下架中</a></li>
									</ul>
									<div id="content">
										<div id="tab1" class="outwrapper">
											<ul class="alt">
<!-- 												<li class="Tl"> -->
<!-- 												</li> -->
												<li>
													<div class="Tl"><h2>上架中票券</h2></div>
													<table class="pd0">${Launched}</table>
												</li>
											</ul>
										</div>
										<div id="tab2" class="outwrapper">
											<ul class="alt">
<!-- 												<li class="Tl"> -->
<!-- 												</li> -->
												<li>
													<div class="Tl"><h2>下架中票券</h2></div>
													<table class="pd0">${Pulled}</table>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script>
		$('.pdidckPP').hide();
		$('.pdidckLL').hide();
		$(function() {
			if (window.history && window.history.pushState) {
				$(window).on('popstate', function() {
					window.history.pushState('forward', null, '#');
					window.history.forward(1);
				});
			}
			window.history.pushState('forward', null, '#');
			window.history.forward(1);
		})
	</script>
	<script src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/Bartenders/JS/forTabs.js"></script>
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