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
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
	<title>新增票券 / Bartenders</title>
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
			display:  flex;
			align-items: center;
			justify-content:  center;
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
			<h1><a href="WelcomeCompany">Bartenders</a></h1>
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
						<img src="/Bartenders/images/contract.png" align="right" id="Input">
						<div class="inwrap">
							<h2>新增票券</h2>
							<form action="<c:url value="/addTkPD"/>" method="POST" enctype="multipart/form-data">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<ul>
											<li>
												<h3>商品名稱</h3>
											</li>
											<li>
												<input id="pdName" placeholder="請填寫商品名稱" class="bt0" name="pdNm" type="text" required="required">
											</li>
										</ul>
										<ul>
											<li>
												<h3>商品數量</h3>
											</li>
											<li>
												<input id="pdStock" class="bt0" name="pdStk" placeholder="請填寫商品數量"  id="pdamount" type="number" min="1" required="required">
											</li>
										</ul>
										<ul>
											<li>
												<h3>商品價格</h3>
											</li>
											<li>
												<input id="pdPrice" class="bt0" name="pdPri" placeholder="請填寫商品價格" id="pdprice" type="number" min="1" required="required">
											</li>
										</ul>
										<ul>
											<li>
												<h3>Tag1</h3>
											</li>
											<li>
												<input id="pdTag1" class="bt0" name="pdTg1" placeholder="請填寫標籤名稱" type="text" max="10">
											</li>
										</ul>
										<ul>
											<li>
												<h3>Tag2</h3>
											</li>
											<li>
												<input id="pdTag2" class="bt0" name="pdTg2" placeholder="請填寫標籤名稱" type="text" max="10">
											</li>
										</ul>
										<ul>
											<li>
												<h3>Tag3</h3>
											</li>
											<li>
												<input id="pdTag3" class="bt0" name="pdTg3" placeholder="請填寫標籤名稱" type="text" max="10">
											</li>
										</ul>
										<ul>
											<li>
												<h3>商品詳細</h3>
											</li>
											<li><textarea id="pdDetail" class="bt0" name="pdDta" placeholder="請填寫商品詳細介紹"  cols="10" rows="8"></textarea></li>
										</ul>
										<ul>
											<li>
												<h3>商品圖片</h3>
											</li>
											<li>
												<div id="imgs">
													<div id="img1">
														<ul>
															<li class="B1">
																<div class="dropzone1">
																	<div class="info1"></div>
																</div>
															</li>
														</ul>
														<input id="imgPlace001" name="pdImg" class="image-url"/>
														<script type="text/javascript" src="/Bartenders/JS/imgur1-1.js"></script>
														<script type="text/javascript" src="/Bartenders/JS/uploadPd1.js"></script>
													</div>
													<div id="img2">
														<ul>
															<li class="B1">
																<div class="dropzone2">
																	<div class="info2"></div>
																</div>
															</li>
														</ul>
														<input id="imgPlace002" name="pdImg2" class="image-url"/>
														<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
														<script type="text/javascript" src="/Bartenders/JS/uploadPd2.js"></script>
													</div>
													<div id="img3">
														<ul>
															<li class="B1">
																<div class="dropzone3">
																	<div class="info3"></div>
																</div>
															</li>
														</ul>
														<input id="imgPlace003" name="pdImg3" class="image-url"/>
														<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
														<script type="text/javascript" src="/Bartenders/JS/uploadPd3.js"></script>
													</div>
												</div>
											</li>
										</ul>
										<div class="col-6 col-12-xsmall">
											<ul>
												<li class="setT2">
													<h3>票券有效期間</h3>
												</li>
												<li>
													<input name="setTKTime" id="setB1" class="dateRange2 form-control" type="text" required="required"/>
												</li>
											</ul>
										</div>
										<div class="col-4 col-12-small">
											<input class="bt0" id="setTt1" name="tm" type="radio"
												value="1" checked required onfocus="showT1()"> <label
												for="setTt1">設定自動上架時間</label>
										</div>
										<div class="col-4 col-12-small">
											<input class="bt0" id="setTt2" name="tm" type="radio" value="2" onfocus="showT2()">
											<label for="setTt2">設定自動上/下架時間</label>
										</div>
										<div class="col-6 col-12-xsmall">
											<ul id="setA" class="sho">
												<li class="setT1">
													<h3>上架時間</h3>
												</li>
												<li>
													<input name="setTimeAct" id="setA1" class="dateRange form-control" type="text"/>
												</li>
											</ul>
										</div>
										<div class="col-6 col-12-xsmall">
											<ul id="setB" class="nosho">
												<li class="setT2">
													<h3>上/下架時間</h3>
												</li>
												<li>
													<input name="setTimeNon" id="setB1" class="dateRange2 form-control" type="text"/>
												</li>
											</ul>
										</div>
									</div>
									<div class="col-12">
										<ul class="actions">
											<li>
												<a style="text-decoration: none;" href="/Bartenders/Dashboard.TkProducts" class="button">回上頁</a>
											</li>
											<li>
												<a style="text-decoration: none;" href="/Bartenders/TicketProduct.Add" class="button">重填</a>
											</li>
											<li>
												<input class="button primary" type="submit" value="新增票券"/>
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

	<script>
		$('#Input').click(function() {
			$('#pdName').val('周三藍色之夜入場券');
			$('#pdStock').val('50');
			$('#pdPrice').val('1000');
			$('#pdTag1').val('藍色');
			$('#pdTag2').val('Blue');
			$('#pdTag3').val('限量');
			$('#pdDetail').val('辛苦工作之後就該好好放鬆一下犒賞自己!<br>週三穿著藍色服裝或飾品並憑本券入場，即可無限暢飲。<br>數量有限，要買要快!<br><br>開始入場時間: 每周三晚上8:00。');
		})

		$('.sho').show();
		$('.nosho').hide();

		function showT1() {
			var T1 = document.getElementById("setA");
			var T2 = document.getElementById("setB");
			T1.className = "sho";
			T1.name = "setTimeAct";
			T2.className = "nosho";
			T2.name = "setTimeNon";
			$('.sho').show();
			$('.nosho').hide();
		}

		function showT2() {
			var T1 = document.getElementById("setA");
			var T2 = document.getElementById("setB");
			T2.className = "sho";
			T2.name = "setTimeAct";
			T1.className = "nosho";
			T1.name = "setTimeNon";
			$('.sho').show();
			$('.nosho').hide();
		}

		var d = new Date();

		var month = d.getMonth() + 1;
		var day = d.getDate();

		var output = d.getFullYear() + '/' + (month < 10 ? '0' : '') + month
				+ '/' + (day < 10 ? '0' : '') + day + " " + d.getHours() + ":"
				+ d.getMinutes() + ":" + d.getSeconds();

		$("input.dateRange").daterangepicker(
				{
					"alwaysShowCalendars" : true,
					opens : "left",
					timePicker : true,
					timePickerIncrement : 1,
					singleDatePicker : true,
					showDropdowns : true,
					minDate : output,
					startDate : output,
					locale : {
						format : "YYYY/MM/DD HH:mm:ss",
						separator : " ~ ",
						applyLabel : "確定",
						cancelLabel : "清除",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1
					}
				});

		$("input.dateRange").on("cancel.daterangepicker", function(ev, picker) {
			$(this).val("");
		});

		$("input.dateRange2").daterangepicker(
				{
					"alwaysShowCalendars" : true,
					opens : "left",
					timePicker : true,
					timePickerIncrement : 1,
					showDropdowns : true,
					minDate : output,
					startDate : output,
					locale : {
						format : "YYYY/MM/DD HH:mm:ss",
						separator : " ~ ",
						applyLabel : "確定",
						cancelLabel : "清除",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1
					}
				});

		$("input.dateRange2").on("cancel.daterangepicker",
				function(ev, picker) {
					$(this).val("");
				});

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
</html>