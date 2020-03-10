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
	<title>活動詳情</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyleForEdit.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<!-- 小鈴鐺 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<style>
		#background{
			position:relative;
			left:0%;
			top:0%;
			margin-top:-80px;
		}
		
		.container{
		position:relative;
		width:900px;
		left:50%;
		padding:10px;
		margin: 0px auto;/*div對齊效果*/
		margin-left:-450px;
		text-align: center;
		
		}
		#participate{
		position:absolute;
		right:0%;
		}

		.inputBox{
			height:20px;
		}
		
		.typeLabel{
			
		}
				/* 小鈴鐺 */

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
	
	<script>
		var number = 0;
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
	<c:if test="${testV>499999}">
		<header id="header" class="alt_ver">
			<h1><a href="WelcomeCompany">Bartenders</a></h1>
	</c:if>
	<c:if test="${testV<499999}">
		<header id="header">
			<h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
	</c:if>
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
						<c:if test="${testV>499999}">
						<div id="menu" class="alt_ver">
							<ul>
								<!-- 
								<c:out value="${testV}"/>
								 -->
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
	<!-- 							<li><a href="/Bartenders/ActivityCreate">建立活動</a></li> -->
	<!-- 							<li><a id="myActivity" href="/Bartenders/queryActivityByUser.do">管理活動</a></li> -->
								<li><a href="/Bartenders/Example">測試</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a href="javascript:signOut()">登出</a></li>
						</c:if>
						<c:if test="${testV<499999}">
							<div id="menu">
								<ul>
								<!-- 
								<c:out value="${testV}"/>
								 -->
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
	<!-- 							<li><a href="/Bartenders/ActivityCreate">建立活動</a></li> -->
	<!-- 							<li><a id="myActivity" href="/Bartenders/queryActivityByUser.do">管理活動</a></li> -->
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
							<div id="background" class="col-12 col-12-medium"><!-- 這裡開始 -->
								<h1 align="center" style="font-size:48px;margin:5px;">活動編輯</h1>
								
								
								<div class="container">
								<c:forEach var="Activity" items="${activity}" varStatus="status"><!--  -->
								<form action="saveActivity.do" method="post" enctype="multipart/form-data">
								<div style="background-color:darkgrey;border-radius:20px;">
									<div style="display:inline-block;vertical-align:top;">
										<div class="each" id="${Activity.activityId}" >
											<fieldset style="width: 350px;border-radius:30px;text-align: center;">
												<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
												<img id="imgDisplay" class="img" alt="未選擇圖片" style="margin: 0px 5px 0px 5px;padding:0px;" src="images/${Activity.img}"> 
												<img id="typeDisplay" class="imgType" alt="未設定類型" title="${Activity.type}" src="images/${Activity.type}.png" style="margin: 0px 10px 0px 0px">
												<input id="uploadFile" type="file" name="uploadFile"  accept="image/*" value="${Activity.img}" style="display:none;"/>
												
												<div class="ActivityName"><input id="name" class="inputBox" type="text" name="name" value="${Activity.name}" style="height:50px;font-size:26px;font-weight:bold;line-height:50px;text-align:center;"> </div>
												
												<div id="typeSelectDiv" style="display:none;">
													<input class="type" type="radio" id="party" name="type" value="party">
													<label class="typeLabel" for="party" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">派對</label> 
													<input class="type" type="radio" id="carnival" name="type" value="carnival">
													<label class="typeLabel" for="carnival" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">嘉年華</label>
													<input class="type" type="radio" id="show" name="type" value="show">
													<label class="typeLabel" for="show" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">酒展</label>
													<input class="type" type="radio" id="festival" name="type" value="festival">
													<label class="typeLabel" for="festival" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">節慶活動</label>
												</div>
												
												<div id="date${Activity.activityId}" class="ActivityDate" align=left>
													<p id="changeFormat${Activity.activityId}" style="margin: 10px">
													<input id="beginTime" class="inputBox" type="text" name="beginTime" value="${Activity.beginTime}" style="width:150px;height:32px;font-size:14px;display:inline;"> ~ 
													<input id="endTime" class="inputBox" type="text" name="endTime"  value="${Activity.endTime}" style="width:150px;height:32px;font-size:14px;display:inline;"></p>
												</div>
												<p align=left style="margin: 10px"><input id="address" type="text" name="address" value="${Activity.address}"> </p>
												<button id="${Activity.activityId}Bhidden${status.index}" class="closeAndOpen" type="button" style="width:120px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:31px">確認地圖</button>
												<div class="showEachMap">
													<div id="hidden${status.index}" class="hideMap">
														<button id="addressBtn" type="button" onclick="getInput()">根據地址自動設定</button><img id="smallok" src="images/ok.png" style="visibility:collapse;vertical-align:middle;">
														<div id="map"
															style="width: 350px; height: 500px; background: red">
														</div>
													</div>
												</div>
											</fieldset>
											
										</div>
										
									</div>
									
									
									<div style="width:500px;display:inline-block;">
										<div style="width:500px;height:140px;">
											<div style="display:inline-block;vertical-align:top;">
												<img src="images/unnamed.png" style="width:140px;height:140px;border:2px white solid;border-radius:20px;">
											</div>
											<div style="width:350px;height:140px;display:inline-block;padding:15px;">
												<p style="margin:0px">主辦人資訊</p>
												<c:if test="${not empty company}">
												<p align="left" style="margin:0px">店家:  ${company.companyName}</p>
												<p align="left" style="margin:0px">聯絡方式:  ${company.phone}</p>
												</c:if>
												<c:if test="${not empty user}">
												<p align="left" style="margin:0px">姓名: ${user.userName}</p>
												<p align="left" style="margin:0px">聯絡方式: ${user.phone}</p>
												</c:if>
											</div>
										
										</div>
										<div align=center style="margin: 10px">
											上限: <input id="limitNum" class="numSetting" type="text" name="limitNum" value="${Activity.limitNum}" style="width:50px;display:inline;height:32px;text-align:center;">人 / 
											成團: <input id="targetNum" class="numSetting" type="text" name="targetNum" value="${Activity.targetNum}" style="width:50px;display:inline;height:32px;text-align:center;">人 / 
											目前: <input id="actualNum" class="numSetting" type="text" name="actualNum" value="${Activity.actualNum}" style="width:50px;display:inline;height:32px;text-align:center;">人
										</div>
					
											<div id="outer${status.index}" class="outer" title="">
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
												<textarea id="brief" class="inputArea" name="brief" >${Activity.brief}</textarea>
										
											<p class="detail" align=center style="margin:0px;text-align:justify">
												<textarea id="detail" class="inputArea" name="detail" rows="10">${Activity.detail}</textarea>
											</p>
							
										</div>
									</div>
									<c:set var="hostId" value="${Activity.userId}"></c:set>
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
											//var changeFormat = document.getElementById('changeFormat${Activity.activityId}');
											//changeFormat.innerHTML = bT[0]+' '+bT[1]+' ~ '+eT[0].substring(5)+' '+eT[1];
											//var beginInput = document.getElementById('beginTime');
											//beginInput.value = bT[0]+' '+bT[1];
											//var endInput = document.getElementById('endTime');
											//beginInput.value = eT[0].substring(5)+' '+eT[1];
											
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
											
									//圖片預覽&&點擊圖片上傳
									
									function readURL(input) {
									  if (input.files && input.files[0]) {
									    var reader = new FileReader();
									    reader.onload = function(e) {
									      $('#imgDisplay').attr('src', e.target.result);
									    }
									    reader.readAsDataURL(input.files[0]);
									  }
									}
									$('#imgDisplay').on('click',function(){
										$("#uploadFile").click();
									})
									$("#uploadFile").change(function() {
									  readURL(this);
									});
									//個別進度條設定
									limitNum.push('${Activity.limitNum}');
									targetNum.push('${Activity.targetNum}');
									currentNum.push('${Activity.actualNum}');
									//console.log('status.index is:','${status.index}','limitNum is:',limitNum[0],'targetNum is:',targetNum,'currentNum is:',currentNum);
									//console.log('limit is: ',limitNum['${status.index}'],' target is: ',targetNum['${status.index}']);
									var fix = $('#groundD${status.index}').width()-20;
									//console.log('固定寬度: ',fix);
									if('${Activity.limitNum}'==999){
										//console.log('no limit')
										if('${Activity.targetNum}'!=0){
											//console.log('target != 0')
											per = fix/targetNum['${status.index}'];
											$('#targetFor${status.index}').width(fix);
											//console.log('目標寬度:',$('#targetFor${status.index}').width());
											//perNum.push(per);
											if(parseInt(currentNum['${status.index}'])>=parseInt(targetNum['${status.index}'])){
												$('#currentFor${status.index}').width(per*parseInt(targetNum['${status.index}']));
												//console.log('現在寬度:',$('#currentFor${status.index}').width());
												//console.log('人數無上限 有目標 已達標')
												$('#outer${status.index}').prop('title',"不限人數   已成團   現在: ${Activity.actualNum}人");
											}else{
												
												$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
												//$('#currentFor${status.index}').css('background-color','pink');
												//console.log('現在寬度:',$('#currentFor${status.index}').width());
												//console.log('人數無上限 有目標 未達標')
												$('#outer${status.index}').prop('title',"不限人數   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
											}
											
										}else if('${Activity.targetNum}'==0){
											//console.log('target = 0')
											per = fix/parseInt(currentNum['${status.index}']);
											$('#targetFor${status.index}').css('display','none');
											//perNum.push(per);
											$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
											//$('#currentFor${status.index}').css('background-color','pink');
											//console.log('現在寬度:',$('#currentFor${status.index}').width());
											//console.log('人數無上限 沒目標')
											$('#outer${status.index}').prop('title',"不限人數   直接成團   現在: ${Activity.actualNum}人");
										}
										$('#limitP${status.index}').css('display','none');
									}else{
										
										per = fix/parseInt(limitNum['${status.index}']);
										//console.log('has limit, per= ',per)
										$('#targetFor${status.index}').width(per*parseInt(targetNum['${status.index}']));
										//console.log('目標寬度: ',$('#targetFor${status.index}').width())
										//perNum.push(per);
										$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
										//$('#currentFor${status.index}').css('background-color','pink');
										//console.log('現在寬度:',$('#currentFor${status.index}').width());
										//console.log('人數有上限 可能有目標')
										$('#outer${status.index}').prop('title',"上限: ${Activity.limitNum}人   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
									}
									perNum.push(per);
									
									if(parseInt(currentNum['${status.index}'])>=parseInt(limitNum['${status.index}'])){
										$('#currentFor${status.index}').css('background-color','#b3b3b3');
										$('#targetFor${status.index}').css('display','none');
										$('#outer${status.index}').prop('title',"活動人數已滿");
									}else if(parseInt(currentNum['${status.index}'])>=parseInt(targetNum['${status.index}'])){
										$('#currentFor${status.index}').css('background-color','lightgreen');
										$('#targetFor${status.index}').css('display','none');
									}else{
										$('#currentFor${status.index}').css('background-color','pink');
									}
											//判斷EL是否為null
											var people = document.getElementById('people${status.index}');
											
											</script>
											<input id="lat" type="text" name="lat" value="${Activity.lat}">
											<input id="lng" type="text" name="lng" value="${Activity.lng}">
											<input id="preUrl" type="text" name="preUrl" value="${preUrl}">
											<input type="text" id="activityId" name="activityId" value="${Activity.activityId}">
											<input type="text" name="userId" value="${getUserId}${getCompanyId}">
											<input type="text" id="realType" name="realType" value="${Activity.type}">
											
											
											<input type="submit" value="確定">
											</form>
									</c:forEach><!-- -->
								
								</div>
								
							</div><!-- 這裡結束 -->
							
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//檢查地址是否輸入 限制定位按鈕
	var addressBtn = document.getElementById('addressBtn')
	if(document.getElementById('address').value==''){
			addressBtn.disabled=true;
		}else{
			addressBtn.disabled=false;
		}
	$('#address').on('blur',function(){
		if(document.getElementById('address').value==''){
			addressBtn.disabled=true;
		}else{
			addressBtn.disabled=false;
		}	
	})
	
	//點地圖儲存座標+小OK顯示
	var ok = document.getElementById("smallok")
	var checklat = document.getElementById("lat")
	$('#map').on("click", function(){
		checkMap();
		reloadMarkers();
		getMarkers(lat.value,lng.value,realType.value);
		console.log('temp marker:',lat.value,lng.value,realType.value)
	});
	function checkMap(){
		console.log("checkMap");
		if(checklat.value!=0){
			ok.style.visibility = 'visible';
		}
	}
	//地址按鈕
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
		document.getElementById('lat').value = locationLat;
		document.getElementById('lng').value = locationLng;
		relocate(locationLat, locationLng,realType.value);
		checkMap();
	}
	//更換活動類型直接改圖片設定
	var typeRadio = document.getElementsByClassName('type');
	var realType = document.getElementById('realType');
	var tempValue;

	$('#typeDisplay').on('click',function(){
		tempValue = this.title;
		document.getElementById(tempValue).checked = true;
		if($('#typeSelectDiv').css('display')=='none'){
			$('#typeSelectDiv').css('display','block');
		}else{
			$('#typeSelectDiv').css('display','none');
		}
		
	})
	$('.type').on('click',function(){
		tempValue = this.id
		realType.value = tempValue;
		var typeDisplay = document.getElementById('typeDisplay');
		typeDisplay.src = 'images/'+tempValue+'.png';
		typeDisplay.title = tempValue;
		reloadMarkers();
		getMarkers(lat.value,lng.value,realType.value);
	})
	
	//設定currentId給超連結
	$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);
	//個別地圖展開
	$('.closeAndOpen').on('click', function(){
		var tempId = this.id;
		console.log('tempId is:',tempId);
		var activityId = tempId.substring(0,4);
		var indexNum = tempId.substring(11);
		var prefix = 'ActivityActivityId';
		//reloadMarkers(prefix,activityId,indexNum);
		//getMarkers(prefix,activityId,indexNum);
		reloadMarkers();
		getMarkers(lat.value,lng.value,realType.value);
		if($('#hidden'+indexNum).css('display')=='none'){
			$('#hidden'+indexNum).css('display','block');
		}else {
			$('#hidden'+indexNum).css('display','none');	
		}
	})

	//計算地圖數量
	console.log('number is: ',number);
	var pre=[];
	for(var i=0;i<number;i++){
		pre.push('map'+i);
	}
	console.log('pre is: ',pre);
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
	<script src="scripts/mapForCreateActivity.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script>
	<c:if test="${not empty errors}">
	console.log('errors has data','${errors}');
	if('${errors.name}'!=''){
		document.getElementById('name').style.border = '1px red solid';
	}
	if('${errors.type}'!=''){
		document.getElementById('typeDiv').style.border = '1px red solid';
	}
	if('${errors.beginTime}'!=''){
		document.getElementById('beginTime').style.border = '1px red solid';
	}
	if('${errors.endTime}'!=''){
		document.getElementById('endTime').style.border = '1px red solid';
	}
	if('${errors.address}'!=''){
		document.getElementById('address').style.border = '1px red solid';
	}
	if('${errors.map}'=='尚未點選地圖設定地點'){
		mapBtn.style.border = '2px red solid';
		mapBtn.innerHTML = '尚未點選地圖設定地點';
	}
	
	if('${errors.limitNum}'!=''){
		document.getElementById('limitNum').style.border = '1px red solid';
	}
	if('${errors.targetNum}'!=''){
		document.getElementById('targetNum').style.border = '1px red solid';
	}
	if('${errors.actualNum}'!=''){
		document.getElementById('actualNum').style.border = '1px red solid';
	}
	if('${errors.brief}'!=''){
		document.getElementById('brief').style.border = '1px red solid';
	}
	if('${errors.detail}'!=''){
		document.getElementById('detail').style.border = '1px red solid';
	}
</c:if>
	<c:if test="${not empty temp}">
	console.log('temp has data','${temp}');
	/**/
	document.getElementById('name').value = '';
	document.getElementById('beginTime').value = '';
	document.getElementById('endTime').value = '';
	document.getElementById('address').value = '';
	document.getElementById('limitNum').value = '';
	document.getElementById('targetNum').value = '';
	document.getElementById('actualNum').value = '';
	document.getElementById('brief').value = '';
	document.getElementById('detail').value = '';
	if('${temp.name}'!=''){
		document.getElementById('name').value = '${temp.name}';
	}
	if('${temp.type}'!='no'){
		document.getElementById('${temp.type}').checked = true;
		realType.value = '${temp.type}';
	}
	if('${temp.beginTime}'!=''){
		document.getElementById('beginTime').value = '${temp.beginTime}';
	}
	if('${temp.endTime}'!=''){
		document.getElementById('endTime').value = '${temp.endTime}';
	}
	if('${temp.address}'!=''){
		document.getElementById('address').value = '${temp.address}';
	}
	if('${temp.lat}'!='0.0'&&'${temp.lng}'!='0.0'){
		document.getElementById('lat').value = '${temp.lat}';
		document.getElementById('lng').value = '${temp.lng}';
		getMarkers(lat.value,lng.value,realType.value);
		checkMap();
		//mapBtn.innerHTML = '修改地圖位置';
	}
	if('${temp.limitNum}'!='null'){
		document.getElementById('limitNum').value = '${temp.limitNum}';
	}
	if('${temp.targetNum}'!='null'){
		document.getElementById('targetNum').value = '${temp.targetNum}';
	}
	if('${temp.actualNum}'!='null'){
		document.getElementById('actualNum').value = '${temp.actualNum}';
	}
	if('${temp.brief}'!=''){
		document.getElementById('brief').value = '${temp.brief}';
	}
	if('${temp.detail}'!=''){
		document.getElementById('detail').value = '${temp.detail}';
	}
	if('${temp.preUrl}'!=''){
		document.getElementById('preUrl').value = '${temp.preUrl}';
	}
</c:if>
	</script>
	
	<!-- 小鈴鐺 -->
	<!-- 
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		});
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	 -->
</body>
</html>