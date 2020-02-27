<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
    <title>驗證成功</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
    <noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
    <style>
        body {
            bgc: #33A6B8;
        }

        img {
            width: 150px;
            display: block;
            margin: auto;
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
			<h1>Bartenders</h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
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
                        <img src="img/Logo_purchase.png">
                        <h3 style="text-align: center;">票券驗證成功，感謝您的使用與蒞臨！</h3>
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