<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<title>編輯商品 / Bartenders</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"/>
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
		
		#oriImg {
			max-width: 200px;
			max-height:300px;
		}
		
		img.loading-image{
			align-self: center;
			margin-left:50%;
			margin-top: 5%;
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
						<div class="outwrap">
							<div class="inwrap">
								<h2>修改商品</h2>
								<form action="<c:url value="/editPD"></c:url>" method="POST" enctype="multipart/form-data">
									<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<ul id="hdId">
												<li colspan="2">
													<input class="bt0" name="pdId" type="text" required="required" value="<c:out value="${pdId}"/>" readonly="readonly">
												</li>
											</ul>
											<ul>
												<li>
													<h3>商品名稱</h3>
												</li>
												<li><input class="bt0" name="pdNm" placeholder="請填寫商品名稱" type="text" required="required" value="<c:out value="${pdNm}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>商品數量</h3>
												</li>
												<li><input class="bt0" name="pdStk" placeholder="請填寫商品數量"  id="pdamount" type="number" min="1" required="required" value="<c:out value="${pdStk}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>商品價格</h3>
												</li>
												<li><input class="bt0" name="pdPri" placeholder="請填寫商品價格" id="pdprice" type="number" min="1" required="required" value="<c:out value="${pdPri}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>Tag1</h3>
												</li>
												<li><input class="bt0" name="pdTg1" placeholder="請填寫標籤名稱" type="text" max="10" value="<c:out value="${pdT1}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>Tag2</h3>
												</li>
												<li><input class="bt0" name="pdTg2" placeholder="請填寫標籤名稱" type="text" max="10" value="<c:out value="${pdT2}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>Tag3</h3>
												</li>
												<li><input class="bt0" name="pdTg3" placeholder="請填寫標籤名稱" type="text" max="10" value="<c:out value="${pdT3}"/>"></li>
											</ul>
											<ul>
												<li>
													<h3>商品詳細</h3>
												</li>
												<li><textarea class="bt0" name="pdDta" placeholder="請填寫商品詳細介紹" cols="10" rows="8"><c:out value="${pdDT}"/></textarea>
												</li>
											</ul>
											<ul>
												<li>
													<h3>商品圖片</h3>
												</li>
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
																		<img id="oriImg" src="<c:out value="${pic1}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace02" type="text" name="pdImg" class="image-url" value="<c:out value="${pic1}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur1.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/uploadPd1-1.js"></script>
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
																		<img id="oriImg" src="<c:out value="${pic2}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace04" type="text" name="pdImg2" class="image-url" value="<c:out value="${pic2}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/uploadPd2-1.js"></script>
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
																		<img id="oriImg" src="<c:out value="${pic3}"/>"/>
																	</div>
																</li>
															</ul>
															<input id="imgPlace06" type="text" name="pdImg3" class="image-url" value="<c:out value="${pic3}"/>" readonly="readonly"/>
															<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
															<script type="text/javascript" src="/Bartenders/JS/uploadPd3-1.js"></script>
														</div>
													</div>
												</li>
											</ul>
											<ul id="setA" class="sho">
												<li>
													<h3>上架時間</h3>
												</li>
												<li>
													<div>
														<c:out value="${autoLT}"/>
													</div>
													<div>
														<input name="setTimeAct1" id="setA1" class="dateRange form-control" type="text">
													</div>
												</li>
											</ul>
											<ul id="setB" class="sho">
												<li>
													<h3>下架時間</h3>
												</li>
												<li>
													<div>
														<c:out value="${autoPT}"/>
													</div>
													<div>
														<input name="setTimeAct2" id="setA2" class="dateRange form-control" type="text">
													</div>
												</li>
											</ul>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li colspan="2" id="bT">
													<a href="/Bartenders/Dashboard.Products">
														<div class="button">回商品管理</div>
													</a>
												</li>
												<li>
													<input class="button primary" type="submit" value="修改商品"/>
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
		var d = new Date();
		var month = d.getMonth() + 1;
		var day = d.getDate();
		var output = d.getFullYear() + '/' + (month < 10 ? '0' : '') + month
			+ '/' + (day < 10 ? '0' : '') + day + " " + d.getHours() + ":"
			+ d.getMinutes() + ":" + d.getSeconds();
		$("input.dateRange").daterangepicker(
			{
				"alwaysShowCalendars": true,
				opens: "left",
				timePicker: true,
				minDate: output,
				timePickerIncrement: 1,
				singleDatePicker: true,
				showDropdowns: true,
				autoUpdateInput: false,
				locale: {
					format: "YYYY/MM/DD HH:mm:ss",
					separator: " ~ ",
					applyLabel: "確定",
					cancelLabel: "清除",
					fromLabel: "開始日期",
					toLabel: "結束日期",
					customRangeLabel: "自訂日期區間",
					daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
					monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
						"7月", "8月", "9月", "10月", "11月", "12月"],
					firstDay: 1
				}
			});

		$("input.dateRange").on('apply.daterangepicker', function (ev, picker) {
			$(this).val(picker.startDate.format('L'));
		});
		$("input.dateRange").on("apply.daterangepicker", function (ev, picker) {
			$(this).val(picker.startDate.format("YYYY/MM/DD HH:mm:ss"));
		});
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