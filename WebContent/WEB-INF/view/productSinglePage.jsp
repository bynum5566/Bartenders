<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/productView.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forSlideShow.css">
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
				<td colspan="2">
					<div>
						<h3>${productName}</h3>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inwrap">
					<div class="flos01">
<!-- 						<div> -->
<%-- 							<img id="pdPicture" src="<c:out value="${pic}"/>"> --%>
<!-- 						</div> -->
						<ul class="slides">
							<input type="radio" name="radio-btn" id="img-1" checked />
							<li class="slide-container">
								<div class="slide">
									<img src="<c:out value="${pic1}"/>" />
								</div>
								<div class="nav">
									<label for="img-3" class="prev">&#x2039;</label>
									<label for="img-2" class="next">&#x203a;</label>
								</div>
							</li>
							<input type="radio" name="radio-btn" id="img-2" />
							<li class="slide-container">
								<div class="slide">
									<img src="<c:out value="${pic2}"/>" />
								</div>
								<div class="nav">
									<label for="img-1" class="prev">&#x2039;</label>
									<label for="img-3" class="next">&#x203a;</label>
								</div>
							</li>
							<input type="radio" name="radio-btn" id="img-3" />
							<li class="slide-container">
								<div class="slide">
									<img src="<c:out value="${pic3}"/>" />
								</div>
								<div class="nav">
									<label for="img-2" class="prev">&#x2039;</label>
									<label for="img-1" class="next">&#x203a;</label>
								</div>
							</li>
							<li class="nav-dots">
								<label for="img-1" class="nav-dot" id="img-dot-1"></label>
								<label for="img-2" class="nav-dot" id="img-dot-2"></label>
								<label for="img-3" class="nav-dot" id="img-dot-3"></label>
							</li>
						</ul>
					</div>
					<div class="flos02">
						<form action="/Bartenders/AddProductToCart.controller"
							method="GET">
							<div id="hideId" class="pdDataMain">
								<input type="text" name="PdId"
									value="<c:out value="${productId}"/>" readonly="readonly">
								<input type="number" name="PdStock"
									value="<c:out value="${pdStk}"/>" readonly="readonly">
								<input type="text" name="ProductName"
									value="<c:out value="${productName}"/>" readonly="readonly">
							</div>
							<div>
								<h2 style="color: rgb(200, 200, 200)">${errorMsgOfAddToCartButton}</h2>
							</div>
							<div class="pdDataMain">
								<div>
									<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag1}"/>">${Tag1}</a>
									<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag2}"/>">${Tag2}</a>
									<a href="/Bartenders/search.Product?keyword=<c:out value="${Tag3}"/>">${Tag3}</a>
								</div>
							</div>
							<div class="pdDataMain">
								<div>價格:${pdPri}</div>
							</div>
							<div class="pdDataMain">
								<div>
									庫存量: <span id="stk">${pdStk}</span>
								</div>
							</div>
							<div id="quant" class="pdDataMain">
								<div>
									購買數量: <input type="number" name="qty" value="1" min="1"
										max="<c:out value="${pdStk}"/>">
								</div>
							</div>
							<div id="sold" class="pdDataMain">
								<div>缺貨中</div>
							</div>
							<div id="vdTime" class="pdDataMain">${pdValD}</div>
							<div id="myFv" class="bt01">${bT}</div>
						</form>
						<div id="pdLk">
							<a
								href="/Bartenders/addMyFav?pdidck=<c:out value="${productId}"/>">
								<input class="bT" type="submit" value="加入我的最愛+">
							</a> <br>
							<button
								style="background-image: url(/Bartenders/images/like_icon.png); background-repeat: no-repeat; background-size: cover; background-position: center;"
								onclick="location.href = '/Bartenders/addFav.bar?cidck=500002';"
								class="bT" />
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
					<button
						onclick="location.href = '/Bartenders/Dashboard.MyFavorite';"
						class="bT">回我的最愛</button>
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
		if (stock <= 0) {
			$('#sold').show();
			$('#quant').hide();
		} else {
			$('#quant').show();
			$('#sold').hide();
		}
	</script>
</body>
</html>