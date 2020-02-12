<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>酒吧</title>
    <!-- 
    <link rel="stylesheet" href="styles/rwd.css">
    <link rel="stylesheet" href="styles/rwd780.css" media="screen and (max-width:780px)">
     -->
    <style>
    
.td1{
	width:100px;
	height: 50px;
	text-align: center;
}
.td6{
	width:600px;
	height: 50px;
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
    <div id="allpage">
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" /> 
        </header>
        <div id="content">
<!--  在此商城搜尋，開始		-->
<%-- 
		<div class="article">
			<section class="section">
        	 <!-- <h2>區塊B-搜尋產品用</h2> -->
        	 	<form action="" method ="GET" >
        	 	<input name="TestTestTest" type="text" size="40" required="required">
        	 	<Input type='submit' value='在此商城搜尋'>
        	 	</form>
        	 	
        	 </section>
        </div>
--%>
<!--在此商城搜尋，結束	-->
        <div class="article">
			<section class="section">
        	<!-- <h2>區塊C-關於賣場</h2> -->
        	<!-- 	<h2>關於本酒吧</h2>  -->
	        	<table border="1"  >
	        		<tr>
	        			<td class="td1">${CompanyName}</td>
	        			<td class="td1">酒吧logo</td>
	        			<td class="td1">地圖按鈕</td>
	        			<td class="td1">Menu</td>
	        		</tr>
	        	</table>
        	 </section>
        	 <section class="section">
	        	 <table border="1"  >
	        		<tr>
	        			<td class="td6">event</td>
	        		</tr>
	        	</table>       	 
        	 </section>
        	 <section class="section">
	        	 <table border="1"  >
	        		<tr>
	        			<td class="td6">跑馬燈(圖片)</td>
	        		</tr>
					<tr>
	        			<td class="td6">酒吧介紹文字</td>
	        		</tr>
	        	</table>       	 
        	 </section>
        </div>
            <article class="article">
                <section class="section">
                <!-- 區塊1 -->
<!-- ============================================ -->                
           <!--          <h2>測試區塊Z1_中央保留</h2>    -->                 
<!--縮放用HTML，開始-->
<!-- 

  <img 
  class="flip" 
  text-align="center"  
  width="200" 
  height="200" 
  src="https://scontent.ftpe7-1.fna.fbcdn.net/v/t1.0-1/cp0/p50x50/20260_259054114079_4529913_n.jpg?_nc_cat=100&_nc_ohc=IIHBcDuJeTwAX9CM8Ev&_nc_ht=scontent.ftpe7-1.fna&oh=07502f128f22176aa9e3b637319325d7&oe=5EBB9CBC"/>

<div class="panel">
  <p>單價</p>
    <img class="flip" text-align="center"  width="200" height="200" src="https://images.goodsmile.info/cgm/images/product/20200131/9243/67389/thumb/770733b2c97f14bae8f9bfa6d03b7b05.jpg"/>
</div>

 -->
<!--縮放用HTML，結束-->
<!-- ============================================ -->  
                </section>                
            </article>
            <article class="article">
                <section class="section">
<!--               	<h2>測試區塊Z2_中央保留2</h2>	-->   
<%--中央保留2，開始--%> 

               	
                	
                	
<%--中央保留2，結束--%>   
<!-- <h2>A=${pageContext}</h2><BR>  -->
<!-- <h2>B=${pageContext.request}</h2><BR> -->
<!-- <h2>C=${pageContext.request.contextPath}</h2><BR> -->



           	
<%--中央保留，開始--%>
<%--
			<div class="flip">
				<section class="section">
					<h2>縮放測試區塊D2_商品清單</h2> 
					<h3>商品清單</h3>
					<h3>${msg}</h3>
				<div>
						<table>
							<thead>
								<tr align="center">
									<td>商品編號</td>
									<td>商品名稱</td>
									<td>單價</td>
									<td>庫存</td>
									<td>前往商品介面</td>
									<td>圖片</td>
									<td>加入購物車</td>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
								
<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
	
	<-- 圖片，開始 -->
		<div class="flip">
			<img width="200" height="200" src="<c:out value="${listOfProduct[current.index].productImageUrl}"/>"/>
		</div>
	<-- 圖片，結束 -->
	
	<-- 展開後內容，開始 -->
	<tr class = "panel">
		<!-- 商品編號 -->
			
		<td align="center">
		<a href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
		>${listOfProduct[current.index].pdId}</a>
		</td>
		
		<!-- 商品名稱 -->
		<td align="center">${listOfProduct[current.index].productName}</td>
		<!-- 單價 -->
		<td align="center">${listOfProduct[current.index].pdPrice}</td>
		
		<td align="center">${listOfProduct[current.index].pdStock}</td>
		
		<td align="center">
		<a href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
		value="${listOfProduct[current.index].pdId}">前往商品介面</a>
		</td>
		
		<td>		
		<div>
			<img width="200" height="200" src="<c:out value="${listOfProduct[current.index].productImageUrl}"/>"/>
		</div>
		</td>
		
		<td>
			<div>
			<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">

	
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

			<Input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
			<Input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
			<Input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
			<Input type='hidden' name='account' value='${account}'>
			<Input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
			
			<Input type='submit' value='加入購物車'>
	
			</FORM>			
			

			</div>

		</td>
	
	</tr>
	<-- 展開後內容，結束 -->
	
</c:forEach>
								</tr>
							</tbody>
						</table>
				<!-- </form>    -->	
					</div>	
			</section>
        </div>
 --%>
<%--中央保留，結束--%>

                </section>
            </article>
<%-- 本體，開始 --%>
			<div class="article">
				<section class="section">
<%-- 清單版本 --%>
					<h3>商品清單</h3>
					<h3>${msg}</h3>
				<div>
				<!--  	<form action="<c:url value="/DisplayProductList.controller"/>" method="post"> -->
						<table>
							<thead>
								<tr align="center">
							<!--  	<td>商品編號</td> -->
									<td>商品名稱</td>
									<td>商品種類</td>
									<td>單價</td>
									<td>庫存</td>
									<td>前往商品介面</td>
									<td>圖片</td>
									<td>加入購物車</td>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
								
<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
	<tr>
		<!-- 商品編號 -->
		<!-- 
		<td align="center">
		<a href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
		value="${listOfProduct[current.index].pdId}">${listOfProduct[current.index].pdId}</a>
		</td>
		 -->	
		
		<!-- 商品名稱 -->
		<td align="center">${listOfProduct[current.index].productName}</td>
		
		<!-- validDate is not null 【QR】 -->
		<!-- 商品種類 -->
		<td>
			<c:choose>
				<c:when test="${listOfProduct[current.index].validDate == null}">
					一般
				</c:when>
				<c:otherwise>
					QR
				</c:otherwise>
			</c:choose>		
		</td>
		
		<!-- 單價 -->
		<td align="center">${listOfProduct[current.index].pdPrice}</td>
		
		<td align="center">${listOfProduct[current.index].pdStock}</td>
		
		<td align="center">
		<a href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}"
		value="${listOfProduct[current.index].pdId}">前往商品介面</a>
		</td>
		
		<td>		
		<div>
			<img width="200" height="200" src="<c:out value="${listOfProduct[current.index].productImageUrl}"/>"/>
		</div>
		</td>
		
		<td>
		
			<c:choose>
				<c:when test="${listOfProduct[current.index].validDate == null}">
					<!-- 一般   -->
			<div>
			<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">

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

			<Input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
			<Input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
			<Input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
			<Input type='hidden' name='account' value='${account}'>
			<Input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
			
			<Input type='submit' value='加入購物車'>
	
			</FORM>			
		
			</div>
				</c:when>
				<c:otherwise>
					<!-- QR -->
			<div>
			<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">

			<select name='qty'>
<!-- QR票券只能買一張 -->
				<option value="1">1</option>
			</select>

			<Input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
			<Input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
			<Input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
			<Input type='hidden' name='account' value='${account}'>
			<Input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
			
			<Input type='submit' value='加入購物車'>
	
			</FORM>			
		
			</div>
				</c:otherwise>
			</c:choose>	



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
    
<!--縮放用JS，開始-->
<script type="text/javascript">
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
</script>
<!--縮放用JS，結束-->

    
</body>
</html>