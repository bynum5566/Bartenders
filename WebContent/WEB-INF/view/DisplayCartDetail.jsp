<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>確認訂單資訊頁面</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>	<noscript>
		<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
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
                <li><a href="/Bartenders/queryAllActive.do">活動大廳</a></li>
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
										<br>
										<table align="center">
											<tr class="actions">
												<td>產品合計:&nbsp;</td>
												<td>${totalPrice}</td>
											</tr>
											<tr class="actions">
												<td >運費:&nbsp;</td>
												<td id = "Freight">${ShippingNumToPrice[order.shipping]}</td>
											</tr>
											<tr class="actions">
												<td>訂單總金額:&nbsp;</td>
												<td id = "finalTotalPrice">${finalTotalPrice}</td>
											</tr>										
										</table>
									</div>
								</div>
								</form>
								<%--改成url													
								<!------------- 新增超商按鈕  ------------------->
								<form style="display:none" id="selectMarket" action="http://map.ezship.com.tw/ezship_map_web.jsp" method="post">
									<input id="marketUrl" type="hidden" name="rtURL" value="http://localhost:8080/Bartenders/DisplayCart.controller?orderId=${orderId}&status=${order.status}">
									<input type="submit" value="選擇超商">
								</form>
								<!------------- 新增超商按鈕 ，結束 ------------------->
								--%>								
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
												<c:if test="${shippingMethod == '1'}">
													<input id="setTt1" name="select1" type="radio" value="1" checked onclick="onclickFunction01()">
													<label for="setTt1">宅配</label>
													<input id="setTt2" name="select1" type="radio" value="2" onclick="onclickFunction02()">
													<label for="setTt2">超商</label>	
												</c:if>	
												<c:if test="${shippingMethod == '2'}">
													<input id="setTt1" name="select1" type="radio" value="1" onclick="onclickFunction01()">
													<label for="setTt1">宅配</label>
													<input id="setTt2" name="select1" type="radio" value="2" checked  onclick="onclickFunction02()">
													<label for="setTt2">超商</label>	
												</c:if>										
											</div>
										</c:if>
<%--url新增超商連結--%>
<a id="selectMarket" style="display:none" href=
"<c:url value="http://map.ezship.com.tw/ezship_map_web.jsp"/>
?rtURL=http://localhost:8080/Bartenders/DisplayCart.controller?orderId=${orderId}&status=${order.status}
">選擇超商</a>	
<!--
0	未選擇
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
											<%--required="required--%>
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


										<%--<c:if test="${shipping == '1' }">--%>
										<c:if test="${shippingMethod == '1' && shipping != '3'}">
											<div id='normalAddress'>									
												<label>地址：</label>
												<%--required="required"--%>
												<input id='normalAddressInputBox' type="text" name="address1" size="30"
													value="${defaultAddress}"/>
												<!-- 	<Input type='hidden' name='address1' value="${defaultAddress}">  -->
												<br>
											</div>
											<div id='returnAddress' style="display:none">
												<label>超商：</label>
												<!-- 新增超商回傳地址  -->
												<%--required="required--%>
												<Input id='returnAddressInputBox' type='text' name='address2' value='${marketAddr}'>
												<%--style="display:none"--%>
												<br>
											</div>	

										</c:if>
										
										<c:if test="${shippingMethod == '2'}">
											<div id='normalAddress' style="display:none">									
												<label>地址：</label>
												<%--required="required--%>
												<input type="text" name="address1" size="30"
													value="${defaultAddress}"/>
												<!-- 	<Input type='hidden' name='address1' value="${defaultAddress}">  -->
												<br>
											</div>	
											<div id='returnAddress'>
												<label>超商：</label>
												<!-- 新增超商回傳地址  -->
												<%--required="required--%>
												<Input type='text' name='address2' value='${marketAddr}'>
												<%--style="display:none"--%>
												<br>
											</div>								
										</c:if>

										<c:if test="${shipping == '2' }">
											<label>超商門市：</label>
											<%--required="required--%>
											<input type="text" name="address2" size="30"
												value="${defaultAddress}"/>
											<br>
										</c:if>

										<c:if test="${shipping == '3' }">
											<label></label>
											<Input type='hidden' name='input2' value="${defaultAddress}">
											<br>
										</c:if>
										<%--超商或宅配--%>
										<c:if test="${shipping == '1' }">
											<!-- 全型空白 -->
											<label>電話：&emsp;&emsp;&emsp;</label>
											<%--required="required--%>
											<input type="text" required="required" name="input2" size="30"
												value="${defaultPhone}"/>
										</c:if>
										<c:if test="${shipping == '3' }">
											<label></label>
										</c:if>

										<br>
										
										<%--<c:if test="${shipping == '1' }">
											<Input type='hidden' name='address2' value='empty'>
										</c:if>--%>
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
										<!--<p style="color:red">請注意，一經確認，即無法修改。</p>-->
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
	var url = document.getElementById('marketUrl');
	console.log('url is:',url.value);
	console.log('orderId is:','${orderId}');
	console.log('status is:','${order.status}');
	function insertUrl(){
		url.value = 'http://localhost:8080/Bartenders/DisplayCart.controller?orderId='+${orderId}+'&status='+${order.status};
	}
		$(".flip").click(function () {
			$(".panel").slideToggle("slow");
		});
		<%--動態顯示運費，總金額。開始--%>
		<!--finalTotalPrice		0 	QR		n/a		-->
		<!--finalTotalPrice		80 	normal	不變		-->
		<!--finalTotalPrice		60 	超商		減去20	-->
		<%--點下宅配--%>
		function onclickFunction01() 
		{
			document.getElementById("Freight").innerHTML = "80";
			document.getElementById("finalTotalPrice").innerHTML = ${finalTotalPrice};
			<%--宅配地址輸入欄位的id--%>
			document.getElementById("normalAddressInputBox").setAttribute("required", "");
			<%--超商地址輸入欄位的id--%>
			document.getElementById("returnAddressInputBox").removeAttribute("required");			
		}
		<%--點下超商--%>
		function onclickFunction02() 
		{
			document.getElementById("Freight").innerHTML = "60";
			document.getElementById("finalTotalPrice").innerHTML = ${finalTotalPrice - 20};
			<%--宅配地址輸入欄位的id--%>
			document.getElementById("normalAddressInputBox").removeAttribute("required");
			<%--超商地址輸入欄位的id--%>
			document.getElementById("returnAddressInputBox").setAttribute("required", "");
		}
		<%--動態顯示運費，總金額。結束--%>
	</script>
	<%--選擇超商按鈕的顯示與隱藏--%>
	<script>
		<%--點下宅配--%>
		$("#setTt1").click(function() {
			<%--超商地址按鈕--%>
			$('#selectMarket').hide();
			<%--超商地址--%>
			$('#returnAddress').hide();
			<%--普通地址--%>
			$('#normalAddress').show();
		})	
		<%--點下超商--%>
		$("#setTt2").click(function() {
			$('#selectMarket').show();
			$('#returnAddress').show();
			$('#normalAddress').hide();
			
		})		
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
<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>	
	</body>
</html>