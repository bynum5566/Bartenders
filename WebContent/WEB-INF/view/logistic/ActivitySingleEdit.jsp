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
	<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		
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
					<div id="menu">
						<ul>
						<c:if test="${testV>499999}">
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
								<form action="updateActivity.do" method="post" enctype="multipart/form-data">
								<div style="background-color:darkgrey;border-radius:20px;">
									<div style="display:inline-block;vertical-align:top;">
										<div class="each" id="${Activity.activityId}" >
											<fieldset style="width: 350px;border-radius:30px;text-align: center;">
												<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
												<img id="imgDisplay" class="img" alt="未選擇圖片" style="margin: 0px 5px 0px 5px;padding:0px;" src="images/${Activity.img}"> 
												<img id="typeDisplay" class="imgType" alt="未設定類型" title="${Activity.type}" src="images/${Activity.type}.png" style="margin: 0px 10px 0px 0px">
												
												<div class="ActivityName"><input class="inputBox" type="text" name="name" value="${Activity.name}" style="height:50px;font-size:26px;font-weight:bold;line-height:50px;text-align:center;"> </div>
												
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
												<input type="text" id="realType" name="realType" value="${Activity.type}">
												<div id="date${Activity.activityId}" class="ActivityDate" align=left>
													<p id="changeFormat${Activity.activityId}" style="margin: 10px">
													<input id="beginTime" class="inputBox" type="text" name="beginTime" value="${Activity.beginTime}" style="width:150px;height:32px;font-size:14px;display:inline;"> ~ 
													<input id="endTime" class="inputBox" type="text" name="endTime"  value="${Activity.endTime}" style="width:150px;height:32px;font-size:14px;display:inline;"></p>
												</div>
												<p align=left style="margin: 10px"><input type="text" name="address" value="${Activity.address}"> </p>
												<button id="${Activity.activityId}Bhidden${status.index}" class="closeAndOpen" type="button" style="width:120px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:31px">確認地圖</button>
												<div class="showEachMap">
													<div id="hidden${status.index}" class="hideMap">
														<div id="map${status.index}"
															style="width: 350px; height: 500px; background: red"></div>
													</div>
												</div>
												
												<!-- 
												<p class="brief" align=center style="width: 340px; margin: 5px; text-align: justify">${Activity.brief}</p>
												-->
												<input type="hidden" name="preUrl" value="${preUrl}">
												
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
													<c:choose>
														<c:when test="${Activity.limitNum==999}">
															<span>參加人數不限</span>
															<span id="people${status.index}" class="number">目前人數:${Activity.actualNum}</span>
															<c:if test="${Activity.targetNum==0}">
																<span>直接成團</span>
															</c:if>
															<c:if test="${Activity.actualNum>=Activity.targetNum&&Activity.targetNum!=0}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum&&Activity.targetNum!=0}">
																<span>未成團</span>
															</c:if>
															
														</c:when>
														<c:when test="${Activity.actualNum==Activity.limitNum}">
															<span>活動人數已滿</span>
															<c:if test="${Activity.targetNum==0}">
																<span>直接成團</span>
															</c:if>
															<c:if test="${Activity.actualNum>=Activity.targetNum&&Activity.targetNum!=0}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum&&Activity.targetNum!=0}">
																<span>未成團</span>
															</c:if>
														</c:when>
														<c:otherwise>
															<span>目前人數${Activity.actualNum} / ${Activity.limitNum}</span>
															<c:if test="${Activity.targetNum==0}">
																<span>直接成團</span>
															</c:if>
															<c:if test="${Activity.actualNum>=Activity.targetNum&&Activity.targetNum!=0}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum&&Activity.targetNum!=0}">
																<span>未成團</span>
															</c:if>
														
														</c:otherwise>
													</c:choose>
													
												</div>
												<div style="position:relative;">
												<div class="outer">
													<div id="groundD" class="ground">
														<p class="limitP NP" title="上限: ${Activity.limitNum}人"><img src="images/arrowLimit.png"></p>
														<div id="targetFor${status.index}" class="targetD">
															<p class="targetP NP" title="成團: ${Activity.targetNum}人"><img src="images/arrowTarget.png"></p>
														</div>
														<div id="currentFor${status.index}" class="currentD NP">
															<p class="currentP NP" title="現在: ${Activity.actualNum}人"><img src="images/arrowCurrent.png"></p>
														</div>
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
	//var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
	//window.open(dlLink);
	
	//更換活動類型直接改圖片設定
	var typeRadio = document.getElementsByClassName('type');
	var realType = document.getElementById('realType');
	var tempValue;

	$('#typeDisplay').on('click',function(){
		tempValue = this.title;
		document.getElementById('carnival').checked = true;
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
		reloadMarkers(prefix,activityId,indexNum);
		getMarkers(prefix,activityId,indexNum);

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
	<script src="scripts/mapForActivity.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	
	
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