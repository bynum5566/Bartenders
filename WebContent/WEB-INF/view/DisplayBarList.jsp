<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>所有酒吧</title>
    <!-- 
    <link rel="stylesheet" href="styles/rwd.css">
    <link rel="stylesheet" href="styles/rwd780.css" media="screen and (max-width:780px)">
     -->
     
     <!-- type -->
          <%--.mydiv--%>
    <style type= "text/css">	
 
     

    
.mydiv {
 width: 100%;
 margin: 0 auto;
 top: 80px;
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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<!-- script src,結束-->
    
</head>
<body>
<div class = mydiv>
    <div id="allpage">
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" /> 
        </header>
        <div id="content">

<%-- 本體，開始 --%>
			<div class="article">
				<section class="section">
<%-- 清單版本 --%>
					<h3>所有酒吧</h3>
					<h3>${msg}</h3>
				<div>
				<!--  	<form action="<c:url value="/DisplayProductList.controller"/>" method="post"> -->
						<table style="border:3px #cccccc solid;">
							<thead>
								<tr align="center">
							<!-- 	<td> 酒吧編號 </td>	 -->
									<td> 酒吧名稱 </td>
									<td></td>	<!-- <td>前往商品介面</td> -->
								</tr>
							</thead>
							<tbody>
								<tr align="center">
								
<c:forEach items="${listOfBar}" var="list" step="1" varStatus="current">
	<tr>
	<!-- 酒吧編號 -->	
	<!--	<td align="center">	 -->
	<!--	${listOfBar[current.index].companyId} -->		<!-- id > companyId -->
	<!--	</td>	-->
	
		 
		<!-- 酒吧名稱 -->
		<td align="center">${listOfBar[current.index].companyName}</td>

		
		<td align="center">
		<a href="<c:url value="/DisplayProductList.controller"/>?barAccount=${listOfBar[current.index].account}"
		>前往酒吧產品介面</a>
		</td>
		
	</tr>
</c:forEach>
								</tr>
							</tbody>
						</table>
				<!-- </form>    -->	
					</div>	
			</section>
        </div>
<%-- 本體，結束 --%>
        
        </div>  <!--end content-->

        <footer>
                <p>2020 All Rights Reserved</p>
        </footer>
    </div>  <!--end allpage-->
</div>     
<!--縮放用JS，開始-->
<script type="text/javascript">
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
</script>
<!--縮放用JS，結束-->

   
</body>
</html>

<%@include file="UserMenu.jsp"%>