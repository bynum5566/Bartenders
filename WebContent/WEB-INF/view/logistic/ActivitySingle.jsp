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
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBarInfo.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyleForSingle.css">
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
								<h1 align="center" style="font-size:48px;margin:5px;">活動詳情</h1>
								
								
								<div class="container">
								<c:forEach var="Activity" items="${activity}" varStatus="status">
								<div style="background-color:darkgrey;border-radius:20px;">
									<div style="display:inline-block;vertical-align:top;">
										<div class="each" id="${Activity.activityId}" >
											<fieldset style="width: 350px;border-radius:30px;text-align: center;">
												<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
												<img class="img" alt="未選擇圖片" style="margin: 0px 5px 0px 5px;padding:0px;"
													src="images/${Activity.img}"> <img class="imgType"
													alt="未設定類型" title="${Activity.type}" src="images/${Activity.type}.png" style="margin: 0px 10px 0px 0px">
												<div class="ActivityName">${Activity.name}</div>
												<div id="date${Activity.activityId}" class="ActivityDate" align=left>
													<p id="changeFormat${Activity.activityId}" style="margin: 10px"></p>
												</div>
												<p align=left style="margin: 10px">${Activity.address} </p>
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
											<p style="margin:5px;font-size:24px;">主辦人資訊</p>
											<div style="display:inline-block;vertical-align:top;">
												<c:if test="${not empty company}">
													<img src="images/host.png" style="width:140px;height:140px;border:2px white solid;border-radius:20px;margin:0px 0px 10px 0px;">
												</c:if>
												<c:if test="${not empty user}">
													<img src="images/host2.png" style="width:140px;height:140px;border:2px white solid;border-radius:20px;margin:0px 0px 10px 0px;">
												</c:if>
											</div>
											<div style="width:350px;height:140px;display:inline-block;padding:15px;">
												
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
															<c:if test="${Activity.actualNum>=Activity.targetNum}">
																<span>已成團</span>
															</c:if>
															<c:if test="${Activity.actualNum<Activity.targetNum}">
																<span>未成團</span>
															</c:if>
															
															<form action="joinActivity.do" method="post" style="margin:0px;vertical-align:middle;">
															<span>我想報名:
																<select name="joinNum" style="width:90px;height:40px;padding:5px;display:inline;">
																	<c:forEach begin="1"
																		end="20"
																		varStatus="add">
																		<option value="${add.index}" style="width:50px;display:inline;">${add.index}人</option>
																	</c:forEach>
																</select>
																<input type="hidden" name="activityId" value="${Activity.activityId}" > 
																<input id="userInput" type="hidden" name="userId" value="${getUserId}${getCompanyId}">
																<input type="submit" value="確定" style="width:80px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:31px">
																</span>
															</form>
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
															
															<form action="joinActivity.do" method="post" style="margin:0px;vertical-align:middle;">
															<span>我想報名:
																<select name="joinNum" style="width:90px;height:40px;padding:5px;display:inline;">
																	<c:forEach begin="1"
																		end="${Activity.limitNum-Activity.actualNum}"
																		varStatus="add">
																		<option value="${add.index}" style="width:50px;display:inline;">${add.index}人</option>
																	</c:forEach>
																</select>
																<input type="hidden" name="activityId" value="${Activity.activityId}" > 
																<input id="userInput" type="hidden" name="userId" value="${getUserId}${getCompanyId}">
																<input type="submit" value="確定" style="width:80px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:31px">
																</span>
															</form>
														</c:otherwise>
													</c:choose>
													
												</div>
												<div style="position:relative;">
												<!-- 
												<div class="outer">
													<div id="groundD${status.index}" class="ground">
														<p class="limitP NP" title="上限: ${Activity.limitNum}人"><img src="images/arrowLimit.png"></p>
														<div id="targetFor${status.index}" class="targetD">
															<p class="targetP NP" title="成團: ${Activity.targetNum}人"><img src="images/arrowTarget.png"></p>
														</div>
														<div id="currentFor${status.index}" class="currentD NP">
															<p class="currentP NP" title="現在: ${Activity.actualNum}人"><img src="images/arrowCurrent.png"></p>
														</div>
													</div>
												</div>
												 -->
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
												</div>
											
											<textarea id="brief" class="brief" name="brief" >${Activity.brief}</textarea>
											<textarea id="detail" class="detail" name="detail">${Activity.detail}</textarea>
											<!-- 
											<p class="brief" align=center style="height:40px;line-height:40px;padding:0px 20px 0px 20px;margin:0px 5px 0px 5px; text-align: center">${Activity.brief}</p>
											<p class="detail" align=center >${Activity.detail}</p>
											 -->
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
											var changeFormat = document.getElementById('changeFormat${Activity.activityId}');
											changeFormat.innerHTML = bT[0]+' '+bT[1]+' ~ '+eT[0].substring(5)+' '+eT[1];
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
													if(${Activity.actualNum>=Activity.targetNum}){
														
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
									</c:forEach>
								
								</div>
								
							</div><!-- 這裡結束 -->
							<c:if test="${hostId==testV}">
								<div id="participate" style="margin:10px;">
									<h1>活動參加者</h1>
									<table>
										<tr>
											<td style="width:120px;">姓名</td>
											<td style="width:140px;">手機</td>
											<td style="width:90px;">人數</td>
										</tr>
										
											<c:forEach var="Participant" items="${participant}" varStatus="status">
												<tr>
													<td>${Participant.name}</td>
													<td>${Participant.phone}</td>
													<td>${Participant.together}</td>
												</tr>
											</c:forEach>
										
									</table>
								</div>
							</c:if>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
	//window.open(dlLink);
	
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
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		});
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	
</body>
</html>