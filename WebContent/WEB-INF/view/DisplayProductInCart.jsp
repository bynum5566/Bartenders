<%@ page language="java" contentType="text/html; charset=UTF-8"　pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>修改數量</title>
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
						<form action="<c:url value="123456"/>" method="post">
						<h2>修改數量</h2><BR>
						<!-- 		<h2>(購物車編號:${orderId})</h2>  -->
						<div class="table-wrapper">
							<table>
								<thead>
									<tr align="center">

										<!--		<td>產品id</td>	-->
										<td class="sigmaTd1">產品名稱</td>
										<td class="sigmaTd1">產品單價</td>
										<td class="sigmaTd1">數量</td>
										<td class="sigmaTd1">修改數量</td>
										<td class="sigmaTd1">刪除</td>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<c:forEach items="${oneOrderCarts}" var="list" step="1" varStatus="current">
									<tr>
										<c:if test="${oneOrderCarts[current.index].quantity != '0' }">

											<!--	<td align="center">${oneOrderCarts[current.index].pdId}</td> -->
											<td align="center">${listOfProduct[current.index].productName}</td>
											<td align="center">${oneOrderCarts[current.index].checkoutPrice}
											</td>

											<td align="center">${oneOrderCarts[current.index].quantity}</td>

											<td align="center"><a href="<c:url value="/ChangeNumberOfProductInCart.controller"/>?num=${oneOrderCarts[current.index].num}">修改數量</a>
											</td>

											<td align="center">
												<a class="button primary" href="<c:url value="/DeleteItemInCart.controller"/>?num=${oneOrderCarts[current.index].num}&orderId=${orderId}">刪除</a>
											</td>
										</c:if>
									</tr>
									<br>
									</c:forEach>
									</tr>
								</tbody>
							</table>
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