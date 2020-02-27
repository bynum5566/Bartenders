<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>我的購物車</title>
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
								<h3>我的購物車</h3>
								<h3>${msg}</h3>
								<div class="table-wrapper">
									<table border="1">
										<thead>
											<tr align="center" class="sigmaGray">

												<td class="sigmaTd1" style="font-size:18px">賣家名稱</td>
												<td class="sigmaTd1">產品名稱</td>
												<td class="sigmaTd1">產品單價</td> <!-- 待雙層foreach完成後enable -->

												<!--  <td class="sigmaTd1">配送類型</td>-->
												<!-- <td>修改配送資訊</td> -->
												<td class="sigmaTd250">產品數量</td> <!-- 修改數量 / 產品數量 -->
												<td class="sigmaTd1">小計</td>
												<td class="sigmaTd1"></td> <!-- 刪除 ，成立訂單-->

											</tr>
										</thead>

										<tbody>
											<tr align="center">
												<c:forEach items="${listOfOrder}" var="list" step="1"
													varStatus="current">


											<tr>
												<!-- 每個訂單的總結列 -->
												<!-- 購物車編號 -->
												<!-- <td align="center">${listOfOrder[current.index].orderId}</td> -->
												<!-- 賣家名稱  -->
												<td align="center">${listOfCompany[current.index].companyName}</td>
												<!-- 產品名稱 ，第一行空著-->
												<td align="center"></td>

												<!-- 產品單價 -->
												<td></td>

												<!-- 配送方式 -->
												<!-- <td align="center">${ShippingNumToStr[listOfOrder[current.index].shipping]}</td>  -->


												<!-- 修改購物車 -->

												<!-- 修改配送資訊 -->
												<!-- 
								<td align="center"><a
										href="<c:url value="/ChangeCart.controller"/>?orderId=${listOfOrder[current.index].orderId}">修改配送資訊</a></td>
								 -->

												<td align="center">

													<!-- 舊版修改數量 -->
													<!-- 保存在:[舊版修改數量系統]資料夾 -->
													<!-- 使用方式:<a href="<c:url value="/DisplayProductInCart.controller"/>?orderId=${listOfOrder[current.index].orderId}">修改數量</a>-->
												</td>

												<!-- 小計，第一行空著 -->
												<td align="center"></td>
												<!-- 刪除 -->



												<td>

													<!-- form版本刪除 -->
													<form style="margin:0px;display:inline" action="<c:url value="/CancelCart.controller"/>" method="get">

													<Input type='hidden' name='orderId'
														value='${listOfOrder[current.index].orderId}'>
													<Input type='hidden' name='status'
														value='${listOfOrder[current.index].status}'>
													<Input type='submit' value='刪除'>
													</form>
												</td>




											</tr>


											<tr>
												<!-- 每個訂單的各個產品 -->
												<!-- 使用前一層foreach的變數 current-->
												<!-- 第 current個訂單的listOfCart -->
												<c:forEach items="${listOflistOfCart[current.index]}" var="list"
													step="1" varStatus="current2">
											<tr>
												<td>
												</td>

												<td>
													<!-- pdId = ${listOflistOfCart[current.index][current2.index].pdId} -->
													${listOflistOfProduct[current.index][current2.index].productName}
												</td>

												<td>
													<!-- 單價   -->
													<!-- 第 current個訂單的listOfCart 中　第current2個Cart -->
													${listOflistOfCart[current.index][current2.index].checkoutPrice}
												</td>

												<td>
													<!-- 數量，產品數量   -->
													<!-- value:預設值，顯示本訂單中本產品的購買數量 -->
													<!-- max:最多買幾個，限制為庫存值 -->


													<!--普通商品才能修改數量-->
													<c:if test="${listOfOrder[current.index].shipping == '1'}">

														<form style="margin:0px;display:inline" action="<c:url value="/UpdateQtyInCart.controller"/>" method="get">
														<!-- qty:修改後數量 -->
														<!-- 其他修改需要的參數:PdId， ProductName，PdStock，account ?，pdPrice-->
														<!-- 一般類型，max = 庫存 -->

														<input type="number" required="required"
															name="qty"
															value="${listOflistOfCart[current.index][current2.index].quantity}"
															max="${listOflistOfProduct[current.index][current2.index].pdStock}"
															min="1"/>

														<Input type='submit' value='修改'>

														<Input type='hidden' name='PdId'
															value='${listOflistOfCart[current.index][current2.index].pdId}'>
														<Input type='hidden' name='ProductName'
															value='${listOflistOfProduct[current.index][current2.index].productName}'>
														<Input type='hidden' name='PdStock'
															value='${listOflistOfProduct[current.index][current2.index].pdStock}'>
														<Input type='hidden' name='pdPrice'
															value='${listOflistOfProduct[current.index][current2.index].pdPrice}'>

														</form>
													</c:if>

													<!-- QR商品，只要列印出數字 -->
													<c:if test="${listOfOrder[current.index].shipping == '3'}">
														${listOflistOfCart[current.index][current2.index].quantity}
														&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
													</c:if>

													<form style="margin:0px;display:inline" action="<c:url value="/DeleteItemInCart.controller"/>" method="get">
													<Input type='submit' value='刪除'>

													<Input type='hidden' name='num'
														value='${listOflistOfCart[current.index][current2.index].num}'>
													<Input type='hidden' name='orderId'
														value='${listOfOrder[current.index].orderId}'>
													<!-- 超連結版本開始 -->
													<!--<a href="<c:url value="/DeleteItemInCart.controller"/>?num=${listOflistOfCart[current.index][current2.index].num}&orderId=${listOfOrder[current.index].orderId}">刪除</a>-->
													<!-- 超連結版本結束 -->
													</form>


												</td>

												<td>
													<!--　小計   -->
													${listOflistOfCart[current.index][current2.index].quantity *
													listOflistOfCart[current.index][current2.index].checkoutPrice}
												</td>

												<td></td><!-- 刪除/成立訂單　 -->




											</tr>
											</c:forEach>
											</tr>

											<td></td>
											<td>總金額</td>
											<td></td>
											<td></td>
											<td align="center">${listOfOrder[current.index].amount}</td>


											<td>



												<a class="button primary" href="<c:url value="/DisplayCart.controller"/>?orderId=${listOfOrder[current.index].orderId}&status=${listOfOrder[current.index].status}">成立訂單</a>


											</td>
											</c:forEach>
											</tr>
										</tbody>
									</table>
								</div>
								<%-- 本體，結束 --%>
							<!-- </div> -->
							<!--end content-->
						<!-- </div> -->
						<!--end allpage-->
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