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
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyle.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
		input{
			color:white;
		}
		.errors{
			margin: 0px auto;
			color:red;
		}
		.container{
		position:absolute;
		left:0%;
		padding:10px;
		margin: 0px auto;/*div對齊效果*/
  		text-align: center;
		}
	    /* 以下是搜尋地圖設定*/
		.searchDiv {
			margin: auto;
/* 			width:800px; */
			width:70%;
			height: auto;
			display:none;
		}
		.mapDiv {
			width: 800px;
			height: 500px;
		}

		/*以下是搜尋框設定*/
		
		#choose{
			position:fixed;
			top:10%;
			right:0%;
			background-color:lightgrey;
/* 			width:150px; */
			width:15%;
			height:auto;
			padding:5px;
			margin:15px;
		}
		label{
			display: block;
			vertical-align:top;
		}
		input{
			display: inline-block;
			vertical-align:top;
		}
		.date{
		width:120px;
		}
		
		#beginTime{
			height:25px;
		}
		
		#endTime{
			height:25px;
		}
		
		div.col-12.col-12-medium {
			margin-left: 1%;
			text-align: center;
		}
		
		input#address{
			 width:500px;
		}
		
		button#clearTime, button#jokerBtn, button#openSearch {
		    width: 130px;
		    height: 40px;
		    margin: 0px auto;
		    vertical-align: middle;
		    color: darkgrey;
		    font-size: 12px;
		}
		
		p.brirf{
			width: 340px;
			margin: 5px;
			text-align: justify;
		}
		
		/*RWD for Map*/
		@media screen and (max-width: 1680px) {
			.col-12.col-12-medium {
				width:50%;
				margin-left: 5%;
			}
		}
		
		@media screen and (max-width: 1480px) {
			.col-12.col-12-medium {
				width:50%;
				margin-left: 9%;
			}
			
		}
		
		@media screen and (max-width: 960px) {
			.col-12.col-12-medium {
				margin-left: 8%;
			}
			#choose{
				width:18%;
			}
			.searchDiv{
				width: 850px;
			}
			#map0 {
				width: 80%;
			}
		}
		
		@media screen and (max-width: 800px) {
			.col-12.col-12-medium {
				margin-left: 4%;
			}
			#choose{
				width:20%;
			}
			.searchDiv{
				width: 750px;
			}
			#map0 {
				width: 80%;
			}
		}
		
		@media screen and (max-width: 736px) {
			.col-12.col-12-medium {
				margin-left: 5%;
			}
			#choose{
				width:20%;
			}
			.searchDiv{
				width: 650px;
			}
			#map0 {
				width: 80%;
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 10px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			}
		}
		
		@media screen and (max-width: 667px) {
			.col-12.col-12-medium {
				width:60%;
				margin-left: 4%;
			}
			#choose{
				width:25%;
			}
			.searchDiv{
				width: 550px;
			}
			#map0 {
				width: 80%;
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 10px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			}
		}
		
		@media screen and (max-width: 620px) {
			.col-12.col-12-medium {
				width:60%;
				margin-left: 4%;
			}
			#choose{
				width:25%;
			}
			.searchDiv{
				width: 500px;
			}
			#map0 {
				width: 80%;
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 10px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			}
		}
		
		@media screen and (max-width: 568px) {
			.col-12.col-12-medium {
				width:50%;
				margin-left: 3%;
			}
			.searchDiv{
				width: 400px;
			}
			#map0 {
				width: 80%;
			}
			#choose{
				width:30%;
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 10px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			}
			
			button#clearTime, button#jokerBtn, button#openSearch {
			    width: 110px;
			    height: 35px;
			    /* padding: 5px; */
			    margin: 0px auto;
			    vertical-align: middle;
			    color: darkgrey;
			    font-size: 10px;
			}
		}
		
		@media screen and (max-width: 414px) {
			.col-12.col-12-medium {
				width:50%;
				margin-left: 2%;
			}
		}
		
		@media screen and (max-width: 360px) {
			input#address{
				width: 300px;
			}
			
			.col-12.col-12-medium {
				width:45%;
				margin-left: 0.3%;
			}
			
			div.container {
			    position: absolute;
			    left: 0%;
			    padding: 10px;
			    margin: 0px auto;
			    text-align: center;
			    width: 320px;
			}
			
			.fieldset {
			    width: 310px;
			}

			img.img{
				width:300px;
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 10px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			}
		}
		
		@media screen and (max-width: 320px) {
			input#address{
				width: 280px;
			}
			
			.col-12.col-12-medium {
				width:45%;
				margin-left: 0.3%;
			}
			
			div#choose.chooseType form.formBox{
				top: 30px;
				height: 480px;
				font-size:14px;
				line-height: 16px;
			}
			
			input.date.flatpickr-input.flatpickr-mobile {
				width: 80px;
			}
			
			button#clearTime, button#jokerBtn, button#openSearch{
				width: 80px;
				height:40px;
				padding:3px;
				margin:0px auto;
				vertical-align:middle;
				color:darkgrey;
				line-height:16px" 
			}
			
			.each {
			    position: relative;
			    border: 2px yellow solid;
			    margin: 0px;
			    display: block;
			    vertical-align: top;
			    height: auto;
			    background-color: grey;
			    border-radius: 20px;
			    width: 300px;
			}
			
			div.container {
			    position: absolute;
			    left: 0%;
			    padding: 10px;
			    margin: 0px auto;
			    text-align: center;
			    width: 320px;
			}
			
			.fieldset {
			    width: 310px;
			}

			img.img {
				width:240px;
			}
			
			div#groundD0 {
				width:260px;
			}
			
			p.brief {
				width:270px;
				margin-left: 10px;
			}
		}
	</style>
	
	<script>
		var number = 1;
		var listActivityId = [];
		var limitNum = [];
		var targetNum = [];
		var currentNum = [];
		var perNum = [];
		var current = [];
		var reach = [];
	</script>
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
</script>

	<div id="page-wrapper">
	<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
							<c:if test="${testV>499999}">
							<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
							<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
							<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
							<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
							<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息與活動+</a></li>
							<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
							<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
							<li><a href="/Bartenders/NewsAndEvents.All">最新消息與活動管理</a></li>
							<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
							<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
							<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
							<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
							<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
							<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
							<li><a href="/Bartenders/ActivityCreate">建立活動</a></li>
							<li><a id="myActivity" href="/Bartenders/queryActivityByUser.do">管理活動</a></li>
							<li><a href="/Bartenders/getBarData.do?userId=${getCompanyId}">測試酒吧</a></li>
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
							<li><a href="/Bartenders/ActivityCreate">建立活動</a></li>
							<li><a id="myActivity" href="/Bartenders/queryActivityByUser.do">管理活動</a></li>
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
<!-- 				<div class="inner"> -->
					<section>
						<div class="row">
							<div class="col-12 col-6-medium"><!-- 這裡開始 -->
								<h1 align=center style="font-size:48px;">活動大廳</h1>
								
								<div class="searchDiv" align=center>
									<label>輸入地址定位</label>
									<input id="address" type="text">
									<button id="addressBtn" type="button" onclick="getInput()">搜尋</button>
									<button id="autoAddressBtn" type="button" onclick="autoLocating()">自動定位</button>
									<div id="map0" class="mapDiv"></div>
								</div>
								
								<div class="container">
									<c:forEach var="Activity" items="${activity}" varStatus="status">
										<div class="each" id="${Activity.activityId}">
											<fieldset class="fieldset">
												<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
												<img class="img" alt="未選擇圖片" src="images/${Activity.img}"> 
												<img class="imgType" alt="未設定類型" title="${Activity.type}" src="images/${Activity.type}.png">
												<div class="ActivityName">${Activity.name}</div>
												<div id="date${Activity.activityId}" class="ActivityDate"
													align=left>
													<p id="changeFormat${Activity.activityId}" style="margin: 10px"></p>
						
												</div>
												<p align=left style="margin: 10px">${Activity.address} <button id="${Activity.activityId}Bhidden${status.index+1}" class="closeAndOpen" type="button" style="width:120px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:40px">確認地圖</button></p>
												<div class="showEachMap">
													<div id="hidden${status.index+1}" class="hideMap">
														<div id="map${status.index+1}"
															style="width: 350px; height: 350px; background: red"></div>
													</div>
												</div>
												<div align=left style="margin: 10px">
													<c:choose>
														<c:when test="${Activity.limitNum==999}">
															<span>參加人數不限</span>
															<c:if test="${Activity.actualNum>=Activity.targetNum}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum}">
																<span>未成團</span>
															</c:if>
														</c:when>
														<c:when test="${Activity.actualNum==Activity.limitNum}">
															<span>活動人數已滿</span>
															<c:if test="${Activity.actualNum>=Activity.targetNum}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum}">
																<span>未成團</span>
															</c:if>
														</c:when>
														<c:otherwise>
															<span>目前人數${Activity.actualNum} / ${Activity.limitNum}</span>
															<c:if test="${Activity.actualNum>=Activity.targetNum}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum}">
																<span>未成團</span>
															</c:if>
															
														</c:otherwise>
													</c:choose>
													
												</div>
												<!--  -->
												<div class="outer">
													<div id="groundD${status.index}" class="ground">
														<img id="limitP${status.index}" class="limitP NP" title="上限: ${Activity.limitNum}人" src="images/arrowLimit.png">
														<div id="targetFor${status.index}" class="targetD">
															<img class="targetP NP" title="成團: ${Activity.targetNum}人" src="images/arrowTarget.png">	
														</div>
														<div id="currentFor${status.index}" class="currentD NP">
															<p><img class="currentP NP" title="現在: ${Activity.actualNum}人" src="images/arrowCurrent.png"></p>
														</div>
													</div>
												</div>
												
												<!-- 
												<div class="outer">
													<div id="groundD${status.index}" class="ground">
														<p id="limitP${status.index}" class="limitP NP" title="上限: ${Activity.limitNum}人"><img src="images/arrowLimit.png"></p>
														<div id="targetFor${status.index}" class="targetD">
															<p class="targetP NP" title="成團: ${Activity.targetNum}人"><img src="images/arrowTarget.png"></p>	
														</div>
														<div id="currentFor${status.index}" class="currentD NP">
															<p class="currentP NP" title="現在: ${Activity.actualNum}人"><img src="images/arrowCurrent.png"></p>
														</div>
													</div>
												</div>
												 -->
												<p class="brief" align=center>${Activity.brief}</p>
												<input type="hidden" name="preUrl" value="${preUrl}">
												<button id="single${Activity.activityId}" class="singlePage">進入活動頁面</button>
												
											</fieldset>
										</div>
										<script>
											console.log('IndexNum is:',"${status.index}");
											//計算地圖個數
											number++;
											listActivityId.push('${Activity.activityId}');
											//轉換時間格式
											var beginD = '${Activity.beginTime}';
											var endD = '${Activity.endTime}';
											var exp = 'hello';
											var bT = beginD.split(' ');//bT[0]開始的年月日2020/02/20 bT[1]開始的時分15:26
											var eT = endD.split(' ');//eT[0]開始的年月日2020/02/20 eT[1]開始的時分15:26
											var changeFormat = document.getElementById('changeFormat${Activity.activityId}');
											changeFormat.innerHTML = bT[0]+' '+bT[1]+' ~ '+eT[0].substring(5)+' '+eT[1];
											//個別進度條設定
											limitNum.push(${Activity.limitNum});
											targetNum.push(${Activity.targetNum});
											currentNum.push(${Activity.actualNum});
											//console.log('status.index is:','${status.index}','limitNum is:',limitNum[0],'targetNum is:',targetNum,'currentNum is:',currentNum);
											//console.log(' limit is: ',limitNum['${status.index}'],' target is: ',targetNum['${status.index}']);
											var fix = $('#groundD${status.index}').width()-20;
											if(${Activity.limitNum}==999){
												if(${Activity.targetNum}!=0){
													per = fix/targetNum['${status.index}'];
													$('#targetFor${status.index}').width(fix);
												}else if(${Activity.targetNum}==0){
													per = fix/currentNum['${status.index}'];
													$('#targetFor${status.index}').css('display','none');
												}
												$('#limitP${status.index}').css('display','none');
											}else{
												per = fix/limitNum['${status.index}'];
												$('#targetFor${status.index}').width(per*targetNum['${status.index}']);
											}
											perNum.push(per);
											$('#currentFor${status.index}').width(per*currentNum['${status.index}']);
											$('#currentFor${status.index}').css('background-color','pink');
											//若成團
											if(currentNum['${status.index}']>=targetNum['${status.index}']){
												$('#currentFor${status.index}').css('background-color','lightgreen');
												$('#targetFor${status.index}').css('display','none');
											}
											//判斷EL是否為null
											var people = document.getElementById('people${status.index}');
											
											</script>
									</c:forEach>
								</div>
								
								<div id="choose" class="chooseType" >
									<span data-toggle="collapse" data-target="#collap" style="text-align:left; cursor:pointer;">&times;</span>
									<div id="collap" class="collapse in" style="text-align: left;">
										<form class="formBox">
											搜尋類型:<br>
											<input id="bar" type="checkbox" class="multi" name="type2" value="bar" ><label for="bar">酒吧</label><br>
											<input id="shop" type="checkbox" class="multi" name="type2" value="shop" ><label for="shop">專賣店</label><br>
											<input id="show" type="checkbox" class="multi" name="type2" value="show" ><label for="show">酒展</label><br>
											<input id="party" type="checkbox" class="multi" name="type2" value="party" ><label for="party">派對</label><br>
											<input id="ready" type="checkbox" class="multi" name="ready" value="ready"><label for="ready">已成團</label><br>
											<input id="available" type="checkbox" class="multi" name="available" value="available"><label for="available">還有空位</label><br>
											<input id="beginTime" class="date" type="text" name="beginTime" placeholder="開始時間" ><br>
											<input id="endTime" class="date" type="text" name="endTime" placeholder="結束時間"><br>
											<button id="clearTime" type="button" onclick="clearDate()">清除時間</button><br>
											<button id="jokerBtn" type="button" onclick="queryJoker()">整合搜尋</button><br>
											<button id="openSearch" type="button">檢視地圖</button><br>
										</form>
									</div>
									
								</div>
							
								
								<script>
								//複合搜尋
								var beginTime = document.getElementById('beginTime');
								var endTime = document.getElementById('endTime');
								var checkBox = document.getElementsByClassName('multi');
								var joker = document.getElementById('jokerBtn');
									//檢查是否輸入時間區間
									beginTime.addEventListener('focus', function(){
										
										  if(endTime.value==''){
											  console.log('end not pick yet')
											  endTime.style.background = 'pink';
											  endTime.placeholder = '請一併選擇結束時間';
											  console.log('begin value: ',beginTime.value);
											  console.log('end value: ',endTime.value);
											  joker.disabled=true;
										  }else{
											  beginTime.style.background = '';
											  console.log('begin value is picked');
											  console.log('begin value: ',beginTime.value);
											  console.log('end value: ',endTime.value);
											  joker.disabled=false;
										  }
										});
									
									endTime.addEventListener('blur', function(){
										  if(beginTime.value==''){
											  console.log('begin not pick yet')
											  beginTime.style.background = 'pink';
											  beginTime.placeholder = '請一併選擇開始時間';
											  console.log('begin value: ',beginTime.value);
											  console.log('end value: ',endTime.value);
											  joker.disabled=true;
										  }else{
											  endTime.style.background = '';
											  console.log('end value is picked');
											  console.log('begin value: ',beginTime.value,typeof beginTime.value);
											  console.log('end value: ',endTime.value);
											  joker.disabled=false;
							
										  }
										});
									//輸入地址定位
									var locationLat;
									var locationLng;
									async function getInput() {
										var address = document.getElementById('address').value

										//等fetch做完再繼續
										await fetch('https://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E').then(
											function (response) {
												return response.json();
											}).then(function (JSONdata) {
												console.log('this is data results: ', JSONdata.results);
												//console.log("this is location's latlng: ", JSONdata.address_components);
												var all = JSONdata.results.forEach(function (item) {
													locationLat = item.geometry.location.lat;
													locationLng = item.geometry.location.lng;

												})
											});//fetch結束
										console.log("指定位置", locationLat, '; ', locationLng);
										relocate(locationLat, locationLng);
									}
									//清除時間按鈕
									function clearDate(){
										if(beginTime.value==''&&endTime.value==''){
											  console.log('nothing happen')
										  }else{
											  console.log('clean date')
											  beginTime.style.background = '';
											  endTime.style.background = '';
											  beginTime.value = '';
											  endTime.value = '';
											  beginTime.placeholder = '開始時間';
											  endTime.placeholder = '結束時間';
										  }
									}
									//時間格式化
									function dateToStr(datetime){
								        var dateTime = new Date(datetime);
								        var year = dateTime.getFullYear();
								        var month = dateTime.getMonth()+1;//js從0開始取
								        var date = dateTime.getDate();
								        var hour = dateTime.getHours();
								        var minutes = dateTime.getMinutes();
								        var second = dateTime.getSeconds();
								        if(month<10){
								            month = "0" + month;
								        }
								        if(date<10){
								            date = "0" + date;
								        }
								        if(hour <10){
								            hour = "0" + hour;
								        }
								        if(minutes <10){
								            minutes = "0" + minutes;
								        }
								        if(second <10){
								            second = "0" + second ;
								        }
								        return year+"-"+month+"-"+date+"-"+hour+"-"+minutes;
								    }
									// begin time
									var today=new Date();
									var current = today.getHours()+':'+today.getMinutes();
									console.log('current time: ',current);
									const myInput = document.getElementById("beginTime");
									const fp = flatpickr(myInput, {
										enableTime : true,
										dateFormat : "yy/m/d H:i",
										maxDate : new Date().fp_incr(30), // 30 days from now
										minDate : "today",
							
										time_24hr: true
									});
									var endMinD;
									var endMinT;
									if(beginTime.value==''){
										endMinD = "today";
										endMinT = current;
									}else{
										endMinD = beginTime.value;
										endMinT = beginTime.value;
									}
									// end time
									const myInput2 = document.getElementById("endTime");
									const fp2 = flatpickr(myInput2, {
										enableTime : true,
										dateFormat : "yy/m/d H:i",
										maxDate : new Date().fp_incr(30), // 30 days from now
										minDate : "today",
										time_24hr: true
									});
								function queryJoker(){
									console.log('start queryJoker');
									var jokerList = [];
									
									for(var i=0;i<checkBox.length;i++){
										if(checkBox[i].checked==true){
											console.log('checked: ',checkBox[i].value);
											jokerList.push(checkBox[i].value);
										}else{
											jokerList.push('checked');
										}
									}
									
									if(beginTime.value==''){
										console.log('time is not selected');
										jokerList.push('null');
										jokerList.push('null');
									}else{
										jokerList.push(dateToStr(beginTime.value));
										jokerList.push(dateToStr(endTime.value));
									}
									
									if($('.searchDiv').css('display')=='block'){
										jokerList.push('open');
									}else{
										jokerList.push('close');
									}
									
									console.log('jokerList: ',jokerList,' ;',typeof jokerList);
									//window.location.href = '<c:url value="/ActivityJoker.do"/>?Object='+jokerList;
									reloadMarkers("ActivityJoker",jokerList,0);
									getMarkers("ActivityJoker",jokerList,0);
								}
								</script>
							</div><!-- 這裡結束 -->
						</div>
					</section>
<!-- 				</div> -->
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
	//window.open(dlLink);

	

	//小OK顯示
	var ok = document.getElementById("smallok")
	var checklat = document.getElementById("lat")
	$('#map').on("click", function(){
		checkMap();
		reloadMarkers(lat.value,lng.value,realType.value);
		getMarkers(lat.value,lng.value,realType.value);
		console.log('temp marker:',lat.value,lng.value,realType.value)
	});
	function checkMap(){
		console.log("checkMap");
		if(checklat.value!=0){
			ok.style.visibility = 'visible';
		}
	}
	
	//打開搜尋地圖
	$('#openSearch').on('click', function(){
		if($('.searchDiv').css('display')=='none'){
			$('.searchDiv').css('display','block');
		}else {
			$('.searchDiv').css('display','none');	
		}
	})
	//個別地圖展開
	$('.closeAndOpen').on('click', function(){
		var tempId = this.id;
		console.log('tempId is:',tempId);
		var activityId = tempId.substring(0,4);
		var indexNum = tempId.substring(11);
		var prefix = 'ActivityActivityId';
		reloadMarkers(prefix,activityId,indexNum);
		getMarkers(prefix,activityId,indexNum);

		if($('#hidden'+indexNum).css('display')=='none'){
			$('#hidden'+indexNum).css('display','block');
		}else {
			$('#hidden'+indexNum).css('display','none');	
		}
	})

	
	//進入個別頁面
	
	$(".singlePage").on("click",function() {
		var activityId = this.id.substring(6);
		console.log('activityId is:',activityId);
		window.location.href = '<c:url value="/queryActivityByActivityId.do"/>?activityId='+ activityId;
		})
	//計算地圖數量
	console.log('number is: ',number);
	var pre=[];
	for(var i=0;i<number;i++){
		pre.push('map'+i);
	}
	console.log('pre is: ',pre);
	
	//設定currentId給超連結
		$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);
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
	<script src="scripts/MapStyle.js"></script>
	<script src="scripts/mapForActivity.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script>
	console.log('jokerList is: ','${jokerList}')
	if(${empty jokerList}){
		var defaultList = ["checked","checked","checked","checked","checked","checked","null","null","close"];
		reloadMarkers("ActivityJoker",defaultList,0);
		getMarkers("ActivityJoker",defaultList,0);
		
	}else{
		var getList = '${jokerList}';
		queryList = getList.slice(1,getList.length-1).split(", ");
		reloadMarkers("ActivityJoker",queryList,0);
		getMarkers("ActivityJoker",queryList,0);
		if(queryList[8].toString()=='open'){
			$('.searchDiv').css('display','block');
		}else{
			$('.searchDiv').css('display','none');
		}
	}
	</script>
</body>
</html>