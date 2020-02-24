<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="UserMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢配送進度</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style>
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
	color: white;
	font-size: 24px;
	border: 1px solid white;
	padding:5px;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<form action="searchTargetOrder.do" method="post">
		<label style="color:white">請輸入欲查詢的訂單號碼<input type="text" name="oID"></label>
		<input type="submit" value="查詢">
	</form>
	
		<fieldset >
			<legend style="color: white;font-size: 24px;">查詢結果</legend>
			<form >
			<table >
					<tr>
						<td>訂單號碼</td>
						<td>取件人姓名</td>
						<td>取件人手機</td>
						<td>送貨地址</td>
						<td>送貨類型</td>
						<td>訂單金額</td>
						<td>狀態</td>
						<td>出貨時間</td>
						<td>物流接收時間</td>
						<td>送達時間</td>
					</tr>
						<c:choose>

						<%-- --%>
						<c:when test="${not empty result.oID}">
							<tr>
								<td>${result.oID}</td>
								<td>${result.oName}</td>
								<td>${result.oPhone}</td>
								<td>${result.oAddr}</td>
								<td id="type">${result.oType}</td>
								<td>${result.oAmount}</td>
								<td id="ostatus">${result.oStatus}</td>
								<td>${result.oTimeA}</td>
								<td>${result.oTimeB}</td>
								<td>${result.oTimeC}</td>
							</tr>
							<script>
								var type = document.getElementById('type');
								if(type.innerHTML=='1'){
									type.innerHTML = '宅配';
								}else if(type.innerHTML=='2'){
									type.innerHTML = '超商';
								}else if(type.innerHTML=='3'){
									type.innerHTML = '票券';
								};
								var orderstatus = document.getElementById('ostatus');
								if(orderstatus.innerHTML=='1'){
									orderstatus.innerHTML = '未收貨';
								}else if(orderstatus.innerHTML=='2'){
									orderstatus.innerHTML = '配送中';
								}else if(orderstatus.innerHTML=='3'){
									orderstatus.innerHTML = '已送達';
								};
							</script>
						</c:when>
						<c:when test="${noData=='no'}">
							<tr>
								<td colspan="10">查無訂單，請重新輸入訂單號碼</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10">請輸入訂單號碼</td>
							</tr>
						</c:otherwise>
				
						</c:choose>
			</table>
			</form>
		</fieldset>


</body>
</html>