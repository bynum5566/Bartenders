<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>訂單管理 / Bartenders</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />

<!-- 小鈴鐺 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>
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

.wrapper {
	padding: 3em 0 2em 0;
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
		<header id="header" class="alt_ver">
			<h1>
				<a href="/Bartenders/Welcome.Company">Bartenders</a>
			</h1>
			
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
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu" class="alt_ver">
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
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h2>請填寫要修改的訂單資料</h2>
						<form action="<c:url value="/doChangeOrder.controller"/>"
							method="POST">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<ul>
										<li style="font-size: 24px;font-weight: bold;">原訂單資訊:</li><br>
										<li style="font-size: 20px;">訂單編號:${orderId.substring(3,6)}${orderId.substring(12,19)}</li>
										<li style="font-size: 20px;"><input type="hidden" size="40" name="orderId"
											value="${orderId}" readonly="readonly" /></li>
										<li style="font-size: 20px;">商品名稱:${productData[0].productName}…</li>
										<%-- 										<li><input type="text" size="40" name="name" value="${productData[0].productName}等" readonly="readonly" /><br></li> --%>
										<li style="font-size: 20px;">訂單總價:$${order.amount}</li>
										<%-- 										<li><input type="text" size="40" name="price" value="${order.amount}" readonly="readonly" /><br></li> --%>
										<li style="font-size: 20px;">原選擇之配送方式:${ShippingNumToStr[order.shipping]}</li>
										<%-- 										<li><input type="text" size="40" name="price" value="${ShippingNumToStr[order.shipping]}" readonly="readonly" /><br></li> --%>
										<li style="font-size: 24px;font-weight: bold;"><br>
										修改訂單資訊:</li><br>
										<li style="font-size: 19px;">收件人:</li>
										<li><input type="text" size="40" name="recipient"
											value="${order.recipient}" /><br></li>
										<li style="font-size: 19px;">配送方式:</li>
										<li><select name="shippingType" id="shipping">
												<option value="ConvenienceStore" width="10">1.超商取貨</option>
												<option value="HomeDelivery" width="10">2.宅配</option>
										</select> <br></li>
										<a href="http://map.ezship.com.tw/ezship_map_web.jsp?rtURL=http://localhost:8080/Bartenders/ShowChangeOrder.controller?orderId=${orderId}">
										<img id="BT" src="/Bartenders/images/shipping.jpg" title="請選擇超商門市" style="width:80px; height:80px;margin-left:8px"></a>
										<li style="font-size: 19px;">配送地址:</li>
										<c:if test="${not empty marketAddress}">
											<li><input type="text" name="address" size="40"
											value="${marketAddress}" /><br></li>
										</c:if>
										<c:if test="${empty marketAddress}">
											<li><input type="text" name="address" size="40"
											value="${attrAddress}" /><br></li>
										</c:if>
										<li style="font-size: 19px;">收件人電話:</li>
										<li><input type="text" size="40" name="phone"
											value="${order.phone}" /><br></li>
									</ul>
								</div>
							</div>
							<div class="col-6 col-12-medium">
								<ul class="actions">
									<li><input class="css_button" type="reset" value="清除重填" /></li>
									<li><input class="button primary" type="submit"
										value="確認送出" /></li>
								</ul>
							</div>
						</form>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
		$("#shipping").change(function(){
			if($('#shipping').val()==="HomeDelivery"){
				$('#BT').hide();
			}else{
				$('#BT').show();
			}
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
		
	<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
</body>

</html>