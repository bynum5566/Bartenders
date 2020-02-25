<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//================================ 接收購物網站所需的各項參數 ==================================
	String sn_id = request.getParameter("sn_id") == null ? "" : request.getParameter("sn_id"); // 訂單編號
	String order_id = request.getParameter("order_id") == null ? "" : request.getParameter("order_id"); // 訂單編號
	String order_status = request.getParameter("order_status") == null ? "" : request.getParameter("order_status"); // 超商別
	  //========================================== 轉碼 ==============================================
	  order_status = new String(order_status.getBytes("ISO8859_1"),"UTF-8");

%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>
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
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<table>
							<tr>
								<td bgcolor=#e3ffd7 width='20%'>
									<div align=right>
										<b>結果</b>
									</div>
								</td>
								<td bgcolor=#FFFFFF style="padding: 10;"><label style="line-height: 30px;">
										<font color=#444444><b>訂單編號</b></font>  =  <%=order_id%><br>
										<font color=#444444><b>店到店編號</b></font>  =  <%=sn_id%><br>
										<font color=#444444><b>訂單狀態</b></font>  =  <%=order_status%><br>
									</label></td>
							</tr>
						</table>
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