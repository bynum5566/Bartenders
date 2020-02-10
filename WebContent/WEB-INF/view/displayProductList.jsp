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
	<div>(介面版本:L_20200204_1556)</div>
    <div id="allpage">
        <header>
            <!-- <img class="logo-img" src="images/logo.jpg" title="logo" alt="logo"> -->
            <nav>
				<ul class="menu">
					<li><a href="<c:url value="/DisplayProductList.controller"/>">商城</a></li>
					<li><a href="<c:url value="/DisplayCartList.controller"/>">我的購物車</a> </li>
					<li><a href="<c:url value="/userOrder.controller"/>">查看訂單</a> </li>						
					<c:choose>
						<c:when test="${LoginStatus=='true'}">
                    <li><a href="/CreateUsers/logout">登出</a></li>
						</c:when>
						<c:otherwise>
					<li><a href="http://localhost:8080/CreateUsers/login">登入</a></li>
						</c:otherwise>
					</c:choose>				
                </ul>
            </nav>            
        </header>
        <div id="content">
		<div class="article">
			<section class="section">
        	 <h2>區塊B-搜尋產品用</h2> 
        	 	<form action="" method ="GET" >
        	 	<input name="TestTestTest" type="text" size="40" required="required">
        	 	<Input type='submit' value='在此商城搜尋'>
        	 	</form>
        	 	
        	 </section>
        </div>
        <div class="article">
			<section class="section">
        	 <h2>區塊C-關於賣場</h2> 
        	 </section>
        </div>
            <article class="article">
                <section class="section">
                <!-- 區塊1 -->
                    <h2>區塊Z1_中央保留</h2>                    
                    <p></p>
					<p></p>
                </section>                
            </article>
<%-- 本體，開始 --%>
			<div class="article">
				<section class="section">
					<h2>區塊D_商品清單</h2> 
					<h3>商品清單</h3>
					<h3>${msg}</h3>
					<form action="<c:url value="/DisplayProductList.controller"/>" method="post">
						<table>
							<thead>
								<tr align="center">
									<td>商品編號</td>
									<td>商品名稱</td>
									<td>單價</td>
									<td>庫存</td>
									<td>前往商品介面</td>
									<td>圖片</td>>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
									<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
								<tr>
									<!-- 商品編號 -->
									<td align="center"><a
											href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
											value="${listOfProduct[current.index].pdId}">${listOfProduct[current.index].pdId}</a>
									</td>
									<!-- 商品名稱 -->
									<td align="center">${listOfProduct[current.index].productName}</td>
									<!-- 單價 -->
									<td align="center">${listOfProduct[current.index].pdPrice}</td>
			
									<td align="center">${listOfProduct[current.index].pdStock}</td>
			
									<td align="center"><a
											href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
											value="${listOfProduct[current.index].pdId}">前往商品介面</a></td>
									<td>
										<div>
											<img src="<c:out value="${pdpicUrl}"/>"/>
										</div>
									</td>
			
			
								</tr>
								</c:forEach>
								</tr>
							</tbody>
						</table>
					</form>
			</section>
        </div>
<%-- 本體，結束 --%>
        
        </div>  <!--end content-->

        <footer>
                <p>2020 All Rights Reserved</p>
        </footer>
    </div>  <!--end allpage-->
</body>
</html>