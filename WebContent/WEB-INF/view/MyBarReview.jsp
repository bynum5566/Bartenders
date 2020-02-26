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
	  color: #9F9BA0;
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
/* 		color: #0F0E0F; */
		color: #FFFFFF;
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
	}
	
	.B1 {
			display:  flex;
			align-items: center;
			justify-content: left;
			font-size: 20px;
			line-height: 24px;
			text-align: left;
		}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
		<h1><a href="WelcomeCompany">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
						<ul>
							<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
							<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
							<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
							<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
							<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息與活動+</a></li>
							<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
							<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
							<li><a href="/Bartenders/NewsAndEvents.All">最新消息與活動管理</a></li>
							<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
							<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
							<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
							<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
							<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
							<li><a href="/Bartenders/ManageBar">管理活動</a></li>
							<li class="small"><a href="WelcomeCompany">首頁</a><a href="javascript:signOut()">登出</a></li>
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
									<li>&zwnj;<div id="barName">${CompanyName}&emsp;&ensp;</div></li>
									<li></li> <!-- 預留放地圖按鈕 -->
									<li>&emsp;&emsp;<div id="myBtn"><h3>Menu</h3></div></li>
									<li>&emsp;&emsp;</li>
									<li><img id="favbT" src="/Bartenders/images/heart (1).png"></li>
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
										<figure align="center">
											<img id="slider" style="width:550px;height:330px" src="${myBarX.coverUrl1}">
										</figure>
									</li>
									<li class="sigmaTd6" style="text-align: left">
										<div class="row">
											<div class="col-6 col-12-medium">
												<ul>
													<li>
														<h3>酒吧介紹:</h3>
														<h3>${myBarX.aboutBar}</h3>
													</li>
												</ul>
											</div>
											<div class="col-6 col-12-medium">
												<ul>
													<li><h3>社群網站</h3></li>
													<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_facebook_986944.png">&nbsp;${myBarX.barFb}</li>
													<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_line_986949.png">&nbsp;${myBarX.barLine}</li>
													<li class="B1"><img class="social" src="/Bartenders/images/iconfinder_Instagram_381384.png">&nbsp;${myBarX.barIg}</li>
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
																				<input type="number" required="required" style="width:60px" name="qty" value="1" max="${listOfProduct[current.index].pdStock}" min="1"/>
																				<input type='hidden' name='PdId' value='${listOfProduct[current.index].pdId}'>
																				<input type='hidden' name='ProductName' value='${listOfProduct[current.index].productName}'>
																				<input type='hidden' name='PdStock' value='${listOfProduct[current.index].pdStock}'>
																				<input type='hidden' name='account' value='${account}'>
																				<input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
																				<input type='hidden' name='barAccount' value='${barAccount}'>
																				<input type='button' style="font-size:12px" value='加入購物車'>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div>
																				<input type="number" required="required" style="width:60px;" name="qty" value="1" max="1" min="1"/>
																				<input type='hidden' name='PdId' value='${listOfProuct[current.index].pdId}'>
																				<input type='hidden' name='ProductName' value='${lisOfProduct[current.index].productName}'>
																				<input type='hidden' name='PdStock' value='${listOfPrduct[current.index].pdStock}'>
																				<input type='hidden' name='account' value='${account}'>
																				<input type='hidden' name='pdPrice' value='${listOfProduct[current.index].pdPrice}'>
																				<input type='hidden' name='barAccount' value='${barAccount}'>
																				<input type='button' style="font-size:12px" value='加入購物車'>
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="panel" style="vertical-align:text-top">
																<p>
																	簡介：<br>
																	${listOfProduct[current.index].pdDetail}
																</p><br>
																<c:choose>
																	<c:when test="${listOfProduct[current.index].validDate == null}">
																		<a href="<c:url value="/Product.View"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情</a>
																	</c:when>
																	<c:otherwise>
																		<a href="<c:url value="/ProductTicket.View"/>?pdId=${listOfProduct[current.index].pdId}">商品詳情</a>
																	</c:otherwise>
																</c:choose>															
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

	<script src="/Bartenders/JS/forBarPage.js"></script>
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