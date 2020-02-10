<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>RWD 網頁測試</title>
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
	<div>(介面版本:N_20200204_1629)</div>
    <div id="allpage">
        <header>
            <!-- <img class="logo-img" src="images/logo.jpg" title="logo" alt="logo"> -->
            <nav>
                <ul class="menu">
					<li><a href="<c:url value="/DisplayProductList.controller"/>">商城</a></li>
					<li><a href="<c:url value="/DisplayCartList.controller"/>">我的購物車</a> </li>
					<li><a href="<c:url value="/userOrder.controller"/>">查看訂單</a> </li>					
					<li><a href="http://localhost:8080/CreateUsers/login">登入</a></li>
                    <li><a href="/CreateUsers/logout">登出</a></li>                
				</ul>
            </nav>            
        </header>
        <div id="content">
            <article class="article">
                <section class="section">

<%-- 本體，開始 --%>

		<form action="<c:url value=" 123456" />" method="post">
		<h2>DisplayProductInCart.jsp</h2>
		<h2>購物車中的產品數量(訂單編號:${orderId})</h2>
		<a href="<c:url value="/DisplayCartList.controller"/>">回到購物車清單</a>
		<table>
			<thead>
				<tr align="center">

					<td>產品id</td>
					<td>產品名稱</td>
					<td>產品單價</td>
					<td>數量</td>
					<td>修改數量</td>
					<td>刪除</td>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<c:forEach items="${oneOrderCarts}" var="list" step="1" varStatus="current">
				<tr>
					<c:if test="${oneOrderCarts[current.index].quantity != '0' }">
						<td align="center">${oneOrderCarts[current.index].pdId}</td>
						<td align="center">${listOfProduct[current.index].productName}</td>
						<td align="center">${oneOrderCarts[current.index].checkoutPrice}</td>


						<td align="center">${oneOrderCarts[current.index].quantity}</td>

						<td align="center"><a
								href="<c:url value="/ChangeNumberOfProductInCart.controller"/>?num=${oneOrderCarts[current.index].num}"
								value="${oneOrderCarts[current.index].num}">修改數量</a>
						</td>

						<td align="center"><a href="<c:url value=""/>?num=${oneOrderCarts[current.index].num}"
								value="${oneOrderCarts[current.index].num}">刪除</a> <!-- 未完成 -->
						</td>


					</c:if>
				</tr>
				<br>
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