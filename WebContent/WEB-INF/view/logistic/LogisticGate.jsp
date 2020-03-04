<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>個人訂單管理</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
	
		#background{
			position:relative;
			left:0%;
			top:0%;
			margin-top:-100px;
			/*border:2px yellow solid;*/
		}
		
		#container{
		position:relative;
		margin: 10px auto;
  		text-align: center;
  		/*border:1px blue solid;*/
		}
		
		#orderDiv{
			position:relative;
			/*border:1px red solid;*/
			width:140%;
			left:50%;
			margin-left:-70%;
		}
		
		td{
		padding:5px;
		vertical-align:middle;
		}
		
		
	</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">
	<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
							<li><a href="/Bartenders/logistic/searchPersonalOrder.do?sID=${getSenderId}">訂單管理</a></li>
							<li><a href="/Bartenders/logistic/OrderSearch.do/1">搜尋訂單</a></li>
							<li class="small"><a href="/Bartenders/logistic/WelcomeLogistic">首頁</a><a href="/Bartenders/logistic/LogisticLogout.do">登出</a></li>
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
							<div id="background" class="col-12 col-12-medium">
								<div id="container">
									<h1 align=center style="color:white;font-size:48px;margin:10px;">個人訂單管理</h1>

												<button id="status0" class="ByStatus" style="width:15%;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">查詢所有訂單</button>
												<button id="status1" class="ByStatus" style="width:17%;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">查詢未收貨訂單</button> <!-- status=1 -->
												<button id="status2" class="ByStatus" style="width:17%;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">查詢配送中訂單</button> <!-- status=2 -->
												<button id="status3" class="ByStatus" style="width:17%;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">查詢已送達訂單</button> <!-- status=3 -->

								</div>
								
									
									<div id="orderDiv" align=center >
										<fieldset >
											<legend style="color:white;font-size:24px">查詢結果</legend>
											<table >
												<thead>
													<tr align=center>
														<td style="width:4%;padding:10px">序號</td>
														<!-- 
														<td style="width:10%;padding:10px">訂單號碼</td>
														 -->
														<td style="width:7%;padding:10px">物流號碼</td>
														<td style="width:4.5%;padding:10px">類型</td>
														<td style="width:15%;">送貨地址</td>
														<td style="width:8%;padding:10px">收件人</td>
														<td style="width:8%;padding:10px">收件人手機</td>
														<td style="width:6%;padding:10px">金額</td>
														<td style="width:6%;padding:10px">進度</td>
														<td style="width:8%;padding:10px">出貨時間</td>
														<td style="width:8%;padding:10px">物流取貨</td>
														<td style="width:8%;padding:10px">送達時間</td>
														<td style="width:6%;padding:10px">狀態</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="Logistic" items="${logistic}" varStatus="status">
														<tr align="center">
															<td>${status.index+1}</td>
															<!-- 
															<td>${Logistic.oID}</td>
															 -->
															<td>${Logistic.lID}</td>
															<td class="myType">${Logistic.oType}</td>
															<td>${Logistic.oAddr}</td>
															<td>${Logistic.oName}</td>
															<td>${Logistic.oPhone}</td>
															<td>${Logistic.oAmount}</td>
															<td class="myStatus">${Logistic.oStatus}</td>
															<td>${Logistic.oTimeA}</td>
															<td>${Logistic.oTimeB}</td>
															<td>${Logistic.oTimeC}</td>
															<!-- 
															<td id="oComplete${Logistic.oID}">${Logistic.oComplete}</td>
															 -->
															<td style="vertical-align:bottom;">
															<button id="${Logistic.oStatus}-${Logistic.oID}-${Logistic.oComplete}"
																	class="Ready" style="width:80px;display:none;padding:0px;">送達</button>
														
															</td>
															
														</tr>
													</c:forEach>
													<c:if test="${empty logistic}">
														<tr>
															<td colspan="12" align="center">查無訂單</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</fieldset>
									</div>
									
							</div>
						</div>
					
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	
	//貨物送達按鈕
	$(".Ready").on("click", function () {
		var Str = this.id
		item = Str.split('-');
		orderStatus = item[0];
		orderID = item[1];
		orderComplete = item[2];
		window.location.href = '<c:url value="/logistic/DeliverReady.do"/>?orderID=' + orderID + '&orderStatus=' + orderStatus;
	})
	listR = $('button[id^="2"][class="Ready"]');
	listR.css("display", "block");
	listRN = $('button[id$="1"][class="Ready"]');
	listRN.attr("disabled", "true");
	//狀態轉換
	var type = document.getElementsByClassName('myType');
	for(var i=0;i<type.length;i++){
		if (type[i].innerHTML == '1') {
			type[i].innerHTML = '宅配';
		} else if (type[i].innerHTML == '2') {
			type[i].innerHTML = '超商';
		} else if (type[i].innerHTML == '3') {
			type[i].innerHTML = '票券';
		};
	}

	var myStatus = document.getElementsByClassName('myStatus');
	for(var i=0;i<myStatus.length;i++){
		if (myStatus[i].innerHTML == '1') {
			myStatus[i].innerHTML = '未收貨';
		} else if (myStatus[i].innerHTML == '2') {
			myStatus[i].innerHTML = '配送中';
		} else if (myStatus[i].innerHTML == '3') {
			myStatus[i].innerHTML = '已送達';
		};
	}
	
	$(".ByStatus").on("click", function () {
		var Str = this.id
		orderStatus = Str.substring(6);
		window.location.href = '<c:url value="/logistic/queryByStatus.do"/>?orderStatus=' + orderStatus + '&sID=${getSenderId}';
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