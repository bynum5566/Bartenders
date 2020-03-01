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
			left:0%;
			
			padding:15px;
		}
		/*
		tr{
			height:97px;
		}
		*/
		.Ready{
			padding:10px;
			text-align:center;
			line-height: 5px;
		}
	
		#btnTd{
			height:97px;
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
							<div class="col-12 col-12-medium">
							<script>
								//測試是否可以接收到登入參數
								var user = '${getUserId}';
								var company = '${getCompanyId}';
								var sender = '${getSenderId}'
								console.log('preUrl=','${preUrl}');
								var currentId = '${getCompanyId}${getUserId}${getSenderId}';
								console.log('currentId is: ',currentId);
								
								//先取回資料做檢查
								function getLogistic(input){
									fetch('http://localhost:8080/Bartenders/logistic/LogisticCheck/'+input+'')
										.then(function(response) {
												console.log('data get!');
												return response.json();
											}).then(function(LogisticJSON) {
												console.log('this is LogisticJSON: ', LogisticJSON);
												console.log('this is sID: ', LogisticJSON.sID);
												LogisticData = LogisticJSON;
												ordersID = LogisticJSON.sID;
												//已點選送達
												if(LogisticJSON.oComplete==1){
													window.location.href = '<c:url value="/UserFirstPage"/>';
												//尚未送達
												}else if(currentId==ordersID){
													console.log('id is same');
													//重複刷
													if(LogisticJSON.oTimeB!=null&&LogisticJSON.oComplete==0){
														document.getElementById('tbody').remove();
														var targetBody = document.createElement("tbody");
														targetBody.id = 'tbody';
														targetBody.align = 'center';
														document.getElementById('targetTable').appendChild(targetBody);
														var newTr = document.createElement("tr");
														var newTd = document.createElement("td"); 
														newTd.innerHTML = 1;
														newTr.appendChild(newTd);
														for(var t in LogisticJSON){
															var txt = LogisticJSON[t];
															if(t!='oNo'&&t!='cID'&&t!='sID'&&t!='charge'&&t!='cost'&&t!='oTimeR'&&t!='oComplete'){
																var newTd = document.createElement("td"); 
																newTd.innerHTML = txt;
																	if(t=='oType'){
																		newTd.className = 'myType';
																	}
																	if(t=='oStatus'){
																		newTd.className = 'myStatus';
																	}
																newTr.appendChild(newTd);
																}
														}
														var newTd = document.createElement("td"); 
														newTd.id = 'btnTd';
														var newBtn = document.createElement("button");
														newBtn.id = LogisticJSON['oStatus']+'-'+LogisticJSON['oID']+'-'+LogisticJSON['oComplete'];
														newBtn.className = 'Ready';
														newBtn.type = 'button';
														newBtn.innerHTML = '送達';
														//newBtn.style.display = 'none';
														newTd.appendChild(newBtn);
														newTr.appendChild(newTd);
														document.getElementById('tbody').appendChild(newTr);
														document.getElementById('noteText').innerHTML = '若商品已送達，請記得先點選送達按鈕再刷QR碼';
														changeHTML();
														readyBtn();
													
													//收貨	
													}else if(orderID!=""&&ary.length==1){
														if (confirm("確定進行物流收貨嗎?")) {
															window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
					
														}
														else {
															alert("已經取消了操作");
															window.location.href = '<c:url value="/logistic/searchPersonalOrder.do?sID=${getSenderId}"/>';
														}
													}
												//配送員不符	
												}else{
													console.log('id is diff');
													window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
												}
												});
									};
								
								//async function initialCheck(){
									var url = location.href;
									var LogisticData;
									var mysID;
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
										getLogistic(orderID);
									}
								//}
								function readyBtn(){
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
								}
							</script>	
							<h3 align="center" style="font-size:36px;">訂單明細</h3>
							<div id="orderDiv">
								
								<fieldset>
									<table id="targetTable">
										<thead>
											<tr align=center>
												<td style="width:75px;padding:10px">序號</td>
												<td style="width:285px;padding:10px">訂單號碼</td>
												<td style="width:135px;padding:10px">物流號碼</td>
												<td style="width:80px;padding:10px">類型</td>
												<td style="width:275px;">送貨地址</td>
												<td style="width:120px;padding:10px">收件人</td>
												<td style="width:160px;padding:10px">收件人手機</td>
												<td style="width:80px;padding:10px">金額</td>
												<td style="width:100px;padding:10px">進度</td>
												<td style="width:160px;padding:10px">出貨時間</td>
												<td style="width:160px;padding:10px">物流取貨</td>
												<td style="width:160px;padding:10px">送達時間</td>
												<td style="width:100px;padding:10px">狀態</td>
											</tr>
										</thead>
										<tbody id="tbody">
											<tr align=center style="height:97px">
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
									<div id="btnDiv" align=center>
										<p id="noteText"></p>
										<button id="bt1" class="Code" >返回</button><br>
									</div>
								</fieldset>
							
							</div>
							
							
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
		function changeHTML(){
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
		}
		//初始轉換 & 初始隱藏
		changeHTML();
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