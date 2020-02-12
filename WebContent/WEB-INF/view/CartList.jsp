<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的購物車</title>
    <!-- 
    <link rel="stylesheet" href="styles/rwd.css">
    <link rel="stylesheet" href="styles/rwd780.css" media="screen and (max-width:780px)">
     -->
    <style>
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
    <div id="allpage">
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" /> 
        </header>
        <div id="content">
            <article class="article">
                <section class="section">

<%-- 本體，開始 --%>
	
	
		<h3>我的購物車</h3>

		<h3>${msg}</h3>
		<form>
			<table>
				<thead>
					<tr align="center">
						<!-- <td>購物車編號</td> -->
						<td>賣家名稱</td>
						<td>商品名稱</td>
						<td>小計</td>
						<td>配送類型</td>
						<!-- <td>修改配送資訊</td> -->
						<td>修改數量</td>
							<td>從購物車移除</td>
							<td>成立訂單</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<c:forEach items="${Corders}" var="list" step="1" varStatus="current">
					<tr>
						<!-- 購物車編號 -->
						<!-- <td align="center">${Corders[current.index].orderId}</td> -->
						<!-- 賣家名稱  -->
						<td align="center">${company[current.index].companyName}</td>
						<!-- 商品名稱 -->
						<td align="center">${productData[current.index].productName}等</td>
						<!-- 小計 -->
						<td align="center">${Corders[current.index].amount}</td>
						<!-- 配送方式 -->
						<td align="center">${ShippingNumToStr[Corders[current.index].shipping]}</td>
						<!-- 修改購物車 -->

						<!-- 修改配送資訊 -->
						<!-- 
						<td align="center"><a
								href="<c:url value="/ChangeCart.controller"/>?orderId=${Corders[current.index].orderId}">修改配送資訊</a></td>
						 -->
						<td align="center"><a
								href="<c:url value="/DisplayProductInCart.controller"/>?orderId=${Corders[current.index].orderId}"
								>修改數量</a></td>

						<!-- 從購物車移除 -->
						<td><a href="<c:url value="/CancelCart.controller"/>?orderId=${Corders[current.index].orderId}&status=${Corders[current.index].status}"
								>從購物車移除</a></td>
						<td><a href="<c:url value="/DisplayCart.controller"/>?orderId=${Corders[current.index].orderId}&status=${Corders[current.index].status}"
								>成立訂單</a></td>

					</tr>
					</c:forEach>
					</tr>
				</tbody>
			</table>
		</form>
		
<%-- 本體，結束 --%>

                </section>                
            </article>


        
        </div>  <!--end content-->

        <footer>
                <p>2020 All Rights Reserved</p>
        </footer>
    </div>  <!--end allpage-->
</body>
</html>