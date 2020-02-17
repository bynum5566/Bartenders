<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"></link>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>酒吧</title>

<style>
	div.panel, img.flip {
		margin: 0px;
		padding: 5px;
		background:rgba(0,0,0,0.6);
		border: solid 1px #c3c3c3;
	}
	div.panel {
		height: 300px;
		width: 300px;	
		display: none;
	}
	.mydiv {
		width: 600px !important;
		margin: auto;
		top: 80px;
		position: relative;
		text-align: center;
		border-radius: 5px;
		background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, rgba(163, 163, 163, 0.5) 99%);
		background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, rgba(163, 163, 163, 0.5) 99%);
		background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, rgba(163, 163, 163, 0.5) 99%);
		background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, rgba(163, 163, 163, 0.5) 99%);
		box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
		-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
		-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	}
	.sigmaBlack{
		color: black;
	}
	.sigmaGray{
		color: gray;
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
	section {
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
	}
	#circle table, #circle tr{
	width:150px !important;
	display: none;
	}
	#circle td{
	width: 30px !important;
	}
</style>
</head>

<body>
	<main>	
	<div class = mydiv>
		<section>
			<table>
				<tr>
					<td class="sigmaTd1">${CompanyName}</td>
					<td class="sigmaTd1">
		                <img src="<c:out value="${myBarX.logoUrl}"/>" />					
					</td>
					<td class="sigmaTd1">地圖按鈕</td>
					<td class="sigmaTd1" onclick="displayMenu()">Menu</td>
					<td class="sigmaTd1">
						<button style="background-image:url(/Bartenders/images/like_icon.png);background-repeat: no-repeat; background-size: cover; background-position: center;" onclick="location.href = '/Bartenders/addFav.bar?cidck=<c:out value="${companyId}"/>';" class="bT"> 
						</button>
					</td>
					<td class="sigmaTd1"></td>
				</tr>
				<tr>
					<td>			
						<div id="dialog" title="Menu">
  							<p>${myBarX.barMenu}</p>
						</div>
					</td>	
				</tr>
			</table>	
		</section>
		<section >
			<table>
				<tr>
					<td class="sigmaTd6">最新活動</td>
				</tr>
				<tr>
					<td>
						<div id="accordion" class="sigmaTransparent">
							<c:forEach items="${listOfEventOfOneBar}" var="list" step="1" varStatus="current">
								<h3 class="sigmaTransparent">${listOfEventOfOneBar[current.index].neTitle}</h3>
									<div class="sigmaTransparent">
										<p class="sigmaTransparent">${listOfEventOfOneBar[current.index].neText}</p>
									</div>
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</section>
		<section >
			<table>
				<tr>
					<td>
					    <div>
					        <div>
					            <figure >
					                <img id="slider" style="width:550px;height:330px"	src="${myBarX.coverUrl1}">
					            </figure>
					        </div>
					        <div>
					        	<table id="circle" width="150px">
					        		<tr width="150px">
					        			<td style="background-color:gray" width="30px" >
					            			<img onmouseover="choose1(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st1" src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            	<img onmouseover="choose2(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st2" src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            	<img onmouseover="choose3(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st3" src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            	<img onmouseover="choose4(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st4" src="/Bartenders/images/Circle.png">
					            </td>
					        	<td style="background-color:gray" width="30px">
					            	<img onmouseover="choose5(this,event)" onmouseout="chooseout(this,event)" class="Sts" id="st5" src="/Bartenders/images/Circle.png">
					            </td>
								</tr>
								</table>
					        </div>
					    </div>
					</td>				
				</tr>
			</table>
		</section>
		<section>
			<table>
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
	<div >
		<section >
			<div>
				<table>
					<tbody>
						<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
						<c:if test="${(current.index+1) %3  == '1' }">
						<tr>
							</c:if>
								<td style="vertical-align:text-top">
									<div style="vertical-align:text-top">
										<div>${listOfProduct[current.index].productName}<br>
												 $ ${listOfProduct[current.index].pdPrice}<br>
											<img class="flip" style="vertical-align:text-top;width:100px;height:100px" src="${listOfProduct[current.index].productImageUrl}"/>
											<c:choose>	
											<c:when test="${listOfProduct[current.index].validDate == null}">
												<div>
													<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">
														<input type="number" required="required" style="width:60px" name="qty" value="1" max="${listOfProduct[current.index].pdStock}"	 min="1" />		
														<Input 	type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
														<Input 	type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
														<Input 	type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
														<Input 	type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
														<Input 	type='hidden' name='barAccount' value='${barAccount}'>		
														<Input type='submit' style="font-size:12px" value='加入購物車'>
													</FORM>
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<FORM action="<c:url value="/AddProductToCart.controller" />" method="get">
														<input type="number" required="required" style="width:60px" name="qty" value="1" max="1" min="1" />	
														<Input 	type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
														<Input 	type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
														<Input 	type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
														<Input 	type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
														<Input 	type='hidden' name='barAccount' value='${barAccount}'>																			
														<Input type='submit' style="font-size:12px" value='加入購物車'>
													</FORM>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="panel" style="vertical-align:text-top">
										<p>
										簡介：<br>
										${listOfProduct[current.index].pdDetail}
										</p><br>
										<a href="<c:url value="/DisplayProductDetail.controller"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情</a>
									</div>
								</div>
							</td>
							<c:if test="${(current.index+1) %3  == '0' }">
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>
</div>
</main>
	<script>
	$(".flip").click(function(){
	    $(this).closest("div").siblings().slideToggle("slow");
	  });
	$( function() {
	  $( "#accordion" ).accordion({
	    collapsible: true
	  });
	} );
	 $( function() {
		   $( "#dialog" ).dialog();
		   $( "#dialog" ).dialog('close');
		 } );
	 function displayMenu() {
		  $( "#dialog" ).dialog('open');
		}
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
	</script>	
</body>
</html>
<%@include file="menu.jsp"%>