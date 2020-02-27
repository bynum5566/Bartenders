<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>營業額圓餅圖 / Bartenders</title>
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>

<style type="text/css">
.wrapper {
	padding: 3em 0 1em 0;
}

body {
	margin: 0;
	padding: 0;
	/* 		background-image: url(/Bartenders/images/bg12.jpg); */
	/* 		background-repeat: no-repeat; */
	/* 		background-attachment: fixed; */
	/* 		background-size: cover; */
	/* 		background-position: top; */
	/* overflow-y: hidden;
	overflow-y: hidden;*/
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

.title {
	font-size: 30px;
	margin: 0 0 0 0;
}

.outwrap {
	min-width: auto;
	text-align: center;
	margin: auto;
}

.myChart {
	width: 600px;
}

.row {
	margin-left: 20%;
}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="WelcomeCompany">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href="/Bartenders/My.Bar">我的酒吧</a></li>
								<li><a href="/Bartenders/Bar.edit">編輯酒吧</a></li>
								<li><a href="/Bartenders/Product.Add">新增商品+</a></li>
								<li><a href="/Bartenders/TicketProduct.Add">新增票券+</a></li>
								<li><a href="/Bartenders/NewsAndEvents.Add">新增最新消息+</a></li>
								<li><a href="/Bartenders/Dashboard.Products">商品管理</a></li>
								<li><a href="/Bartenders/Dashboard.TkProducts">票券管理</a></li>
								<li><a href="/Bartenders/NewsAndEvents.All">最新消息管理</a></li>
								<li><a href="/Bartenders/companyOrder.controller">訂單管理</a></li>
								<li><a href="/Bartenders/salesReport.controller">銷售量長條圖</a></li>
								<li><a href="/Bartenders/salesReportByPie.controller">營業額圓餅圖</a></li>
								<li><a href="/Bartenders/Croom.chat">聊天室</a></li>
								<li><a href="/Bartenders/logistic/LogisticGate">物流</a></li>
								<li><a href="/Bartenders/ManageBar">管理活動</a></li>
								<li class="small"><a href="WelcomeCompany">首頁</a><a
									href="javascript:signOut()">登出</a></li>
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
							<div class="col-6 col-12-medium">
								<div class="outwrap" align="center" style="width: 500px;">
									<h1 class="title">營業額圓餅圖</h1>
									<br>
									<canvas align="center" id="myChart"></canvas>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<div class="row">
							<div class="col-6 col-12-medium">
								<div class="outwrap">
									<h3>
										<a style="text-decoration: none;" class="button"
											href="<c:url value="SaleReportByExcel.controller"/>">匯出Excel</a>
									</h3>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script>
	var ctx = document.getElementById("myChart");
	  var myChart = new Chart(ctx, {
	    type: 'pie',
	    data: {
	      labels:${productNamesForPie},
	      fontColor: ["white"],
	      datasets: [{
	        label: '產品銷售數量',
	        data:${productsPrice},
	        backgroundColor: [
	        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
	        ],
	        borderColor: [
	        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
	        ],
	        borderWidth: 1
	      }]
	    },
	    options: {
	    	legend: {
	    		position: 'top',
	    		labels: {
	    		boxWidth: 20,// 修改寬度
	    		fontSize: 20,
	    		fontColor: 'white'
	    		}
	    		},
	        scales: {
	      	  scaleFontColor: "white",
	      	  
	          yAxes: [{
	            ticks: {
	              beginAtZero:true,
	              color: 'rgba(0, 0, 0, 0)',
	              fontSize: 18, 
	              
	            }
	          }]
	        }
	      }
	  });
	</script>
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
</body>


</html>
