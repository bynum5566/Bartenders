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
			left:0px;
		}
		
		#bt1{
			position:fixed;
			top:20%;
			display:none;
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
								<h1 align="center" style="font-size:36px;">這項商品正在配送中</h1>
								<div id="orderDiv">
								<fieldset>
									<legend>訂單明細</legend>
									<table align=center>
										<thead>
											<tr>
												<td style="width:80px;padding:10px">序號</td>
												<td>訂單號碼</td>
												<td>物流號碼</td>
												<td style="width:80px;padding:10px">類型</td>
												<td style="width:250px;">送貨地址</td>
												<td style="width:150px;padding:10px">取件人姓名</td>
												<td style="width:150px;padding:10px">取件人手機</td>
												<td style="width:80px;padding:10px">金額</td>
												<td style="width:100px;padding:10px">進度</td>
												<td style="width:150px;padding:10px">出貨時間</td>
												<td style="width:150px;padding:10px">物流取貨</td>
												<td style="width:150px;padding:10px">送達時間</td>
												<td style="width:80px;padding:10px">狀態</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${status.index+1}</td>
												<td>${valid.oID}</td>
												<td>${valid.lID}</td>
												<td>${valid.oType}</td>
												<td>${valid.oAddr}</td>
												<td>${valid.oName}</td>
												<td>${valid.oPhone}</td>
												<td>${valid.oAmount}</td>
												<td class="status">${valid.oStatus}</td>
												<td>${valid.oTimeA}</td>
												<td>${valid.oTimeB}</td>
												<td>${valid.oTimeC}</td>
												<td>${valid.oComplete}</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
							<button id="bt1" class="Code" >返回</button><br>
							</div><!-- 這裡結束 -->
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	<script>
		$("#bt1").on("click", function () {
			window.location.href = '<c:url value="/logistic/LogisticGate"/>';
		})
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