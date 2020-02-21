<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogisticGate</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
a{
color: #E8CCFF;

}
a:hover {
color: 	#9F88FF;
}
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
	border: 1px solid black;
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

.mapDiv {
	height: 400px;
	width: 400px;
	float:left;
}
</style>

</head>
<body >
	<h1 align=center style="color:white;font-size:48px">個人訂單管理</h1>

		
			<table align=center>
				<tr>
					<td>
						<button id="status0" class="ByStatus" >所有訂單</button>
						<button id="status1" class="ByStatus" >查詢已預約訂單</button>	<!-- status=1 -->
						<button id="status2" class="ByStatus" >查詢配送中訂單</button>	<!-- status=2 -->
						<button id="status3" class="ByStatus" >查詢已送達訂單</button>  <!-- status=3 -->
						<button class="return">回酒吧</button>
					<!-- 
						<button id="test" class="create" >測試訂單</button>
					 -->
					</td>
				</tr>
				<tr>
					<td>
						<button id="searchOrder" >搜尋訂單</button>
					</td>
				</tr>
			</table>
		
			<div align="center">
			<form action="<c:url value="/logistic/LogisticLogout.do" />" method="post">
				<table>
					<tr>
						<td><input type="submit" value="登出"></td>
					</tr>
				</table>
			</form>
			</div>
			<br>
			<div id="map" class="mapDiv" align=center></div>
		<!-- 	
	 -->

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
						<td>出貨時間</td>
						<td>送達物流中心時間</td>
						<td>顧客取貨時間</td>
						<td>完成</td>
						<td>貨物送達確認</td>
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
							<td>${Logistic.oTimeA}</td>
							<td>${Logistic.oTimeB}</td>
							<td>${Logistic.oTimeC}</td>
							<td id="oComplete${Logistic.lID}">${Logistic.oComplete}</td>
							<td><button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="Ready" style="display: none">貨物確認送達</button></td>
							
							<!-- 
							<td>
							
								<button
									id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="UnPaid" style="display: none">確認收款</button>
								<button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="UnTrans" style="display: none">出貨完成</button>
								<button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="Comp" style="display: none">貨物送達</button>
								<button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
									class="Ready" style="display: none">貨物確認送達</button>
							</td>
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
	
	$("#searchOrder").on("click", function() {
		var prefix = 'OrderSearch';
		var input = 1;
		reloadMarkers(prefix,input);
		getMarkers(prefix,input);
	})
	
	$(".ByStatus").on("click", function() {
		var Str = this.id
		orderStatus = Str.substring(6);
		window.location.href = '<c:url value="/logistic/queryByStatus.do"/>?orderStatus=' + orderStatus;
	})
								
	//回上頁
	$(".return").on("click", function() {
		window.location.href = '<c:url value="/WelcomeCompany"/>';
	})
				

		listR = $('button[id^="2"][class="Ready"]');
		listR.attr("style", "display:block;");
		console.log(listR);

		

		listD = $('button[id^="4"]');
		listD.attr("style", "display:none;");

		listtd = $('td[class="status"]');
		console.log(listtd);

	</script>
	<script src="../scripts/MapStyle.js"></script>
	<script src="../scripts/mapForOrder.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	
</body>
</html>