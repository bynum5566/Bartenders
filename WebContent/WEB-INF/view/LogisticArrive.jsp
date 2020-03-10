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
	<title>商品送達</title>
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
<script>
	//測試是否可以接收到登入參數
	var user = '${getUserId}';
	var company = '${getCompanyId}';
	
	console.log('preUrl=','${preUrl}');
	var currentId = '${getCompanyId}${getUserId}';
	console.log('currentId is: ',currentId);
	<c:set var="testV" value="${getCompanyId}${getUserId}"/>
								
								//先取回資料做檢查
								function getLogistic(input){
									fetch('http://localhost:8080/Bartenders/LogisticCheck/'+input+'')
										.then(function(response) {
												console.log('data get!');
												return response.json();
											}).then(function(LogisticJSON) {
												console.log('this is LogisticJSON: ', LogisticJSON);
												console.log('this is sID: ', LogisticJSON.sID);
												LogisticData = LogisticJSON;
												//尚未收到貨物
												if(LogisticJSON.oTimeC==null&&LogisticJSON.oComplete==1){
													//已點選送達
													if(LogisticJSON.charge==currentId){
														//收件人正確
														if (confirm("是否確定收到商品?")) {
															console.log('商品確認已收到')
															window.location.href = '<c:url value="/MerchandiseArrive.do"/>?orderID=' + orderID + '&userId=' + currentId;
														}
														else {
															alert("動作取消");
															window.location.href = '<c:url value="/UserFirstPage"/>?';
														}
													//收件人不符
													}else{
														console.log('收件人不符');
														window.location.href = '<c:url value="/MerchandiseArrive.do"/>?orderID=' + orderID + '&userId=' + currentId;
													}
												//貨物已收到重複刷
												}else {
													//本人重複刷
													if(LogisticJSON.charge==currentId){
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
														document.getElementById('tbody').appendChild(newTr);
														document.getElementById('noteText').innerHTML = '此訂單已於'+LogisticJSON['oTimeC']+'完成配送';
														changeHTML();
														console.log('之前已經確認收貨');
														
													//不是本人誤刷
													}else{
														console.log('你不是本人');
														window.location.href = '<c:url value="/MerchandiseArrive.do"/>?orderID=' + orderID + '&userId=' + currentId;
													}
												}//else結束
											});
									};
								
								//async function initialCheck(){
									var url = location.href;
									var LogisticData;
									console.log('url catched: ',url);
								//再來用去尋找網址列中是否有資料傳遞(QueryString)
									if (url.indexOf('?') != -1) {
										var orderID = "";
										//在此直接將各自的參數資料切割放進ary中
										var ary = url.split('?')[1].split('&');
										console.log(ary);
										//此時ary的內容為：
										//ary[0] = 'id=U001'，ary[1] = 'name=GQSM'
										//如果資料名稱為id的話那就把他取出來
										if (ary[0].split('=')[0] == 'orderID')
											orderID = ary[0].split('=')[1];
										console.log('orderID is:',orderID);
										if(ary.length=1){
											getLogistic(orderID);
										}
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
	<div id="page-wrapper">
	<header id="header" class="alt_ver">
		<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu" class="alt_ver">
						<ul>
							<c:if test="${testV>499999}">
							<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
							<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
							<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
							<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
							<li><a href="/Bartenders/NewsAndEvents.All">最新消息與活動管理</a></li>
							<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
							<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
							<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
							<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
							<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
<%-- 							<li><a href="/Bartenders/getBarData.do?userId=${getCompanyId}">測試酒吧</a></li> --%>
							<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a href="javascript:signOut()">登出</a></li>
							</c:if>
							<c:if test="${testV<499999}">
							<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
							<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
							<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
							<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
							<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
							<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
							<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
							<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
							<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
							<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
							<li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
							</c:if>
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
							<h3 align="center" style="font-size:36px;">商品送達</h3>
							<div id="orderDiv">
								
								<fieldset>
									<table id="targetTable">
										<thead>
											<tr align=center>
												<td style="width:4%;padding:10px">序號</td>
											
												<td style="width:10%;padding:10px">訂單號碼</td>
												
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
	
											</tr>
										</thead>
										<tbody id="tbody">
											<tr align=center style="height:97px">
												<td>${status.index+1}</td>
												
												<td id="temp">${update.oID}</td>
												
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
												
											</tr>
	
										</tbody>
									</table>
									<div id="btnDiv" align=center>
										<p id="noteText">${thank}</p>
										<button id="bt1" class="Code" >確定</button><br>
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
			window.location.href = '<c:url value="/UserFirstPage"/>';
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