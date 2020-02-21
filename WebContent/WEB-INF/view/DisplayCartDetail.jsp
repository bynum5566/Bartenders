<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>確認訂單資訊頁面</title>
<%-- 畫面version 20200213_1650--%>
    <link 
    rel="stylesheet" 
    type="text/css" 
    href="/Bartenders/CSS/add_editView.css">
	
	<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
	
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>
	
    <style type= "text/css">	

	.sigmaGray{
		color: gray;
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
 
h{
	color:white ;
}

td{
	border-width: 1px;
}

* {
    margin:0;
    padding:0;
    font-family :Microsoft JhengHei;
}
#allpage {
    width:100%;
    margin:0 auto;
}
header {
    width:100%;
}
.logo-img {
    width:100%;
    
}
.menu {
    width:100%;
    overflow:auto;            
    border-radius:5px;
    list-style-type:none;
   
}
.menu li {
    width:7em;
    line-height:2.5em;
    float:left;
    
}
.menu li a {
    display:block;
    text-align:center;
    color:	#005AB5;
}
.menu li a:link {
    text-decoration:none;
}
.menu li a:hover {
    background-color:	#0080FF	;
    color:	#ffffff;
    border-radius:5px;
}
#content {
    width:100%;
    overflow:auto;
    /* border:1px solid gray; */
}
.article {
    width:100%;
    float:left;
}
.section {
    background-color:#ffffff;
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
}

.aside {
    width:28%;
    float:right;
    
}
footer {
    background-color:	#ACD6FF;
    border-radius:5px;
    text-align:center;
    line-height:2.5em;
    color:	#4F4F4F;
}

<!--縮放用CSS，開始-->
div.panel,img.flip
{
	margin:0px;
	padding:5px;
	text-align:center;
	background:#e5eecc;
	border:solid 1px #c3c3c3;
}
div.panel
{
	height:300px;
	width:300px;
	display:none;
}
<!--縮放用CSS，結束-->

  
    </style>

<!-- script src,開始 -->   
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<!-- script src,結束-->
    
</head>
<body>
<main>

    <div class="mydiv" >
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" /> 
        </header>
        <div >

<%-- 本體，開始 --%>

		<form action="<c:url value=" 123456" />" method="post">
		<h2>確認訂單資訊頁面</h2>
		<!-- <h3>(購物車編號:${orderId}) </h3>  -->
		<table border="1">
			<thead>
				<tr align="center">
					<td class="sigmaTd1">產品名稱</td>
					<td class="sigmaTd1">產品單價</td>
					<td class="sigmaTd1">產品數量</td>
					<td class="sigmaTd1">產品金額</td>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<c:forEach items="${oneOrderCarts}" var="list" step="1" varStatus="current">
				<tr>

					<c:if test="${oneOrderCarts[current.index].quantity != '0' }">
						<td align="center">${productData[current.index].productName}</td>
						<td align="center">${oneOrderCarts[current.index].checkoutPrice}</td>
						<td align="center">${oneOrderCarts[current.index].quantity}</td>
						<td align="center">${productsPrice[current.index]}</td>
					</c:if>

				</tr>
				<br>
				</c:forEach>

				<td> </td>
				</tr>
				<tr align="center">
					<td colspan="3">產品合計</td>
					<td>${totalPrice}</td>
				</tr>
				<tr align="center">
					<td colspan="3" >運費</td>
					<td id = "Freight">${ShippingNumToPrice[order.shipping]}</td>
				</tr>
				  <!--<tr align="center">-->
					<!--<td colspan="3" id ="finalTotalPrice">訂單總金額</td>
					<!--<td>${finalTotalPrice}</td>
				<!--</tr>-->
				
			</tbody>

		</table>

		</form>

		<FORM action="<c:url value="/ChangeStatusOneToTwo.controller" />" method="get">
		<h2>配送資訊</h2>
		配送方式:
		
		<!-- =如果是一般商品，可以選擇配送方式，開始= -->

<c:if test="${shipping == '1' or shipping == '2'}">
	<!--  如果這固定宅配，enable這個		<Input type='hidden' name='select1' value="${shipping}"> --> 
	<!--  如果這固定宅配，enable這個		<label>宅配</label> -->
	
	<input  name="select1" type="radio" value="1" onclick="onclickFunction01()" checked required >
	<label for="setTt1">宅配</label>
	<input name="select1" type="radio" value="2" onclick="onclickFunction02()">
	<label	for="setTt2">超商</label>
	

</c:if>

<!-- 
0	未選擇
1	宅配
2	超商
3	QR票券
 -->
		<!-- =如果是一般商品，可以選擇配送方式，結束= -->
		
		<c:if test="${shipping == '3' }">
			<label>QR票券</label>
		</c:if>

		<c:if test="${shipping == '1' }">
		<br>
		<label>收件人&emsp;&emsp;：</label>
		<input type="text" required="required" name="input1" size="30" value="${defaultName}" />
<!-- 	<Input type='hidden' name='input1' value="${defaultName}"> -->
		<br>
		</c:if>
		<c:if test="${shipping == '3' }">
		<br>
		<label></label>
		<Input type='hidden' name='input1' value="${defaultName}">
		<br>
		</c:if>
		
		<!-- 未選擇 -->
		<c:if test="${shipping == '0' }">
			<label>宅配地址：${defaultAddress}</label>
			<Input type='hidden' name='address1' value="${defaultAddress}">
			<Input type='hidden' name='address2' value="${defaultAddress}">
			<br>
		</c:if>		
		
		
		<c:if test="${shipping == '1' }">
			<label>地址／門市：</label>
			<input type="text" required="required" name="address1" size="30" value="${defaultAddress}" />
	<!-- 	<Input type='hidden' name='address1' value="${defaultAddress}">  -->
			<br>
		</c:if>


		<c:if test="${shipping == '2' }">
			<label>超商門市：</label>
			<input type="text" required="required" name="address2" size="30" value="${defaultAddress}" />
			<br>
		</c:if>

		<c:if test="${shipping == '3' }">
			<label></label>		
			<Input type='hidden' name='input2' value="${defaultAddress}">
			<br>
		</c:if>

		<c:if test="${shipping == '1' }">
		<!-- 全型空白 -->
		<label>電話&emsp;&emsp;&emsp;：</label>
		<input type="text" required="required" name="input2" size="30" value="${defaultPhone}" />
		</c:if>
		<c:if test="${shipping == '3' }">
			<label></label>	
		</c:if>

		<br>
		<c:if test="${shipping == '1' }">
			<Input type='hidden' name='address2' value='empty'>
		</c:if>
		<c:if test="${shipping == '2' }">
			<Input type='hidden' name='address1' value='empty'>
		</c:if>
		<c:if test="${shipping == '3' }">
			<Input type='hidden' name='address1' value='empty'>
			<Input type='hidden' name='address2' value='empty'>
		</c:if>

		<c:if test="${shipping == '3' }">
			<Input type='hidden' name='select1' value='${shipping}'>
		</c:if>

		

		<Input type='hidden' name='orderId' value='${orderId}'>
		<Input type='hidden' name='totalPrice' value='${totalPrice}'> <!-- 新增2020131_1634 -->
		  	<Input type='hidden' name='Freight' value='${ShippingNumToPrice[order.shipping]}'>  
		<!--  	<Input type='hidden' name='Freight' value='${ShippingNumToPrice[order.shipping]}'>  -->
		<Input type='submit' value='資訊無誤，確認訂購'>
		<p style="color:red">請注意，一經確認，即無法修改。</p>
		</form>
		
<%-- 本體，結束 --%>
        
        </div>  <!--end content-->


    </div>  <!--end allpage-->
   
<!--縮放用JS，開始-->
<script type="text/javascript">
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
</script>
<!--縮放用JS，結束-->


<script type="text/javascript">
function onclickFunction01() {
	document.getElementById("Freight").innerHTML = "80";
	}
function onclickFunction02() {
	document.getElementById("Freight").innerHTML = "60";
	
}

</script>

</main> 
</body>
</html>

<%--左側工具列，開始 --%>   
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>    