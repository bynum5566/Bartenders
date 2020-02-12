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

    <style type= "text/css">

.mydiv {
 width: 100%;
 margin: 0 auto;
 top: 580px;			
 position: sticky;
 text-align: center;    
 }

body {
    background-color:	#ECF5FF;
    
}
* {
    margin:0;
    padding:0;
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
    background-color:#ACD6FF;
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
    </style>
</head>
<body>
<div class = mydiv>
    <div id="allpage">
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" />   
        </header>
        <div id="content">
            <article class="article">
                <section class="section">

<%-- 本體，開始 --%>

		<form action="<c:url value=" 123456" />" method="post">
		<h2>確認訂單資訊頁面</h2>
		<!-- <h3>(購物車編號:${orderId}) </h3>  -->
		<table>
			<thead>
				<tr align="center">
					<td>產品名稱</td>
					<td>產品單價</td>
					<td>產品數量</td>
					<td>產品金額</td>
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

				</tr>
				<tr align="center">
					<td colspan="3">產品合計</td>
					<td>${totalPrice}</td>
				</tr>
				<tr align="center">
					<td colspan="3">運費</td>
					<td>${ShippingNumToPrice[order.shipping]}</td>
				</tr>
				<tr align="center">
					<td colspan="3">訂單總金額</td>
					<td>${finalTotalPrice}</td>
				</tr>
			</tbody>

		</table>

		</form>

		<FORM action="<c:url value="/OrderOneToTwo.controller" />" method="get">
		<h2>配送資訊</h2>
		配送方式:
		
		<!-- =如果是一般商品，可以選擇配送方式，開始= -->

<c:if test="${shipping == '1' or shipping == '2'}">
	<input  name="select1" type="radio" value="1" checked required >
	<!-- onfocus="functionName()" 用來觸發函式 -->
	<label for="setTt1">宅配</label>
	
	<input name="select1" type="radio" value="2" >
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

		<br>
		<label>收件人：</label>
		<input type="text" required="required" name="input1" size="40" value="${defaultName}" />
<!-- 	<Input type='hidden' name='input1' value="${defaultName}"> -->
		<br>
		
		
		<!-- 未選擇 -->
		<c:if test="${shipping == '0' }">
			<label>宅配地址：${defaultAddress}</label>
			<Input type='hidden' name='address1' value="${defaultAddress}">
			<Input type='hidden' name='address2' value="${defaultAddress}">
			<br>
		</c:if>		
		
		
		<c:if test="${shipping == '1' }">
			<label>宅配地址：</label>
			<input type="text" required="required" name="address1" size="40" value="${defaultAddress}" />
	<!-- 	<Input type='hidden' name='address1' value="${defaultAddress}">  -->
			<br>
		</c:if>


		<c:if test="${shipping == '2' }">
			<label>超商門市：</label>
			<input type="text" required="required" name="address2" size="40" value="${defaultAddress}" />
	<!-- 	<Input type='hidden' name='address2' value="${defaultAddress}"> -->	
			<br>
		</c:if>

		<c:if test="${shipping == '3' }">
			<label>QR票券</label>		<!-- 如果是QR不印地址，宅配/超商則會印地址 -->
			<br>
		</c:if>

		<label>電話：</label>
		<input type="text" required="required" name="input2" size="40" value="${defaultPhone}" />
	<!--<Input type='hidden' name='input2' value='${defaultPhone}'> -->
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
		<Input type='hidden' name='Freight' value='${ShippingNumToPrice[order.shipping]}'> <!-- 新增2020131_1634 -->
		<Input type='submit' value='資訊無誤，確認訂購'>
		<p style="color:red">請注意，一經確認，即無法修改。</p>
		</form>
		
<%-- 本體，結束 --%>

                </section>                
            </article>


        
        </div>  <!--end content-->

        <footer>
                <p>2020 All Rights Reserved</p>
        </footer>
    </div>  <!--end allpage-->
</div>	  <!--end mydiv-->
</body>
</html>