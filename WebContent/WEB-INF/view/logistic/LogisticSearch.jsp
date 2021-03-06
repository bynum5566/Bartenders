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
	<title>物流訂單搜尋</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindowForOrder.css">
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
		
		#container{
		position:relative;
		margin: 10px auto;
  		text-align: center;
  		/*border:1px blue solid;*/
		}

		#orderDiv{
			position:relative;
			width:140%;
			left:50%;
			margin-left:-70%;
			/*border:1px red solid;
			width:1500px;
			left:50%;
			margin-left:-750px;
			*/
		}
		td{
		padding:5px;
		vertical-align:middle;
		}
		
		#demoBox{
			position:relative;
			right:-80%;
			bottom:-50px;
			width:450px;
			height:100px;
		}
		
		/* 以下是地圖搜尋設定*/
		.searchDiv {
			margin: auto;
			display:none;
			height:auto;
			/*border:1px yellow solid;*/
		}
		
		.mapDiv {
/* 			height: 400px; */
			width: 800px;	
			height: 400px;
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
	
		<article id="main" >
			<section class="wrapper style5" >
				<div class="inner" >
					<section>
						<div class="row" >
							<div id="background" class="col-12 col-12-medium" >
								<div id="container">
									<h1 align=center style="color:white;font-size:48px;margin:10px;">訂單搜尋</h1>
									<button id="openSearch" type="button" style="width:150px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">打開地圖</button>
									<button id="renewSearch" type="button" style="width:150px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px" onclick="queryJoker()">更新訂單</button>
									<div class="searchDiv" align=center>
										<div id="map" class="mapDiv"></div>
									</div>
									
								</div>
									<div id="orderDiv" align=center >
									
								
										<fieldset>
											<legend style="color:white;font-size:24px">查詢結果</legend>
											<table id="targetTable" align=center >
												<thead>
													<tr align="center">
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
														<td style="width:7%;padding:10px">狀態</td>
													</tr>
												</thead>
												<tbody id="tbody" align="center">
													<c:forEach var="Logistic" items="${logistic}" varStatus="status">
														<tr style="vertical-align:middle;">
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
															<td>
															<button id="${Logistic.sID}-${Logistic.oStatus}-${Logistic.cID}-${Logistic.oID}"
																	class="reserve allnormal" style="width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">接單</button>	
															<button id="${Logistic.sID}-${Logistic.oStatus}-${Logistic.cID}-${Logistic.oID}"
																	class="reserve alldemo" style="width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px">5秒demo</button>			
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</fieldset>
									
								</div>
							</div>
						</div>
							<!--  -->
									<div id="demoBox" align="center" >
										<form action="<c:url value="/logistic/createLogistic.do" />" method="post">
											<table>
												<tr>
													<td style="width:350px;">請輸入要模擬的訂單號碼<input type="text" name="orderId" style="width:300px;height:40px;"></td>
													<td style="width:100px;"><input type="submit" value="建立" style="width:80px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px"></td>
												</tr>
											</table>
										</form>
									</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//登入者id
	console.log('配送員ID: ','${getSenderId}');
	//打開搜尋地圖
	$('#openSearch').on('click', function(){
		if($('.searchDiv').css('display')=='none'){
			$('.searchDiv').css('display','block');
			var prefix = 'logistic/OrderSearch';
			reloadMarkers();
			reloadOrders();
			getMarkers(prefix,1,'${getSenderId}','byBar');
			getOrders('logistic/OrderSearchByBar',0,'${getSenderId}','all');
			$('#openSearch').html('收起地圖');
			//$('#container').css('position','relative');
		}else {
			$('.searchDiv').css('display','none');	
			$('#openSearch').html('打開地圖');
			//$('#container').css('position','absolute');
		}

	})
	var OrderJSON;
	var situation;
	function getOrderJSON(OrderJSON,situation){
		document.getElementById('tbody').remove();
		var targetBody = document.createElement("tbody");
		targetBody.id = 'tbody';
		targetBody.align = 'center';
		document.getElementById('targetTable').appendChild(targetBody);
		var index = 1;
		var selectOrder = OrderJSON.forEach(function(item){
			var newTr = document.createElement("tr");
			var newTd = document.createElement("td"); 
			newTd.innerHTML = index;
			newTr.appendChild(newTd);
			index++;
			for(var t in item){
				var txt = item[t];
				if(t!='oNo'&&t!='cID'&&t!='sID'&&t!='oComplete'&&t!='charge'&&t!='cost'&&t!='oTimeR'&&t!='oTimeB'&&t!='oTimeC'){
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
			if(situation=='byBar'){
				console.log('situation is: ',situation);
				var newTd = document.createElement("td"); 
				var newBtn = document.createElement("button");
				newBtn.id = item['sID']+'-'+item['oStatus']+'-'+item['cID']+'-'+item['oID'];
				newBtn.className = 'reserve normal';
				newBtn.innerHTML = '接單';
				newBtn.style = 'width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px;';
				//newBtn.style.display = 'none';
				newTd.appendChild(newBtn);
				//demo用
				var newBtn2 = document.createElement("button");
				newBtn2.id = item['sID']+'-'+item['oStatus']+'-'+item['cID']+'-'+item['oID'];
				newBtn2.className = 'reserve demo';
				newBtn2.innerHTML = '5秒demo';
				newBtn2.style = 'width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px;';
				//newBtn.style.display = 'none';
				newTd.appendChild(newBtn2);
			}else if(situation=='all'){
				console.log('situation is: ',situation);
				var newTd = document.createElement("td"); 
				var newBtn = document.createElement("button");
				newBtn.id = item['sID']+'-'+item['oStatus']+'-'+item['cID']+'-'+item['oID'];
				newBtn.className = 'reserve allnormal';
				newBtn.innerHTML = '接單';
				newBtn.style = 'width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px;';
				//newBtn.style.display = 'none';
				newTd.appendChild(newBtn);
				//demo用
				var newBtn2 = document.createElement("button");
				newBtn2.id = item['sID']+'-'+item['oStatus']+'-'+item['cID']+'-'+item['oID'];
				newBtn2.className = 'reserve alldemo';
				newBtn2.innerHTML = '5秒demo';
				newBtn2.style = 'width:140px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:0px;';
				//newBtn.style.display = 'none';
				newTd.appendChild(newBtn2);
			}
			newTr.appendChild(newTd);
			document.getElementById('tbody').appendChild(newTr);
			
		})
		changeHTML();
		changeDisplay();
	}
	//訂單搜尋
	function queryJoker(){
		console.log('click joker');
		//清除酒吧
		reloadMarkers()
		reloadOrders();
		
		getMarkers('logistic/OrderSearch',1,'${getSenderId}','all');
		//reset();
		getOrders('logistic/OrderSearchByBar',0,'${getSenderId}','all');
	}
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
	
	//接單按鈕
	function changeDisplay(){
		$(".normal").on("click",function () {
			var Str = this.id.split('-');
			oID = Str[3];
			cID = Str[2];
			console.log('Str is: ',Str,'oID: ',oID,'element is: ',this);
			//清除酒吧
			reloadMarkers();
			//清除送貨地點
			reloadOrders();
			reserveOrder('logistic/OrderReserveByBar/bar/60',oID,'${getSenderId}','byBar');
			
			//getMarkers('logistic/OrderSearch',1,'${getSenderId}','byBar');
			//getOrders('logistic/OrderSearchByBar',cID,'${getSenderId}','byBar');
			//changeIcon(cID);
		})

		//demo按鈕
		$(".demo").on("click",function () {
			var Str = this.id.split('-');
			oID = Str[3];
			cID = Str[2];
			console.log('Str is: ',Str,'oID: ',oID,'element is: ',this);
			//清除酒吧
			reloadMarkers();
			//清除送貨地點
			reloadOrders();
			reserveOrder('logistic/OrderReserveByBar/bar/5',oID,'${getSenderId}','byBar');
			
			//getMarkers('logistic/OrderSearch',1,'${getSenderId}','byBar');
			//getOrders('logistic/OrderSearchByBar',cID,'${getSenderId}','byBar');
			//changeIcon(cID);
		})
		
		$(".allnormal").on("click",function () {
			var Str = this.id.split('-');
			oID = Str[3];
			cID = Str[2];
			console.log('Str is: ',Str,'oID: ',oID,'element is: ',this);
			//清除酒吧
			reloadMarkers();
			//清除送貨地點
			reloadOrders();
			reserveOrder('logistic/OrderReserveByBar/all/60',oID,'${getSenderId}','all');
			
			//getMarkers('logistic/OrderSearch',1,'${getSenderId}','all');
			//getOrders('logistic/OrderSearchByBar',0,'${getSenderId}','all');
			//changeIcon(cID);
		})

		//demo按鈕
		$(".alldemo").on("click",function () {
			var Str = this.id.split('-');
			oID = Str[3];
			cID = Str[2];
			console.log('Str is: ',Str,'oID: ',oID,'element is: ',this);
			//清除酒吧
			reloadMarkers();
			//清除送貨地點
			reloadOrders();
			reserveOrder('logistic/OrderReserveByBar/all/5',oID,'${getSenderId}','all');
			
			//getMarkers('logistic/OrderSearch',1,'${getSenderId}','all');
			//getOrders('logistic/OrderSearchByBar',0,'${getSenderId}','all');
			//changeIcon(cID);
		})
		
		listR = $('button[id^="9"][class*="reserve"]');
		listR.attr("disabled",true);
		console.log('listR number: ',listR.length);
		for(var i=0;i<listR.length;i++){
			listR[i].innerHTML = '已接單';
		}	
	}
	

	//初始轉換 & 初始隱藏
	changeHTML();
	changeDisplay();
	
	

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
	<script src="/Bartenders/logistic/scripts/MapStyle.js"></script>
	<script src="/Bartenders/logistic/scripts/mapForOrder.js"></script>
	<script type="text/javascript"
		src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
</body>
</html>