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
	<title>Excel Report</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
		#orderDiv{
			position:absolute;
			left:0px;
			
		}
		
		td{
		border:1px white solid;
		padding:5px;
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
							<li><a href="/Bartenders/logistic/LogisticGate">訂單管理</a></li>
							<li><a href="/Bartenders/logistic/LogisticSearch">搜尋訂單</a></li>
							<li><a href="/Bartenders/logistic/SelectLogisticPOST">選擇超商</a></li>
							<li><a href="/Bartenders/Example">測試</a></li>
							<li class="small"><a href="/Bartenders/WelcomeLogistic">首頁</a><a href="javascript:signOut()">登出</a></li>
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
							<div class="col-12 col-12-medium">
								<h1 align=center style="color:white;font-size:48px">物流訂單管理</h1>
								<table align=center>
									<tr>
										<td style="border:1px transparent solid">
											<button id="status0" class="ByStatus">管理所有訂單</button>
											<button id="status1" class="ByStatus">查詢未收貨訂單</button> <!-- status=1 -->
											<button id="status2" class="ByStatus">查詢配送中訂單</button> <!-- status=2 -->
											<button id="status3" class="ByStatus">查詢已送達訂單</button> <!-- status=3 -->
										</td>
									</tr>
								</table>
								<!-- 
								<div align="center">
									<form action="<c:url value="/logistic/createLogistic.do" />" method="post">
										<table>
											<tr>
												<td>請輸入要測試的訂單號碼<input type="text" name="orderId"></td>
												<td><input type="submit" value="建立"></td>
											</tr>
										</table>
									</form>
								</div>
								 -->
								<div id="orderDiv" align=center >
									<fieldset>
										<legend style="color:white;font-size:24px">查詢結果</legend>
										<table align=center>
											<thead>
												<tr>
													<td style="width:80px;padding:10px">序號</td>
													<td>訂單號碼</td>
													<td>物流號碼</td>
													<td style="width:80px;padding:10px">類型</td>
													<td style="width:250px;">送貨地址</td>
													<td style="width:150px;padding:10px">取件人姓名</td>
													<td style="width:150px;padding:10px">取件人手機</td>
													<td style="width:80px;padding:10px">金額</td>
													<td style="width:100px;padding:10px">進度</td>
													<td style="width:150px;padding:10px">出貨時間</td>
													<td style="width:150px;padding:10px">物流取貨</td>
													<td style="width:150px;padding:10px">送達時間</td>
													<td style="width:80px;padding:10px">狀態</td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="Logistic" items="${logistic}" varStatus="status">
													<tr>
														<td>${status.index+1}</td>
														<td>${Logistic.oID}</td>
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
														<td><button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
																class="Ready" style="display: none">貨物確認送達</button></td>
													</tr>
												</c:forEach>
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
	//狀態轉文字
	var type = document.getElementsByClassName('myType');
	console.log('type column: ', type);
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
	console.log('status column: ', myStatus);
	for(var i=0;i<myStatus.length;i++){
		if (myStatus[i].innerHTML == '1') {
			myStatus[i].innerHTML = '未收貨';
		} else if (myStatus[i].innerHTML == '2') {
			myStatus[i].innerHTML = '配送中';
		} else if (myStatus[i].innerHTML == '3') {
			myStatus[i].innerHTML = '已送達';
		};
	}
	
	listR = $('button[id^="2"][class="Ready"]');
	listR.attr("style", "display:block;");
	console.log(listR);
	
	$(".Ready").on("click", function () {
		var Str = this.id
		orderID = Str.substring(2);
		orderStatus = Str.substring(0, 1);
		orderType = Str.substring(1, 2);
		window.location.href = '<c:url value="/logistic/DeliverReady.do"/>?orderID=' + orderID + '&orderStatus=' + orderStatus;
	})
	$(".ByStatus").on("click", function () {
		var Str = this.id
		orderStatus = Str.substring(6);
		window.location.href = '<c:url value="/logistic/queryByStatus.do"/>?orderStatus=' + orderStatus;
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