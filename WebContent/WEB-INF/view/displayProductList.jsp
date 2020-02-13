<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


    <link rel="stylesheet" type="text/css" href="/Bartenders/images/add_editView.css">
	<noscript><link rel="stylesheet" href="/Bartenders/images/noscript.css" /></noscript>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>

<title>酒吧</title>

<style>

.mydiv {
	width: auto;
	margin: auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.5) 99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
}


	.sigmaTd1 {
		width: 100px;
		height: 50px;
		text-align: center;
	}
	
	.sigmaTd6 {
		width: 600px;
		height: 50px;
		text-align: center;
	}
	
	
	div.panel, img.flip {
		margin: 0px;
		padding: 5px;
		text-align: center;
		background: #e5eecc;
		border: solid 1px #c3c3c3;
	}
	
	div.panel {
		height: 300px;
		width: 300px;
		display: none;
	}
	
	section {
   
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
}

</style>
</head>

<body>

<main>

<div class = mydiv>		<!-- 【G】 -->
<div>	<!-- 【F】 -->
		<header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" />
		</header>
		
<div id="content">	<!-- 【B】 -->


	<section >	
		<table border="1">
			<tr>
				<td class="sigmaTd1">${CompanyName}</td>
				<td class="sigmaTd1">酒吧logo</td>
				<td class="sigmaTd1">地圖按鈕</td>
				<td class="sigmaTd1">Menu</td>
			</tr>
		</table>	
	</section>
	
	<section >
		<table border="1">
			<tr>
				<td class="sigmaTd6">event</td>
			</tr>
		</table>
	</section>
	
	<section >
		<table border="1">
			<tr>
				<td class="sigmaTd6">跑馬燈(圖片)</td>
			</tr>
			<tr>
				<td class="sigmaTd6">酒吧介紹文字</td>
			</tr>
		</table>
	</section>
	

<%-- 本體，開始 --%>

<div >
	<section >
		<%-- 清單版本 --%>
<h3 class="sigmaTd1" style="color:white">商品清單</h3>
<h3>${msg}</h3>
<div>
	<!--  	<form action="<c:url value="/DisplayProductList.controller"/>" method="post"> -->
<table>
	<thead>
		<tr align="center">
			<!--  	<td>商品編號</td> -->
			<td class="sigmaTd1">商品名稱</td>
			<td class="sigmaTd1">商品種類</td>
			<td class="sigmaTd1">單價</td>
			<td class="sigmaTd1">庫存</td>
			<td class="sigmaTd1">前往商品介面</td>
			<td class="sigmaTd1">圖片</td>
			<td class="sigmaTd1">加入購物車</td>
		</tr>
	</thead>
	<tbody>
		<tr align="center">

		<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
		<tr>


			<!-- 商品名稱 -->
			<td align="center">${listOfProduct[current.index].productName}</td>

			<!-- validDate is not null 【QR】 -->
			<!-- 商品種類 -->
<td><c:choose>
<c:when
	test="${listOfProduct[current.index].validDate == null}">
一般
</c:when>
<c:otherwise>
QR
</c:otherwise>
</c:choose></td>

<!-- 單價 -->
<td align="center">${listOfProduct[current.index].pdPrice}</td>

<td align="center">${listOfProduct[current.index].pdStock}</td>

<td align="center"><a
	href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}">前往商品介面</a>
</td>

<td>
	<div>

<img width="200" height="200"
	src="<c:out value="${listOfProduct[current.index].productImageUrl}"/>" />
</div>
</td>

<td><c:choose>
<c:when
	test="${listOfProduct[current.index].validDate == null}">
<!-- 一般   -->
<div>

<FORM
	action="<c:url value="/AddProductToCart.controller" />"
method="get">

<select name='qty'>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
</select> <Input type='hidden' name='PdId'
	value='${listOfProduct[current.index].pdId}'>
<Input type='hidden' name='ProductName'
	value='${listOfProduct[current.index].productName}'>
<Input type='hidden' name='PdStock'
	value='${listOfProduct[current.index].pdStock}'>
<Input type='hidden' name='account' value='${account}'>
<Input type='hidden' name='pdPrice'
	value='${listOfProduct[current.index].pdPrice}'>

		<Input type='submit' value='加入購物車'>

	</FORM>

</div>

</c:when>
<c:otherwise>
<!-- QR -->
<div>

<FORM
	action="<c:url value="/AddProductToCart.controller" />"
method="get">

<select name='qty'>
	<!-- QR票券只能買一張 -->
	<option value="1">1</option>
</select> <Input type='hidden' name='PdId'
	value='${listOfProduct[current.index].pdId}'>
<Input type='hidden' name='ProductName'
	value='${listOfProduct[current.index].productName}'>
<Input type='hidden' name='PdStock'
	value='${listOfProduct[current.index].pdStock}'>
<Input type='hidden' name='account' value='${account}'>
<Input type='hidden' name='pdPrice'
	value='${listOfProduct[current.index].pdPrice}'>

		<Input type='submit' value='加入購物車'>

	</FORM>

</div>

</c:otherwise>
</c:choose></td>

</tr>
</c:forEach>
		</tr>
	</tbody>
</table>

</div>

	</section>
</div>

<%-- 本體，結束 --%>




</div>


	</div>
</div>

</main>

</body>
</html>

<%--左側工具列，開始 --%>
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>
