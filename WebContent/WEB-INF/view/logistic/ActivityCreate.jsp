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
<<<<<<< HEAD
	<title>建立活動</title>
=======
	<title>建立活動／Bartenders</title>
>>>>>>> cb48927c9aa2374a7591c3dcbe3ffbac7143834d
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	
	<!-- 小鈴鐺 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<style>

		.errors{
			margin: 0px auto;
			color:red;
		}
		
		label{
		margin:15px;
		}

		/**/
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
	    
<<<<<<< HEAD
	    #demoBox{
	    	position:absolute;
	    	right:2%;
	    	bottom:5%;
	    }
=======
	    		/*小鈴鐺*/
.noticeBox {
	position: fixed;
	top: 60px;
	right: 20px;
	align: right;
}

.bell .bellImg {
	height: 70px;
	width: 70px;
	float: right;
}

.notice {
	background-color: rgb(255, 255, 255, 0.4);
	width: 110%;
	height: auto;
	float: right;
	display: none;
}
	
>>>>>>> cb48927c9aa2374a7591c3dcbe3ffbac7143834d
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
	<header id="header">
		<h1><a href="index.jsp">Bartenders</a></h1>
		
		<!-- 小鈴鐺 -->
			<div class="noticeBox">
				<div class="bell">
					<img class="bellImg" src="/Bartenders/images/bell.png">
				</div>
				<div class="notice">
					<ul id="notice"></ul>
				</div>
			</div>
		
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
							<div class="col-12 col-12-medium">
							<!-- -->
								
							 
								<div id="alter" align="center">
									<h1 style="font-size:36px;" align="center">酒吧舉辦活動</h1>
									<form action="saveActivity.do" method="post" enctype="multipart/form-data">
										<fieldset style="width: 800px">
												<input id="name" class="classTest" type="text" name="name" placeholder="輸入活動名稱">
												<div id="typeDiv" style="margin:10px;">
													<input class="type" type="radio" id="party" name="type" value="party"><label for="party">派對</label> 
													<input class="type" type="radio" id="carnival" name="type" value="carnival"> <label for="carnival">嘉年華</label>
													<input class="type" type="radio" id="show" name="type" value="show"> <label for="show">酒展</label>
													<input class="type" type="radio" id="festival" name="type" value="festival"> <label for="festival">節慶活動</label>
												</div>
												<input id="beginTime" type="text" name="beginTime" placeholder="開始時間" > ~ <input id="endTime" type="text" name="endTime" placeholder="結束時間">
												<p></p>

												<input id="address" type="text" name="address" placeholder="活動地址">
												<p style="vertical-align:middle;">地圖位置: <button id="Bhidden" type="button" style="margin:10px;">點選按鈕設定地圖位置</button><img id="smallok" src="images/ok.png" style="visibility:collapse;vertical-align:middle;"></p>

												<div class="showEachMap">
													<div id="hidden" class="hideMap" >
														<button id="addressBtn" type="button" onclick="getInput()">根據地址自動設定</button>
														<div id="map"></div>
													</div>
												</div>

												<label style="display:inline;">(選填)</label>
												<input id="limitNum" class="numSetting" type="text" name="limitNum" placeholder="人數上限"> /
												<input id="actualNum" class="numSetting" type="text" name="actualNum" placeholder="內建人數"> / 
												<input id="targetNum" class="numSetting" type="text" name="targetNum" placeholder="成團人數">
												<br>
												<br>
												<p>活動照片上傳: <input id="uploadFile" type="file" name="uploadFile" style="width:300px;"/></p>
												<textarea id="brief" placeholder="輸入活動簡介" name="brief" rows="1"></textarea>
												<br>
												<textarea id="detail" placeholder="輸入活動內容" name="detail" rows="6"></textarea>
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
						<!-- Demo用 -->
								<div id="demoBox">
									<button id="demo1">派對</button><br>
									<button id="demo2">酒展</button><br>
									<button id="demo3">嘉年華</button>
								</div>
					</section>
					
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript" >
		//demo用
		$('#demo1').on('click',function(){
			console.log('click1');
			$('#name').val('周末狂歡派對');
			//$('#party').prop('checked');
			document.getElementById('party').checked = true;
			$('#realType').val('party');
			$('#beginTime').val('2020/03/05 19:00');
			$('#endTime').val('2020/03/05 22:00');
			$('#address').val('台北市大安區仁愛路四段112巷11號');
			$('#lat').val(25.0365128);
			$('#lng').val(121.5499646);
			$('#limitNum').val(10);
			$('#actualNum').val(2);
			$('#targetNum').val(6);
			$('#brief').val('狂歡派對就是要人多');
			$('#detail').val('我們是一群認識已久的酒友 當初也是因為喝酒認識的 如果你也是個酒品愛好者 卻苦無一起享受的夥伴 歡迎加入我們一起狂歡');
		})
		
		$('#demo2').on('click',function(){
			console.log('click2');
			$('#name').val('2020 台北國際酒展');
			//$('#party').prop('checked');
			document.getElementById('show').checked = true;
			$('#realType').val('show');
			$('#beginTime').val('2020/03/13 10:00');
			$('#endTime').val('2020/03/16 18:00');
			$('#address').val('台北南港展覽館1館');
			$('#lat').val(25.0365128);
			$('#lng').val(121.5499646);
			$('#limitNum').val(999);
			$('#actualNum').val(46);
			//$('#targetNum').val(0);
			$('#brief').val('全台最大國際酒展');
			$('#detail').val('來自世界各國的葡萄酒、清酒及啤酒！結合好酒、好食、好玩、好看，與你一起打開味蕾、刺激鼻間、衝擊視野、感受微醺、探索春Wine美好，體驗酒展風格。');
		})
		
		
		
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
		//inputType(tempValue);	
	})
	/*
	function inputType(testValue){
		for(var i=0;i<typeRadio.length;i++){
			if(typeRadio[i].checked==true){
				console.log('real type is: ',tempValue)
				realType.value = tempValue;
			}
		}
	}
	*/
	
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
		dateFormat : "yy/m/d H:i",
		maxDate : new Date().fp_incr(31), // 14 days from now
		minDate : "today",
		time_24hr: true
	});

	// end time
	const myInput2 = document.getElementById("endTime");
	const fp2 = flatpickr(myInput2, {
		enableTime : true,
		dateFormat : "yy/m/d H:i",
		maxDate : new Date().fp_incr(31), // 14 days from now
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
		if('${temp.limitNum}'!='null'){
			document.getElementById('limitNum').value = '${temp.limitNum}';
		}
		if('${temp.targetNum}'!='null'){
			document.getElementById('targetNum').value = '${temp.targetNum}';
		}
		if('${temp.actualNum}'!='null'){
			document.getElementById('actualNum').value = '${temp.actualNum}';
		}
		if('${temp.brief}'!=''){
			document.getElementById('brief').value = '${temp.brief}';
		}
		if('${temp.detail}'!=''){
			document.getElementById('detail').value = '${temp.detail}';
		}
		
	</c:if>
	</script>
	
	
<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	
</body>
</html>