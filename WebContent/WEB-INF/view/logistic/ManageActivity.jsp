<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateActivity</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
	margin: 0px auto;
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

#map {
	height: 600px;
	width: 600px;
}

.container{

	width: 1200px;
	margin: 20px auto 0 auto;
	padding: 20px;
	border-radius: 10px;
}

.float_center{
	float: right;
	position: relative;
	left: -50%; /* or right 50% */
	text-align: left;
}

.each{
	position: relative;
	left: 50%;
	float:left;
}

.img{
width:350px;
height:350px;
border:lightgrey 1px solid;
/*float:left;*/
}

.imgType {
float:right;
}

.ActivityName{
color:orange;
font-weight:bold;
font-size:24px;
border:lightgrey 1px solid;
margin: 10px 10px 0px 10px;
/*float:left;*/
width:300px;
height:26px;

overflow:hidden;/*超出的文本隐藏*/
text-overflow:ellipsis;/*溢出用省略号显示*/
white-space:nowrap;/*溢出不换行*/
}
.ActivityDate{
margin: 0px;
}

.singleDate{
display:inline-block;
}

.brief{
border:lightgrey 1px solid;
padding:5px;
}

#popupcontent{
position: relative;
/**/
visibility: hidden;

overflow: hidden;
border:1px solid #CCC;


padding:5px;
}

.showEachMap{
		width: auto;
        display: block;
        margin: 0 auto;
        /*网页中内容居中显示*/
        padding: 5px;
        font-size: 9pt;
        /* 9pt的字体是没有锯齿的  */
        height: auto;
        /*因整个div部分，会有一部分动态显示或者隐藏，所以将高度设为auto*/
    }
    #hiddenx{
        display: none;
    }
    .hideMap{
    	display: none;
    }
    .hiddenBtn{
        background-color: grey;

        text-align: center;
        margin: 0 auto;
        display: block;
  
        text-decoration: none;
        padding-top: 10px;
    }
</style>
<script>
var number = 0;
</script>
<body >
	<h1 align=center>管理活動</h1>
	<div align=center>
		<table>
			<tr>
				<td>
					<button id="search" class="mapType">地圖搜尋</button>
					<button class="return">返回活動大廳</button>
					
				</td>
			</tr>
			<tr>
				<td>
					<button id="1000" class="activity">查詢1000</button>
					<button id="1001" class="activity">查詢1001</button>
					<button id="1002" class="activity">查詢1002</button>
				</td>
			</tr>
		</table>
	</div>
	<section class="container">
	<div class="float_center">
	<c:forEach var="Activity" items="${activity}" varStatus="status">
	<div class="each" id="${Activity.activityId}" >
			<fieldset style="width: 350px" >
				<legend>活動${status.index+1} - 活動ID:${Activity.activityId}</legend>
					<img class="img" alt="未選擇圖片" style="margin: 5px"  src="images/${Activity.img}" >
					<img class="imgType" alt="未設定類型" title="${Activity.type}" src="images/beer.png" >
					<div class="ActivityName" >${Activity.name}</div>
					<div id="date${Activity.activityId}" class="ActivityDate" align=left >
						<p id="changeFormat${status.index}"></p>
					
					</div>
					<p align=left style="margin: 10px">${Activity.address}</p><button id="Bhidden${status.index}" type="button" >確認地圖</button>
						<div class="showEachMap">
							<div id="hidden${status.index}" class="hideMap" >
								<div id="map${status.index}" style="width:500px;height:500px;background:red"></div>
							</div>
						</div>
						<div>
						<c:choose>
						<c:when test="${empty Activity.targetNum}">
							<p>活動人數不限</p>
						</c:when>
						<c:when test="${Activity.targetNum-Activity.actualNum>0}">
						<p id="people${status.index}" class="number" align=left style="display:inline;margin: 0px;">參加人數: ${Activity.targetNum} / ${Activity.actualNum}  	</p>
						<p align=right style="display:inline;margin: 0px;">   我想報名:</p>
						<form align=right action="joinActivity.do" method="post" style="display:inline;margin: 0px;">
							<input type="hidden" name="userId" value="${Activity.userId}" >
							<input type="hidden" name="activityId" value="${Activity.activityId}" >
							<select name="joinNum">
								<c:forEach begin="1" end="${Activity.targetNum-Activity.actualNum}" varStatus="status">
									<option value="${status.index}" >${status.index}</option>
								</c:forEach>
							</select>
							<p align=right style="display:inline;margin: 0px;">人</p>
							<input type="submit" value="確定">
						</form>
						</c:when>
						<c:otherwise>
					        <p>參加人數已滿</p>
					    </c:otherwise>
					</c:choose>
						</div>
					<p class="brief" align=center style=";width:340px;margin: 5px;text-align:justify" >${Activity.brief}</p>
					<span>
					<button id="${Activity.status}-${Activity.activityId}-${Activity.userId}"
							class="edit visible" style="display: none">編輯</button>
					<button id="${Activity.status}${Activity.activityId}${Activity.userId}"
							class="close visible" style="display: none">結束活動</button>
					<input type="hidden" name="preUrl" value="${preUrl}">
					</span>
							

					<script>
					
					//計算地圖個數
					number++;
					//個別地圖展開
					var target;
					var element = document.querySelector('#block');
					function open(){
						console.log('click function open');
					}
					$('#Bhidden${status.index}').on('click',function(){
						console.log('start');
						var temp = this.id;
						var activityId = ${Activity.activityId}
						var type = 'ActivityActivityId';
						var mapId = '${status.index}';
						console.log('userId:',activityId);
						target = temp.substring(1);
						console.log('target is:',target);
						if($('#hidden${status.index}').css('display') == 'none'){
							console.log('try to show');
							showTargetMap(target);
							getMarkers(type,activityId,mapId);
							console.log('reload done: ',mapId);
						}else if($('#hidden${status.index}').css('display') == 'block'){
							console.log('try to hide');
							hideTargetMap(target);
						}
					});
					
					function showTargetMap(target){
						document.getElementById(target).style.display="block";
					};
					function hideTargetMap(target){
						document.getElementById(target).style.display="none";
					};
					
					//判斷EL是否為null
					var people = document.getElementById('people${status.index}');
					
					//轉換時間格式
					var beginD = '${Activity.beginTime}';
					var endD = '${Activity.endTime}';
					var exp = 'hello';
					var bT = beginD.split(' ');//bT[0]開始的年月日2020/02/20 bT[1]開始的時分15:26
					var eT = endD.split(' ');//eT[0]開始的年月日2020/02/20 eT[1]開始的時分15:26
					console.log('bT[0] is: ',bT[0]);
					var changeFormat = document.getElementById('changeFormat${status.index}');
					console.log('item is: '+changeFormat);
					changeFormat.value = bT[0]+' '+bT[1]+' ~ '+eT[0].substring(5)+' '+eT[1];
					</script>
				
			</fieldset>
	
	</div>
	
	</c:forEach>
	</div>
	</section>
	
	<script>
	
	console.log('接收到的activity: ','${activity}');
	var preUrl = "${preUrl}";
	console.log(preUrl);
	
	//測試是否可以接收到登入參數
	var user = '${getUserId}';
	console.log('userId is: ','${getUserId}');
	var company = '${getCompanyId}';
	console.log('companyId is: ','${getCompanyId}');
	var searchId;
	<c:if test='${empty getUserId}'>
	searchId = '${getCompanyId}';
		<c:set var="jQueryId" scope="page" value='${getCompanyId}'/>
	</c:if>
	<c:if test='${empty getCompanyId}'>
	searchId = '${getUserId}';
		<c:set var="jQueryId" scope="page" value='${getUserId}'/>
	</c:if>
	console.log('final searchId is: ',searchId);
	//個別搜尋
	$(".activity").on("click",function() {
		var activityId = this.id
		/*
		console.log('click');
		reloadMarkers(userId);
		*/
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
		window.location.href = '<c:url value="/searchActivity"/>';
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
	<script src="scripts/mapForMarker.js"></script>
	<script>
	
	</script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>

</head>
</body>
</html>