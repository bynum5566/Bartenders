<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<title>用戶密碼重設</title>
	
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
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
						<!-- <main>
							<div> -->
						<h2>使用者重設密碼</h2>
						<form action="<c:url value="/resetPassword.controller"/>" method="post">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<!-- <table> -->
								<ul>
									<li>
										<h3>帳號:</h3>
									</li>
									<li><input type="text" name="userAccount" placeholder="請輸入您的帳號" id="account"/></li>
									<li>${errors.account}</li>
								</ul>

								<ul>
									<li>
										<h3>EMAIL帳號:</h3>
									</li>
									<li><input type="email" name="useremail" autocomplete="off" size="50" id="email"
											placeholder="請填寫正確的郵件地址" required="required"
											pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/><br></li>
									<li>${errors.email}</li>
								</ul>

								<ul>
									<li>
										<h3>手機:</h3>
									</li>
									<li><input type="text" name="userphone" autocomplete="off" size="50"
											placeholder="請填寫正確的手機號碼" required="required" id="phone"/><br></li>
									<li>${errors.phone}</li>
								</ul>
								<ul>
									<li>
										<h3>新密碼:</h3>
									</li>
									<li><input type="text" name="newPassword" size="50"
											placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
											pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="newPassword"/><br></li>
								</ul>
								<ul>
									<li>
										<h3>確認新密碼:</h3>
									</li>
									<li><input type="text" name="newPassword2" size="50" placeholder="請再輸入一次密碼"
											required="required" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="newPassword2"/><br>
									</li>
									<li>${errors.pswd}</li>
								</ul>

								<ul class="actions">
									<li><a class="button" href="/Bartenders/login">返回</a></li>
									<li colspan="2"><button class="button primary" value="submit">送出</button></li>
									<li><input class="button" type="reset" value="清除重填"/></li>
									<li><input class="button" type="button" value="demo" id="demo"/></li>
								</ul>
								<!-- </table> -->
							</div>
						</div>
						</form>
						<!-- </div> -->
						<h2>${errors.msg}</h2>
						<!-- </main> -->
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
			$('#account').val('11129Henry');
			$('#newPassword').val('PassW0rd123');
			$('#newPassword2').val('PassW0rd123');
			$('#phone').val('0987564251');
			$('#email').val('11129henry@gamil.com');
		});
	</script>
	
	
	
	
	</body>

</html>