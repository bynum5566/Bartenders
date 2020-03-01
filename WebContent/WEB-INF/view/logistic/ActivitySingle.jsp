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
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyle.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
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
		position:relative;
		left:0%;
		padding:10px;
		margin: 0px auto;/*div對齊效果*/
  		text-align: center;
		}
	    /* 以下是搜尋地圖設定*/
		.searchDiv {
			margin: auto;
			width:800px;
			height: 800px;
			display:none;
		}
		.mapDiv {
			height: 800px;
			width: 800px;
		}

		/*以下是搜尋框設定*/
		.chooseType{
			position:fixed;
			top:-10%;
			right:0%;
			background-color:lightgrey;
			width:150px;
			height: 400px;
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
				<div class="inner">
					<section>
						<div class="row">
							<div class="col-12 col-12-medium"><!-- 這裡開始 -->
								<h1 align="center">活動詳情</h1>
								<div class="container">
									<c:forEach var="Activity" items="${activity}" varStatus="status">
										<div class="each" id="${Activity.activityId}">
											<fieldset style="width: 350px;border-radius:30px">
												<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
												<img class="img" alt="未選擇圖片" style="margin: 5px"
													src="images/${Activity.img}"> <img class="imgType"
													alt="未設定類型" title="${Activity.type}" src="images/${Activity.type}.png" style="margin: 0px 10px 0px 0px">
												<div class="ActivityName">${Activity.name}</div>
												<div id="date${Activity.activityId}" class="ActivityDate"
													align=left>
													<p id="changeFormat${Activity.activityId}" style="margin: 10px"></p>
						
												</div>
												<p align=left style="margin: 10px">${Activity.address} <button id="${Activity.activityId}Bhidden${status.index}" class="closeAndOpen" type="button">確認地圖</button></p>
												
												<div class="showEachMap">
													<div id="hidden${status.index}" class="hideMap">
														<div id="map${status.index}"
															style="width: 350px; height: 350px; background: red"></div>
													</div>
												</div>
												<div align=left style="margin: 10px">
													<c:choose>
														<c:when test="${empty Activity.targetNum}">
															<p>活動人數不限</p>
														</c:when>
														<c:when test="${Activity.limitNum-Activity.actualNum>0}">
															<p id="people${status.index}" class="number">參加人數:${Activity.actualNum} / ${Activity.limitNum} 我想報名:</p>
															<form align=right action="joinActivity.do" method="post" >
																<input type="hidden" name="activityId" value="${Activity.activityId}" > 
																<input id="userInput" type="hidden" name="userId" value="${getUserId}${getCompanyId}">
																<select name="joinNum" style="width:130px;display:inline;">
																	<c:forEach begin="1"
																		end="${Activity.limitNum-Activity.actualNum}"
																		varStatus="add">
																		<option value="${add.index}" style="width:130px;display:inline;">${add.index}人</option>
																	</c:forEach>
																</select>
																<input type="submit" value="確定" style="width:50px;display:inline;">
															</form>
														</c:when>
														<c:otherwise>
															<p>參加人數已滿</p>
														</c:otherwise>
													</c:choose>
												</div>
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
												
												<p class="brief" align=center style="width: 340px; margin: 5px; text-align: justify">${Activity.brief}</p>
												<input type="hidden" name="preUrl" value="${preUrl}">
												
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
											console.log('status.index is:','${status.index}','limitNum is:',limitNum[0],'targetNum is:',targetNum,'currentNum is:',currentNum);
											var fix = $('#groundD').width()-20;
											console.log(' limit is: ',limitNum['${status.index}'],' target is: ',targetNum['${status.index}']);
											per = fix/limitNum['${status.index}'];
											perNum.push(per);
											console.log('per is:',per);
											$('#targetFor${status.index}').width(per*targetNum['${status.index}']);
											$('#currentFor${status.index}').width(per*currentNum['${status.index}']);
											$('#currentFor${status.index}').css('background-color','pink');
											
											if(currentNum['${status.index}']>=targetNum['${status.index}']){
												console.log('target reached',typeof currentNum['${status.index}'],' > ',typeof targetNum['${status.index}']);
												console.log('target reached',currentNum['${status.index}'],' > ',targetNum['${status.index}']);
												$('#currentFor${status.index}').css('background-color','lightgreen');
												$('#targetFor${status.index}').css('display','none');
											}
											//判斷EL是否為null
											var people = document.getElementById('people${status.index}');
											</script>
									</c:forEach>
								</div>
								<div class="participate">
									<h1>活動參加者</h1>
									<table>
										<tr>
											<td>姓名</td>
											<td>手機</td>
											<td>人數</td>
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
</body>
</html>