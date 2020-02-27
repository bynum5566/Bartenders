<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>修改配送資訊</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	
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
						<h1>修改配送資訊</h1>
						<form action="<c:url value="/doChangeShipping.controller"/>" method="POST">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								<h2>原配送資訊:</h2>
								<ul class="alt">
									<li>
										<h3>訂單編號:</h3>
										<h3>${orderId}</h3>
									</li>
									<li>
										<h3>商品名稱:</h3>
										<h3>${listOfProduct[0].productName}等</h3>
									</li>
									<li>
										<h3>訂單總價:</h3>
										<h3>${orderX.amount}</h3>
									</li>
									<li>
										<h3>原選擇之配送方式:</h3>
										<h3>${ShippingType[orderX.shipping]}</h3>
									</li>
								</ul>
							</div>
						</div>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<h2>修改配送資訊:</h2>
								<ul>
									<li>
										<h3>收件人:</h3>
									</li>
									<li><input type="text" size="40" name="recipient" value="${orderX.recipient}"/><br>
									</li>
									<li>
										<h3>配送方式:</h3>
									</li>
									<li>
										<div class="col-12">
											<select name="shippingType">
												<c:choose>
													<c:when test="${ShippingType[orderX.shipping]=='QR票券'}">
														<option value="QR" width="10">3.QR</option>
													</c:when>
													<c:otherwise>
														<option value="HomeDelivery" width="10">1.宅配</option>
														<option value="ConvenienceStore" width="10">2.超商取貨
														</option>
													</c:otherwise>
												</c:choose>
											</select><br>
										</div>
									</li>
									<c:choose>
										<c:when test="${ShippingType[orderX.shipping]=='QR票券'}">
											<li>
											<Input type='hidden' name='address' value='${Address}'></li>
										</c:when>
										<c:otherwise>
											<li>
												<h3>地址/門市:</h3>
											</li>
											<li><input type="text" name="address" size="40" value="${Address}"/><br>
											</li>
										</c:otherwise>
									</c:choose>
									<li>
										<h3>收件人電話:</h3>
									</li>
									<li><input type="text" size="40" name="phone" value="${orderX.phone}"/><br>
									</li>
								</ul>
								<ul class="actions">
									<li><input class="button" type="reset" value="清除重填"/></li>
									<li><input class="button primary" type="submit" value="確認送出"/></li>
								</ul>
							</div>
						</div>
						</form>
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