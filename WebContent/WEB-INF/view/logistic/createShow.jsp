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

div {
	margin: 0px auto;
}

fieldset {
	text-align: center;
	width: 1200px;
}

#map {
	height: 600px;
	width: 600px;
}

.errors{
	margin: 0px auto;
	color:red;
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
	
	<div id="idiv" align=center>
		<form action="saveActivity.do" method="post" enctype="multipart/form-data">
			<fieldset style="width: 500px">
				<legend>建立活動</legend>
					<h3 id="ih3" style="margin: 10px 10px 0px 10px; display: inline-block"><input type="text" name="name" value="${Activity.name}"></h3>
					<p id="ip" align="right" style="color: red; margin: 10px 20px 10px 70px; display: inline">
					<input type="radio" id="party" name="type" value="party"><label for="party">派對</label> 
					<input type="radio" id="show" name="type" value="show"> <label for="show">酒展</label>
					<input type="hidden" id="no" name="type" value="no"><label for="no"></label></p>
					
					<p style="margin: 5px"><input id="beginTime" type="text" name="beginTime"
							placeholder="請選擇開始時間"> ~ <input
							id="endTime" type="text" name="endTime"
							placeholder="結束時間"></p>
					<p style="margin: 5px"><input type="text" name="address" placeholder="活動地址" style="width:350px"></p>
					<p style="margin: 5px"><input type="text" name="targetNum" placeholder="參加人數上限" style="width:100px"> /
										<input type="text" name="actualNum" placeholder="內建人數" style="width:100px">
					</p>
					<p>地圖位置: <button id="Bhidden" type="button">確認地圖</button><img id="smallok" src="images/ok.jpg" style="visibility:collapse"><input id="lat" type="hidden" name="lat" >
					<input id="lng" type="hidden" name="lng" ></p>
					<div class="showEachMap">
						<div id="hidden" class="hideMap" >
								<div id="map" style="width:500px;height:500px;background:red"></div>
							</div>
						</div>
					<script>
						//測試是否可以接收到登入參數
						var user = '${getUser.userId}';
						console.log('userId is: ','${getUser.userId}');
						var company = '${getCompany.companyId}';
						console.log('companyId is: ','${getCompany.companyId}');
						console.log('preUrl=','${preUrl}');
						var sendText;
						<c:if test='${empty getUser.userId}'>
							sendText = 'c${getCompany.companyId}';
							<c:set var="finalText" scope="page" value='c${getCompany.companyId}'/>
						</c:if>
						<c:if test='${empty getCompany.companyId}'>
							sendText = 'u${getUser.userId}';
							<c:set var="finalText" scope="page" value='u${getUser.userId}'/>
						</c:if>
						
						console.log('final sendText is: ',sendText);

					</script>
			
					<br>
					
					<input type="file" name="uploadFile" />
					
					<p><input type="text" placeholder="輸入活動簡介" style="width:400px;height:250px" name="brief"></p>
					<input type="text" name="preUrl" value="${preUrl}">
					<input type="text" name="userId" value="<c:out value="${finalText}"/>">
					<input type="submit" value="確認">
			</fieldset>
		</form>
	</div>

	<div id="map"></div>
	<script src="./scripts/MapStyle.js"></script>
	<script src="./scripts/mapForLocation.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script>

	//
	var target = 'hidden';
	$('#Bhidden').on('click',function(){
		console.log('start');
		if($('#hidden').css('display') == 'none'){
			console.log('try to show');
			showTargetMap();
			console.log('reload done: ');
		}else if($('#hidden').css('display') == 'block'){
			console.log('try to hide');
			hideTargetMap();
		}
	});
	
	function showTargetMap(){
		document.getElementById('hidden').style.display="block";
	};
	function hideTargetMap(){
		document.getElementById('hidden').style.display="none";
	};
		//小OK顯示
		$('#map').on("click", function(){
			checkMap()
		});
		function checkMap(){
			console.log("checkMap");
			var ok = document.getElementById("smallok")
			var checklat = document.getElementById("lat")
			if(checklat.value!=0){
				ok.style.visibility = 'visible';
			}
		}
		
			
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
			minTime : current,
			time_24hr: true
		});

		// end time
		const myInput2 = document.getElementById("endTime");
		const fp2 = flatpickr(myInput2, {
			enableTime : true,
			dateFormat : "yy/m/d H:i",
			maxDate : new Date().fp_incr(14), // 14 days from now
			minDate : "today",
			minTime : current,
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
</body>
</html>