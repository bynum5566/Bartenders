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

		.errors{
			margin: 0px auto;
			color:red;
		}
		
		label{
		margin:15px;
		}
		.wrapper.style5 ::-webkit-input-placeholder {
		color: #eee !important;
		font-family: 'Noto Sans TC', sans-serif;
		}
		
		#alter{
			position:absolute;
			top:10%;
			left:0%;
			width:100%;
		}
		
		#name{
			width:400px;
		}
		
		#beginTime{
		width:210px;
		display:inline;
		}
		
		#endTime{
		width:210px;
		display:inline;
		}

		#limitNum{
		width:108px;
		display:inline;
		}
		
		#targetNum{
		width:108px;
		display:inline;
		}
		
		#actualNum{
		width:108px;
		display:inline;
		}
		
		/*以下是地圖開關設定*/
		.showEachMap{
			width: 800px;
			height:550px;
	        display: block;
	        margin: 0 auto;
	        font-size: 9pt;
	        height: auto;
	    }
		#map {
			width: 800px;
			height: 550px;
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
			<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
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
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a href="javascript:signOut()">登出</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>
	</c:if>
	<c:if test="${testV<499999}">
		<header id="header">
			<h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
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
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>
	</c:if>
	
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<div class="row">
							<div class="col-12 col-12-medium">
							<!-- -->
								
							 
								<div id="alter" align="center">
									<h1 style="font-size:36px;" align="center">設定酒吧資訊</h1>
									<form action="saveBar.do" method="post" enctype="multipart/form-data">
										<fieldset style="width: 800px">
												<input id="name" class="classTest" type="text" name="name" value="${bar.companyName}">
												<div id="typeDiv" style="margin:10px;">
													<input class="type" type="radio" id="bar" name="type" value="bar"><label for="bar">酒吧</label> 
													<input class="type" type="radio" id="shop" name="type" value="shop"> <label for="shop">洋酒專賣店</label>
												</div>
												<input id="beginTime" type="text" name="beginTime" placeholder="營業時間" > ~ <input id="endTime" type="text" name="endTime" placeholder="打烊時間">
												<p></p>
												<input id="address" type="text" name="address" value="${bar.address}">
												<p>地圖位置: <button id="Bhidden" type="button" style="margin:10px;">點選按鈕設定地圖位置</button><img id="smallok" src="images/ok.png" style="visibility:collapse;vertical-align:middle;"></p>
												<div class="showEachMap">
													<div id="hidden" class="hideMap" >
														<button id="addressBtn" type="button" onclick="getInput()">根據地址自動設定</button>
														<div id="map"></div>
													</div>
												</div>
												<p>酒吧照片上傳: <input id="uploadFile" type="file" name="uploadFile" style="width:300px;"/></p>
												<textarea id="brief" name="brief" rows="3" >${myBar.aboutBar}</textarea>
												<br>
												<div style="display:none">
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
	
	<script type="text/javascript" >
	//var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
	//window.open(dlLink);
		//更改placeholder
		
		
		console.log('this is bar: ','${bar}');
		console.log('this is myBar: ','${myBar}');
		//檢查地址是否輸入 限制定位按鈕
		var addressBtn = document.getElementById('addressBtn')
		if(document.getElementById('address').value==''){
				addressBtn.disabled=true;
			}else{
				addressBtn.disabled=false;
			}
		$('#address').on('blur',function(){
			if(document.getElementById('address').value==''){
				addressBtn.disabled=true;
			}else{
				addressBtn.disabled=false;
			}	
		})


		
	//若沒有選擇活動 預設為no 會報錯
	var typeRadio = document.getElementsByClassName('type');
	var realType = document.getElementById('realType');
	var tempValue;
	$('.type').on('click',function(){
		tempValue = this.id
		realType.value = tempValue;
	})
	
	//點地圖儲存座標+小OK顯示
	var ok = document.getElementById("smallok")
	var checklat = document.getElementById("lat")
	$('#map').on("click", function(){
		checkMap();
		reloadMarkers();
		getMarkers(lat.value,lng.value,realType.value);
		console.log('temp marker:',lat.value,lng.value,realType.value)
	});
	function checkMap(){
		console.log("checkMap");
		if(checklat.value!=0){
			ok.style.visibility = 'visible';
		}
	}
	
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
		relocate(locationLat, locationLng,realType.value);
		checkMap();
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
		noCalendar: true,
		dateFormat : "H:i",
		//dateFormat : "yy/m/d H:i",
		//maxDate : new Date().fp_incr(14), // 14 days from now
		//minDate : "today",
		time_24hr: true
	});

	// end time
	const myInput2 = document.getElementById("endTime");
	const fp2 = flatpickr(myInput2, {
		enableTime : true,
		noCalendar: true,
		dateFormat : "H:i",
		//dateFormat : "yy/m/d H:i",
		//maxDate : new Date().fp_incr(14), // 14 days from now
		//minDate : "today",
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
	<script>
	console.log('this is errors: ','${errors}');
	console.log('this is temp: ','${temp}');
	console.log('this is temp.name: ','${temp.name}');
	<c:if test="${not empty errors}">
		console.log('errors has data');
		if('${errors.name}'!=''){
			document.getElementById('name').placeholder = '${errors.name}';
			document.getElementById('name').style.border = '1px red solid';
		}
		if('${errors.type}'!=''){
			document.getElementById('typeDiv').style.border = '1px red solid';
		}
		if('${errors.beginTime}'!=''){
			document.getElementById('beginTime').placeholder = '${errors.beginTime}';
			document.getElementById('beginTime').style.border = '1px red solid';
		}
		if('${errors.endTime}'!=''){
			document.getElementById('endTime').placeholder = '${errors.endTime}';
			document.getElementById('endTime').style.border = '1px red solid';
		}
		if('${errors.address}'!=''){
			document.getElementById('address').placeholder = '${errors.address}';
			document.getElementById('address').style.border = '1px red solid';
		}
		if('${errors.map}'=='尚未點選地圖設定地點'){
			mapBtn.style.border = '2px red solid';
			mapBtn.innerHTML = '尚未點選地圖設定地點';
		}

		if('${errors.brief}'!=''){
			document.getElementById('brief').placeholder = '${errors.brief}';
			document.getElementById('brief').style.border = '1px red solid';
		}
		if('${errors.detail}'!=''){
			document.getElementById('detail').placeholder = '${errors.detail}';
			document.getElementById('detail').style.border = '1px red solid';
		}
	</c:if>
	<c:if test="${not empty temp}">
		console.log('temp has data');
		/**/
		if('${temp.name}'!=''){
			document.getElementById('name').value = '${temp.name}';
		}
		if('${temp.type}'!='no'){
			document.getElementById('${temp.type}').checked = true;
			realType.value = '${temp.type}';
		}
		if('${temp.beginTime}'!=''){
			document.getElementById('beginTime').value = '${temp.beginTime}';
		}
		if('${temp.endTime}'!=''){
			document.getElementById('endTime').value = '${temp.endTime}';
		}
		if('${temp.address}'!=''){
			document.getElementById('address').value = '${temp.address}';
		}
		if('${temp.lat}'!='0.0'&&'${temp.lng}'!='0.0'){
			document.getElementById('lat').value = '${temp.lat}';
			document.getElementById('lng').value = '${temp.lng}';
			getMarkers(lat.value,lng.value,realType.value);
			checkMap();
			mapBtn.innerHTML = '修改地圖位置';
		}

		if('${temp.brief}'!=''){
			document.getElementById('brief').value = '${temp.brief}';
		}

		
	</c:if>
	</script>
</body>
</html>