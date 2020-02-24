<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動大廳</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyle.css">
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
float: right;
	position: relative;
	left: 0%;
	text-align: left;
	
	
	/*
	
		position: absolute;
	left: 50%;
	transform: translateX(-50%);
	border:1px solid black;
*/
}

/* 以下是搜尋地圖設定*/
.searchDiv {
	margin: auto;
	border:2px black solid;
	width:800px;
	height: 800px;
	display:none;
}

.chooseType{
	border:2px black solid;
	width:150px;
	height: 400px;
	display: inline-block;
	vertical-align:top;
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
width:130px;
}

table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

fieldset {
	text-align: center;
	width: 1200px;
}
.mapDiv {
	height: 600px;
	width: 600px;
	display: inline-block;
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
	<h1 align=center>活動大廳</h1>

	<button id="openSearch" type="button" >地圖搜尋</button>
	<section>
		<div class="searchDiv" align=center>
		<div id="map0" class="mapDiv"></div>
		<div id="choose" class="chooseType" >
			<form class="formBox">
				<label>搜尋類型:</label>
				<label><input type="checkbox" class="multi" name="type2" value="bar">酒吧</label>
				<label><input type="checkbox" class="multi" name="type2" value="shop">專賣店</label>
				<label><input type="checkbox" class="multi" name="type2" value="show">酒展</label>
				<label><input type="checkbox" class="multi" name="type2" value="party">派對</label>
				<br>
			</form>
			<form class="formBox">
				<label>搜尋狀態:</label>
				<label><input type="checkbox" class="multi" name="ready" value="ready">已成團</label>
				<label><input type="checkbox" class="multi" name="available" value="available">還有空位</label>
				<br>
			</form>
			<form class="formBox">
				<label>搜尋日期:</label>
				<label><input id="beginTime" class="date" type="text" name="beginTime" placeholder="開始時間"></label>
				<br>
				<label><input id="endTime" class="date" type="text" name="endTime" placeholder="結束時間"></label>
				<br>
				<label><button id="clearTime" type="button" onclick="clearDate()" >清除時間</button></label>
				<br>
			</form>
			
			<hr>
			<label><button id="jokerBtn" type="button" onclick="queryJoker()" >整合搜尋</button></label>
		</div>
	</div>
	</section>
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
			minTime : current,
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
			minTime : current,
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
				jokerList.push('null');
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
		
		console.log('jokerList: ',jokerList,' ;',typeof jokerList);
		//window.location.href = '<c:url value="/Activitytest.do"/>?Object='+jokerList;
		reloadMarkers("ActivityJoker",jokerList,0);
		getMarkers("ActivityJoker",jokerList,0);
	}
	
	
	</script>
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
								<c:when test="${Activity.limitNum==999}">
									<p>參加人數不限</p>
									<c:if test="${Activity.actualNum>=Activity.targetNum}">
										<p>已成團</p>
									</c:if>
									<c:if test="${Activity.actualNum<Activity.targetNum}">
										<p>未成團</p>
									</c:if>
								</c:when>
								<c:when test="${Activity.actualNum==Activity.limitNum}">
									<p>活動人數已滿</p>
									<c:if test="${Activity.actualNum>=Activity.targetNum}">
										<p>已成團</p>
									</c:if>
									<c:if test="${Activity.actualNum<Activity.targetNum}">
										<p>未成團</p>
									</c:if>
								</c:when>
								<c:otherwise>
									<p>目前人數${Activity.actualNum} / ${Activity.limitNum} </p>
									<c:if test="${Activity.actualNum>=Activity.targetNum}">
										<p>已成團</p>
									</c:if>
									<c:if test="${Activity.actualNum<Activity.targetNum}">
										<p>未成團</p>
									</c:if>
								</c:otherwise>
							</c:choose>
							
						</div>
						<div class="outer">
							<div id="groundD" class="ground">
								<p id="limitP${status.index}" class="limitP NP" title="上限: ${Activity.limitNum}人"><img src="images/arrowLimit.png"></p>
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
						<span>
							<button id="single${Activity.activityId}" class="singlePage">進入活動頁面</button>
						</span>
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
					var fix = $('#groundD').width()-20;
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
	</section>
	<label>輸入上限<input id="limitNum" type="text" name="limit"></label><br>
	<label>輸入目標<input id="targetNum" type="text" name="target"></label><br>
	<input type="submit" onclick="reSet()" value="設定"><br>
	<button id="per">增加1份</button>
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
	
	//進度條
	var fix = $('#ground').width()-20;
	console.log('fix width: ',fix);
	var per;
	var limitNum = document.getElementById('limitNum');
	var targetNum = document.getElementById('targetNum');
	var currentNum = 0;
	var total = document.getElementById('currentD');
	var current;
	var reach;
	var target;
	function reSet(){
		console.log(' limit is: ',limitNum.value,' target is: ',targetNum.value);
		per = fix/limitNum.value;
		reach = per*targetNum.value;
		currentNum = 0;
		console.log('per is:',per);
		console.log('reach is:',reach);
		$('#targetD').width(reach);
		$('#currentD').width(0);
		$('#currentD').css('background-color','pink');
	}
	$('#per').on('click',function(){
		currentNum++;
		console.log('number is: ',currentNum,'/',targetNum.value)
		current = $('#currentD').width();
		console.log('jquery current is: ',current);
		$('#currentD').width(current+per);
		console.log('jquery after is: ',$('#total').width());
		if(currentNum==targetNum.value){
			console.log('target reached')
			$('#currentD').css('background-color','lightgreen');
			$('#targetP').css("display","none");
		}
		
	})
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
	
		
		
	//地圖搜尋
	$("#search").on("click",function() {
		window.location.href = '<c:url value="/searchMarker"/>';
		})
	//編輯
	$(".edit").on("click",function() {
		var Str = this.id
		var array = Str.split("-")
		
		window.location.href = '<c:url value="/editActivity.do"/>?activityId=' + array[1];
		})
		
		listButton = $('button[id^="O"][class*="visible"]');
		listButton.attr("style", "display:block;");
		
	//回上頁
	$(".return").on("click", function() {
		window.location.href = '<c:url value="/queryAllActive.do"/>';
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
	<script src="scripts/mapForActivity.js"></script>
	<script>
	
	</script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<%@ include file="../menu.jsp"%>

</body>
</html>