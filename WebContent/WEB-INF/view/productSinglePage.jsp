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
			<tr>
				<td>
					<h3>${productName}</h3>
				</td>
			</tr>
			<tr>
				<td class="inwrap">
					<div class="flos01">
						<div>
							<img id="pdPicture" src="<c:out value="${pic}"/>">
						</div>
					</div>
					<div class="flos02">
						<form action="/Bartenders/AddProductToCart.controller" method="GET">
							<div id="hideId" class="pdDataMain">
								<input type="text" name="PdId" value="<c:out value="${productId}"/>" readonly="readonly">
								<input type = "number" name="PdStock" value="<c:out value="${pdStk}"/>" readonly="readonly">
								<input type = "text" name="ProductName" value="<c:out value="${productName}"/>" readonly="readonly">
							</div>
							<div>
								<h2 style="color:rgb(200,200,200)">${errorMsgOfAddToCartButton}</h2>
							</div>
							<div class="pdDataMain">
								<div>
									價格:${pdPri}
								</div>
							</div>
							<div class="pdDataMain">
								<div>
									庫存量:
									<span id="stk">${pdStk}</span>
								</div>
							</div>
							<div id="quant" class="pdDataMain">
								<div>
									購買數量:
									<input type="number" name="qty" value="1" min="1" max="<c:out value="${pdStk}"/>">
								</div>
							</div>
							<div id="sold" class="pdDataMain">
								<div>缺貨中</div>
							</div>
							<div id="vdTime" class="pdDataMain">
								${pdValD}
								<!-- <div>有效期間:
									<span id="vdTime2">${pdValD}</span>
								</div> -->
							</div>
							<div id="myFv" class="bt01">
								${bT}
								<!-- <input class="bT" type="submit" value="加入購物車+"> -->
							</div>
						</form>
							<div id="pdLk">
<!-- 								<form action="/Bartenders/addMyFav" method="post"> -->
<!-- 									<input id ="pdidckL" type="text" name="pdidck" class="pdidckLL" -->
<%-- 										value="<c:out value="${productId}"/>" readonly="readonly"> --%>
									<a href="/Bartenders/addMyFav?pdidck=<c:out value="${productId}"/>">
										<input class="bT" type="submit" value="加入我的最愛+">
									</a>
<!-- 								</form> -->
							</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="dtails">
						<p>${pdDetail}</p>
					</div>
				</td>
			</tr>
			<tr>
				<td class="bt01">
					<!-- <a href="/Bartenders/Dashboard.MyFavorite">
						<input class="bT01" type="button" value="回我的最愛" />
					</a> -->
					<button onclick="location.href = '/Bartenders/Dashboard.MyFavorite';" class="bT" >回我的最愛</button>
				</td>
			</tr>
		</table>
	</div>
	
	<%@include file="UserMenu.jsp"%>

<script type="text/javascript">
	$('#sold').hide();
	$('#hideId').hide();
	$('#pdidckL').hide();
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