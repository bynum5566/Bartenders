<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title>酒吧 / Bartenders</title>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
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
	
	#favbT, img.myMenu {
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
	
	.social{
		width: 40px;
		height: 40px;
		cursor: pointer;
	}
	
	.B1 {
			display:  flex;
			align-items: center;
			justify-content: left;
			font-size: 20px;
			line-height: 24px;
			text-align: left;
		}

	.swiper-container {
	  width: 640px;
      height: 360px;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    div.swiper-slide img {
    width: 100%;
    height: 100%;
    margin: auto;
    object-fit: cover;
}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
      		<h1><a href="UserFirstPage">Bartenders</a></h1>
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
							<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
							<li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
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
									<ul class="actions">
										<li><img style="width:100px;height:100px;border-radius: 50%;border:2px solid white;" src="<c:out value="${myBarX.logoUrl}"/>"/>&emsp;&emsp;</li>
										<li >&zwnj;<div id="barName">${CompanyName}&emsp;&ensp;</div></li>
										<li></li> <!-- 預留放地圖按鈕 -->
										<li>&emsp;&emsp;</li>
										<li><img id="myBtn" class="myMenu" src="/Bartenders/images/menu_icon.png"></li>
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
									</ul>
									<ul class="alt">
										<li><h2>最新活動<h2></h2></li>
										<li>
											<div>
												<c:forEach items="${listOfEventOfOneBar}" var="list" step="1" varStatus="current">
													<div  class="accordion">${listOfEventOfOneBar[current.index].neTitle}</div>
													<div class="thePanels">
														<br>
														<p class="sigmaTransparent">${listOfEventOfOneBar[current.index].neText}</p>
													</div>
												</c:forEach>
											</div>
										</li>
										<li>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<div class="swiper-slide"><img src="${myBarX.coverUrl1}" /></div>
												<div class="swiper-slide"><img src="${myBarX.coverUrl2}" /></div>
												<div class="swiper-slide"><img src="${myBarX.coverUrl3}" /></div>
												<div class="swiper-slide"><img src="${myBarX.coverUrl4}" /></div>
												<div class="swiper-slide"><img src="${myBarX.coverUrl5}" /></div>
											</div>
											<div class="swiper-pagination"></div>
											<div class="swiper-button-next"></div>
											<div class="swiper-button-prev"></div>
										</div>
										</li>
										<li class="sigmaTd6" style="text-align: left">
											<div class="row">
												<div class="col-6 col-12-medium">
													<ul>
														<li><h3>酒吧介紹</h3></li>
														<li><h3>${myBarX.aboutBar}</h3></li>
													</ul>
												</div>
												<div class="col-6 col-12-medium">
													<ul>
														<li><h3>社群網站</h3></li>
														<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_facebook_986944.png" onclick="location.href='https://www.facebook.com/${myBarX.barFb}';">&nbsp;${myBarX.barFb}</li>
														<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_line_986949.png" onclick="location.href='https://line.me/ti/p/${myBarX.barLine}';">&nbsp;${myBarX.barLine}</li>
														<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_Instagram_381384.png" onclick="location.href='https://instagram.com/${myBarX.barIg}';">&nbsp;${myBarX.barIg}</li>
													</ul>
												</div>
											</div>
										</li>
										<li>
											<table>
												<tbody>
													<c:forEach items="${listOfProduct}" var="list" step="1" varStatus="current">
														<c:if test="${(current.index+1) %3  == '1' }">
															<tr>
														</c:if>
														<td style="vertical-align:text-top">
															<div style="vertical-align:text-top">
																<div>
																	${listOfProduct[current.index].productName}
																	<br>
																	$ ${listOfProduct[current.index].pdPrice}
																	<br>
																	<img class="flip" style="vertical-align:text-top;width:100px;height:100px" src="${listOfProduct[current.index].productImageUrl}"/>
																	<c:choose>
																		<c:when test="${listOfProduct[current.index].validDate == null}">
																			<div>
																				<form action="<c:url value="/AddProductToCart.controller"/>" method="get">
																					<input type="number" required="required" style="width:60px" name="qty" value="1" max="${listOfProduct[current.index].pdStock}" min="1"/>
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
																			<div>
																				<form action="<c:url value="/AddProductToCart.controller"/>" method="get">
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
																</div>
																<div class="panel" style="vertical-align:text-top">
																	<p>
																		簡介：<br>
																		${listOfProduct[current.index].pdDetail}
																	</p><br>
																	<a href="<c:url value="/Product.show"/>?PdId=${listOfProduct[current.index].pdId}">商品詳情</a>
																</div>
															</div>
														</td>
														<c:if test="${(current.index+1) %3  == '0' }">
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
										</li>
									</ul>
								</section>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>
	
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script>
			var swiper = new Swiper('.swiper-container', {
				spaceBetween: 30,
				centeredSlides: true,
				autoplay: {
					delay: 2500,
					disableOnInteraction: false,
				},
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			});
		
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