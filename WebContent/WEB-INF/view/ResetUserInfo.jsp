<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>修改個人資訊</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

	<!-- <style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	background: url("/Bartenders/images/bg15.png") no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.mydiv {
	width: 50%;
	height: 500px;
	margin: 0px auto;
	top: 80px;
	position: relative;
	text-align: center;
	background-position: center;
	align-content: center;
	background-color: rgb(255, 255, 255, 0.4);
}

.content {
	margin: auto;
	line-height: 340%;
	font-size: 130%;
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
		    <header id="header">
      <h1><a href="UserFirstPage">Bartenders</a></h1>
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
                <li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
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
						<!-- <div class="mydiv"> -->
						<h2>修改個人資料</h2>
						<div>
							<h2>${errorMsg}</h2>
						</div>
						<form action="<c:url value="/resetInfo.do"/>" method="POST">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<!-- <table class="content"> -->
								<ul>
									<li>
										<h3>姓名:</h3>
									</li>
									<li><input type="text" name="userName" required="required" size="50"
											placeholder="請輸入您的姓名" pattern="^.{3,30}$"/><br></li>
									<li>
										<h3>帳號:</h3>
									</li>
									<li><input type="text" size="50" placeholder="${account}" disabled="disabled"/><br>
									</li>
									<li>
										<h3>手機:</h3>
									</li>
									<li><input type="tel" name="phone" autocomplete="off" size="50"
											placeholder="請填寫欲更改的手機號碼" required="required" pattern="^.{10}$"/><br>
									</li>
									<li>
										<h3>生日:</h3>
									</li>
									<li><input type="date" name="birthday" size="50" autocomplete="off"
											required="required"/><br></li>
									<li>
										<h3>電子郵件:</h3>
									</li>
									<li><input type="email" size="50" placeholder="${showEmail}"
											disabled="disabled"/><br></li>
									<li>
										<h3>聯絡地址:</h3>
									</li>
									<li><input type="text" name="address" autocomplete="off" size="50"
											placeholder="請填寫欲更改的的住址" pattern="^[0-9-\u4e00-\u9fa5].{10,}$"
											required="required"/><br></li>
								</ul>
								<!-- </table> -->
								<ul class="actions">
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
	</body>

</html>