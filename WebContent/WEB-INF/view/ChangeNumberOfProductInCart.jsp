<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>修改數量</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<!-- 小鈴鐺 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
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
		
.noticeBox {
	position: fixed;
	top: 60px;
	right: 20px;
	align: right;
}

.bell .bellImg {
	height: 70px;
	width: 70px;
	float: right;
}

.notice {
	background-color: rgb(255, 255, 255, 0.4);
	width: 110%;
	height: auto;
	float: right;
	display: none;
}
		
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		    <header id="header">
      <h1><a href="/Bartenders/Welcome.UserFirstPage">Bartenders</a></h1>
    
<!-- 小鈴鐺 -->
			<div class="noticeBox">
				<div class="bell">
					<img class="bellImg" src="/Bartenders/images/bell.png">
				</div>
				<div class="notice">
					<ul id="notice"></ul>
				</div>
			</div>
    
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
                <li class="small"><a href="/Bartenders/Welcome.UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<h2>修改數量</h2>
								<h2>${errorMsgOfAddToCartButton}</h2>
								<ul class="alt">
									<li>產品名稱: ${ProductName}</li>
									<li>原購買數量: ${nowBuyQty}</li>
									<li>單價: ${pdPrice}</li>
								</ul>
								<form action="<c:url value="/UpdateQtyInCart.controller"/>" method="get">
								<h3>變更購買數量:</h3>
								<div class="col-12">
									<c:choose>
										<c:when test="${validDate == null}">
											<select class="sigmaBlack" name='qty'>
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
										</c:when>
										<c:otherwise>
											<select name='qty'>
												<option value="1">1</option>
											</select>
										</c:otherwise>
									</c:choose>
								</div>
								<Input type='hidden' name='PdId' value='${PdId}'>
								<Input type='hidden' name='ProductName' value='${ProductName}'>
								<Input type='hidden' name='PdStock' value='${PdStock}'>
								<Input type='hidden' name='account' value='${account}'>
								<Input type='hidden' name='pdPrice' value='${pdPrice}'>
								<div class="col-12">
									<ul class="actions">
										<li><Input class="button primary" type='submit' value='確認修改'></li>
									</ul>
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
	
<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
	
	</body>

</html>