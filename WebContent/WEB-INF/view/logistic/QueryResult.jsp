<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>QueryResult</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
		table {
			border-collapse: collapse;
		}

		td {
			border: 1px solid black;
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

<body class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>

						test:${result}<br>

						<form>
							<fieldset>
								<legend>查詢結果</legend>
								<table align=center>
									<thead>
										<tr>
											<td>序號</td>
											<td>訂單號碼</td>
											<td>送貨類型</td>
											<td>送貨地址</td>
											<td>取件人姓名</td>
											<td>取件人手機</td>
											<td>訂單金額</td>
											<td>狀態</td>
											<td>送達時間</td>
											<td>取貨時間</td>
											<td>完成</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="Logistic" items="${result}" varStatus="status">
											<tr>
												<td>${status.index+1}</td>
												<td>${Logistic.oID}</td>
												<td>${Logistic.oType}</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</fieldset>
						</form>
					</section>
				</div>
			</section>
		</article>
	</div>
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