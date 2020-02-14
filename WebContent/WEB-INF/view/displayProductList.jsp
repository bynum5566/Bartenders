<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


    <link 
    rel="stylesheet" 
    type="text/css" 
    href="/Bartenders/CSS/add_editView.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
	





	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	<%-- Event script，開始 --%>
	$( function() {
	  $( "#accordion" ).accordion({
	    collapsible: true
	  });
	} );
	<%-- Event script，結束 --%>
	
	<%-- Menu script，開始 --%>	
	 $( function menuClick() {
		   $( "#dialog" ).dialog();
		 } );
	 <%-- Menu script，結束 --%>
	 
<%-- 跑馬燈script，開始 --%>
<!--../img/bg1.jpg -->
<!-- var images = ["mucha_1.jpg", "mucha_2.jpg", "mucha_3.jpg", "mucha_4.jpg", "mucha_5.jpg"]; -->
<!-- var images = ["../img/mucha_1.jpg", "../img/mucha_2.jpg", "../img/mucha_3.jpg", "../img/mucha_4.jpg", "../img/mucha_5.jpg"];-->

<!-- 可以直接打網址，如"https://images.goodsmile.info/cgm/images/product/20200131/9243/67389/thumb/770733b2c97f14bae8f9bfa6d03b7b05.jpg" -->
var images = ["/Bartenders/images/mucha_1.jpg", "/Bartenders/images/mucha_2.jpg", "/Bartenders/images/mucha_3.jpg", "/Bartenders/images/mucha_4.jpg", "/Bartenders/images/mucha_5.jpg"];
var num = 0;

function nex() {
    var slider = document.getElementById("slider");
    num++;
    if (num >= images.length) {
        num = 0;
    }
    slider.src = images[num];
}

function prev() {
    var slider = document.getElementById("slider");
    num--;
    if (num < 0) {
        num = images.length - 1;
    }
    slider.src = images[num];
}

var P = document.getElementById("slider");
var t = setInterval(changeP, 2000);

function choose1(obj, oEvent) {
    var e = oEvent || window.event;
    var target = e.target || e.srcElement;
    var pArrays = obj.getElementsByTagName("img");
    slider.src = images[0];
    window.clearInterval(t);
}
function choose2(obj, oEvent) {
    var e = oEvent || window.event;
    var target = e.target || e.srcElement;
    var pArrays = obj.getElementsByTagName("img");
    slider.src = images[1];
    window.clearInterval(t);
}
function choose3(obj, oEvent) {
    var e = oEvent || window.event;
    var target = e.target || e.srcElement;
    var pArrays = obj.getElementsByTagName("img");
    slider.src = images[2];
    window.clearInterval(t);
}
function choose4(obj, oEvent) {
    var e = oEvent || window.event;
    var target = e.target || e.srcElement;
    var pArrays = obj.getElementsByTagName("img");
    slider.src = images[3];
    window.clearInterval(t);
}
function choose5(obj, oEvent) {
    var e = oEvent || window.event;
    var target = e.target || e.srcElement;
    var pArrays = obj.getElementsByTagName("img");
    slider.src = images[4];
    window.clearInterval(t);
}
function chooseout() {
    t = setInterval(changeP, 2000);
}

function changeP() {
    num++;
    if (num >= images.length) {
        num = 0;
    }
    slider.src = images[num];
}

let flag;
flag2 = true;
function pl() {
    if (flag2) {
        flag2 = false;
        window.clearInterval(t);
    }
    else {
        flag2 = true;
        t = setInterval(changeP, 2000);
    }
}


<%-- 跑馬燈script，結束 --%>



	 
	</script>

<title>酒吧</title>

<style>

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

	.sigmaTransparent{
		background:rgba(0,0,0,0.1);
		margin-bottom:10px;
		color:white;
		
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
	
	
	div.panel, img.flip {
		margin: 0px;
		padding: 5px;
		text-align: center;
		background: #e5eecc;
		border: solid 1px #c3c3c3;
	}
	
	div.panel {
		height: 300px;
		width: 300px;
		display: none;
	}
	
	section {
   
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
}

</style>
</head>

<body>
	
	<main>
	
	<div class = mydiv>		<!-- 【G】 -->
	<div>	<!-- 【F】 -->
			<header>
				<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" />
			</header>
			
	<div id="content">	<!-- 【B】 -->
	
	
		<section >	
			<table border="1">
				<tr>
					<td class="sigmaTd1">${CompanyName}</td>
					<td class="sigmaTd1">酒吧logo</td>
					<td class="sigmaTd1">地圖按鈕</td>
					<td class="sigmaTd1">Menu</td>
					<td class="sigmaTd1"></td>
					<td class="sigmaTd1"></td>
				</tr>
<!-- (Menu) Dialog開始 -->
<tr>
<td>			
<div id="dialog" title="Menu">
  <p>${CompanyName}的Menu</p>
</div>
</td>	
</tr>
<!-- (Menu) Dialog結束 -->
			</table>	
		</section>
		
		<section >
			<table border="1">
				<tr>
					<td class="sigmaTd6">Event</td>
				</tr>

	<!-- 事件，開始 -->
<tr>
<td>
<div id="accordion" class="sigmaTransparent">
  <h3 class="sigmaTransparent"
  >Event 1</h3>
  <div class="sigmaTransparent">
    <p class="sigmaTransparent">白蘭地買十送一</p>
  </div>
  <h3 class="sigmaTransparent">Event 2</h3>
  <div class="sigmaTransparent">
    <p class="sigmaTransparent">買3000送300</p>
  </div>
  <h3 class="sigmaTransparent">Event 3</h3>
  <div class="sigmaTransparent">
    <p class="sigmaTransparent">以下商品七折</p>
    <ul>
      <li class="sigmaTransparent">蘋果酒</li>
      <li class="sigmaTransparent">伏特加</li>
    </ul>
  </div>
  <h3 class="sigmaTransparent">Event 4</h3>
  <div class="sigmaTransparent">
    <p class="sigmaTransparent">QR票券七折優惠中</p>
  </div>
</div>
</td>
</tr>
	<!-- 事件，結束 -->
				
			</table>
		</section>
		
		<section >
			<table border="1"  width="200">
				<tr>
					<td class="sigmaTd6">跑馬燈(圖片)</td>
				</tr>
				

								
				<tr>
<td>
<!-- 跑馬燈，開始 -->
    <div >
        <div>
            <figure >
            	<!-- "mucha_1.jpg"改成"/Bartenders/images/mucha_1.jpg"  -->
                <img id="slider" 
                class="pics"
                width="200"
                height="200"
                src="/Bartenders/images/mucha_1.jpg">
            </figure>
        </div>
        <div>
        <!-- north_star.png改成  /Bartenders/images/north_star.png -->
        	<table>
        	<tr>
        	<td style="background-color:gray">
            <img onmouseover="choose1(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st1"
                src="/Bartenders/images/north_star.png">
            </td>
        	<td style="background-color:gray">
            <img onmouseover="choose2(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st2"
                src="/Bartenders/images/north_star.png">
            </td>
        	<td style="background-color:gray">
            <img onmouseover="choose3(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st3"
                src="/Bartenders/images/north_star.png">
            </td>
        	<td style="background-color:gray">
            <img onmouseover="choose4(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st4"
                src="/Bartenders/images/north_star.png">
            </td>
        	<td style="background-color:gray">
            <img onmouseover="choose5(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st5"
                src="/Bartenders/images/north_star.png">
            </td>
			</tr>
			</table>
        </div>
        <!-- 
        <div>
            <button onclick="prev()"><img class="bt" src="/Bartenders/images/first.png"></button>
            <button onclick="pl()"><img class="bt" src="/Bartenders/images/play_pause.png"></button>
            <button onclick="nex()"><img class="bt" src="/Bartenders/images/last.png"></button>
        </div>
         -->
    </div>
<!-- 跑馬燈，結束 -->
</td>				
				
				</tr>
				

			</table>
		<table border="1" >
				<tr>
					<td class="sigmaTd6" style="text-align: left">酒吧介紹：
					${myBarX.aboutBar}
					<br>
					<br>
					
					FB:${myBarX.barFb}<br>
					Line:${myBarX.barLine}<br>
					Instgram:${myBarX.barIg}<br>
					</td>
					
				</tr>		
		</table>
		</section>
		
	
	<%-- 本體，開始 --%>
	
	<div >
			<section >
				<%-- 清單版本 --%>
		<h3 class="sigmaTd1" style="color:white">商品清單</h3>
		<h3>${msg}</h3>
		<div>
			<!--  	<form action="<c:url value="/DisplayProductList.controller"/>" method="post"> -->
			<table>
				<thead>
					<tr align="center">
						<!--  	<td>商品編號</td> -->
						<td class="sigmaTd1">商品名稱</td>
						<td class="sigmaTd1">商品種類</td>
						<td class="sigmaTd1">單價</td>
						<td class="sigmaTd1">庫存</td>
						<td class="sigmaTd1">前往商品介面</td>
						<td class="sigmaTd1">圖片</td>
						<td class="sigmaTd1">加入購物車</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
			
					<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
					<tr>
			
			
						<!-- 商品名稱 -->
						<td align="center">${listOfProduct[current.index].productName}
						</td>
			
						<!-- validDate is not null 【QR】 -->
						<!-- 商品種類 -->
						<td><c:choose>
								<c:when
									test="${listOfProduct[current.index].validDate == null}">
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
						
						<td align="center"><a
							href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}">前往商品介面</a>
						</td>
			
						<td>
							<div>
								<img width="200" height="200"
									src="<c:out value="${listOfProduct[current.index].productImageUrl}"/>" />
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
											
											<Input 	type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
											<Input 	type='hidden' name='ProductName'
													value='${listOfProduct[current.index].productName}'>
											<Input 	type='hidden' name='PdStock'
													value='${listOfProduct[current.index].pdStock}'>
											<Input 	type='hidden' name='account' value='${account}'>
											<Input 	type='hidden' name='pdPrice'
													value='${listOfProduct[current.index].pdPrice}'>
											<Input type='submit' value='加入購物車'>
			
										</FORM>
			
									</div>
			
								</c:when>
								<c:otherwise>
									<!-- QR -->
									<div>
			
										<FORM
												action="<c:url value="/AddProductToCart.controller" />"
												method="get">
										
										<select name='qty'>
											<!-- QR票券只能買一張 -->
											<option value="1">1</option>
										</select> 
										<Input 	type='hidden' name='PdId'
												value='${listOfProduct[current.index].pdId}'>
										<Input 	type='hidden' name='ProductName'
												value='${listOfProduct[current.index].productName}'>
										<Input 	type='hidden' name='PdStock'
												value='${listOfProduct[current.index].pdStock}'>
										<Input 	type='hidden' name='account' value='${account}'>
										<Input 	type='hidden' name='pdPrice'
												value='${listOfProduct[current.index].pdPrice}'>
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
		</div>
			</section>
	</div>
	
	

	
	
	<%-- 本體，結束 --%>
	
	</div>
	</div>
	</div>
	
	</main>

</body>
</html>

<%--左側工具列，開始 --%>
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>
