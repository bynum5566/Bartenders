<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<title>註冊酒吧帳戶/ Bartenders</title>
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
	<header id="header" class="alt_ver">
		<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>Menu</span></a>
					<div id="menu" class="alt_ver">
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
							
							<h2>請填寫基本資料</h2>
							<div>
								<h5>${errorMsg}</h5>
							</div>
							<form action="<c:url value="/GCregister.do"/>" method="POST">
							<div class="row gtr-uniform">
								<div class="col-11 col-12-xsmall">
									<ul>
										<li><h3>店名:</h3></li>
										<li><input type="text" name="companyName" required="required" size="50"
												placeholder="請填寫正確的店名" pattern="^.{1,30}$" id="store"/><br></li>
										<li><h3>帳號:</h3></li>
										<li><input type="text" name="newAccount" placeholder="${gid}" size="50"
												disabled="disabled"/><br></li>
										<li><h3>密碼:</h3></li>
										<li><input type="password" name="newPassword" size="50"
												placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
												pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd"/><br></li>
										<li><h3>確認密碼:</h3></li>
										<li><input type="password" name="newPassword2" size="50" placeholder="請再輸入一次密碼"
												required="required"
												pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd2"/><br>
										</li>
										<li><h3>手機:</h3></li>
										<li><input type="tel" name="phone" autocomplete="off" size="50"
												placeholder="請填寫正確的手機號碼" required="required" pattern="^.{10}$" id="phone"/><br>
										</li>
										<li><h3>統一編號:</h3></li>
										<li><input type="text" name="taxId" autocomplete="off" size="50"
												placeholder="請填寫正確的統一編號" required="required" id="taxid"/><br></li>
										<li><h3>電子郵件:</h3></li>
										<li><input type="email" name="email" placeholder="${email}" size="50"
												disabled="disabled"/><br></li>
										<li><h3>店家地址:</h3></li>
										<li><input type="text" name="address" autocomplete="off" size="50"
												placeholder="請填寫正確的住址" pattern="^[0-9-\u4e00-\u9fa5].{10,}$"
												required="required" id="add"/><br></li>
										<li><h3>Line ChannelId:</h3></li>
										<li><input type="text" name="lineId" autocomplete="off" required="required"
												size="50" placeholder="請填寫正確的Line ChannelId" id="lid"/><br></li>
										<li><h3>Line ChannelSecret:</h3></li>
										<li><input type="text" name="lineSecret" autocomplete="off" required="required"
												size="50" placeholder="請填寫正確的Line ChannelSecret" id="lsecret"/></li>
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
			$('#store').val('來Bar');
			$('#pwd').val('Ann159874');
			$('#pwd2').val('Ann159874');
			$('#phone').val('0987564546');
			$('#taxid').val('25649875');
			$('#add').val('台北市大安區信義路三段151-2號');
			$('#lid').val('1653764156');
			$('#lsecret').val('a4e495c062ff3b7402b974c43399ce81');
		});
	</script>
	</body>

</html>