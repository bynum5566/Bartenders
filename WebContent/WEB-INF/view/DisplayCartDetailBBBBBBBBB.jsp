<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>確認訂單資訊頁面／Bartenders</title>
	<%--豪--%>
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>	<noscript>
		<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
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
						<div class="mydiv">
							<header>
								<jsp:include page="/WEB-INF/view/cartTopMenu.jsp"/>
							</header>
							<div>
								<form action="<c:url value=" 123456"/>" method="post">
								<div class="row">
									<div class="col-6 col-12-medium">
										<h2>確認訂單資訊頁面</h2>
										<!-- <h3>(購物車編號:${orderId}) </h3>  -->
										<table align="center">
											<tr align="center">
												<td>產品名稱</td>
												<td>產品單價</td>
												<td>產品數量</td>
												<td>產品金額</td>
											</tr>
											<c:forEach items="${oneOrderCarts}" var="list" step="1" varStatus="current">
												<c:if test="${oneOrderCarts[current.index].quantity != '0' }">
													<tr class="actions">
														<td>${productData[current.index].productName}</td>
														<td>${oneOrderCarts[current.index].checkoutPrice}</td>
														<td>${oneOrderCarts[current.index].quantity}</td>
														<td>${productsPrice[current.index]}</td>
													</tr>
												</c:if>
												<br>
											</c:forEach>
										</table>
										<ul class="alt">
											<li colspan="3">產品合計:&nbsp;${totalPrice}</li>
											<li colspan="3">運費:&nbsp;${ShippingNumToPrice[order.shipping]}</li>
											<li colspan="3">訂單總金額:&nbsp;${finalTotalPrice}</li>
										</ul>
									</div>
								</div>
								</form>

								<form action="<c:url value="/ChangeStatusOneToTwo.controller"/>" method="get">
								<div class="row">
									<div class="col-6 col-12-medium">
										<h2>配送資訊</h2>
										<h3>配送方式:</h3>

										<!-- =如果是一般商品，可以選擇配送方式，開始= -->

										<c:if test="${shipping == '1' or shipping == '2'}">
											<!--  如果這固定宅配，enable這個		<Input type='hidden' name='select1' value="${shipping}"> -->
											<!--  如果這固定宅配，enable這個		<label>宅配</label> -->
											<div class="col-4 col-12-small">
												<input id="setTt1" name="select1" type="radio" value="1" checked >
												<label for="setTt1">宅配</label>
												<input id="setTt2" name="select1" type="radio" value="2">
												<label for="setTt2">超商</label>
											</div>

										</c:if>

										<!--0	未選擇
					1	宅配
					2	超商
					3	QR票券 -->
										<!-- =如果是一般商品，可以選擇配送方式，結束= -->

										<c:if test="${shipping == '3' }">
											<label>QR票券</label>
										</c:if>

										<c:if test="${shipping == '1' }">
											<br>
											<label>收件人&emsp;&emsp;：</label>
											<input type="text" required="required" name="input1" size="30"
												value="${defaultName}"/>
											<!-- 	<Input type='hidden' name='input1' value="${defaultName}"> -->
											<br>
										</c:if>
										<c:if test="${shipping == '3' }">
											<br>
											<label></label>
											<Input type='hidden' name='input1' value="${defaultName}">
											<br>
										</c:if>

										<!-- 未選擇 -->
										<c:if test="${shipping == '0' }">
											<label>宅配地址：${defaultAddress}</label>
											<Input type='hidden' name='address1' value="${defaultAddress}">
											<Input type='hidden' name='address2' value="${defaultAddress}">
											<br>
										</c:if>


										<c:if test="${shipping == '1' }">
											<label>地址／門市：</label>
											<input type="text" required="required" name="address1" size="30"
												value="${defaultAddress}"/>
											<!-- 	<Input type='hidden' name='address1' value="${defaultAddress}">  -->
											<br>
										</c:if>


										<c:if test="${shipping == '2' }">
											<label>超商門市：</label>
											<input type="text" required="required" name="address2" size="30"
												value="${defaultAddress}"/>
											<br>
										</c:if>

										<c:if test="${shipping == '3' }">
											<label></label>
											<Input type='hidden' name='input2' value="${defaultAddress}">
											<br>
										</c:if>

										<c:if test="${shipping == '1' }">
											<!-- 全型空白 -->
											<label>電話：&emsp;&emsp;&emsp;</label>
											<input type="text" required="required" name="input2" size="30"
												value="${defaultPhone}"/>
										</c:if>
										<c:if test="${shipping == '3' }">
											<label></label>
										</c:if>

										<br>
										<c:if test="${shipping == '1' }">
											<Input type='hidden' name='address2' value='empty'>
										</c:if>
										<c:if test="${shipping == '2' }">
											<Input type='hidden' name='address1' value='empty'>
										</c:if>
										<c:if test="${shipping == '3' }">
											<Input type='hidden' name='address1' value='empty'>
											<Input type='hidden' name='address2' value='empty'>
										</c:if>

										<c:if test="${shipping == '3' }">
											<Input type='hidden' name='select1' value='${shipping}'>
										</c:if>



										<Input type='hidden' name='orderId' value='${orderId}'>
										<Input type='hidden' name='totalPrice' value='${totalPrice}'>
										<!-- 新增2020131_1634 -->
										<Input type='hidden' name='Freight'
											value='${ShippingNumToPrice[order.shipping]}'>
										<!-- 新增2020131_1634 -->
										<input class="button primary" type='submit' value='資訊無誤，確認訂購'>
										<p style="color:red">請注意，一經確認，即無法修改。</p>
									</div>
								</div>
								</form>
								<!-- 本體，結束  -->
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>



	<!--縮放用JS，開始-->
	<script type="text/javascript">
		$(".flip").click(function () {
			$(".panel").slideToggle("slow");
		});
	</script>
	<!--縮放用JS，結束-->

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