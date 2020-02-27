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
	<title>Excel Report</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		
		.wrapper.style5 ::-webkit-input-placeholder {

		color: #eee !important;
		font-family: 'Noto Sans TC', sans-serif;
		}
		
		#beginTime{
		width:250px;
		display:inline;
		}
		
		#endTime{
		width:250px;
		display:inline;
		}
		
		.numSetting{
		width:150px;
		display:inline;
		}
		
		#limitNum{
		width:150px;
		display:inline;
		}
		
		#targetNum{
		width:150px;
		display:inline;
		}
		
		#actualNum{
		width:150px;
		display:inline;
		}
		/*以下是地圖開關設定*/
		.showEachMap{
			width: 550px;
			height:550px;
	        display: block;
	        margin: 0 auto;
	        font-size: 9pt;
	        height: auto;
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
</head>
<body class="is-preload">
	<div id="page-wrapper">
	<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
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
							<div class="col-12 col-12-medium">
							<!-- 
								<h1>酒吧舉辦活動</h1>
							 -->
								<div id="wholeDiv" align=center>
									<form action="saveActivity.do" method="post" enctype="multipart/form-data">
										<fieldset>
											<legend style="font-size:36px;">建立活動</legend>
												<br>
												<input id="name" type="text" name="name" placeholder="輸入活動名稱" ><p class="errors">${errors.name}</p>
												<div id="typeDiv">
												<table>
													<tr>
														<td>
															<input class="type" type="radio" id="party" name="type" value="party"><label for="party">派對</label> 
														</td>
														<td>
															<input class="type" type="radio" id="carnival" name="type" value="carnival"> <label for="carnival">嘉年華</label>
														</td>
														<td>
															<input class="type" type="radio" id="show" name="type" value="show"> <label for="show">酒展</label>
														</td>
														<td>
															<input class="type" type="radio" id="festival" name="type" value="festival"> <label for="festival">節慶活動</label>
														</td>
													</tr>

												</table>
												</div>
												
												<p class="errors">${errors.type}</p>
												<input id="beginTime" type="text" name="beginTime" placeholder="開始時間" > ~ <input id="endTime" type="text" name="endTime" placeholder="結束時間">
												
												
												<p class="errors">${errors.time}</p>
												<input id="address" type="text" name="address" placeholder="活動地址">
												<p>地圖位置: <button id="Bhidden" type="button" >點選按鈕設定地圖位置</button><img id="smallok" src="images/ok.jpg" style="visibility:collapse"></p>
												<p class="errors">${errors.map}</p>
												<div class="showEachMap">
													
													<div id="hidden" class="hideMap" >
														<button id="addressBtn" type="button" onclick="getInput()">自動設定</button>
														<div id="map"></div>
													</div>
												</div>
												<p class="errors">${errors.address}</p>
												<input id="limitNum" class="numSetting" type="text" name="limitNum" placeholder="人數上限"> /
												<input id="actualNum" class="numSetting" type="text" name="actualNum" placeholder="內建人數"> / 
												<input id="targetNum" class="numSetting" type="text" name="targetNum" placeholder="成團人數">
												<br>
												<br>
												<p>活動照片上傳: <input id="uploadFile" type="file" name="uploadFile" style="width:100px;"/></p>
												<textarea  type="text" placeholder="輸入活動簡介" name="brief" rows="1">輸入活動簡介</textarea>
												<br>
												<textarea  type="text" placeholder="輸入活動內容" name="content" rows="6">輸入活動內容</textarea>
												<br>
												<div style="display:block">
												<input id="lat" type="text" name="lat" value="0">
												<input id="lng" type="text" name="lng" value="0">
												<input type="text" name="preUrl" value="${preUrl}">
												<input type="text" name="userId" value="${getUserId}${getCompanyId}">
												<input type="text" id="realType" name="realType" value="no">
												</div>
												<input type="submit" value="確認">
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
	//window.open(dlLink);
		//更改placeholder
		console.log('this is errors: ','${errors}');
		//地址按鈕
		/**/
		var locationLat;
		var locationLng;
		async function getInput() {
			var address = document.getElementById('address').value
			
			//等fetch做完再繼續
			await fetch('https://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E').then(
				function (response) {
					return response.json();
				}).then(function (JSONdata) {
					console.log('this is data results: ', JSONdata.results);
					//console.log("this is location's latlng: ", JSONdata.address_components);
					var all = JSONdata.results.forEach(function (item) {
						locationLat = item.geometry.location.lat;
						locationLng = item.geometry.location.lng;

					})
				});//fetch結束
			console.log("指定位置", locationLat, '; ', locationLng);
			document.getElementById('lat').value = locationLat;
			document.getElementById('lng').value = locationLng;
			relocate(locationLat, locationLng);
			checkMap();
		}
		
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
	var company = '${getCompanyId}';

	console.log('preUrl=','${preUrl}');
	var currentId = '${getCompanyId}${getUserId}';
	console.log('currentId is: ',currentId);
	
	
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
	//地圖開關
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
	//設定currentId給超連結
	$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);
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
	<script src="scripts/mapForCreateActivity.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
</body>
</html>