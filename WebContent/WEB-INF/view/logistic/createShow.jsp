<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>舉辦活動</title>
<style>

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

#wholeDiv{
position:relative;
top:10%;
}

fieldset {
	text-align: center;
	width: 900px;
}

input{
height:50px;
font-size:24px;
border-radius:10px;
border:1px black solid;
}

label{
border:1px black solid;
height:50px;
font-size:24px;
}

#name{
	width:500px;
}
#typeDiv{
	position:absolute;
	right:20%;
	top:-5%;
	height:80px;
	width:200px;
	border:1px red solid;
	display:inline-block;
}
.perType{
	height:70px;
	width:190px;
	border:1px blue solid;
}

.type{
	height:24px;
}
.errors{
	margin: 0px auto;
	color:red;
}
/*以下是地圖開關設定*/
.showEachMap{
		width: 550px;
		height:550px;
        display: block;
        margin: 0 auto;
        /*网页中内容居中显示*/
        font-size: 9pt;
        /* 9pt的字体是没有锯齿的  */
        height: auto;
        /*因整个div部分，会有一部分动态显示或者隐藏，所以将高度设为auto*/
    }
#map {
	height: 550px;
	width: 550px;
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body align=center>
	<h1>酒吧舉辦活動</h1>

	<div align=center>
		<table>
			<tr>
				<td>
					<button class="return">回上一頁</button>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="wholeDiv" align=center>
		<form action="saveActivity.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>建立活動</legend>
					<input id="name" type="text" name="name" placeholder="活動名稱"><p class="errors">${errors.name}</p>
					<div id="typeDiv">
					<table>
						<tr>
							<td>
								<input class="type" type="radio" id="party" name="type" value="party"><label for="party">派對</label> 
							</td>
							<td>
								<input class="type" type="radio" id="carnival" name="type" value="carnival"> <label for="carnival">嘉年華</label>
							</td>
						</tr>
						<tr>
							<td>
								<input class="type" type="radio" id="show" name="type" value="show"> <label for="show">酒展</label>
							</td>
							<td>
								<input class="type" type="radio" id="festival" name="type" value="festival"> <label for="festival">節慶活動</label>
							</td>
						</tr>
					</table>
					<!-- 
						<div class="perType">
							<input class="type" type="radio" id="party" name="type" value="party"><label for="party">派對</label> 
						<input class="type" type="radio" id="carnival" name="type" value="carnival"> <label for="carnival">嘉年華</label>
							
						</div>
						<div class="perType">
						<input class="type" type="radio" id="show" name="type" value="show"> <label for="show">酒展</label>
						<input class="type" type="radio" id="festival" name="type" value="festival"> <label for="festival">節慶活動</label>
						</div>
						 -->
					</div>
					
					<p class="errors">${errors.type}</p>
					<p><input id="beginTime" type="text" name="beginTime" placeholder="請選擇開始時間">
					 ~ <input id="endTime" type="text" name="endTime" placeholder="結束時間">
					</p>
					<p class="errors">${errors.time}</p>
					<p><input type="text" name="address" placeholder="活動地址"></p>
					<p class="errors">${errors.address}</p>
					<p><input type="text" name="limitNum" placeholder="參加人數上限">
					 /
					<input type="text" name="actualNum" placeholder="內建人數">
					 / 
					<input type="text" name="targetNum" placeholder="成團人數">
					</p>
					<p>地圖位置: <button id="Bhidden" type="button" >點選按鈕設定地圖位置</button><img id="smallok" src="images/ok.jpg" style="visibility:collapse"></p>
					<p class="errors">${errors.map}</p>
					<div class="showEachMap">
						<div id="hidden" class="hideMap" >
							<div id="map"></div>
						</div>
					</div>
					<input type="file" name="uploadFile" />
					<textarea  type="text" placeholder="輸入活動簡介" name="brief"></textarea>
					
					<br>
					<div>
					<input id="lat" type="text" name="lat" value="0">
					<input id="lng" type="text" name="lng" value="0">
					<input type="text" name="preUrl" value="${preUrl}">
					<input type="text" name="userId" value="${getUserId}${getCompanyId}">
					<!-- 
					<input type="text" name="userId" value="<c:out value="${finalText}"/>">
					 -->
					<input type="text" id="realType" name="realType" value="no">
					</div>
					<input type="submit" value="確認">
			</fieldset>
		</form>
	</div>
	<script src="./scripts/MapStyle.js"></script>
	<script src="./scripts/mapForCreateActivity.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script>

	//若沒有選擇活動 預設為no 會報錯
	var typeRadio = document.getElementsByClassName('type');
	var realType = document.getElementById('realType');
	var tempValue;
	$('.type').on('click',function(){
		tempValue = this.id
		inputType(tempValue);	
	})
	function inputType(testValue){
		for(var i=0;i<typeRadio.length;i++){
			if(typeRadio[i].checked==true){
				console.log('real type is: ',tempValue)
				realType.value = tempValue;
			}
		}
	}
	
	//測試是否可以接收到登入參數
	var user = '${getUserId}';
	console.log('userId is: ','${getUserId}');
	var company = '${getCompanyId}';
	console.log('companyId is: ','${getCompanyId}');
	console.log('preUrl=','${preUrl}');
	var sendText;
	
	/**/
	<c:if test='${empty getUserId}'>
		sendText = '${getCompanyId}';
		<c:set var="finalText" scope="page" value='${getCompanyId}'/>
	</c:if>
	<c:if test='${empty getCompanyId}'>
		sendText = '${getUserId}';
		<c:set var="finalText" scope="page" value='${getCompanyId}'/>
	</c:if>
	
	console.log('final sendText is: ',sendText);
	

	//地圖開關
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
	var mapBtn = document.getElementById('Bhidden');
	$('#Bhidden').on('click',function(){
		console.log('start');
		if($('#hidden').css('display') == 'none'){
			document.getElementById('hidden').style.display="block";
			mapBtn.innerHTML = '收起地圖';
		}else if($('#hidden').css('display') == 'block'){
			document.getElementById('hidden').style.display="none";
			if(checklat.value!=0){
				mapBtn.innerHTML = '修改地圖位置';
			}else{
				mapBtn.innerHTML = '尚未選擇地圖位置';
			}
			
		}
	});

		
		
			
		// begin time
		var today=new Date();
		var current = today.getHours()+':'+today.getMinutes();
		console.log('current time: ',current);
		const myInput = document.getElementById("beginTime");
		const fp = flatpickr(myInput, {
			enableTime : true,
			dateFormat : "yy/m/d H:i",
			maxDate : new Date().fp_incr(14), // 14 days from now
			minDate : "today",
			time_24hr: true
		});

		// end time
		const myInput2 = document.getElementById("endTime");
		const fp2 = flatpickr(myInput2, {
			enableTime : true,
			dateFormat : "yy/m/d H:i",
			maxDate : new Date().fp_incr(14), // 14 days from now
			minDate : "today",
			time_24hr: true
		});

		$(".return").on("click", function() {
			window.location.href = '<c:url value="/ManageBar"/>';
		})
		
		$("#cancel").on("click", function() {
			CancelLocating();
			cancelLocating = true;
			console.log('click on cancel locating');
		})
	</script>
	<%@ include file="../menu.jsp"%>
</body>
</html>