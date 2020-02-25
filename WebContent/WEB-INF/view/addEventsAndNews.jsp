<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta  http-equiv="Expires"  CONTENT="0">   
	<meta  http-equiv="Cache-Control"  CONTENT="no-cache">   
	<meta  http-equiv="Pragma"  CONTENT="no-cache">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<!-- <link rel="stylesheet" type="text/css" href="Bartenders/CSS/add_editView.css"> -->
	<title>Add News and Event</title>
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
		
		#Input{
			width: 40px;
			height: 40px;
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
								<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
								<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
								<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息與活動+</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息與活動管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
								<li><a href="/Bartenders/ManageBar">管理活動</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<img src="/Bartenders/images/contract.png" align="right" id="Input">
						<div class="inwrap">
							<h2>新增最新消息</h2>
							<form action="<c:url value="/addNew.EN"></c:url>" method="POST">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<ul>
											<li>
												<h3>標題</h3>
											</li>
											<li><input id="newsTitle" type="text" name="neTitle"
												required="required"></li>
										</ul>
										<ul>
											<li>
												<h3>詳細</h3>
											</li>
											<li><textarea cols="10" rows="8" id="newsDetail" name="neText" required="required"></textarea></li>
										</ul>
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><a style="text-decoration: none;" class="button" href="/Bartenders/NewsAndEvents.All">取消</a></li>
											<li><input class="button primary" type="submit" value="發表"></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script type="text/javascript">
		$('#Input')
				.click(
						function() {
							$('#newsTitle').val('新分店台北信義店新開幕!');
							$('#newsDetail')
									.val(
											'慶祝信義分店新開幕，<br>即日起全店品項5折優惠!<br>活動期限至2020/3/30止。<br>(本活動僅限信義分店有效，其他分店無此優惠。)');
						})

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