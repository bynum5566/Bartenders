<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />

<title>facebook註冊/Bartenders</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>


</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="/Bartenders/Welcome.Company">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>

								<li><a href="/Bartenders/login">返回首頁</a></li>

							</ul>
						</div></li>
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

								目前狀態： <span id="FB_STATUS_1"></span>

								<div id="fb-root"></div>
								<script async defer crossorigin="anonymous"
									src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=198371544718507&autoLogAppEvents=1"></script>


								<div class="fb-login-button" data-width="" data-size="large"
									data-button-type="continue_with" data-layout="default"
									data-auto-logout-link="false" data-use-continue-as="true"></div>



								<script type="text/javascript">
									window.fbAsyncInit = function() {
										FB.init({
											appId : '198371544718507', // 填入 FB APP ID
											cookie : true,
											xfbml : true,
											version : 'v6.0'
										});

										FB.getLoginStatus(function(response) {
											statusChangeCallback(response);
										});
									};

									// 處理各種登入身份
									function statusChangeCallback(response) {
										console.log(response);
										var target = document
												.getElementById("FB_STATUS_1"), html = "";

										// 登入 FB 且已加入會員
										if (response.status === 'connected') {
											html = "已登入 FB<br/>";

											FB
													.api(
															'/me?fields=id,name,email',
															function(response) {
																console
																		.log(response);
																html += "會員暱稱："
																		+ response.name
																		+ "<br/>";

																target.innerHTML = html;
																$(
																		'#facebookName')
																		.val(
																				response.name);
																$(
																'#facebookName1')
																.val(
																		response.name);
																$(
																		'#facebookAccount')
																		.val(
																				response.id);
																$(
																'#facebookAccount1')
																.val(
																		response.id);


															});
										}

										// 登入 FB, 未偵測到加入會員
										else if (response.status === "not_authorized") {
											target.innerHTML = "已登入 FB，但未加入 WFU BLOG DEMO 應用程式";
										}

										// 未登入 FB
										else {
											target.innerHTML = "未登入 FB";

										}
									}

									function checkLoginState() {
										FB.getLoginStatus(function(response) {
											statusChangeCallback(response);
										});
									}

									// 載入 FB SDK
									(function(d, s, id) {
										var js, fjs = d.getElementsByTagName(s)[0];
										if (d.getElementById(id))
											return;
										js = d.createElement(s);
										js.id = id;
										js.src = "https://connect.facebook.net/zh_TW/sdk.js";
										fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));
								</script>

								
								<form action="<c:url value="/Fregister.do"/>"
									method="POST">
									<div class="row gtr-uniform">
										<div class="col-11 col-12-xsmall">
											<ul>
												<li>姓名:</li>
												<li><input type="text" name="facebookNameshow"
													id="facebookName" size="50" disabled="disabled"/><br>
													<input type="hidden" name="facebookName"
													id="facebookName1" size="50" /><br></li>
												<li>帳號:</li>
												<li><input type="text" name="facebookAccountshow"
													id="facebookAccount" size="50"  disabled="disabled"/><br>
													<input type="hidden" name="facebookAccount"
													id="facebookAccount1" size="50"  /><br></li>
												<li>密碼:</li>
												<li><input type="text" name="newPassword" size="50"
													placeholder="請至少輸入8碼，包含英文字母大小寫與數字" required="required"
													pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd" /><br></li>
												<li>確認密碼:</li>
												<li><input type="text" name="newPassword2" size="50"
													placeholder="請再輸入一次密碼" required="required"
													pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$" id="pwd2" /><br></li>
												<li>手機:</li>
												<li><input type="tel" name="phone" autocomplete="off"
													size="50" placeholder="請填寫正確的手機號碼" required="required"
													pattern="^.{10}$" id="phone" /><br></li>
												<li>生日:</li>
												<li><input type="date" name="birthday" size="50"
													autocomplete="off" required="required" id="bd" /><br></li>
												<li>電子郵件:</li>
												<li><input type="email" name="email" size="50"
													id="email" /><br></li>
												<li>聯絡地址:</li>
												<li><input type="text" name="address"
													autocomplete="off" size="50" placeholder="請填寫正確的住址"
													pattern="^[0-9-\u4e00-\u9fa5].{10,}$" required="required"
													id="add" /><br></li>
											</ul>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input class="button" type="button" value="demo"
													id="demo" /></li>
												<li><a class="button" href="/Bartenders/login">回主頁</a></li>
												<li><input class="button" type="reset" value="清除重填" /></li>
												<li><input class="button primary" type="submit"
													value="確認送出" /></li>
											</ul>
										</div>
									</div>
								</form>
								<h1 style="text-align: center; margin: 10px;">${errorMsg}</h1>
								<h1 style="text-align: center; margin: 10px;">${msg}</h1>
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>




	<script type="text/javascript">
		$('#demo').click(function() {
			$('#pwd').val('PassW0rd123');
			$('#pwd2').val('PassW0rd123');
			$('#phone').val('0987588851');
			$('#email').val('11129henry@gmail.com');
			$('#add').val('台北市大安區和平東路一段162號');
		});
	</script>

</body>

</html>