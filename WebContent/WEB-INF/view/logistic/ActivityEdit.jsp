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
	<title>Excel Report / Bartenders</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
	
		#alter{
			position:absolute;
			border:1px yellow solid;
			top:10%;
			left:0%;
			width:100%;
		}
		
		.small {
			display: flex;
			align-self: center;
		}
	
		.small a {
			font-size: 16px;
			font-weight: 400;
			color: #888;
			font-family: 111.otf;
		}
	
		.small a+a {
			margin-left: 15px;
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
		<c:if test="${testV>499999}">
			<h1><a href="WelcomeCompany">Bartenders</a></h1>
		</c:if>
		<c:if test="${testV<499999}">
			<h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
		</c:if>
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
<!-- 							<li><a href="/Bartenders/ActivityCreate">建立活動</a></li> -->
<!-- 							<li><a id="myActivity" href="/Bartenders/queryActivityByUser.do">管理活動</a></li> -->
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
								<div id="alter">
								<h1 align=center style="font-size:36px;">編輯活動</h1>

									<div id="idiv" align=center>
										<form action="updateActivity.do" method="post" enctype="multipart/form-data">
											<fieldset style="width: 500px">
												
												<c:forEach var="Activity" items="${activity}" varStatus="status">
													<h3 id="ih3" style="margin: 10px 10px 0px 10px; display: inline-block"><input
															type="text" name="name" value="${Activity.name}"></h3>
													<p id="ip" align="right"
														style="color: red; margin: 10px 20px 10px 70px; display: inline">
														<input type="radio" id="party" name="type" value="party" check=""><label
															for="party">派對</label>
														<input type="radio" id="show" name="type" value="show" check=""> <label
															for="show">酒展</label></p>
			
													<p style="margin: 5px"><input id="beginTime" type="text" name="beginTime"
															value="${Activity.beginTime}"> ~ <input id="endTime" type="text"
															name="endTime" value="${Activity.endTime}"></p>
													<p style="margin: 5px"><input type="text" name="address"
															value="${Activity.address}" style="width:350px"></p>
													<p>參加人數上限:
														<input type="text" name="targetNum" style="width:100px"
															value="${Activity.targetNum}"> /內建人數:
														<input type="text" name="actualNum" style="width:100px"
															value="${Activity.actualNum}">
													</p>
													<p>地圖位置: <button id="Bhidden" type="button">確認地圖</button><img id="smallok"
															src="images/ok.jpg" style="visibility:collapse">
			
														<input id="lat" type="hidden" name="lat" value="${Activity.lat}">
			
														<input id="lng" type="hidden" name="lng" value="${Activity.lng}">
													</p>
													<div class="showEachMap">
														<div id="hidden" class="hideMap" >
															<button id="addressBtn" type="button" onclick="getInput()">自動設定</button>
															<div id="map"></div>
														</div>
													</div>
													
													<img alt="" src="images/${Activity.img}">
													<input type="file" name="uploadFile" />
													<p><input type="text" value="${Activity.brief}" style="width:400px;height:250px"
															name="brief"></p>
													<input type="hidden" name="preUrl" value="${preUrl}">
													<input type="hidden" name="activityId" value="${Activity.activityId}">
													<input type="submit" value="確認">
													<script>
														var type = ${ Activity.type }
														if (type = 'party') {
															console.log("it's party");
															document.getElementById('party').checked = true;
														} else if (type = 'show') {
															console.log("it's show");
															document.getElementById('show').checked = true;
														}
														var newLat = document.getElementById('lat');
														var newLng = document.getElementById('lng');
			
													</script>
												</c:forEach>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
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
		time_24hr: true
	});
	//設定currentId給超連結
	$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);
	</script>
	<script src="./scripts/MapStyle.js"></script>
	<script src="./scripts/mapForLocation.js"></script>
	<script type="text/javascript"
		src="https://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>
</html>