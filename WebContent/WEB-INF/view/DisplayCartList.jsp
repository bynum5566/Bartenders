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

	.sigmaGray{
		color: gray;
	}

	.sigmaTd1 {
		width: 100px;
		height: 50px;
		text-align: center;
	}
	.sigmaTd250 {
		width: 250px;
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
	<h3 style="color:white">我的購物車</h3>
	<h3>${msg}</h3>
		<div>	<!-- line297附近 -->
			<table border="1">
				<thead >
					<tr align="center" class="sigmaGray">
						<!-- <td>購物車編號</td> -->
						
						<td class="sigmaTd1"  style="font-size:18px" >賣家名稱</td>
						<td class="sigmaTd1">產品名稱</td>
						<td class="sigmaTd1">產品單價</td>		<!-- 待雙層foreach完成後enable -->

						<!--  <td class="sigmaTd1">配送類型</td>-->
						<!-- <td>修改配送資訊</td> -->
						<td class="sigmaTd250">產品數量</td>		<!-- 修改數量 / 產品數量 -->
						<td class="sigmaTd1">小計</td>
						<td class="sigmaTd1"></td>	<!-- 刪除 ，成立訂單-->

					</tr>
				</thead>

				<tbody>
					<tr align="center">
						<c:forEach items="${listOfOrder}" var="list" step="1" varStatus="current">
						
						
						<tr>	<!-- 每個訂單的總結列 -->
							<!-- 購物車編號 -->
							<!-- <td align="center">${listOfOrder[current.index].orderId}</td> -->
							<!-- 賣家名稱  -->
							<td align="center">${listOfCompany[current.index].companyName}</td>
							<!-- 產品名稱 ，第一行空著-->
							<td align="center"></td>
	
							<!-- 產品單價 -->
							<td></td>		
	
							<!-- 配送方式 -->
							<!-- <td align="center">${ShippingNumToStr[listOfOrder[current.index].shipping]}</td>  -->
							
							
							<!-- 修改購物車 -->
	
							<!-- 修改配送資訊 -->
							<!-- 
							<td align="center"><a
									href="<c:url value="/ChangeCart.controller"/>?orderId=${listOfOrder[current.index].orderId}">修改配送資訊</a></td>
							 -->
							 
							<td align="center">
								<!-- 舊版修改數量 -->
								<!--<a href="<c:url value="/DisplayProductInCart.controller"/>?orderId=${listOfOrder[current.index].orderId}">修改數量</a>-->
							</td>
	
							<!-- 小計，第一行空著 -->
							<td align="center"></td>
							<!-- 刪除 -->
							
							
							
							<td>

							<!-- form版本刪除 -->
								<form 
								style="margin:0px;display:inline"
								action="<c:url value="/CancelCart.controller" />"
								method="get"
								>
								
								<Input type='hidden' name='orderId' value='${listOfOrder[current.index].orderId}'>
								<Input type='hidden' name='status' value='${listOfOrder[current.index].status}'>
								<Input type='submit' value='刪除'>
								</form>
							</td>




						</tr>
						
						
						<tr>
						<!-- 每個訂單的各個產品 -->
						<!-- 使用前一層foreach的變數 current-->
						<!-- 第 current個訂單的listOfCart -->
						<c:forEach items="${listOflistOfCart[current.index]}" var="list" step="1" varStatus="current2">
							<tr>
								<td>
								</td>
								
								<td><!-- pdId = ${listOflistOfCart[current.index][current2.index].pdId} -->
									${listOflistOfProduct[current.index][current2.index].productName}
								</td>
								
								<td><!-- 單價   -->
									<!-- 第 current個訂單的listOfCart 中　第current2個Cart -->
									${listOflistOfCart[current.index][current2.index].checkoutPrice}
								</td>
								
								<td><!-- 數量，產品數量   -->		
									<!-- value:預設值，顯示本訂單中本產品的購買數量 -->
									<!-- max:最多買幾個，限制為庫存值 -->
									
										
									<!--普通商品才能修改數量-->
									<c:if test="${listOfOrder[current.index].shipping == '1'}">
								
										<form 
										style="margin:0px;display:inline"
										action="<c:url value="/UpdateQtyInCart.controller" />"
										method="get"
										>
											<!-- qty:修改後數量 -->
											<!-- 其他修改需要的參數:PdId， ProductName，PdStock，account ?，pdPrice-->
											<!-- 一般類型，max = 庫存 -->
	
											<input type="number" 
											required="required"
											style="width:60px"
											name="qty" 
											value="${listOflistOfCart[current.index][current2.index].quantity}" 
											max="${listOflistOfProduct[current.index][current2.index].pdStock}"	
											min="1" 	
											/>												
											
											<Input type='submit' value='修改'>
											
											<Input type='hidden' name='PdId' value='${listOflistOfCart[current.index][current2.index].pdId}'>
											<Input type='hidden' name='ProductName' value='${listOflistOfProduct[current.index][current2.index].productName}'>
											<Input type='hidden' name='PdStock' value='${listOflistOfProduct[current.index][current2.index].pdStock}'>
											<Input type='hidden' name='pdPrice' value='${listOflistOfProduct[current.index][current2.index].pdPrice}'>										
																			
										</form>
									</c:if>
									
									<!-- QR商品，只要列印出數字 -->
									<c:if test="${listOfOrder[current.index].shipping == '3'}">
										${listOflistOfCart[current.index][current2.index].quantity}
										&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									</c:if>
										
									<form 
									style="margin:0px;display:inline"
									action="<c:url value="/DeleteItemInCart.controller" />"
									method="get"
									>	
										<Input type='submit' value='刪除'>
										
										<Input type='hidden' name='num' value='${listOflistOfCart[current.index][current2.index].num}'>
										<Input type='hidden' name='orderId' value='${listOfOrder[current.index].orderId}'>
										<!-- 超連結版本開始 -->
											<!--<a href="<c:url value="/DeleteItemInCart.controller"/>?num=${listOflistOfCart[current.index][current2.index].num}&orderId=${listOfOrder[current.index].orderId}">刪除</a>-->
										<!-- 超連結版本結束 -->								
									</form>									
									

								</td>
								
								<td><!--　小計   -->
									${listOflistOfCart[current.index][current2.index].quantity * listOflistOfCart[current.index][current2.index].checkoutPrice}
								</td>
								
								<td></td><!-- 刪除/成立訂單　 -->
								

								
								
							</tr>
					</c:forEach>
						</tr>
						
						<td></td>
						<td>總金額</td>
						<td></td>
						<td></td>
						<td align="center">${listOfOrder[current.index].amount}</td>
						
						
						<td>
						
						
						
						<a 
						style="color:yellow"
						href="<c:url value="/DisplayCart.controller"/>?orderId=${listOfOrder[current.index].orderId}&status=${listOfOrder[current.index].status}">成立訂單</a>
						
						
						</td>				
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
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