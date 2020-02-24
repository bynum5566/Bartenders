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
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBarForSingleActivity.css">
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
				<label>搜尋日期:</label>
				<label><input id="beginTime" class="date" type="text" name="beginTime" placeholder="開始時間"></label>
				<br>
				<label><input id="endTime" class="date" type="text" name="endTime" placeholder="結束時間"></label>
				<br>
				<label><button id="clearTime" type="button" onclick="clearDate()" >清除時間</button></label>
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
		beginTime.addEventListener('blur', function(){
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
								<c:when test="${empty Activity.targetNum}">
									<p>活動人數不限</p>
								</c:when>
								<c:when test="${Activity.limitNum-Activity.actualNum>0}">
									<p id="people${status.index}" class="number" align=left
										style="display: inline; margin: 0px;">參加人數:
										${Activity.actualNum} / ${Activity.limitNum}</p>
									<p align=right style="display: inline; margin: 0px;">我想報名:</p>
									
									<form align=right action="joinActivity.do" method="post" style="display: inline; margin: 0px;">
										<input type="hidden" name="userId" value="${Activity.userId}">
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
	<label>輸入上限<input id="limitNum" type="text" name="limit"></label><br>
	<label>輸入目標<input id="targetNum" type="text" name="target"></label><br>
	<input type="submit" onclick="reSet()" value="設定"><br>
	<button id="per">增加1份</button>
	<script>
	/*
	var testAry = new Array(5);
	for(var i=0; i<5;i++){
		testAry[i] = new Array();
		for(var y=0; y<5;y++){
			testAry[i][y]=''+i+','+y+'';
		}
	}
	console.log('this is test ary:',testAry);
	console.log('this is test ary:',testAry[2].length);
	*/
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
	//我想參加
	$(".join").on("click",function() {
		var activityId = this.id
		window.location.href = '<c:url value="/closeActivity.do"/>?userId='+ userId + '&activityId=' + activityId;
		})
	//關閉活動
	$(".close").on("click",function() {
		var Str = this.id
		var activityId = Str.substring(1,5);
		var userId = Str.substring(5);
		window.location.href = '<c:url value="/closeActivity.do"/>?userId='+ userId + '&activityId=' + activityId;
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
		
	//以下用於彈出視窗
	var baseText = null;

	function showPopup(w,h){
		console.log('button ready');
		var popUp = document.getElementById('popupcontent');
		popUp.style.top = '100px';
		popUp.style.left = '100px';
		popUp.style.width = w+'px';
		popUp.style.height = h+'px';
		if (baseText == null){
			baseText = popUp.innerHTML;//這是一個DIV彈窗效果!
		}
			popUp.innerHTML = baseText+'<div id=\'statusbar\'><button onclick=\'hidePopup();\'>Close window</button></div>';
			var sbar = document.getElementById('statusbar');
			sbar.style.marginTop = (parseInt(h)-140)+'px';
			popUp.style.visibility = 'visible';
		
	};
	
	function hidePopup(){
		var popUp = document.getElementById('popupcontent');
		console.log('click hide');
		popUp.style.visibility = 'hidden';
	};
	//回上頁
	$(".return").on("click", function() {
		window.location.href = '<c:url value="/queryAllActive.do"/>';
	})
	/*
	$('#showMap').on('click',function(){
		
		showPopup(150,150);
	})
	*/
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