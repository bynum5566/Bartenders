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
		
		#bt1{
			position:fixed;
			top:20%;
			display:none;
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
							<div class="col-6 col-12-medium">
								<script>
								//測試是否可以接收到登入參數
								var user = '${getUserId}';
								var company = '${getCompanyId}';
								var sender = '${getSenderId}'
								console.log('preUrl=','${preUrl}');
								var currentId = '${getCompanyId}${getUserId}${getSenderId}';
								console.log('currentId is: ',currentId);
							
								var url = location.href;
								console.log('url catched: ',url);
								//再來用去尋找網址列中是否有資料傳遞(QueryString)
								if (url.indexOf('?') != -1) {
									var orderID = "";
									var orderStatus = "";
									//在此直接將各自的參數資料切割放進ary中
									var ary = url.split('?')[1].split('&');
									console.log(ary);
									//此時ary的內容為：
									//ary[0] = 'id=U001'，ary[1] = 'name=GQSM'
									//如果資料名稱為id的話那就把他取出來
									if (ary[0].split('=')[0] == 'orderID')
										orderID = ary[0].split('=')[1];
									console.log('orderID is:',orderID);
									if (orderID != "") {
										if (confirm("確定進行物流收貨嗎?")) {
											window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
	
										}
										else {
											alert("已經取消了操作");
											window.location.href = '<c:url value="/logistic/loginSuccess"/>';
										}
									}
	
								}
							</script>
							<h3 align="center" style="font-size:36px;">訂單明細</h3>
							<div id="orderDiv">
								<fieldset>
									<legend>訂單明細</legend>
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
											<tr>
												<td>${status.index+1}</td>
												<td>${update.oID}</td>
												<td>${update.lID}</td>
												<td class="myType">${update.oType}</td>
												<td>${update.oAddr}</td>
												<td>${update.oName}</td>
												<td>${update.oPhone}</td>
												<td>${update.oAmount}</td>
												<td class="myStatus">${update.oStatus}</td>
												<td>${update.oTimeA}</td>
												<td>${update.oTimeB}</td>
												<td>${update.oTimeC}</td>
												<td class="myComplete">${update.oComplete}</td>
											</tr>
	
										</tbody>
									</table>
								</fieldset>
							</div>
							<button id="bt1" class="Code" >返回</button><br>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<script>
		$("#bt1").on("click", function () {
			window.location.href = '<c:url value="/logistic/LogisticGate"/>';
		})
		
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
		
		var myComplete = document.getElementsByClassName('myComplete');
		console.log('complete column: ', myComplete);
		for(var i=0;i<myComplete.length;i++){
			if (myComplete[i].innerHTML == '1') {
				myComplete[i].innerHTML = '完成';
			}
		}
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