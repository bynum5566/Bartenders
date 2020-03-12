<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>物流登入</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />	<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>

	<style type="text/css">
		a {
			color: #E8CCFF;
		}

		a:hover {
			color: #9F88FF;
		}

/* 		.mydiv { */
/* 			min-width: auto; */
/* 			top: 80px; */
/* 			position: sticky; */
/* 			text-align: center; */
/* 			border-radius: 5px; */
/* 			background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%); */
/* 			background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%); */
/* 			background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%); */
/* 			background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%); */
/* 			box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
/* 			-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
/* 			-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
/* 			color: #E8CCFF; */
/* 		} */


		body {
/* 			margin: 0; */
/* 			padding: 0; */
			background-image: url("/Bartenders/images/BarImgOrderUser.png");
			background-position: top;
			background-attachment: fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
			background-repeat: no-repeat;
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
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
						<div class="row">
							<div class="col-8 col-12-medium">
								<h2>物流登入</h2>
								<div>
									<form action="<c:url value="/logistic/LogisticLogin.do" />" method="post" >
										<ul class="alt">
												<li>
													<h3>帳號:</h3>
													<input id="userN" type="text" name="username">
													<h3>${errors.account}</h3>
												</li>
												<li>
													<h3>密碼:</h3>
													<input id="userP" type="password" name="userpwd">
													<h3>${errors.password}</h3>
													<input type="hidden" name="orderID" value="${orderID}">
												</li>
												<!-- 
												<td><input type="hidden" name="orderStatus" value="${orderStatus}"></td>
												 -->
												<li>
													<input type="submit">
													<button id="demo1" >配送員01</button>
													<button id="demo2" >配送員02</button>
													<h3>${errors.msg}</h3>
													<h3>${msg}</h3>
												</li>
										</ul>
									</form>
								</div>
							</div>
						</div>
				</div>
			</section>
		</article>
	</div>
	<script>
		$('#demo1').on('click',function(){
			console.log('click demo1')
			$('#userN').val('Alex7311');
			$('#userP').val('2Xlialri');
		})
		
		$('#demo2').on('click',function(){
			console.log('click demo2')
			$('#userN').val('Jone0001');
			$('#userP').val('2Xbralbr');
		})
	</script>
	
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