<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<title>編輯最新消息 / Bartenders</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
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
						<div class="outwrap">
							<div class="inwrap">
								<h2>編輯最新消息</h2>
								<form action="/Bartenders/EN.edit" method="POST">
									<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<div>
												<label>標題</label>
												<input type="text" name="neTitle" placeholder="請填寫標題"  value="<c:out value="${neTitle}"></c:out>" required="required" id="neTitle"/>
											</div>

											<div>
												<label>詳細</label>
												<textarea cols="10" rows="8" name="neText" placeholder="請填寫消息詳細內容" required="required">${neText}</textarea>
											</div>

											<div id="neId">
												<input name="neId" type="text" value="<c:out value="${neId}"/>" readonly="readonly">
											</div>
										</div>
									</div>
									<br>
									<div class="col-12">
										<ul class="actions">
											<li>
												<a href="/Bartenders/NewsAndEvents.All">
													<div class="button">取消</div>
												</a>
											</li>
											<li><input class="button primary" type="submit" value="更新"></li>
											
											<!-- 推播功能 -->
											<li><input class="button primary" onclick="push();" value="推廣活動"></li>
										</ul>
									</div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	<script type="text/javascript">
		function push(){
			var title = document.getElementById('neTitle').value;
			websocket.send('${CName}'+'%'+title);
		}
	</script>

	<script>
		$('#neId').hide();
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