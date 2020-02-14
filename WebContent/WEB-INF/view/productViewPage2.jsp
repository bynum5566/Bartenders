<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/productView.css">
<title>Bartender- Preview ${productName}</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
</head>

<body>
	<div class="outw">
				<div>
					<h2>商品預覽</h2>
				</div>
		<table class="outwrap0">
<!-- 			<tr> -->
<!-- 				<td colspan="2"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td colspan="2">
				<div>
					<h3>${productName}</h3>
				</div>
				</td>
			</tr>
			<tr>
				<td class="inwrap">
					<div class="flos01">
						<div>
							<img id="pdPicture" src="<c:out value="${pic}"/>">
<!-- 							<img id="pdPicture" src="https://images.plurk.com/3igWGJHn8RjteL3eqyutFX.jpg"> -->
						</div>
					</div>
					<div class="flos02">
						<form action="/addMyFav" method="post">
						<div id="hideId" class="pdDataMain">
							<div>商品編號: </div>
							<input type="text" value="<c:out value="${productId}"/>" readonly="readonly">
						</div>
						<div class="pdDataMain">
							<div>價格:
								<span>${pdPri}</span>
							</div>
						</div>
						<div class="pdDataMain">
							<div>庫存量:
								<span id="stk">${pdStk}</span>
							</div>
						</div>
						<div id="quant" class="pdDataMain">
							<div>購買數量:
								<input type="number" min="1" max="<c:out value="${pdStk}"/>">
							</div>
						</div>
						<div id="sold" class="pdDataMain">
							<h4>缺貨中</h4>
						</div>
						<div class="pdDataMain flos">
							<div>有效期間:<br>
								<span>${pdValD}</span>
							</div>
						</div>
						<div id="myFv">
							<div>
								<input id="bT" class="bT" type="submit" value="加入購物車+">
							</div>
						</div>
					</form>
							<div>
								<input class="bT" type="submit" value="加入我的最愛+">
							</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="dtails">
						<p>${pdDetail}</p>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="bt01">
					<!-- <a href="/Bartenders/Dashboard.TkProducts">
						<input class="bt01 bt0 bT01" type="button" value="回商品管理" />
					</a> -->
				<button onclick="location.href = '/Bartenders/Dashboard.TkProducts';" class="bT" >回票券商品管理</button>
			</td>
			</tr>
		</table>
	</div>

	<%@ include file="menu.jsp"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	$('#sold').hide();
	$('#hideId').hide();
	var stock = document.getElementById("stk").value;
	if(stock <= 0){
		$('#sold').show();
		$('#quant').hide();
	}else{
		$('#quant').show();
		$('#sold').hide();
	}
</script>
</body>
</html>