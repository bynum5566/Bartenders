<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<title>最新消息 / Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<!-- 小鈴鐺 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
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
		
		.B1 {
			display: flex;
			align-items: center;
			justify-content: left;
		}
		
		.MidS1{
			justify-content: right;
			text-align: left;
			width: 380px;
			margin-left:5%;	
		}
		
		td.RSide{
			margin-right:5%;
		}
		
		.sweet-alert button.confirm, .sweet-alert button.cancel {
		    border: 0;
		    border-radius: 3px;
		    -webkit-box-shadow: none;
		    box-shadow: none;
		    color: #fff;
		    cursor: pointer;
		    font-size: 17px;
		    font-weight: 500;
		    margin: 15px 5px 0;
		    padding: 0 40px;
		}
		
		button.confirm {
			background-color: #ed4933 !important;
		}
		
		button.confirm:hover {
			background-color: #ef5e4a !important;
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
		
		.wrapper {
		    padding: 2em 0 4em 0;
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
						<div class="row">
							<div class="col-8 col-12-medium">
								<ul class="actions">
									<li>
										<a href="/Bartenders/NewsAndEvents.Add">
											<div class="btn btn-one">
												<input class="button" type="button" value="新增+"/>
											</div>
										</a>
									</li>
								</ul>
								<ul class="alt">
									<li>
										<h2>最新消息</h2>
									</li>
									<li>
										<div class="inwrapper" style="height: 600px;overflow: auto;">
											<table class="pd0">${NewsEvents}</table>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script>
		$('.pdidckLL').hide();
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
		
		$('a.bT4').click(function(e){
            e.preventDefault();
            var link = $(this).attr('href');

            swal({
                title: "刪除",
                text: "確定要刪除選擇的項目嗎?",
                type: "warning",
                confirmButtonText: "確定",
				cancelButtonText: "取消",
                showCancelButton: true
            },
            function(isConfirm) {
				if (isConfirm) {
                	window.location.href = link;
				}
            });
        });
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	
	
	</body>

</html>