<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
	<title>公司密碼重設</title>
	
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/ >
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

	<!-- <style>
h1.panel, form.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	border: solid 1px #c3c3c3;
}

form.panel {
	height: 600px;
	width: 900px;
	background-color: transparent;
}

#wordPicture {
	height: 200px;
	width: 800px;
}
</style> -->


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
			<h1><a href="/Bartenders/login">Bartenders</a></h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu" class="alt_ver">
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
						<!-- <main> -->
						<!-- <div align="center"> -->
						<h2>酒吧使用者重設密碼</h2>
						<form action="<c:url value="/resetCompanyPassword.controller"/>" method="post">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<!-- <table> -->
								<ul>
									<li>
										<h3>公司帳號:</h3>
									</li>
									<li><input type="text" name="companyAccount" placeholder="請輸入您的帳號"/></li>
									<li>${errors.account}</li>
									<li>
										<h3>EMAIL帳號:</h3>
									</li>
									<li><input type="email" name="companyemail" autocomplete="off" size="50"
											placeholder="請填寫正確的郵件地址" required="required"
											pattern="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/><br></li>
									<li>${errors.email}</li>
									<li>
										<h3>電話:</h3>
									</li>
									<li><input type="text" name="companyphone" autocomplete="off" size="50"
											required="required" placeholder="請輸入您的電話"/><br></li>
									<li>${errors.phone}</li>
									<li>
										<h3>統一編號:</h3>
									</li>
									<li><input type="text" name="taxId" autocomplete="off" size="50" required="required"
											placeholder="請輸入您的統一編號"/><br></li>
									<li>${errors.taxId}</li>
									<li>
										<h3>密碼:</h3>
									</li>
									<li><input type="password" name="newPassword" size="50"
											placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
											pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$"/><br></li>
									<li>
										<h3>確認密碼:</h3>
									</li>
									<li><input type="password" name="newPassword2" size="50" placeholder="請再輸入一次密碼"
											required="required" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$"/><br>
									</li>
									<li>${errors.pswd}</li>
								</ul>

								<ul class="actions">
									<li><a class="button" href="/Bartenders/CLogin">返回</a></li>
									<li colspan="2"><button class="button primary" value="submit">送出</button></li>
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
	</body>

</html>