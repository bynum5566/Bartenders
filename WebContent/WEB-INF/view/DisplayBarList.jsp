<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${title}</title>
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


	.sigmaYellow{
		color: yellow;
	}
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


	<h3 style="color:white">${title}</h3>
	<h3>${msg}</h3>
		<form>
			<table border="1">
				<thead>
					<tr align="center" class="sigmaGray">
				<!-- 	<td> 酒吧編號 </td>	 -->
						<td class="sigmaTd1"> 酒吧名稱 </td>
						<td class="sigmaTd1"> </td>	<!-- <td>前往商品介面</td> -->
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
							<td align="center" style="width:150px">${listOfBar[current.index].companyName}</td>
					
							<!-- 酒吧連結 -->
							<td align="center" style="width:200px">
								<a class="sigmaYellow" href="<c:url value="/DisplayProductList.controller"/>?barAccount=${listOfBar[current.index].account}"
								>前往酒吧產品介面</a>
		
							</td>		
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
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

</main> 
</body>
</html>

<%--左側工具列，開始 --%>   
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>    