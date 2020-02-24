<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動詳情</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBarForSingleActivity.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyle.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
<style>
body {
	margin: 0px auto;
}

.container {
	position: relative;
	border:1px solid red;
	width: 1200px;
	margin: 20px auto 0 auto;
	padding: 20px;
	border-radius: 10px;
}



.float_center {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	border:1px solid black;
/*
	float: right;
	position: relative;
	left: -50%;
	text-align: left;
*/
}

.participate{
position: fixed;
width:200px;
height:500px;
right:100px;
border:1px solid black;
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
<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1 align=center>活動詳情</h1>
	<section class="container">
		<div class="float_center">
			<c:forEach var="Activity" items="${activity}" varStatus="status">
				<div class="each" id="${Activity.activityId}">
					<fieldset style="width: 350px;border-radius:30px">
						<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
						<img class="img" alt="未選擇圖片" style="margin: 5px"
							src="images/${Activity.img}"> <img class="imgType"
							alt="未設定類型" title="${Activity.type}" src="images/beer.png" style="margin: 0px 10px 0px 0px">
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
									<p id="people${status.index}" class="number" align=left
										style="display: inline; margin: 0px;">參加人數:
										${Activity.actualNum} / ${Activity.limitNum}</p>
									<p align=right style="display: inline; margin: 0px;">我想報名:</p>
									
									<form align=right action="joinActivity.do" method="post" style="display: inline; margin: 0px;">
										<input id="userInput" type="text" name="userId" value="disconnect">
										<input type="hidden" name="activityId" value="${Activity.activityId}"> 
										<select name="joinNum">
											<c:forEach begin="1"
												end="${Activity.limitNum-Activity.actualNum}"
												varStatus="add">
												<option value="${add.index}">${add.index}</option>
											</c:forEach>
										</select>
										<p align=right style="display: inline; margin: 0px;">人</p>
										<input type="submit" value="確定">
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
						<p class="brief" align=center
							style="width: 340px; margin: 5px; text-align: justify">${Activity.brief}</p>
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
	</section>
	<section class="participate">
		<div>
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
	</section>
	<script>
	console.log('接收到的activity: ','${activity}');
	var preUrl = "${preUrl}";
	console.log(preUrl);
	
	
	//撈取登入者身分
	console.log('preUrl=','${preUrl}');
	var user = '${getUser.userId}';
	console.log('userId is: ','${getUser.userId}');
	var company = '${getCompany.companyId}';
	console.log('companyId is: ','${getCompany.companyId}');
	
	var targetId;
	<c:if test='${empty getUser.userId}'>
		targetId = '${getCompany.companyId}';
		<c:set var="targetId" scope="page" value='${getCompany.companyId}'/>
	</c:if>
	<c:if test='${empty getCompany.companyId}'>
		targetId = '${getUser.userId}';
		<c:set var="targetId" scope="page" value='${getUser.userId}'/>
	</c:if>
	console.log('searching targetId: ','${targetId}')
	$('#userInput').val('${targetId}');
	
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

	
	console.log('number is: ',number);
	var pre=[];
	for(var i=0;i<number;i++){
		pre.push('map'+i);
	}
	console.log('pre is: ',pre);
	
	</script>
	<!--  -->
	<script src="scripts/MapStyle.js"></script>
	<script src="scripts/initMap.js"></script>
	<script src="scripts/getMarker.js"></script>
	<script>
	
	</script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<%@ include file="../menu.jsp"%>
	<!-- 
	<script>
		var searchMap = new google.maps.Map(document.getElementById('searchMap'),mapStyle);
	</script>
 -->
</body>
</html>