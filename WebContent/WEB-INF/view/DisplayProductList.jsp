<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title>酒吧</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<style>
		div.panel,
		img.flip {
			margin: 0px;
			padding: 5px;
			background: rgba(0, 0, 0, 0.6);
			border: solid 1px #c3c3c3;
		}

		div.panel {
/* 			height: 300px; */
			height: auto;
			width: 300px;
			display: none;
		}

		.sigmaTd1 img {
			width: 100px;
		}

	.small {
		display: flex;
		align-self: center;
	}

	.small a {
		font-size: 16px;
		font-weight: 400;
		color: #888;
		font-family: 111.otf;
	}

	.small a+a {
		margin-left: 15px;
	}
	
	#barName{
		font-size: 50px;
		font-weight: 600;
	}
	
	#favbT{
		width: 100px;
		height: 100px;
		cursor: pointer;
	}
	
	#myBtn:hover {
		color: #ECECED;
	}
	
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  padding-top: 100px;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgb(0,0,0);
	  background-color: rgba(0,0,0,0.4);
	}
	
	.modal-content {
	  position: relative;
	  margin: auto;
	  padding: 0;
	  border: 1px solid #888;
	  width: 40%;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s;
	}
	
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	.close {
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: #443E44;
	}
	
	.modal-body {
		background-color: #A19CA8;
		padding: 2px 16px;
		color: #FFFFFF;
/* 		color: #0F0E0F; */
	}
	
	.accordion {
	  background-color: #443E44;
/*  	  color: #9F9BA0; */
 	  color: #FFFFFF;
	  cursor: pointer;
	  padding: 18px;
	  width: 100%;
	  border: none;
	  text-align: left;
	  outline: none;
	  font-size: 22px;
	  font-weight: 600;
	  transition: 0.4s;
	  border: 1px solid #554F55;
	}
	
	.active, .accordion:hover {
	  background-color: #554F55;
/* 	  color: #ECECED; */
	  color: #FFFFFF;
	}
	
	.accordion:after {
	  content: '\002B';
/*  	  color: #ECECED; */
 	  color: #FFFFFF;
	  font-weight: bold;
	  float: right;
	  margin-left: 5px;
	}
	
	.active:after {
  		content: "\2212";
	}
	
	.thePanels {
	  padding: 0 18px;
	  background-color: #76727B;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.2s ease-out;
/* 	  color: #ECECED; */
	  color: #FFFFFF;
	}
	
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
      		<h1><a href="index.jsp">Bartenders</a></h1>
      		<nav id="nav">
        		<ul>
          			<li class="special">
            			<a href="#menu" class="menuToggle"><span>Menu</span></a>
            			<div id="menu">
              			<ul>
							<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
							<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
							<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
							<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
							<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
							<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
							<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
							<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
							<li class="small"><a href="UserFirstPage">返回首頁</a><a href="javascript:signOut()">登出</a></li>
              			</ul>
              			</div>
          			</li>
        		</ul>
      		</nav>
		</header>
    
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<div class=mydiv>
							<section>
								<!-- level5 -->
								<!-- 有框 <table border="1" > -->
									<ul class="actions">
										<li><img style="width:100px;height:100px;border-radius: 50%;border:2px solid white;" src="<c:out value="${myBarX.logoUrl}"/>"/>&emsp;&emsp;</li>
										<li >&zwnj;<div id="barName">${CompanyName}&emsp;&ensp;</div></li>
										<li></li> <!-- 預留放地圖按鈕 -->
										<li>&emsp;&emsp;<div id="myBtn"><h3>Menu</h3></div></li>
										<li>&emsp;&emsp;</li>
										<li><img id="favbT" src="/Bartenders/images/heart (1).png" onclick="location.href='/Bartenders/addFav.bar?cidck=<c:out value="${companyId}"/>';"></li>
										<li></li>
									</ul>
									<ul>
										<li>
											<div id="myModal" class="modal">
												<div class="modal-content">
													<div class="modal-header">
														<span class="close">&times;</span>
														<h2>Menu</h2>
													</div>
													<div class="modal-body">
														<p>${myBarX.barMenu}</p>
													</div>
												</div>
											</div>
										</li>
<!-- 										<li> -->
<!-- 											<div id="dialog" title="Menu"> -->
<%-- 												<p>${myBarX.barMenu}</p> --%>
<!-- 											</div> -->
<!-- 										</li> -->
									</ul>
<!-- 								<table class="sigmaFontSize20"> -->
									<!-- 無框 -->
									<!-- (Menu) Dialog開始 -->
									<!-- (Menu) Dialog結束 -->
<!-- 								</table> -->
<!-- 							</section> level5 -->
<!-- 							<section> -->
								<!-- level5 -->
								<!-- 有框 <table border="1">-->
<!-- 								<table> -->
									<!-- level6 -->
									<ul class="alt">
										<li><h2>最新活動<h2></h2></li> <!-- 最新活動 標題 -->
									<!-- 事件event，開始 -->
										<li>
											<div>
												<c:forEach items="${listOfEventOfOneBar}" var="list" step="1" varStatus="current">
													<!-- 此酒吧的所有事件 -->
													<div  class="accordion">${listOfEventOfOneBar[current.index].neTitle}</div>
													<!-- event標題 -->
													<div class="thePanels">
														<br>
														<p class="sigmaTransparent">${listOfEventOfOneBar[current.index].neText}</p>
														<!-- event內文-->
													</div>
												</c:forEach>
											</div>
										</li>
									<!-- 事件，結束 -->
<!-- 								</table> -->
<!-- 							</section> level5 -->
<!-- 							<section> -->
								<!-- level5 -->
								<!-- 有框 <table border="1">-->
<!-- 								<table> -->
									<!-- 跑馬燈(圖片) -->
<!-- 									<tr> -->
<!-- 										<td> -->
											<!-- 跑馬燈，開始 -->
<!-- 											<div> -->
										<li>
											<figure align="center">
																<!-- 跑馬燈，第一張圖 -->
																<!-- "/Bartenders/images/圖片名稱.jpg"-->
																<!-- px不寫，會無效 -->
												<img id="slider" style="width:550px;height:330px" src="${myBarX.coverUrl1}">
											</figure>
										</li>
<!-- 												<div> -->
													<!-- 跑馬燈，選擇紐 -->
													<!-- north_star.png改成  /Bartenders/images/north_star.png -->
<!-- 													<table> -->
<!-- 														<tr> -->
<!-- 															<td> -->
<!-- 																<img onmouseover="choose1(this,event)" -->
<!-- 																	onmouseout="chooseout(this,event)" class="Sts" -->
<!-- 																	id="st1" src="/Bartenders/images/Circle.png"> -->
<!-- 															</td> -->
<!-- 															<td> -->
<!-- 																<img onmouseover="choose2(this,event)" -->
<!-- 																	onmouseout="chooseout(this,event)" class="Sts" -->
<!-- 																	id="st2" src="/Bartenders/images/Circle.png"> -->
<!-- 															</td> -->
<!-- 															<td> -->
<!-- 																<img onmouseover="choose3(this,event)" -->
<!-- 																	onmouseout="chooseout(this,event)" class="Sts" -->
<!-- 																	id="st3" src="/Bartenders/images/Circle.png"> -->
<!-- 															</td> -->
<!-- 															<td> -->
<!-- 																<img onmouseover="choose4(this,event)" -->
<!-- 																	onmouseout="chooseout(this,event)" class="Sts" -->
<!-- 																	id="st4" src="/Bartenders/images/Circle.png"> -->
<!-- 															</td> -->
<!-- 															<td> -->
<!-- 																<img onmouseover="choose5(this,event)" -->
<!-- 																	onmouseout="chooseout(this,event)" class="Sts" -->
<!-- 																	id="st5" src="/Bartenders/images/Circle.png"> -->
<!-- 															</td> -->
<!-- 														</tr> -->
<!-- 													</table> -->
<!-- 												</div> -->
<!-- 											</div> -->
											<!-- 跑馬燈，結束 -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</section> -->
<!-- 							<section> -->
								<!-- 有框<table border="1" > -->
<!-- 								<table> -->
<!-- 									<tr> -->
										<li class="sigmaTd6" style="text-align: left">
											<div class="row">
												<div class="col-6 col-12-medium">
													<ul>
														<li><h3>酒吧介紹:</h3></li>
														<li><h3>${myBarX.aboutBar}</h3></li>
													</ul>
												</div>
												<div class="col-6 col-12-medium">
													<ul class="icons">
														<li><img class="" src="/Bartenders/images/iconfinder_facebook_986944.png"><span class="label" id="${myBarX.barFb}">Twitter</span></li>
														<li><img src="/Bartenders/images/iconfinder_line_986949.png"><span class="label">${myBarX.barLine}</span></li>
														<li><img src="/Bartenders/images/iconfinder_Instagram_381384.png"><span class="label">${myBarX.barIg}</span></li>
													</ul>
												</div>
											</div>
										</li>
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</section> -->
							<%-- 本體，開始 --%>
<!-- 							<div> -->
<%-- 								<section> 縮放版本的商品列表，開始 --%>
										<li>
											<table>
												<tbody>
													<!--  <tr align="center">-->
													<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
	
														<!-- 四個換一行 -->
														<c:if test="${(current.index+1) %3  == '1' }">
															<tr>
														</c:if>
	
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
																	<img class="flip" style="vertical-align:text-top;width:100px;height:100px" src="${listOfProduct[current.index].productImageUrl}"/>
																	<!--下拉選單，開始 -->
																	<!-- 產品種類不同，能買的東西不同 -->
																	<c:choose>
																		<c:when test="${listOfProduct[current.index].validDate == null}">
																			<!--一般的-->
																			<div>
																				<form action="<c:url value="/AddProductToCart.controller"/>" method="get">
																				<!-- 一般，上下式 -->
																					<input type="number" required="required" style="width:60px" name="qty" value="1" max="${listOfProduct[current.index].pdStock}" min="1"/>
																					<!-- 一般，上下式 -->
																					<input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
																					<input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
																					<input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
																					<input type='hidden' name='account' value='${account}'>
																					<input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
																					<input type='hidden' name='barAccount' value='${barAccount}'>
																					<input type='submit' style="font-size:12px" value='加入購物車'>
																				</form>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<!-- QR -->
																			<div>
																				<form action="<c:url value="/AddProductToCart.controller"/>" method="get">
																				<!-- QR，下拉式 -->
	
																				<!--舊版下拉式-->
																				<!--<select class="sigmaBlack" name='qty'>-->
																				<!-- QR票券只能買一張 -->
																				<!--<option value="1">1</option>-->
																				<!--</select> -->
																				<input type="number" required="required" style="width:60px" name="qty" value="1" max="1" min="1"/>
	
																				<input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
																				<input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
																				<input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
																				<input type='hidden' name='account' value='${account}'>
																				<input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
																				<input type='hidden' name='barAccount' value='${barAccount}'>
																				<input type='submit' style="font-size:12px" value='加入購物車'>
																				</form>
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
																	<a href="<c:url value="/Product.show"/>?PdId=${listOfProduct[current.index].pdId}">商品詳情</a>
																	<!-- <a href="<c:url value="/Product.show"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情mk2</a> -->
																	<!-- <a href="<c:url value="/Bartenders/Product.show"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情mk3</a> -->
																</div>
															</div>
														</td>
														<!-- 一組 -->
														<c:if test="${(current.index+1) %3  == '0' }">
															</tr>
														</c:if>
														<!-- 四個換一行 -->
													</c:forEach>
													<!-- </tr>-->
												</tbody>
											</table>
										</li>
									</ul>
								</section>
								<%-- 縮放版本的商品列表，結束 --%>
							<%-- 本體，結束 --%>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script>
			var modal = document.getElementById("myModal");
			var btn = document.getElementById("myBtn");
			var span = document.getElementsByClassName("close")[0];
			btn.onclick = function() {
			  modal.style.display = "block";
			}
		
			span.onclick = function() {
			  modal.style.display = "none";
			}
		
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none";
			  }
			}
			
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight) {
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    } 
			  });
			}
			///////////////////////////////////////////////////////////////////
	
			$(".flip").click(function () {
				$(this).closest("div").siblings().slideToggle("slow");
			});
	
// 			$(function () {
// 				$("#accordion").accordion({
// 					collapsible: true
// 				});
// 			});
	
// 			$(function () {
// 				$("#dialog").dialog();
// 				$("#dialog").dialog('close');
// 			});

// 		function displayMenu() {
// 			$("#dialog").dialog('open');
// 		}

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
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	</body>

</html>