<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單搜尋</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>


.mydiv {
	min-width: auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	color: #E8CCFF;
}


body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

table {
	border-collapse: collapse;
}

td {
	border: 1px solid white;
	color:white;
	font-size:20px;
}

div {
	class: center;
}

fieldset {
	text-align: center;
	width: 1500px;
}
/* 以下是地圖搜尋設定*/
.searchDiv {
	margin: auto;
	display:none;
}

.chooseType{
	border:2px white solid;
	width:150px;
	height: 400px;
	display: inline-block;
	vertical-align:top;
	padding:5px;
	margin:15px;

}
.mapDiv {
	height: 600px;
	width: 800px;
	float:left;
	
}
#searchBox{
	border:2px white solid;
	background-color:lightgrey;
	position:fixed;
	width:150px;
	height:300px;
	right:0%;
}

</style>

</head>

<body>
<br>
<br>
<br>
<br>
	<h1 align=center style="color:white;font-size:48px">訂單搜尋</h1>
	<button id="openSearch" type="button" >地圖搜尋</button>
	<section>
		<div class="searchDiv" align=center>
			<div id="map" class="mapDiv"></div>
		</div>
		
	</section>	
	<div id="searchBox">
		<label><button id="jokerBtn" type="button" onclick="queryJoker()" >整合搜尋</button></label>
	</div>
	
	<div align=center>
		<fieldset>
			<legend style="color:white;font-size:24px">查詢結果</legend>
			<table align=center>
				<thead>
					<tr>
						<td>序號</td>
						<td>訂單號碼</td>
						<td>物流號碼</td>
						<td>商家號碼</td>
						<td>送貨類型</td>
						<td>送貨地址</td>
						<td>取件人姓名</td>
						<td>取件人手機</td>
						<td>訂單金額</td>
						<td>狀態</td>
						<!-- 
						<td>送貨員編號</td>
						<td>出貨時間</td>
						<td>送達物流中心時間</td>
						<td>顧客取貨時間</td>
						<td>完成</td>
						<td>貨物送達確認</td>
						 -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Logistic" items="${logistic}" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${Logistic.oID}</td>
							<td>${Logistic.lID}</td>
							<td>${Logistic.cID}</td>
							<td id="type${Logistic.lID}">${Logistic.oType}</td>
							<td>${Logistic.oAddr}</td>
							<td>${Logistic.oName}</td>
							<td>${Logistic.oPhone}</td>
							<td>${Logistic.oAmount}</td>
							<td id="ostatus${Logistic.lID}">${Logistic.oStatus}</td>
							<!-- 
							<td>${Logistic.sID}</td>
							<td>${Logistic.oTimeA}</td>
							<td>${Logistic.oTimeB}</td>
							<td>${Logistic.oTimeC}</td>
							<td id="oComplete${Logistic.lID}">${Logistic.oComplete}</td>
							<td><button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="Ready" style="display: none">貨物確認送達</button></td>
							 -->
						</tr>
						<script>
							console.log('status is, ${Logistic.oStatus}')
						
							var type = document.getElementById('type${Logistic.lID}');
							if(type.innerHTML=='1'){
								type.innerHTML = '宅配';
							}else if(type.innerHTML=='3'){
								type.innerHTML = '票券';
							};
							
							var status = document.getElementById('ostatus${Logistic.lID}');
							if(status.innerHTML==1){
								status.innerHTML = '未取貨';
							}else if(status.innerHTML==2){
								status.innerHTML = '運送中';
							}else if(status.innerHTML==3){
								status.innerHTML = '訂單完成';
							};
							
							var finish = document.getElementById('oComplete${Logistic.lID}');
							if(finish.innerHTML=='1'){
								console.log('finish');
								finish.innerHTML = '送達';
							}
							</script>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</div>
	<script>
	
	//搜尋按鈕
	/*
	function queryJoker(){
		console.log('click joker');
		var prefix = 'logistic/OrderSearch';
		reloadMarkers(prefix,1);
		getMarkers(prefix,1);
		
	}
	*/
	function queryJoker(){
		console.log('click joker');
		var prefix = 'logistic/OrderSearch';
		window.location.href = '<c:url value="/logistic/OrderSearch.do/'+1+'"/>';
		
	}
	
	//打開搜尋地圖
	$('#openSearch').on('click', function(){
		if($('.searchDiv').css('display')=='none'){
			$('.searchDiv').css('display','block');
			var prefix = 'logistic/OrderSearch';
			reloadMarkers(prefix,1);
			getMarkers(prefix,1);
		}else {
			$('.searchDiv').css('display','none');	
		}
	})

	
	</script>

	<script src="../scripts/MapStyle.js"></script>
	<script src="../scripts/mapForOrder.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<%@ include file="logisticMenu.jsp"%>
</body>
</html>