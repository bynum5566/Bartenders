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
<%-- 畫面version 20200213_1650--%>
    <link 
    rel="stylesheet" 
    type="text/css" 
    href="/Bartenders/images/add_editView.css">
	<noscript><link rel="stylesheet" href="/Bartenders/images/noscript.css" /></noscript>
	
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
	<!-- 加入購物車 -->
	<!-- [加入購物車成功] 改亮字 -->
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
        
        </div>  <!--end content-->


    </div>  <!--end allpage-->
   
<!--縮放用JS，開始-->
<script type="text/javascript">
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
</script>
<!--縮放用JS，結束-->

</main> 
</body>
</html>

<%--左側工具列，開始 --%>   
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>    