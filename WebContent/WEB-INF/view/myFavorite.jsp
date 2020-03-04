<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>我的最愛/Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forTabs.css">
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
		
		.wrapper.style5 h3.nameLink {
			cursor: pointer;
			color: #A5DEE4;
			text-shadow: 1px 2px 0px #0F2540;
		}
		
		.wrapper.style5 h3.nameLink:hover {
			color: #DAC9A6;
			text-shadow: 1px 2px 0px #8E354A;
		}
		.pd0{
			text-align: left;
		}
	
		.noticeBox {
			position: fixed;
			top: 60px;
			right: 20px;
			align: right;
		}
		
		.B1 {
			display: flex;
			align-items: center;
			justify-content: left;
		}
		
		.B1.leftSide{
			width:400px;
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
		
		.sweet-alert button.confirm {
			background-color: #ed4933 !important;
		}
		
		.sweet-alert button.confirm:hover {
			background-color: #ef5e4a !important;
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

        #content {
		    margin-top: 0;
		}
		
		.wrapper {
		    padding: 2em 0 4em 0;
		}
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
			
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
						<div class="row">
							<div class="col-7 col-12-medium">
								<div id="tabs">
									<ul class="fav">
										<li><a class="tab" href="#tab1" name="#tab1">Bar</a></li>
										<li><a class="tab" href="#tab2" name="#tab2">Alcohol</a></li>
									</ul>
								</div>
								<div id="content">
									<div id="tab1" class="outwrapper">
										<ul class="alt">
											<li><h2>我的最愛酒吧清單</h2></li>
											<li class="inwrapper">
												<div style="height: 600px;overflow: auto;">
													<table class="pd0">${MyfavB}</table>
												</div>
											</li>
										</ul>
									</div>
									<div id="tab2" class="outwrapper">
										<ul class="alt">
											<li><h2>我的最愛酒類清單</h2></li>
											<li class="inwrapper">
												<div style="height: 600px;overflow: auto;">
													<table class="pd0">${Myfav}</table>
												</div>
											</li>
										</ul>
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
		$('.pdidckLL').hide();
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
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