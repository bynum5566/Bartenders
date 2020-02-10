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
	
		<h2>${msg}</h2>
		<form action="<c:url value="/CancelCart.controller"/>" method="POST">
			<h2>
				<a href="<c:url value="/DisplayCartList.controller"/>">返回訂單頁面 </a> </h2> </form> 
				
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