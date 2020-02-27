<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>註冊酒吧帳戶</title>
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
							<div class="col-7 col-12-medium">
							
							<h2>請填寫基本資料</h2>
							<div>
								<h5>${errorMsg}</h5>
							</div>
							<form action="<c:url value="/GCregister.do"/>" method="POST">
							<div class="row gtr-uniform">
								<div class="col-11 col-12-xsmall">
									<ul>
										<li><h3>店名:</h3></li>
										<li><input type="text" name="companyName" required="required" size="50"
												placeholder="請填寫正確的店名" pattern="^.{1,30}$"/><br></li>
										<li><h3>帳號:</h3></li>
										<li><input type="text" name="newAccount" placeholder="${gid}" size="50"
												disabled="disabled"/><br></li>
										<li><h3>密碼:</h3></li>
										<li><input type="password" name="newPassword" size="50"
												placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
												pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$"/><br></li>
										<li><h3>確認密碼:</h3></li>
										<li><input type="password" name="newPassword2" size="50" placeholder="請再輸入一次密碼"
												required="required"
												pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$"/><br>
										</li>
										<li><h3>手機:</h3></li>
										<li><input type="tel" name="phone" autocomplete="off" size="50"
												placeholder="請填寫正確的手機號碼" required="required" pattern="^.{10}$"/><br>
										</li>
										<li><h3>統一編號:</h3></li>
										<li><input type="text" name="taxId" autocomplete="off" size="50"
												placeholder="請填寫正確的統一編號" required="required"/><br></li>
										<li><h3>電子郵件:</h3></li>
										<li><input type="email" name="email" placeholder="${email}" size="50"
												disabled="disabled"/><br></li>
										<li><h3>店家地址:</h3></li>
										<li><input type="text" name="address" autocomplete="off" size="50"
												placeholder="請填寫正確的住址" pattern="^[0-9-\u4e00-\u9fa5].{10,}$"
												required="required"/><br></li>
										<li><h3>Line ChannelId:</h3></li>
										<li><input type="text" name="lineId" autocomplete="off" required="required"
												size="50" placeholder="請填寫正確的Line ChannelId"/><br></li>
										<li><h3>Line ChannelSecret:</h3></li>
										<li><input type="text" name="lineSecret" autocomplete="off" required="required"
												size="50" placeholder="請填寫正確的Line ChannelSecret"/></li>
									</ul>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input class="button" type="reset" value="清除重填"/></li>
										<li><input class="button primary" type="submit" value="確認送出"/></li>
									</ul>
								</div>
							</div>
							</form>
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