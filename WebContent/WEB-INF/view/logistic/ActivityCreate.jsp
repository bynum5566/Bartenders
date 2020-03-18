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
	<title>活動建立</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBarInfo.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/ActivityStyleForEdit.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<!-- 小鈴鐺 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<style>
		#background{
			position:relative;
			left:0%;
			top:0%;
			margin-top:-80px;
		}
		
		.container{
		position:relative;
		width:900px;
		left:50%;
		padding:10px;
		margin: 0px auto;/*div對齊效果*/
		margin-left:-450px;
		text-align: center;
		
		}
		#demoBox{
	    	position:absolute;
	    	right:2%;
	    	bottom:5%;
	    }

		.inputBox{
			height:20px;
		}
		
		.typeLabel{
			
		}
				/* 小鈴鐺 */

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
			<h1><a href="WelcomeCompany">Bartenders</a></h1>
	</c:if>
	<c:if test="${testV<499999}">
		<header id="header">
			<h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
	</c:if>
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
						<c:if test="${testV>499999}">
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
						</c:if>
						<c:if test="${testV<499999}">
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
							<div id="background" class="col-12 col-12-medium"><!-- 這裡開始 -->
								<h1 align="center" style="font-size:48px;margin:5px;">活動建立</h1>
								
								
								<div class="container">
								
								<form action="saveActivity.do" method="post" enctype="multipart/form-data">
								<div style="background-color:darkgrey;border-radius:20px;">
									<div style="display:inline-block;vertical-align:top;">
										<div class="each">
											<fieldset style="width: 350px;border-radius:30px;text-align: center;">
												<legend>活動 - 活動ID:</legend>
												<img id="imgDisplay" class="img" alt="未選擇圖片" style="margin: 0px 5px 0px 5px;padding:0px;" src="images/noImage.png"> 
												<img id="typeDisplay" class="imgType"  style="margin: 0px 10px 0px 0px">
												<input id="uploadFile" type="file" name="uploadFile"  accept="image/*"  style="display:none;"/>
												
												<div class="ActivityName"><input id="name" class="inputBox" type="text" name="name" placeholder="活動名稱" style="color:orange;height:50px;font-size:26px;font-weight:bold;line-height:50px;text-align:center;"> </div>
												
												<div id="typeDiv" >
													<input class="type" type="radio" id="party" name="type" value="party">
													<label class="typeLabel" for="party" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">派對</label> 
													<input class="type" type="radio" id="carnival" name="type" value="carnival">
													<label class="typeLabel" for="carnival" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">嘉年華</label>
													<input class="type" type="radio" id="show" name="type" value="show">
													<label class="typeLabel" for="show" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">酒展</label>
													<input class="type" type="radio" id="festival" name="type" value="festival">
													<label class="typeLabel" for="festival" style="font-size:18px;padding:5px 0px 5px 30px;line-height:20px;margin:5px 0px 5px 0px;">節慶活動</label>
												</div>
												
												<div id="date" class="ActivityDate" align=left>
													<p id="changeFormat" style="margin: 10px">
													<input id="beginTime" class="inputBox" type="text" name="beginTime" placeholder="開始時間" style="width:150px;height:32px;font-size:14px;display:inline;">  ~  
													<input id="endTime" class="inputBox" type="text" name="endTime"  placeholder="結束時間"  style="width:150px;height:32px;font-size:14px;display:inline;"></p>
												</div>
												<p align=left style="margin: 10px"><input id="address" type="text" name="address" placeholder="活動地點" > </p>
												<button id="Bhidden" class="closeAndOpen" type="button" style="width:180px;height:40px;padding:5px;margin:0px auto;vertical-align:middle;color:white;line-height:31px">確認地圖</button>
												<div class="showEachMap">
													<div id="hidden" class="hideMap"><p style="display:inline-block;width:45px;"></p>    
														<button id="addressBtn" type="button" onclick="getInput()">根據地址自動設定</button><img id="smallok" src="images/ok.png" style="visibility:collapse;vertical-align:middle;">
														<div id="map"
															style="width: 350px; height: 500px; background: red">
														</div>
													</div>
												</div>
											</fieldset>
											
										</div>
										
									</div>
									
									
									<div style="width:500px;display:inline-block;">
										<div style="width:500px;height:140px;">
											<div style="display:inline-block;vertical-align:top;">
												<c:if test="${not empty company}">
													<img src="images/host.png" style="width:140px;height:140px;border:2px white solid;border-radius:20px;margin:0px 0px 10px 0px;">
												</c:if>
												<c:if test="${not empty user}">
													<img src="images/host2.png" style="width:140px;height:140px;border:2px white solid;border-radius:20px;margin:0px 0px 10px 0px;">
												</c:if>
											</div>
											<div style="width:350px;height:140px;display:inline-block;padding:15px;">
												<p style="margin:0px">主辦人資訊</p>
												<c:if test="${not empty company}">
												<p align="left" style="margin:0px">店家:  ${company.companyName}</p>
												<p align="left" style="margin:0px">聯絡方式:  ${company.phone}</p>
												</c:if>
												<c:if test="${not empty user}">
												<p align="left" style="margin:0px">姓名: ${user.userName}</p>
												<p align="left" style="margin:0px">聯絡方式: ${user.phone}</p>
												</c:if>
											</div>
										
										</div>
										<div align=center style="margin: 10px;font-size:18px;">
											(選填) 上限: <input id="limitNum" class="numSetting" type="text" name="limitNum" style="width:50px;display:inline;height:32px;text-align:center;">人 / 
											成團: <input id="targetNum" class="numSetting" type="text" name="targetNum" style="width:50px;display:inline;height:32px;text-align:center;">人 / 
											目前: <input id="actualNum" class="numSetting" type="text" name="actualNum" style="width:50px;display:inline;height:32px;text-align:center;">人
										</div>
					
											<div id="outer0" class="outer" title="">
													<div id="groundD0" class="ground">
														
														<img id="limitP0" class="limitP NP" title="上限: 人" src="images/arrowLimit.png">
														<div id="targetFor0" class="targetD">
															<img class="targetP NP" title="成團: 人" src="images/arrowTarget.png">	
														</div>
														<div id="currentFor0" class="currentD NP">
															<p><img class="currentP NP" title="現在: 人" src="images/arrowCurrent.png"></p>
														</div>
													</div>
												</div>
												<textarea id="brief" class="inputArea" name="brief" placeholder="活動簡介"></textarea>
										
											<p class="detail" align=center style="margin:0px;text-align:justify">
												<textarea id="detail" class="inputArea" name="detail" placeholder="活動內容"></textarea>
											</p>
							
										</div>
									</div>
									<c:set var="hostId" value="${Activity.userId}"></c:set>
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
											//var changeFormat = document.getElementById('changeFormat${Activity.activityId}');
											//changeFormat.innerHTML = bT[0]+' '+bT[1]+' ~ '+eT[0].substring(5)+' '+eT[1];
											//var beginInput = document.getElementById('beginTime');
											//beginInput.value = bT[0]+' '+bT[1];
											//var endInput = document.getElementById('endTime');
											//beginInput.value = eT[0].substring(5)+' '+eT[1];
											
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
											
									//圖片預覽&&點擊圖片上傳
									
									function readURL(input) {
									  if (input.files && input.files[0]) {
									    var reader = new FileReader();
									    reader.onload = function(e) {
									      $('#imgDisplay').attr('src', e.target.result);
									    }
									    reader.readAsDataURL(input.files[0]);
									  }
									}
									$('#imgDisplay').on('click',function(){
										$("#uploadFile").click();
									})
									$("#uploadFile").change(function() {
									  readURL(this);
									});
									//個別進度條設定
									limitNum.push('${Activity.limitNum}');
									targetNum.push('${Activity.targetNum}');
									currentNum.push('${Activity.actualNum}');
									//console.log('status.index is:','${status.index}','limitNum is:',limitNum[0],'targetNum is:',targetNum,'currentNum is:',currentNum);
									//console.log('limit is: ',limitNum['${status.index}'],' target is: ',targetNum['${status.index}']);
									var fix = $('#groundD${status.index}').width()-20;
									//console.log('固定寬度: ',fix);
									if('${Activity.limitNum}'==999){
										//console.log('no limit')
										if('${Activity.targetNum}'!=0){
											//console.log('target != 0')
											per = fix/targetNum['${status.index}'];
											$('#targetFor${status.index}').width(fix);
											//console.log('目標寬度:',$('#targetFor${status.index}').width());
											//perNum.push(per);
											if(parseInt(currentNum['${status.index}'])>=parseInt(targetNum['${status.index}'])){
												$('#currentFor${status.index}').width(per*parseInt(targetNum['${status.index}']));
												//console.log('現在寬度:',$('#currentFor${status.index}').width());
												//console.log('人數無上限 有目標 已達標')
												$('#outer${status.index}').prop('title',"不限人數   已成團   現在: ${Activity.actualNum}人");
											}else{
												
												$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
												//$('#currentFor${status.index}').css('background-color','pink');
												//console.log('現在寬度:',$('#currentFor${status.index}').width());
												//console.log('人數無上限 有目標 未達標')
												$('#outer${status.index}').prop('title',"不限人數   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
											}
											
										}else if('${Activity.targetNum}'==0){
											//console.log('target = 0')
											per = fix/parseInt(currentNum['${status.index}']);
											$('#targetFor${status.index}').css('display','none');
											//perNum.push(per);
											$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
											//$('#currentFor${status.index}').css('background-color','pink');
											//console.log('現在寬度:',$('#currentFor${status.index}').width());
											//console.log('人數無上限 沒目標')
											$('#outer${status.index}').prop('title',"不限人數   直接成團   現在: ${Activity.actualNum}人");
										}
										$('#limitP${status.index}').css('display','none');
									}else{
										
										per = fix/parseInt(limitNum['${status.index}']);
										//console.log('has limit, per= ',per)
										$('#targetFor${status.index}').width(per*parseInt(targetNum['${status.index}']));
										//console.log('目標寬度: ',$('#targetFor${status.index}').width())
										//perNum.push(per);
										$('#currentFor${status.index}').width(per*parseInt(currentNum['${status.index}']));
										//$('#currentFor${status.index}').css('background-color','pink');
										//console.log('現在寬度:',$('#currentFor${status.index}').width());
										//console.log('人數有上限 可能有目標')
										$('#outer${status.index}').prop('title',"上限: ${Activity.limitNum}人   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
									}
									perNum.push(per);
									
									if(parseInt(currentNum['${status.index}'])>=parseInt(limitNum['${status.index}'])){
										$('#currentFor${status.index}').css('background-color','#b3b3b3');
										$('#targetFor${status.index}').css('display','none');
										$('#outer${status.index}').prop('title',"活動人數已滿");
									}else if(parseInt(currentNum['${status.index}'])>=parseInt(targetNum['${status.index}'])){
										$('#currentFor${status.index}').css('background-color','lightgreen');
										$('#targetFor${status.index}').css('display','none');
									}else{
										$('#currentFor${status.index}').css('background-color','pink');
									}
											//判斷EL是否為null
											var people = document.getElementById('people${status.index}');
											
											</script>
											<input id="lat" type="hidden" name="lat" value="0">
											<input id="lng" type="hidden" name="lng" value="0">
											<input id="preUrl" type="hidden" name="preUrl" value="${preUrl}">
											<input type="hidden" name="userId" value="${getUserId}${getCompanyId}">
											<input id="realType" type="hidden" name="realType" value="no">
											<input id="activityId" type="hidden" name="activityId" value="${Activity.activityId}">
											
											<input id="submitBtn" type="submit" value="確定">
											</form>
									
								
								</div>
								
							</div><!-- 這裡結束 -->
							<div id="demoBox">
								<button id="demo1">不完整demo</button><br>
								<button id="demo2">完整demo</button><br>
								<button id="demo3">完整demo2</button>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script type="text/javascript">
	//demo用
	$('#demo1').on('click',function(){
		console.log('click1');
		$('#name').val('周末狂歡派對');
		//$('#party').prop('checked');
		//document.getElementById('party').checked = true;
		//$('#realType').val('party');
		//document.getElementById('typeDisplay').src = 'images/party.png';
		$('#beginTime').val('2020/03/13 19:00');
		//$('#endTime').val('2020/03/13 22:00');
		//$('#address').val('台北市大安區仁愛路四段112巷11號');
		//$('#lat').val(25.0365128);
		//$('#lng').val(121.5499646);
		addressBtn.disabled=false;
		//checkMap();
		$('#limitNum').val(10);
		$('#actualNum').val(2);
		$('#targetNum').val(6);
		$('#brief').val('狂歡派對就是要人多');
		$('#detail').val('我們是一群認識已久的酒友 當初也是因為喝酒認識的 如果你也是個酒品愛好者 卻苦無一起享受的夥伴 歡迎加入我們一起狂歡');
	})
	
	$('#demo2').on('click',function(){
		console.log('click1');
		$('#name').val('周末狂歡派對');
		//$('#party').prop('checked');
		document.getElementById('party').checked = true;
		$('#realType').val('party');
		document.getElementById('typeDisplay').src = 'images/party.png';
		$('#beginTime').val('2020/03/13 19:00');
		$('#endTime').val('2020/03/13 22:00');
		$('#address').val('台北市大安區仁愛路四段112巷11號');
		$('#lat').val(25.0365128);
		$('#lng').val(121.5499646);
		addressBtn.disabled=false;
		checkMap();
		$('#limitNum').val(10);
		$('#actualNum').val(2);
		$('#targetNum').val(6);
		$('#brief').val('狂歡派對就是要人多');
		$('#detail').val('我們是一群認識已久的酒友 當初也是因為喝酒認識的 如果你也是個酒品愛好者 卻苦無一起享受的夥伴 歡迎加入我們一起狂歡');
	})
	
	$('#demo3').on('click',function(){
		console.log('click2');
		$('#name').val('2020 台灣德國啤酒節');
		//$('#party').prop('checked');
		document.getElementById('carnival').checked = true;
		$('#realType').val('carnival');
		document.getElementById('typeDisplay').src = 'images/carnival.png';
		$('#beginTime').val('2020/03/21 10:00');
		$('#endTime').val('2020/03/28 18:00');
		$('#address').val('台北晶華酒店');
		$('#lat').val(25.054231);
		$('#lng').val(121.524194);
		addressBtn.disabled=false;
		checkMap();
		$('#limitNum').val(999);
		$('#actualNum').val(9);
		//$('#targetNum').val(0);
		$('#brief').val('聞名世界的慕尼黑啤酒節來囉');
		$('#detail').val('台北晶華酒店今年首次推出的「德國酒食嘉年華」，是由連續在台主辦德國啤酒節19年的德籍美食主廚--麥可溫德(Michael Wendel)主導，將這流傳近3世紀的飲食文化首次帶進五星酒店；三樓宴會廳的「德國啤酒節派對」現場提供德式冷肉乳酪盤、啤酒燉豬肉、德式烤豬腳、啤酒節烘烤半雞、德式冷肉乳酪盤…等應景佳餚以及特色獨具的德國艾丁格啤酒；場地佈置上也是匠心獨具的將巴伐利亞垂吊掛飾、啤酒節專用桌椅…等空運來台，晶華更重金禮聘曾在美國、法國、荷蘭等地啤酒節演出的巴伐利亞特快車樂團(Bavaria Show Express)現場演唱，團員身著德國傳統服飾、透過歡樂的曲風，以及特色獨具的阿爾卑斯山長號炒熱氣氛，希望完整傳遞德國啤酒節的氛圍。');
	})
	
	$('#demo4').on('click',function(){
		console.log('click2');
		$('#name').val('2020 台北國際酒展');
		//$('#party').prop('checked');
		document.getElementById('show').checked = true;
		$('#realType').val('show');
		document.getElementById('typeDisplay').src = 'images/show.png';
		$('#beginTime').val('2020/03/13 10:00');
		$('#endTime').val('2020/03/16 18:00');
		$('#address').val('台北南港展覽館1館');
		$('#lat').val(25.0365128);
		$('#lng').val(121.5499646);
		addressBtn.disabled=false;
		checkMap();
		$('#limitNum').val(999);
		$('#actualNum').val(12);
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
			$('#Bhidden').css('border','');
		}
	}
	//地址按鈕
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
	//更換活動類型直接改圖片設定
	var typeRadio = document.getElementsByClassName('type');
	var realType = document.getElementById('realType');
	var tempValue;

	$('#typeDisplay').on('click',function(){
		tempValue = this.title;
		document.getElementById(tempValue).checked = true;
		if($('#typeSelectDiv').css('display')=='none'){
			$('#typeSelectDiv').css('display','block');
		}else{
			$('#typeSelectDiv').css('display','none');
		}
		
	})
	$('.type').on('click',function(){
		tempValue = this.id
		realType.value = tempValue;
		var typeDisplay = document.getElementById('typeDisplay');
		typeDisplay.src = 'images/'+tempValue+'.png';
		typeDisplay.title = tempValue;
		reloadMarkers();
		getMarkers(lat.value,lng.value,realType.value);
		$('#typeDiv').css('border','');
	})
	
	//設定currentId給超連結
	$('#myActivity').attr("href","/Bartenders/queryActivityByUser.do?currentId="+currentId);

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
				mapBtn.innerHTML = '尚未設定地圖';
			}	
		}
	});
	//點選時清空簡介 內容
	$('#brief').on('click',function(){
		if($('#brief').val()=='活動簡介'||$('#brief').val()=='尚未輸入簡介'){
			$('#brief').val('');
		}
	})
	$('#detail').on('click',function(){
		if($('#detail').val()=='活動內容'||$('#brief').val()=='尚未輸入內容'){
			$('#detail').val('');
		}
	})
	$('#submitBtn').on('click',function(){
		if($('#brief').val()=='活動簡介'||$('#brief').val()=='尚未輸入簡介'){
			$('#brief').val('');
		}
		if($('#detail').val()=='活動內容'||$('#brief').val()=='尚未輸入內容'){
			$('#detail').val('');
		}
	})
	//計算地圖數量
	console.log('number is: ',number);
	var pre=[];
	for(var i=0;i<number;i++){
		pre.push('map'+i);
	}
	console.log('pre is: ',pre);
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
		if('${errors.map}'=='尚未設定地圖'){
			mapBtn.style.border = '2px red solid';
			mapBtn.innerHTML = '尚未設定地圖';
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
	console.log('temp has data','${temp}');
	/**/
	document.getElementById('name').value = '';
	document.getElementById('beginTime').value = '';
	document.getElementById('endTime').value = '';
	document.getElementById('address').value = '';
	document.getElementById('limitNum').value = '';
	document.getElementById('targetNum').value = '';
	document.getElementById('actualNum').value = '';
	document.getElementById('brief').value = '';
	document.getElementById('detail').value = '';
	if('${temp.name}'!=''){
		document.getElementById('name').value = '${temp.name}';
	}
	if('${temp.type}'!='no'){
		document.getElementById('${temp.type}').checked = true;
		realType.value = '${temp.type}';
		document.getElementById('typeDisplay').src = 'images/${temp.type}.png';
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
		//mapBtn.innerHTML = '修改地圖位置';
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
	if('${temp.preUrl}'!=''){
		document.getElementById('preUrl').value = '${temp.preUrl}';
	}
</c:if>

	$('#name').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})
	$('#beginTime').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})
	$('#endTime').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})
	$('#address').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})
	$('#brief').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})
	$('#detail').on('blur',function(){
		var myVal = this.value;
		if(myVal!=''){
			$(this).css('border','');
		}
	})

	</script>
	
	<!-- 小鈴鐺 -->
	<!-- 
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		});
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	 -->
</body>
</html>