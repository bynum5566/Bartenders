<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>加入購物車</title>
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
            <!-- <img class="logo-img" src="images/logo.jpg" title="logo" alt="logo"> -->
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" />		           
        </header>
        <div id="content">
            <article class="article">
                <section class="section">

<%-- 本體，開始 --%>
	<h2 style="color:rgb(200,200,200)">${errorMsgOfAddToCartButton}</h2>
		<form>
			<table>
				<thead>
					<tr align="center">
				<!--  	<td>產品id</td>	-->	
						<td>產品名稱</td>
						<td>庫存數量</td>
						<td>單價 </td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
				<!-- 	<td>${PdId}</td>	-->	
						<td>${ProductName}</td>
						<td>${PdStock}</td>
						<td>${pdPrice}</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">
		購買數量: 


<c:choose>
	<c:when test="${validDate == null}">
		<!-- 一般   -->
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
		</select>
	</c:when>	
	<c:otherwise>
	<!-- QR  -->
	<select name='qty'>
			<option value="1">1</option>
	</select>
	</c:otherwise>
</c:choose>
		
		<Input type='hidden' name='PdId' value='${PdId}'>
		<Input type='hidden' name='ProductName' value='${ProductName}'>
		<Input type='hidden' name='PdStock' value='${PdStock}'>
		<Input type='hidden' name='account' value='${account}'>
		<Input type='hidden' name='pdPrice' value='${pdPrice}'>
		
		<Input type='submit' value='加入購物車'>

		</FORM>
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