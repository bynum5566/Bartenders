<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<title>新增最新消息 / Bartenders</title>
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
		
		#Input{
			width: 40px;
			height: 40px;
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
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
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
											<li><input id="newsTitle" type="text" name="neTitle" placeholder="請填寫標題"  required="required"></li>
										</ul>
										<ul>
											<li>
												<h3>詳細</h3>
											</li>
											<li><textarea cols="10" rows="8" id="newsDetail" name="neText" placeholder="請填寫消息詳細內容" required="required"></textarea></li>
										</ul>
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><a style="text-decoration: none;" class="button" href="/Bartenders/NewsAndEvents.All">取消</a></li>
											<li><input class="button primary" type="submit" value="發佈"></li>
											
											<li>
											<img src="/Bartenders/images/promote.png" onclick="push();" style="width: 40px;height:40px;cursor:pointer;">
											</li>
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
		$('#Input').click(function() {
			$('#newsTitle').val('新分店台北信義店新開幕!');
			$('#newsDetail').val('慶祝信義分店新開幕，\n即日起全店品項5折優惠!\n活動期限至2020/3/30止。\n(本活動僅限信義分店有效，其他分店無此優惠。)');
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

<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	
	<script type="text/javascript">
		function push(){
			var title = document.getElementById('newsTitle').value;
			websocket.send('${Caccount}'+'%'+'${CName}'+'*'+title);
		}
	</script>

</body>

</html>