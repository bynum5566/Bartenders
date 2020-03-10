<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>訂單管理 / Bartenders</title>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<!-- <style type="text/css">
.mydiv {
	width:100%;
	margin:0 auto;
	top: 80px;
	position: relative;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(15, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	color: #E8CCFF;
	font-size: 17px;
}

body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/bg11.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}



img{
height:90;
width:130;
}

.css_button {
	padding: 3.5px 7px;
	border: 1px solid #857C7C;
	background: -webkit-gradient(linear, left top, left bottom, from(#6D6C70),
		to(#615B5B));
	background: -webkit-linear-gradient(top, #6D6C70, #615B5B);
	background: -moz-linear-gradient(top, #6D6C70, #615B5B);
	background: -ms-linear-gradient(top, #6D6C70, #615B5B);
	background: -o-linear-gradient(top, #6D6C70, #615B5B);
	background-color: #615B5B;
	box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-moz-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 4px #948888;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	color: #CCBBFF;
	font-size: 16px;
	font-family: 111.otf;
	text-decoration: none;
	font-weight: bold;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	cursor: pointer;
}

.css_button:hover {
	background: none;
	background-color: #615B5B;
	box-shadow: 0px 0px 5px 0px #AAAAAA;
	-webkit-box-shadow: 0px 0px 5px 0px #AAAAAA;
	-moz-box-shadow: 0px 0px 5px 0px #AAAAAA;
	border: 1px solid #ffffff;
	color: #F2E4E4;
}

.css_button:active {
	top: 1px;
	position: relative;
}

td,th{
line-height: 25px;
padding-left: 5px;
padding-right: 5px;
}

</style> -->
<style>
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
	.wrapper {
    padding: 4em 0 4em 0;
}
h1, h2, h3, h4, h5, h6 {
    color: #fff;
    font-weight: 800;
    letter-spacing: 0.225em;
    text-transform: uppercase;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-family: 'Noto Sans TC', sans-serif;
}

h2 {
    font-size: 1.35em;
    font-size: 1.75em;
    line-height: 1.75em;
}
table th {
    color: #fff;
    font-weight: 600;
    padding: 0 0em 0.75em 1.7em;
    text-align: left;
    font-size: 18px;
}

table td {
    padding: 0.5em 0.5em;
}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header" class="alt_ver">
			<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu" class="alt_ver">
						<ul>
							<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a href="javascript:signOut()">登出</a></li>
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
<!--  						<div class="row">
							<div class="col-12 col-12-medium">-->
						<div class="mydiv"> 
							<div align="center"> 

								<form action="<c:url value="/OrderList.controller"/>" method="post">
								<h2>訂單明細</h2>
								<div class="table-wrapper">
								<table>
									<thead>
										<tr align="center">
											<th>產品縮圖</th>
											<th>產品名稱</th>
											<th>產品單價</th>
											<th>產品數量</th>
											<th>產品金額</th>
										</tr>
									</thead>
									<tbody>
										<tr align="center">
											<c:forEach items="${oneOrderCarts}" var="list" step="1" varStatus="current">
										<tr>
											<td align="center" height="90" width="130">
												<img height="90" width="130" id="pdPicture" src="<c:out value="${productData[current.index].productImageUrl}"/>">
											</td>
											<td align="center" style="line-height:50px">${productData[current.index].productName}</td>
											<td align="center">$${oneOrderCarts[current.index].checkoutPrice}</td>
											<td align="center">${oneOrderCarts[current.index].quantity}</td>
											<td align="center">$${productsPrice[current.index]}</td>
											<!--<td colspan="3">合計  ${totalPrice}</td> -->

										</tr>
										<br>
										</c:forEach>
										</tr>

										<tr align="center">
											<th colspan="4">產品合計</th>
											<td>$${totalPrice}</td>
										</tr>
										<tr align="center">
											<th colspan="4">運費</th>
											<td>$${ShippingNumToPrice[order.shipping]}</td>
										</tr>
										<tr align="center">
											<th colspan="4">訂單總金額</th>
											<td>$${finalTotalPrice}</td>
										</tr>

									</tbody>
								</table>
							</div>
								<br>
								<div align="center">
									<h3>
										<a href="<c:url value="/companyOrder.controller"/>">
											<input class="css_button" type="button" value="返回訂單頁面"/>
										</a>
									</h3>
								</div>
								</form>
							</div>
						</div>

					</section>
 				</div> 
			</section>
		</article>
	</div>
	
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