<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<h1><a href="/Bartenders/login">Bartenders</a></h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href="/Bartenders/login">返回首頁</a></li>
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
						<!-- <div class="content"> -->
						<h2>請填寫基本資料</h2>
						<div>
							<h5>${errorMsg}</h5>
						</div>
						<form action="<c:url value="/register.do"/>" method="POST">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<!-- <table> -->
									<ul>
										<li>
											<h3>姓名:</h3>
										</li>
										<li><input type="text" name="userName"
											required="required" size="50" placeholder="請輸入您的姓名"
											pattern="^.{3,30}$" id="name"/><br></li>
										<li>
											<h3>帳號:</h3>
										</li>
										<li><input type="text" name="newAccount"
											autocomplete="off" size="50"
											placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
											pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="account"/><br></li>
										<li>
											<h3>密碼:</h3>
										</li>
										<li><input type="text" name="newPassword" size="50"
											placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
											pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd"/><br></li>
										<li>
											<h3>確認密碼:</h3>
										</li>
										<li><input type="text" name="newPassword2" size="50"
											placeholder="請再輸入一次密碼" required="required"
											pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd2"/><br>
										</li>
										<li>
											<h3>手機:</h3>
										</li>
										<li><input type="tel" name="phone" autocomplete="off"
											size="50" placeholder="請填寫正確的手機號碼" required="required"
											pattern="^.{10}$" id="phone"/><br></li>
										<li>
											<h3>生日:</h3>
										</li>
										<li><input type="date" name="birthday" size="50"
											autocomplete="off" required="required"/><br></li>
										<li>
											<h3>電子郵件:</h3>
										</li>
										<li><input type="email" name="email" autocomplete="off"
											size="50" placeholder="請填寫正確的郵件地址" required="required"
											pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" id="email"/><br></li>
										<li>
											<h3>聯絡地址:</h3>
										</li>
										<li><input type="text" name="address" autocomplete="off"
											size="50" placeholder="請填寫正確的住址"
											pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required" id="add"/><br></li>
									</ul>
									<!-- </table> -->
									<ul class="actions">
										<li><input class="button" type="button" value="demo" id="demo"/></li>
										<li><a class="button" href="/Bartenders/login">回主頁</a></li>
										<li><input class="button" type="reset" value="清除重填"/></li>
										<li><input class="button primary" type="submit" value="確認送出"/></li>
									</ul>
								</div>
							</div>
						</form>
						<!-- </div> -->
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
		$('#demo').click(function(){
			$('#name').val('楊雲理');
			$('#account').val('11129Henry');
			$('#pwd').val('11129Henry');
			$('#pwd2').val('11129Henry');
			$('#phone').val('0987564251');
			$('#email').val('11129henry@gmail.com');
			$('#add').val('台北市大安區樂利路31-1號');
		});
	</script>

</body>

</html>