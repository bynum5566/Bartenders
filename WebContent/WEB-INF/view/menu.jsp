<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<link rel="stylesheet" type="text/css"
	href="/Bartenders/images/C_menu.css">
</head>
<body>
	<header tabindex="0">Bartenders</header>
	<div id="nav-container">
		<div class="bg"></div>
		<div class="button" tabindex="0">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</div>
		<div id="nav-content" tabindex="0">
			<ul>
				<li><a class="menu" href="/Bartenders/My.Bar">我的Bar</a></li>
				<li><a class="menu" href="/Bartenders/Bar.edit">編輯Bar</a></li>
				<li><a class="menu" href="/Bartenders/Product.Add">新增商品+</a></li>
				<li><a class="menu" href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
				<li><a class="menu" href="/Bartenders/Dashboard.Products">商品管理</a></li>
				<li><a class="menu" href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
				<li><a class="menu" href="/Bartenders/companyOrder.controller">訂單管理</a></li>
				<li><a class="menu" href="/Bartenders/salesReport.controller">銷售長條圖</a></li>
				<li><a class="menu" href="/Bartenders/salesReportByPie.controller">銷售圓餅圖</a></li>
				<li class="small"><a class="menu" href="/Bartenders/Welcome.Company">前往首頁</a><a class="menu"
					href="javascript:signOut()">登出</a></li>
			</ul>
		</div>
	</div>

	<script type="text/javascript">
	  function signOut() {
			gapi.auth2.init().then( () => {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		   		});
			})
			document.location.href="http://localhost:8080/Bartenders/logout";
		  }
		  
		  function onLoad() {
		      gapi.load('auth2', function() {
		        gapi.auth2.init();
		      });
		    }
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>
</html>