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
	<title>物流訂單明細</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

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
		#background{
			position:relative;
			left:0%;
			top:0%;
			margin-top:-100px;
			/*border:2px yellow solid;*/
		}
	
		#orderDiv{
			position:relative;
			/*border:1px red solid;*/
			width:150%;
			left:50%;
			margin-left:-75%;
		}
		
		td{
			/*border:1px white solid;*/
			vertical-align:middle;
		}
		
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
							<div id="background" class="col-12 col-12-medium">
							<script>
								//測試是否可以接收到登入參數
								var user = '${getUserId}';
								var company = '${getCompanyId}';
								var sender = '${getSenderId}'
								console.log('preUrl=','${preUrl}');
								var currentId = '${getSenderId}';
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
												if(LogisticJSON.oComplete==1&&currentId==ordersID){
													window.location.href = '<c:url value="/MerchandiseFilter.do"/>?orderID=' + orderID;
													//window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
												//尚未送達
												}else if(currentId==ordersID){
													console.log('配送員相符');
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
															if(t!='oNo'&&t!='oID'&&t!='cID'&&t!='sID'&&t!='charge'&&t!='cost'&&t!='oTimeR'&&t!='oComplete'){
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
														console.log('重複刷');
													
													//收貨	
													}else if(orderID!=""&&LogisticJSON.oTimeB==null){
														if (confirm("確定進行物流收貨嗎?")) {
															window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
					
														}
														else {
															alert("已經取消了操作");
															window.location.href = '<c:url value="/logistic/searchPersonalOrder.do?sID=${getSenderId}"/>';
														}
													}
												//配送員不符	
												}else if(ordersID!=null&&currentId!=ordersID){
													console.log('配送員不符');
													document.getElementById('temp').innerHTML = '配送員不符，請勿拿別人訂單 ';
													window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID=' + orderID + '&sID=' + currentId;
												//尚未預約取件
												}else {
													console.log('此訂單尚未點選預約');
													document.getElementById('temp').innerHTML = '請先預約取件 ';
													//////////////////////////////////
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
														if(t!='oNo'&&t!='oID'&&t!='cID'&&t!='sID'&&t!='charge'&&t!='cost'&&t!='oTimeR'&&t!='oComplete'){
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
													newTd.id = 'reserveBtn';
													var newBtn = document.createElement("button");
													newBtn.id = LogisticJSON['sID']+'-'+LogisticJSON['oStatus']+'-'+LogisticJSON['cID']+'-'+LogisticJSON['oID'];
													
													newBtn.type = 'button';
													newBtn.className = 'reserve normal';
													newBtn.innerHTML = '接單';
													newBtn.style = 'width:100px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px;';
													//newBtn.style.display = 'none';
													newTd.appendChild(newBtn);
													newTr.appendChild(newTd);
													
													/////////
													document.getElementById('tbody').appendChild(newTr);
													document.getElementById('noteText').innerHTML = '您尚未預約此訂單，請先點選接單按鈕';
													changeDisplay();
												}//else結束
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
								
								//接單按鈕
								function changeDisplay(){
								
									$(".normal").on("click",function () {
										var Str = this.id.split('-');
										oID = Str[3];
										cID = Str[2];
										console.log('Str is: ',Str,'oID: ',oID,'element is: ',this);

										reserveOrder('logistic/OrderReserveByBar/bar/60',oID,'${getSenderId}','byBar');
										this.innerHTML = '已接單';
										$(this).attr("disabled",true);
										
									})
									/*
								$(".reserve").on("click", function () {
									var Str = this.id
									orderID = Str.substring(8);
									console.log('orderId is: ',orderID)
									window.location.href = '<c:url value="/logistic/orderReserve.do"/>?oID=' + orderID + '&sID='+currentId;
								})
								*/
								}
								function reserveOrder(prefix,input,senderId,situation){
									fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'/'+senderId+'').then(
											function(response) {
												console.log('reserveOrder done');
												return response.json();
											})
										}
							</script>	
							<h3 align="center" style="font-size:36px;">訂單明細</h3>
							<div id="orderDiv">
								
								<fieldset>
									<table id="targetTable">
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
										<tbody id="tbody">
											<tr align=center style="height:97px">
												<td>${status.index+1}</td>
												<!-- 
												<td id="temp">${update.oID}</td>
												 -->
												<td>${update.lID}</td>
												<td class="myType">${update.oType}</td>
												<td id="temp">${update.oAddr}</td>
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