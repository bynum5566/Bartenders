<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
		#orderDiv{
			position:absolute;
			left:3%;
			margin:0px auto;
		}

</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<div class="row">
							<div class="col-12 col-12-medium"><!-- 這裡開始 -->
								<h1 align="center" style="font-size:36px;">這張訂單已交由配送員編號: ${realSender.senderId} 配送中</h1>
								
								<div id="orderDiv" >
									<fieldset >
										<table align=center>
											<thead>
												<tr align=center>
													<td style="width:80px;padding:10px">序號</td>
													<td style="width:270px;padding:10px">訂單號碼</td>
													<td style="width:100px;padding:10px">物流號碼</td>
													<td style="width:80px;padding:10px">類型</td>
													<td style="width:250px;">送貨地址</td>
													<td style="width:120px;padding:10px">收件人</td>
													<td style="width:150px;padding:10px">收件人手機</td>
													<td style="width:80px;padding:10px">金額</td>
													<td style="width:100px;padding:10px">進度</td>
													<td style="width:150px;padding:10px">出貨時間</td>
													<td style="width:150px;padding:10px">物流取貨</td>
													<td style="width:150px;padding:10px">送達時間</td>
												</tr>
											</thead>
											<tbody>
												<tr align=center>
													<td>${status.index+1}</td>
													<td>${valid.oID}</td>
													<td>${valid.lID}</td>
													<td class="myType">${valid.oType}</td>
													<td>***************</td>
													<td>********</td>
													<td>********</td>
													<td>${valid.oAmount}</td>
													<td class="myStatus">${valid.oStatus}</td>
													<td>${valid.oTimeA}</td>
													<td>${valid.oTimeB}</td>
													<td>${valid.oTimeC}</td>
												</tr>
											</tbody>
										</table>
										<div align="center">
											<button id="bt1" class="Code" >返回</button>
										</div>
									</fieldset>
								</div>
							</div><!-- 這裡結束 -->
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<script>
		$("#bt1").on("click", function () {
			window.location.href = '<c:url value="/logistic/WelcomeLogistic"/>';
		})
		
		//狀態轉換
	var type = document.getElementsByClassName('myType');
	for(var i=0;i<type.length;i++){
		if (type[i].innerHTML == '1') {
			type[i].innerHTML = '宅配';
		} else if (type[i].innerHTML == '2') {
			type[i].innerHTML = '超商';
		} else if (type[i].innerHTML == '3') {
			type[i].innerHTML = '票券';
		};
	}

	var myStatus = document.getElementsByClassName('myStatus');
	for(var i=0;i<myStatus.length;i++){
		if (myStatus[i].innerHTML == '1') {
			myStatus[i].innerHTML = '未收貨';
		} else if (myStatus[i].innerHTML == '2') {
			myStatus[i].innerHTML = '配送中';
		} else if (myStatus[i].innerHTML == '3') {
			myStatus[i].innerHTML = '已送達';
		};
	}
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