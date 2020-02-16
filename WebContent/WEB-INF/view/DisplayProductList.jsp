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
	
	<%--原本script放這裡，放這裡縮放會沒效果，所以現在放在body裡面的後半部 --%>


<title>酒吧</title>

<%--style，開始--%>
<style>

	/*--縮放用style開始*/
	div.panel, img.flip {
		margin: 0px;
		padding: 5px;
		/*background: #e5eecc;*/
		background:rgba(0,0,0,0.6);
		border: solid 1px #c3c3c3;
	}
	
	div.panel {
		height: 300px;
		width: 300px;	
		display: none;
	}
	/*--縮放用style結束*/

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

	/*透明*/
	.sigmaTransparent{
		background:rgba(0,0,0,0.1);
		margin-bottom:10px;
		color:white;		
	}
	/*單位1的框*/
	.sigmaTd1 {
		width: 100px;
		height: 50px;
		text-align: center;
	}
	/*單位6的框*/
	.sigmaTd6 {
		width: 600px;
		height: 50px;
		text-align: center;
	}
	
	section {
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
	}

</style>
<%--style，結束--%>
</head>

<body>
	<main>	<!-- level1 class = mydiv -->
	<div class = mydiv>
	
		<section >	<!-- level5 -->
			<table border="1" >
				<tr>
					<td class="sigmaTd1">${CompanyName}</td>
					<td class="sigmaTd1">
		                <img 
		                src="<c:out value="${myBarX.logoUrl}"
		                />" />					
					</td>	<!-- 酒吧logo -->
					<td class="sigmaTd1">地圖按鈕</td>
					<td class="sigmaTd1" onclick="displayMenu()">Menu</td>
					<!-- Rosalie Wu的我的最愛按鈕  -->	
					<td class="sigmaTd1">
						<button 
						style="background-image:url(/Bartenders/images/like_icon.png);background-repeat: no-repeat; background-size: cover; background-position: center;" 
						onclick="location.href = '/Bartenders/addFav.bar?cidck=<c:out value="${companyId}"/>';" 
						class="bT"> 
						</button>
					</td>
					<td class="sigmaTd1"></td>
				</tr>
<!-- (Menu) Dialog開始 -->
<tr>
<td>			
<div id="dialog" title="Menu">
  <p>${myBarX.barMenu}</p>
</div>
</td>	
</tr>
<!-- (Menu) Dialog結束 -->
			</table>	
		</section>	<!-- level5 -->
		
		
		<section >	<!-- level5 -->
			<table border="1">	<!-- level6 -->
				<tr>
					<td class="sigmaTd6">最新活動</td>	<!-- 最新活動 標題 -->
				</tr>

					<!-- 事件event，開始 -->
				<tr>
					<td>
						<div id="accordion" class="sigmaTransparent">
							<c:forEach items="${listOfEventOfOneBar}" var="list" step="1" varStatus="current">	<!-- 此酒吧的所有事件 -->
								<h3 class="sigmaTransparent">${listOfEventOfOneBar[current.index].neTitle}</h3>	<!-- event標題 -->
									<div class="sigmaTransparent">
										<p class="sigmaTransparent">${listOfEventOfOneBar[current.index].neText}</p>	<!-- event內文-->
									</div>
							</c:forEach>
						</div>
					</td>
				</tr>
					<!-- 事件，結束 -->
				
			</table>
		</section>	<!-- level5 -->
		
		<section >	<!-- level5 -->
			<table border="1">	<!-- 跑馬燈(圖片) -->					
				<tr>
					<td>
					<!-- 跑馬燈，開始 -->
					    <div>
					        <div>
					            <figure >	<!-- 跑馬燈，第一張圖 -->
					            	<!-- "/Bartenders/images/圖片名稱.jpg"-->
					            	<!-- px不寫，會無效 -->
					                <img id="slider" 
					               style="width:600px;height:300px"	
					                src="${myBarX.coverUrl1}">
					            </figure>
					        </div>
					        <div>	<!-- 跑馬燈，選擇紐 -->
					        <!-- north_star.png改成  /Bartenders/images/north_star.png -->
					        	<table>
					        	<tr>
					        	<td style="background-color:gray" width="30px" >
					            <img onmouseover="choose1(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st1"
					                src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            <img onmouseover="choose2(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st2"
					                src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            <img onmouseover="choose3(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st3"
					                src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            <img onmouseover="choose4(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st4"
					                src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            <img onmouseover="choose5(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st5"
					                src="/Bartenders/images/Circle.png">
					            </td>
								</tr>
								</table>
					        </div>
					    </div>
					<!-- 跑馬燈，結束 -->
					</td>				
				</tr>
			</table>
		</section>
			
		<section>
			<table border="1" >
				<tr>
					<td class="sigmaTd6" style="text-align: left">
						酒吧介紹：<br>
						${myBarX.aboutBar}<br>
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

		<section >	<%-- 縮放版本的商品列表，開始 --%>
			<div>
				<table>
					<tbody>
						<tr align="center">
							<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">

								
									<!-- 一組 -->
									<!-- 點這個區塊(class="flip")會縮放下面的(class="panel") -->	
									<td style="vertical-align:text-top">
										<div style="vertical-align:text-top">
											<div>
												<!-- 商品名稱 -->
												${listOfProduct[current.index].productName}
												<br>
												<!-- 單價 -->
												$ ${listOfProduct[current.index].pdPrice}
												<br>
												<img class="flip"
												style="vertical-align:text-top;width:100px;height:100px"

						
												
												src="${listOfProduct[current.index].productImageUrl}"/>
												<!--下拉選單，開始 -->
													<!-- 產品種類不同，能買的東西不同 -->
													<c:choose>	
														<c:when test="${listOfProduct[current.index].validDate == null}">
										
															<!--一般的-->
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
																	<Input 	type='hidden' name='barAccount'
																			value='${barAccount}'>		
																	<Input type='submit' style="font-size:12px" value='加入購物車'>
									
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
																<Input 	type='hidden' name='barAccount'
																			value='${barAccount}'>																			
																<Input type='submit' style="font-size:12px" value='加入購物車'>
																
																</FORM>
									
															</div>
									
														</c:otherwise>
													</c:choose>
												<!--下拉選單，結束 -->
											</div>
											<div class="panel" style="vertical-align:text-top">
												<p>
												簡介：<br>
												${listOfProduct[current.index].pdDetail}
												</p><br>
													<!--<a href="<c:url value="/AddToCartButton.controller"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情</a>-->
													<a href="<c:url value="/DisplayProductDetail.controller"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情</a>
													<!-- <a href="<c:url value="/Product.show"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情mk2</a> -->
													<!-- <a href="<c:url value="/Bartenders/Product.show"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情mk3</a> -->
													
											</div>
										</div>
									</td>
									<!-- 一組 -->

							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</section>	<%-- 縮放版本的商品列表，結束 --%>

	

	</div>
	<%-- 本體，結束 --%>
	</div>
	</main>
	
	<script>
	<%--縮放用JS，開始--%>
	$(".flip").click(function(){
		
	    $(this).closest("div").siblings().slideToggle("slow");
	  });
	<%--縮放用JS，結束--%>	
	
	
	<%-- Event script，開始 --%>
	$( function() {
	  $( "#accordion" ).accordion({
	    collapsible: true
	  });
	} );
	<%-- Event script，結束 --%>
	
	<%-- Menu script，開始 --%>	
	 $( function() {
		   $( "#dialog" ).dialog();
		   $( "#dialog" ).dialog('close');
		 } );
	 
	 function displayMenu() {
		  $( "#dialog" ).dialog('open');
		}

	 
	 <%-- Menu script，結束 --%>
	 
<%-- 跑馬燈script，開始 --%>


<!-- 可以直接打網址，如"https://images.goodsmile.info/cgm/images/product/20200131/9243/67389/thumb/770733b2c97f14bae8f9bfa6d03b7b05.jpg" -->
<!-- "/Bartenders/images/mucha_1.jpg" -->
<!--對應位置:\Bartenders\WebContent\WEB-INF\resources\images\mucha_1.jpg -->
<!--跑馬燈圖片-->
var images = ["${myBarX.coverUrl1}", "${myBarX.coverUrl2}", "${myBarX.coverUrl3}", "${myBarX.coverUrl4}", "${myBarX.coverUrl5}"];
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
var t = setInterval(changeP, 5000);

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
    t = setInterval(changeP, 5000);	
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
        t = setInterval(changeP, 5000);
    }
}


<%-- 跑馬燈script，結束 --%>



	 
	</script>	
	
	
</body>
</html>

<%--左側工具列，開始 --%>
<%@include file="UserMenu.jsp"%>
<%--左側工具列，結束--%>
