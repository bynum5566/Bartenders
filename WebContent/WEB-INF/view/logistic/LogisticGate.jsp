<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>LogisticGate</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		a {
			color: #E8CCFF;

		}

		a:hover {
			color: #9F88FF;
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
			margin: 0;
			padding: 0;
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
			color: white;
			font-size: 20px;
		}

		div {
			class: center;
		}

		fieldset {
			text-align: center;
			width: 1500px;
		}
	</style>

<style>
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
</style>
</head>

<body class="center is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h1 align=center style="color:white;font-size:48px">物流訂單管理</h1>


						<table align=center>
							<tr>
								<td>
									<button id="status0" class="ByStatus">管理所有訂單</button>
									<button id="status1" class="ByStatus">查詢未收貨訂單</button> <!-- status=1 -->
									<button id="status2" class="ByStatus">查詢配送中訂單</button> <!-- status=2 -->
									<button id="status3" class="ByStatus">查詢已送達訂單</button> <!-- status=3 -->
									<!-- 
						<button id="test" class="create" >測試訂單</button>
					 -->
								</td>
							</tr>
						</table>
						<div align="center">
							<form action="<c:url value="/logistic/LogisticLogout.do"/>" method="post">
							<table>
								<tr>
									<td><input type="submit" value="登出"></td>
								</tr>
							</table>
							</form>
						</div>
						<br>
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
												<td id="type${Logistic.oID}">${Logistic.oType}</td>
												<td>${Logistic.oAddr}</td>
												<td>${Logistic.oName}</td>
												<td>${Logistic.oPhone}</td>
												<td>${Logistic.oAmount}</td>
												<td id="mystatus${Logistic.oID}">${Logistic.oStatus}</td>
												<td>${Logistic.oTimeA}</td>
												<td>${Logistic.oTimeB}</td>
												<td>${Logistic.oTimeC}</td>
												<td id="oComplete${Logistic.oID}">${Logistic.oComplete}</td>
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


												var type = document.getElementById('type${Logistic.oID}');
												console.log('type column: ', type);
												if (type.innerHTML == '1') {
													type.innerHTML = '宅配';
												} else if (type.innerHTML == '2') {
													type.innerHTML = '超商';
												} else if (type.innerHTML == '3') {
													type.innerHTML = '票券';
												};
												console.log('oID is: ', '${Logistic.oID}');

												var status = document.getElementById('mystatus${Logistic.oID}');
												console.log('status is: ', 'mystatus${Logistic.oID}');
												console.log('status.innerHTML: ', status);
												console.log('status column: ', status.getHeaders());
												if (status = '1') {
													status = '未取貨';
												} else if (status.innerHTML == '2') {

													status.innerHTML = '運送中';
												} else if (status = 3) {
													status = '訂單完成';
												};

												var finish = document.getElementById('oComplete${Logistic.oID}');
												if (finish.innerHTML == '1') {
													finish.innerHTML = '送達';
												}
											</script>
										</c:forEach>
									</tbody>
								</table>
							</fieldset>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<!--						<div>
								<h1>Test Query by Type</h1>
										<table>
										<tr>
											<td>
												<button id="typeA" class="ByType" >管理訂單出貨方式</button>
												<button id="typeM" class="ByType" >查詢門市訂單</button>	
												<button id="typeH" class="ByType" >查詢宅配訂單</button>	
											</td>
										</tr>
									</table>
						
								<fieldset>
									<legend>訂單類型</legend>
									<table align=center>
										<thead>
											<tr>
												<td>序號</td>
												<td>訂單號碼</td>
												<td>物流號碼</td>
												<td>送貨類型</td>
												<td>送貨地址</td>
												<td>取件人姓名</td>
												<td>取件人手機</td>
												<td>訂單金額</td>
												<td>狀態</td>
												<td>出貨時間</td>
												<td>送達時間</td>
												<td>備用時間</td>
												<td>完成</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="Logistic" items="${type}" varStatus="status">
												<tr>
													<td>${status.index+1}</td>
													<td>${Logistic.oID}</td>
													<td>${Logistic.lID}</td>
													<td>${Logistic.oType}</td>
													<td>${Logistic.oAddr}</td>
													<td>${Logistic.oName}</td>
													<td>${Logistic.oPhone}</td>
													<td>${Logistic.oAmount}</td>
													<td class="status">${Logistic.oStatus}</td>
													<td>${Logistic.oTimeA}</td>
													<td>${Logistic.oTimeB}</td>
													<td>${Logistic.oTimeC}</td>
													<td>${Logistic.oComplete}</td>
													<td><button
															id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
															class="st1" style="display: none">改成宅配出貨</button>
														<button id="${Logistic.oStatus}${Logistic.oType}${Logistic.oID}"
															class="st2" style="display: none">改成門市出貨</button></td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="11">${null}</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
							<div>
								<h1>
									Test QRCode
								</h1>
									<button id="code1" class="Code" >建立QRCode</button><br>
									<button id="code2" class="Code" >掃描QRCode</button><br>
									${code}
							</div>
							 -->
	<script>
		$(".st1,.st2")
			.on(
				"click",
				function () {
					var Str = this.id
					orderID = Str.substring(2);
					orderStatus = Str.substring(0, 1);
					orderType = Str.substring(1, 2);

					window.location.href = '<c:url value="/ChangeType.do"/>?orderID='
						+ orderID + '&orderType=' + orderType;

				})
		$(".Ready").on("click", function () {
			var Str = this.id
			orderID = Str.substring(2);
			orderStatus = Str.substring(0, 1);
			orderType = Str.substring(1, 2);
			window.location.href = '<c:url value="/logistic/DeliverReady.do"/>?orderID=' + orderID + '&orderStatus=' + orderStatus;
		})
		$(".ByStatus").on("click", function () {
			var Str = this.id
			orderStatus = Str.substring(6);
			window.location.href = '<c:url value="/logistic/queryByStatus.do"/>?orderStatus=' + orderStatus;
		})


		/*
		
				$(".UnPaid,.UnTrans,.Comp").on("click",function() {
					var Str = this.id
					orderID = Str.substring(2);
					orderStatus = Str.substring(0, 1);
					orderType = Str.substring(1, 2);
					window.location.href = '<c:url value="/logistic/ChangeStatus.do"/>?orderID='+ orderID + '&orderStatus=' + orderStatus;
					})
					
				
					
				
				
					
				$(".ByType").on("click", function() {
					var Str = this.id
					orderType = Str.substring(4);
					window.location.href = '<c:url value="/logistic/queryByType.do"/>?orderType=' + orderType;
					})
					
				$("#code1").on("click", function() {
					var Str = this.id
					orderType = Str.substring(4);
					window.location.href = '<c:url value="/CreateQRCode.do"/>';
					})
					
				$("#code2").on("click", function() {
					var Str = this.id
					orderType = Str.substring(4);
					window.location.href = '<c:url value="/ReadQRCode.do"/>';
					})
				
				$(".QRCode").on("click", function() {
					var Str = this.id
					orderID = Str.substring(2);
					orderStatus = Str.substring(0, 1);
					orderType = Str.substring(1, 2);
					window.location.href = '<c:url value="/QRCodeAction.do"/>?orderID='+ orderID + '&orderStatus=' + orderStatus;
					})
				
				$(".create").on("click", function() {
					window.location.href = '<c:url value="/testLogistic.do"/>';
					})
		
				listAll = $('button');
				console.log(listAll);
		
				listM = $('button[id*="M"][class="st2"]');
				listM.attr("style", "display:block;");
		
				listH = $('button[id*="H"][class="st1"]');
				listH.attr("style", "display:block;");
		
				listU = $('button[id^="1"][class="UnPaid"]');
				listU.attr("style", "display:block;");
		
				listT = $('button[id^="2"][class="UnTrans"]');
				listT.attr("style", "display:block;");
				console.log(listT);
				listC = $('button[id^="3"][class="Comp"]');
				listC.attr("style", "display:block;");
				console.log(listC);
				*/
		listR = $('button[id^="2"][class="Ready"]');
		listR.attr("style", "display:block;");
		console.log(listR);



		listD = $('button[id^="4"]');
		listD.attr("style", "display:none;");

		listtd = $('td[class="status"]');
		console.log(listtd);
		/*
		if(listtd.innerHTML=='1'){
			listtd.text('未付款');
		}

		if(listtd.html()=='01'){
			listtd.text('未付款');
		}
		if(listtd.html()=='2'){
			listtd.text('已付款待出貨');
		}
		 */
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
	</body>

</html>