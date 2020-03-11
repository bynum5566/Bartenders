<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>銷售量直條圖 / Bartenders</title>
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>

<!-- 小鈴鐺 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<style type="text/css">
body {
/* 	margin: 0; */
/* 	padding: 0; */
	/* 		background-image: url(/Bartenders/images/bg12.jpg); */
	/* 		background-repeat: no-repeat; */
	/* 		background-attachment: fixed; */
	/* 		background-size: cover; */
	/* 		background-position: top; */
	/*overflow-y: hidden;
	overflow-y: hidden;*/
}

.outwrap {
	min-width: auto;
	/* 		top: 90px; */
	/* 		position: sticky; */
	text-align: center;
	margin: auto;
	width: 800px;
	/* 		border-radius: 5px; */
	/* 		background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */
	/* 			rgba(163, 163, 163, 0.3) 99%); */
	/* 		background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */
	/* 			rgba(163, 163, 163, 0.3) 99%); */
	/* 		background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */
	/* 			rgba(163, 163, 163, 0.3) 99%); */
	/* 		background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%, */
	/* 			rgba(163, 163, 163, 0.3) 99%); */
	/* 		box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
	/* 		-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
	/* 		-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6); */
	/* 		color:#FFFFFF; */
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
.wrapper {
    padding: 3em 0 1em 0;
}

	.row {
		margin-left: 9%;
	}
	
	
.noticeBox {
	position: fixed;
	top: 60px;
	right: 20px;
	align: right;
}

.bell .bellImg {
	height: 70px;
	width: 70px;
	float: right;
}

.notice {
	background-color: rgb(255, 255, 255, 0.4);
	width: 110%;
	height: auto;
	float: right;
	display: none;
}

.B1 {
	display: flex;
	align-items: center;
	justify-content: right;
}
	
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header" class="alt_ver">
			<h1><a href="/Bartenders/Welcome.Company">Bartenders</a></h1>
			
		<!-- 小鈴鐺 -->
			<div class="noticeBox">
				<div class="bell">
					<img class="bellImg" src="/Bartenders/images/bell.png">
				</div>
				<div class="notice">
					<ul id="notice"></ul>
				</div>
			</div>	
			
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
								<li class="small"><a href="/Bartenders/Welcome.Company">首頁</a><a
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
								<div class="outwrap">
									<h1 class="title">銷售量直條圖</h1>
									<br>
									<form action="/Bartenders/salesReportSelectTime.controller">
									<ul class="actions">
									<li class="B1">
									起訖時間:</li>
									<li class="B1" nowrap="nowrap">
									<input type="date" name="startTime" size="30"
											autocomplete="off" required="required"/>
									</li>
									<li class="B1">
									～</li>
									<li class="B1" nowrap="nowrap">
									<input type="date" name="endTime" size="30"
											autocomplete="off" required="required"/>
									</li>
									<li class="B1">
									<input type="submit" value="搜尋" />
									</li>
									</ul>
									</form>
									<canvas id="myChart"></canvas>
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
	    type: 'bar',
	    data: {
	      labels:${productNames},
	      datasets: [{
	        label: '產品銷售數量',
	        data:${productsSoldQuantity},
	        backgroundColor: [
	        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
	        ],
	        borderColor: [
	        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
	        ],
	        borderWidth: 2
	        
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
	            fontColor: "white",
	            fontSize: 18, 
	            
	          }
	        }],
	        xAxes: [{
	            ticks: {
	              beginAtZero:true,
	              fontSize: 18, 
	              fontColor: "white",
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

	<!-- 小鈴鐺 -->
	<script type="text/javascript">
		$(".bell").click(function() {
			$(".notice").slideToggle("slow");
		})
	</script>
	<script src="/Bartenders/JS/OpenWebsocket.js"></script>
</body>

</html>