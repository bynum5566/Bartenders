<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>註冊帳戶/ Bartenders</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

<style type="text/css">
/* html, body { */
/* 	margin: 0; */
/* 	padding: 0; */
/* 	background: url("/Bartenders/images/Register.jpg") no-repeat center */
/* 		center fixed; */
/* 	-webkit-background-size: cover; */
/* 	-moz-background-size: cover; */
/* 	-o-background-size: cover; */
/* 	background-size: cover; */
/* } */

/* .content { */
/* 	margin: 100px auto; */
/* 	text-align: center; */
/* 	background-color: rgb(255, 255, 255, 0.4); */
/* 	width: 50%; */
/* 	height: 500px; */
/* 	border: 1.5px groove rgb(255, 255, 255, 0.4); */
/* 	border-radius: 2%; */
/* 	font-size: 140%; */
/* 	line-height: 150%; */
/* } */

/* table { */
/* 	margin-left: 15%; */
/* } */

h5 {
	color: red;
}

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
		<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu">
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
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
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
						<div class="row">
							<div class="col-7 col-12-medium">
							<h1>請填寫基本資料</h1>
							<h5>${errorMsg}</h5>
							<form action="<c:url value="/Gregister.do"/>" method="POST">
								<div class="row gtr-uniform">
									<div class="col-11 col-12-xsmall">
										<ul>
											<li>姓名:</li>
											<li><input type="text" name="userName" placeholder="${Gname}" size="50" disabled="disabled"/><br></li>
											<li>帳號:</li>
											<li><input type="text" name="newAccount" placeholder="${gid}" size="50" disabled="disabled"/><br></li>
											<li>密碼:</li>
											<li><input type="password" name="newPassword" size="50" placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd"/><br></li>
											<li>確認密碼:</li>
											<li><input type="password" name="newPassword2" size="50" placeholder="請再輸入一次密碼" required="required" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd2"/><br></li>
											<li>手機:</li>
											<li><input type="tel" name="phone" autocomplete="off" size="50" placeholder="請填寫正確的手機號碼" required="required" pattern="^.{10}$" id="phone"/><br></li>
											<li>生日:</li>
											<li><input type="date" name="birthday" size="50" autocomplete="off" required="required" id="bd"/><br></li>
											<li>電子郵件:</li>
											<li><input type="email" name="email" placeholder="${email}" size="50" disabled="disabled"/><br></li>
											<li>聯絡地址:</li>
											<li><input type="text" name="address" autocomplete="off" size="50" placeholder="請填寫正確的住址" pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required" id="add"/><br></li>
										</ul>
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><input class="button" type="button" value="demo" id="demo"/></li>
											<li><a class="button" href="/Bartenders/login">回主頁</a></li>
											<li><input class="button" type="reset" value="清除重填"/></li>
											<li><input class="button primary" type="submit" value="確認送出"/></li>
										</ul>
									</div>
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
	<script type="text/javascript">
		window.onbeforeunload = function() {
			signOut()
		}
		
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
	
	<script type="text/javascript">
		$('#demo').click(function(){
			$('#pwd').val('Ann159874');
			$('#pwd2').val('Ann159874');
			$('#phone').val('0987564251');
			$('#bd').val('1990/3/13');
			$('#add').val('台北市大安區信義路三段147巷5弄17-1');
		});
	</script>

</body>

</html>