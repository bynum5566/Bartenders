<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<title>編輯酒吧 / Bartenders</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
	
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
		
		img.loading-image{
			align-self: center;
			margin-left: 50%;
			margin-top: 5%;
		}
		
		.dropzone {
			background-color: rgb(0, 0, 0, 0.5);
			border: 4px dashed #ccc;
			position: relative;
			margin-right: auto;
			margin-left: auto;
			height: 100px;
			width: 100px;
			padding: 10px;
			margin: 15px;
			display: inline-block;
		}
		
		.info {
			margin-top: 11%;
		}
		
		.dropzone p {
			margin: 0%;
			text-align: center;
			width: 100%
		}
		
		.input {
			height: 100%;
			left: 0;
			outline: 0;
			opacity: 0;
			position: absolute;
			top: 0;
			width: 100%
		}
		
		.image-url {
			width: 50%;
		}

		.loading-modal {
			background-color: rgba(255, 255, 255, .8);
			display: none;
			position: fixed;
			z-index: 1000;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%
		}
		
		.loading-table {
			margin-left: auto;
			margin-right: auto;
			margin-top: 15%;
			margin-bottom: 15%;
		}
		
		img.img {
			max-width: 200px;
			max-height: 300px;
		}
		
		#oriImg {
			max-width: 200px;
			max-height:300px;
		}
		
		img.loading-image{
			align-self: center;
			margin-left:50%;
			margin-top: 5%;
		}
		
		.status {
			border-radius: 5px;
			text-align: center;
			width: 50%;
			margin-left: auto;
			margin-right: auto;
		}
		
		.B1 {
			display:  flex;
			align-items: center;
			justify-content:  center;
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
						<div class="outwrap">
							<div class="inwrap">
								<h2>編輯酒吧</h2>
								<form action="/Bartenders/editBar" method="post" enctype="multipart/form-data">
									<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<ul id="hdId">
												<li colspan="2">
													<input class="bt0" name="pdId" type="text" value="<c:out value="${barId}"/>" readonly="readonly">
												</li>
											</ul>
											<ul>
												<li><label>Bar名稱</label></li>
												<li>
													<input type="text" name="barName" required="required" value="<c:out value="${barName}"/>">
												</li>
											</ul>
											<ul>
												<li><label>Bar Logo</label></li>
												<li>
													<ul class="actions">
														<li class="B1">
															<div class="dropzone">
																<div class="info"></div>
															</div>
														</li>
														<li>
															<div id="imgPlace1">
																<img id="oriImg" src="<c:out value="${barLogoUrl}"/>"/>
															</div>
														</li>
													</ul>
													<input id="imgPlace2" type="text" name="pdImg" class="image-url" value="<c:out value="${barLogoUrl}"/>"/>
													<script type="text/javascript" src="/Bartenders/JS/imgur.js"></script>
													<script type="text/javascript" src="/Bartenders/JS/upload.js"></script>
												</li>
											</ul>
											<ul>
												<li><label>封面圖片</label></li>
												<li>
													<div id="imgs">
														<div id="img1">
															<ul class="actions">
																<li class="B1">
																	<div class="dropzone1">
																		<div class="info1"></div>
																	</div>
																</li>
																<li>
																	<div id="imgPlace01">
																		<img id="oriImg" src="<c:out value="${barImgUrl1}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace02" type="text" name="cover1" class="image-url" value="<c:out value="${barImgUrl1}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur1.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/upload1.js"></script>
														</div>
														<div id="img2">
															<ul class="actions">
																<li class="B1">
																	<div class="dropzone2">
																		<div class="info2"></div>
																	</div>
																</li>
																<li>
																	<div id="imgPlace03">
																		<img id="oriImg" src="<c:out value="${barImgUrl2}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace04" type="text" name="cover2" class="image-url" value="<c:out value="${barImgUrl2}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/upload2.js"></script>
														</div>
														<div id="img3">
															<ul class="actions">
																<li class="B1">
																	<div class="dropzone3">
																		<div class="info3"></div>
																	</div>
																</li>
																<li>
																	<div id="imgPlace05">
																		<img id="oriImg" src="<c:out value="${barImgUrl3}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace06" type="text" name="cover3" class="image-url" value="<c:out value="${barImgUrl3}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/upload3.js"></script>
														</div>
														<div id="img4">
															<ul class="actions">
																<li class="B1">
																	<div class="dropzone4">
																		<div class="info4"></div>
																	</div>
																</li>
																<li>
																	<div id="imgPlace07">
																		<img id="oriImg" src="<c:out value="${barImgUrl4}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace08" type="text" name="cover4" class="image-url" value="<c:out value="${barImgUrl4}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur4.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/upload4.js"></script>
														</div>
														<div id="img5">
															<ul class="actions">
																<li class="B1">
																	<div class="dropzone5">
																		<div class="info5"></div>
																	</div>
																</li>
																<li>
																	<div id="imgPlace09">
																		<img id="oriImg" src="<c:out value="${barImgUrl5}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace10" type="text" name="cover5" class="image-url" value="<c:out value="${barImgUrl5}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur5.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/upload5.js"></script>
														</div>
													</div>
												</li>
											</ul>
											<ul>
												<li><label>關於</label></li>
												<li><textarea id="aboutBar" name="aboutBar" placeholder="關於酒吧">${aboutBar}</textarea></li>
											</ul>
											<ul>
												<li><label>Menu</label></li>
												<li><textarea id="barMenu" name="barMenu" placeholder="請填寫酒吧菜單">${barMenu}</textarea></li>
											</ul>
											<ul>
												<li><label>地址</label></li>
												<li>
													<input type="text" name="barAddress"  placeholder="請填寫酒吧地址" required="required" value="<c:out value="${barAdd}"/>">
												</li>
											</ul>
											<ul>
												<li><label>電話</label></li>
												<li>
													<input type="tel" name="barPhone"  placeholder="請填寫酒吧電話" required="required" value="<c:out value="${barPhone}"/>">
												</li>
											</ul>
											<ul>
												<li><label>Facebook粉專帳號</label></li>
												<li><input type="text" id="barFb" name="barFb" placeholder="請填寫Facebook帳號"  value="<c:out value="${barFb}"/>"></li>
											</ul>
											<ul>
												<li><label>Line帳號</label></li>
												<li><input type="text" id="barLine" name="barLine" placeholder="請填寫Line帳號"  value="<c:out value="${barLine}"/>">
												</li>
											</ul>
											<ul>
												<li><label>Instgram帳號</label></li>
												<li><input type="text" id="barIG" name="barIG" placeholder="請填寫Instgram帳號"  value="<c:out value="${barIg}"/>"></li>
											</ul>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li id="bT">
													<a href="/Bartenders/My.Bar">
														<div class="button">回上頁</div>
													</a>
												</li>
												<li>
													<input class="button primary" type="submit" value="確認修改"/>
												</li>
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

	<script>
		$("#hdId").hide();
		
		$('#Input').click(function() {
			$('#aboutBar').val('這裡是一個令人放鬆自在的空間，\n每天都有爵士樂手現場演奏，\n暫時放下平日的煩惱以及城市的喧囂，\n沉浸在爵士樂以及我們精心調製出的美味調酒中吧!');
			$('#barMenu').val('完美馬丁尼......$300\n瑪格麗塔......$300\n藍色夏威夷......$350\n環遊世界......$350\n亞歷山大......$320\n白色佳人......$320\n藍色珊瑚礁......$350\n墨西哥灣流......$320');
			$('#barFb').val('little_JazzBar_2009');
			$('#barLine').val('little_JazzBar_2009');
			$('#barIG').val('little_JazzBar_2009');
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
	
	</body>

</html>