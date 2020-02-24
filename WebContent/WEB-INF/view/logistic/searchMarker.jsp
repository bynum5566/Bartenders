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
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
<style>


.container {
	margin: auto;
	border:2px black solid;
	width:800px;
	height: 800px;
	
}
.mapDiv {
	height: 600px;
	width: 600px;
	display: inline-block;
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



</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
	<h1 align=center>地圖搜尋</h1>
	<div align=center >
		<label>輸入地址<input id="address" type="text" style="width:500px" value="103台北市大同區承德路三段49號"></label><button id="addressBtn" onclick="getInput()">確認</button>
		<button id="autoAddressBtn" onclick="autoLocating()">自動定位</button>
	</div>
	<div align=center>
		<button id="shop" class="search">查詢洋酒專賣</button>
		<button id="bar" class="search">查詢酒吧</button>
		<button id="show" class="search">查詢酒展</button>
		<button id="party" class="search">查詢派對</button>
		<button class="return">回上一頁</button>
	</div>
	<div class="container" align=center>
		<div id="map" class="mapDiv"></div>
		<div id="choose" class="chooseType" >
		<!-- 
			<form action="searchMarker.do" method="post">
				<label>搜尋類型:</label>
				<label><input type="checkbox" name="type" value="bar">酒吧</label>
				<label><input type="checkbox" name="type" value="shop">專賣店</label>
				<label><input type="checkbox" name="type" value="show">酒展</label>
				<label><input type="checkbox" name="type" value="party">派對</label>
				
				<hr>
				<label><input type="submit"  value="查詢"></label>
			</form>
			<br>
			<br>
			<br>
			 -->
			<form class="formBox">
				<label>搜尋類型:</label>
				<label><input type="checkbox" class="multi" name="type2" value="bar">酒吧</label>
				<label><input type="checkbox" class="multi" name="type2" value="shop">專賣店</label>
				<label><input type="checkbox" class="multi" name="type2" value="show">酒展</label>
				<label><input type="checkbox" class="multi" name="type2" value="party">派對</label>
				<br>
				<!-- 
				<label><button type="button" onclick="chooseType()" >查詢</button></label>
				 -->
			</form>

			<form class="formBox">
				<label>搜尋日期:</label>
				<label><input id="beginTime" class="date" type="text" name="beginTime" placeholder="開始時間"></label>
				<br>
				<label><input id="endTime" class="date" type="text" name="endTime" placeholder="結束時間"></label>
				<br>
				<label><button id="clearTime" type="button" onclick="clearDate()" >清除時間</button></label>
				<!-- 
				<label><button type="button" onclick="chooseDate()" >查詢</button></label>
				 -->
			</form>
			<hr>
			<label><button id="jokerBtn" type="button" onclick="queryJoker()" >整合搜尋</button></label>
		</div>
	</div>

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
		reloadMarkers("ActivityJoker",jokerList);
		getMarkers("ActivityJoker",jokerList);
	}
	
	//按類型搜尋
	function chooseType(){
		console.log('this is script button');
		var list = [];
		
		console.log('all boxes: ',checkBox);
		for(var i=0;i<checkBox.length;i++){
			if(checkBox[i].checked==true){
				console.log('checked: ',checkBox[i].value);
				list.push(checkBox[i].value);
			}
			
		}
		console.log('list contain:',list);
		for(var i=0;i<list.length;i++){
			reloadMarkers('ActivityType',list[i]);
		}
		for(var i=0;i<list.length;i++){
			getMarkers('ActivityType',list[i]);
		}
	}
	
	//按時間搜尋
	async function chooseDate(){
		var list = [];
		var immediatly=new Date();

		console.log('時間區隔為',beginTime.value,' ~ ',endTime.value)
		
		var biginDate = new Date(beginTime.value);
		var beginDiff = (((biginDate-immediatly)/1000/60));
		console.log('時間差為',beginDiff,'分')
		var immeDate = dateToStr(immediatly);
		var begin = dateToStr(beginTime.value);
		var end = dateToStr(endTime.value);

		reloadMarkers('ActivityDate',begin+'/'+end);
		getMarkers('ActivityDate',begin+'/'+end);

	}
	
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
	
	
	
	//日期選擇器
	// begin time
		var today=new Date();
		var current = today.getHours()+':'+today.getMinutes();
		console.log('current time: ',today.getMonth()+1+'/'+today.getDate()+' '+today.getHours()+':'+today.getMinutes());
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
	//清除時間按鈕
	//var clearTimeBtn = document.getElementById('clearTime');
	function clearDate(){
		if(beginTime.value==''){
			  console.log('nothing happen')
			  //beginTime.placeholder = '開始時間';
			  //endTime.placeholder = '結束時間';
		  }else{
			  console.log('clean date')
			  beginTime.style.background = '';
			  endTime.style.background = '';
			  beginTime.value = '';
			  endTime.value = '';
			  beginTime.placeholder = '開始時間';
			  endTime.placeholder = '結束時間';
		  }
	}
	
	//地址按鈕
	var locationLat;
	var locationLng;
	async function getInput(){	
		var address = document.getElementById('address').value
		
		//等fetch做完再繼續
		await fetch('https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E').then(
			function(response) {
				return response.json();
			}).then(function(JSONdata) {
			console.log('this is data results: ', JSONdata.results);
			//console.log("this is location's latlng: ", JSONdata.address_components);
				var all = JSONdata.results.forEach(function(item){
					locationLat = item.geometry.location.lat;
					locationLng = item.geometry.location.lng;
					
				})
			});//fetch結束
			console.log("指定位置",locationLat,'; ',locationLng);
			relocate(locationLat,locationLng);
	};

	//個別類型搜尋
	$('.search').on('click', function(){
		var type = this.id;
		var prefix = 'ActivityType';
		reloadMarkers(prefix,type);
		getMarkers(prefix,type);
	})
	
	$(".return").on("click", function() {
			window.location.href = '<c:url value="/ManageActivity"/>';
		})
	
	</script>
	<script src="scripts/MapStyle.js"></script>
	<script src="scripts/mapForSingleMapWithMarker.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	
</body>
</html>