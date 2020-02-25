<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Orders</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
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
		
		.row{
			margin-left: 8%;
		}
		div.panel, td.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: gray;
	border: solid 1px #c3c3c3;
	max-width: 1400px;
}

td.flip h3{
cursor: pointer;
}

div.panel {
	height: auto;
	display:none;
	max-width: 1400px;
}

	</style>
<!-- 	<style type="text/css"> -->
<!-- /* 		a { */ -->
<!-- /* 			color: #E8CCFF; */ -->
<!-- /* 		} */ -->
		
<!-- /* 		a:hover { */ -->
<!-- /* 			color: #9F88FF; */ -->
<!-- /* 		} */ -->
		
<!-- /* 		.mydiv { */ -->
<!-- /* 			min-width: auto; */ -->
<!-- /* 			top: 80px; */ -->
<!-- /* 			position: sticky; */ -->
<!-- /* 			text-align: center; */ -->
<!-- /* 			border-radius: 5px; */ -->
<!-- /* 			background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */ -->
<!-- /* 				rgba(163, 163, 163, 0.5) 99%); */ -->
<!-- /* 			background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */ -->
<!-- /* 				rgba(163, 163, 163, 0.5) 99%); */ -->
<!-- /* 			background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */ -->
<!-- /* 				rgba(163, 163, 163, 0.5) 99%); */ -->
<!-- /* 			background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */ -->
<!-- /* 				rgba(163, 163, 163, 0.5) 99%); */ -->
<!-- /* 			box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */ -->
<!-- /* 			-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */ -->
<!-- /* 			-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */ -->
<!-- /* 			color: #E8CCFF; */ -->
<!-- /* 			font-size: 18px; */ -->
<!-- /* 		} */ -->
		
<!-- /* 		body { */ -->
<!-- /* 			margin: 0; */ -->
<!-- /* 			padding: 0; */ -->
<!-- /* 			background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat */ -->
<!-- /* 				center center fixed; */ -->
<!-- /* 			-webkit-background-size: cover; */ -->
<!-- /* 			-moz-background-size: cover; */ -->
<!-- /* 			-o-background-size: cover; */ -->
<!-- /* 			background-size: cover; */ -->
<!-- /* 		} */ -->
		
<!-- /* 		td{ */ -->
<!-- /* 		line-height: 25px; */ -->
<!-- /* 		padding-left: 3px; */ -->
<!-- /* 		padding-right: 3px; */ -->
<!-- /* 		} */ -->
<!-- 	</style> -->

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
<!-- 				<div class="inner"> -->
					<section>
						<div class="row">
							<div class="col-6 col-12-medium">
					
<!-- 						<div class="mydiv"> -->
<!-- 							<div align="center"> -->
			<h2>我的訂單</h2>
			<br>
			<form action="<c:url value="/userOrder.controller"/>" method="post">
				<table class="myTable">
					<thead>
						<tr align="center">
							<th nowrap="nowrap">訂單編號</th>
							<th nowrap="nowrap">酒吧</th>
							<th nowrap="nowrap">訂單內容</th>
							<th nowrap="nowrap">金額</th>
							<th nowrap="nowrap">收件人</th>
							<th nowrap="nowrap">配送方式</th>
							<th nowrap="nowrap">配送地址/QRcode載點</th>
							<th nowrap="nowrap">配送電話</th>
							<th nowrap="nowrap">訂單狀態</th>
							<th nowrap="nowrap">購買時間</th>
							<th nowrap="nowrap">物流編號</th>
							<th nowrap="nowrap">付款</th>
							<th nowrap="nowrap">修改</th>
							<th nowrap="nowrap">取消</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<c:forEach items="${Corders}" var="list" step="1"
								varStatus="current">
								<tr>
									<td align="center" nowrap="nowrap"><a
										href="<c:url value="/OrderListUser.controller"/>?orderId=${Corders[current.index].orderId}"
										value="${Corders[current.index].orderId}">${Corders[current.index].orderId.substring(3,6)}${Corders[current.index].orderId.substring(12,19)}</a>
									</td>
									<td align="center" nowrap="nowrap">${company[current.index].companyName}</td>
									<td align="center" nowrap="nowrap"><div class="flip" style="cursor: pointer;">${productData[current.index][0].productName}...</div>
									<div class="panel">
									<c:forEach items="${productData[current.index]}" var="list" step="1"
								varStatus="current1">
										<p>${productData[current.index][current1.index].productName}</p></c:forEach>
									</div>
									</td>
									<td align="center" nowrap="nowrap">$${Corders[current.index].amount}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].recipient}</td>
										<c:choose>
									<c:when
										test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
										<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping].substring(0,6)}<br>${ShippingNumToStr[Corders[current.index].shipping].substring(6,10)}</td>
									</c:when>
									<c:otherwise>
										<td align="center" nowrap="nowrap">${ShippingNumToStr[Corders[current.index].shipping]}</td>
									</c:otherwise>
								</c:choose>
									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td align="center" nowrap="nowrap"><a
												href="${attrAddress[current.index]}">QRcode載點</a></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap">${attrAddress[current.index]}</td>
										</c:otherwise>
									</c:choose>
									<td align="center" nowrap="nowrap">${Corders[current.index].phone}</td>
									<td align="center" nowrap="nowrap">${statusNumToStr[Corders[current.index].status]}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].createTime.substring(0,10)}<br>${Corders[current.index].createTime.substring(11,19)}</td>
									<td align="center" nowrap="nowrap">${Corders[current.index].shippingNumber}</td>
									<c:choose>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='未付款'}">
											<td align="center" nowrap="nowrap"><a
												href="<c:url value="/doLPay"/>?orderId=${Corders[current.index].orderId}">
													去付款</a></td>
										</c:when>
										<c:otherwise>
											<td nowrap="nowrap"><font color=gray>去付款</font></td>
										</c:otherwise>
									</c:choose>


									<!--<td align="center" nowrap="nowrap"><a
										href="<c:url value="/doLPay"/>?orderId=${Corders[current.index].orderId}">
											去付款</a></td>-->
											
									<!--<form:form action="doLPay" method="post">
									<table>
										<tr>
											<td><input type="submit" value="去付款"></td>
										</tr>
									</table>
								</form:form>-->
									<c:choose>
										<c:when
											test="${ShippingNumToStr[Corders[current.index].shipping]=='QRcode電子票券'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='配送中'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已到貨'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='已取消'}">
											<td nowrap="nowrap"><font color=gray>修改</font></td>
										</c:when>
										<c:otherwise>
											<td align="center" nowrap="nowrap"><a
												href="<c:url value="/ShowChangeOrderUser.controller"/>?orderId=${Corders[current.index].orderId}"
												value="${Corders[current.index].orderId}">修改</a></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when
											test="${statusNumToStr[Corders[current.index].status]=='未付款'}">
											<td nowrap="nowrap"><a
												href="<c:url value="/CancelOrderUser.controller"/>?orderId=${Corders[current.index].orderId}&status=${Corders[current.index].status}"
												value="${Corders[current.index].orderId}">取消</a></td>
										</c:when>
										<c:otherwise>
											<td nowrap="nowrap"><font color=gray>取消</font></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</form>
							</div>
						</div>
	
					</section>
<!-- 				</div> -->
			</section>
		</article>
	</div>
	 <script type="text/javascript">
  $(".flip").click(function() {
   <%--$(".panel").slideToggle("slow");--%>
   $(this).siblings().slideToggle("slow");
  });
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
