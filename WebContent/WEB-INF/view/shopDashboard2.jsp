<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
	<meta http-equiv="Expires" CONTENT="0">
	<meta http-equiv="Cache-Control" CONTENT="no-cache">
	<meta http-equiv="Pragma" CONTENT="no-cache">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>票券管理 / Bartenders</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/forTabs.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
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
		
		.wrapper.style5 h4.bT3 {
			cursor: pointer;
			color: #A5DEE4;
			text-shadow: 1px 2px 0px #0F2540;
		}
		
		.wrapper.style5 h4.bT3:hover {
			color: #DAC9A6;
			text-shadow: 1px 2px 0px #8E354A;
		}
		
		.Tl {
			text-align: left;
/* 			padding-left: 2px; */
		}
		
		.B1 {
			display: flex;
			align-items: center;
			justify-content: right;
		}
		
		button.confirm, button.cancel {
		    border: 0;
		    border-radius: 3px;
		    -webkit-box-shadow: none;
		    box-shadow: none;
		    color: #fff;
		    cursor: pointer;
		    font-size: 17px;
		    font-weight: 500;
		    margin: 15px 5px 0;
		    padding: 0 40px;
		}
		
		button.confirm {
			background-color: #ed4933 !important;
		}
		
		button.confirm:hover {
			background-color: #ef5e4a !important;
		}
		
		#tabs a.bT4 {
            float: none;
            position: inherit;
            padding: inherit;
            height: auto;
            line-height: inherit;
            text-transform: none;
            text-decoration: none;
            color: transparent;
            border-right: none;
            border-bottom: none;
            border-bottom-color: transparent;
            opacity: 1;
            filter: none;
        }

        #tabs a.bT4:hover,
        #tabs a.bT4:focus {
            border-bottom-color: transparent;
            opacity: 1;
            filter: none;
        }

        #tabs a.tab:focus {
            outline: none;
        }

        #tabs a.bT4 {
            height: auto;
            line-height: inherit;
            border-right: none;
            border-bottom: none;
            border: none;
        }
        
        td.MidS1{
        	width: 310px;
        	overflow: hidden;
        }
        
        div.pdId p, div.pdNm h4{
        	overflow:hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
        }
        
        p{
        	margin: 0px 0px;
        }
        
        #content {
		    margin-top: 0;
		}
		
		.wrapper {
		    padding: 2em 0 4em 0;
		}
	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header" class="alt_ver">
			<h1>
				<a href="WelcomeCompany">Bartenders</a>
			</h1>
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
								<li class="small"><a href="WelcomeCompany">首頁</a><a href="javascript:signOut()">登出</a></li>
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
							<div class="col-10 col-12-medium">
								<ul class="actions B1">
									<li class="flos1">
										<a class="f1" href="/Bartenders/TicketProduct.Add">
											<div class="btn btn-one">
												<input class="button" type="button" value="新增票券+">
											</div>
										</a>
									</li>
									<li class="flos2">
										<a class="f1" href="/Bartenders/Dashboard.Products">
											<div class="btn btn-one">
												<input class="button" type="button" value="商品管理" />
											</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col-10 col-12-medium">
								<div id="tabs">
									<ul class="fav">
										<li><a class="tab" href="#tab1" name="#tab1">上架中</a></li>
										<li><a class="tab" href="#tab2" name="#tab2">下架中</a></li>
									</ul>
								</div>
								<div id="content">
									<div id="tab1" class="outwrapper">
										<ul class="alt">
											<li>
												<div class="Tl">
													<h2>上架中票券</h2>
													<div>
														&nbsp;&nbsp;&ensp;&emsp;&emsp;<input type="checkbox" id="CheckAllL" align="left"><label for="CheckAllL" align="left">全選</label>
													</div>
												</div>
												<div style="height: 600px;overflow: auto;">
													<table class="pd0">${Launched}</table>
												</div>
												<ul class="actions B1">
													<li style="border-color: transparent;">
														<form action="/Bartenders/delMultiLTkPD" method="post" id="lMultiDel">
															<input type="text" id="list1" name="listForTkDelete1">
															<input type="submit" value="批量刪除">
														</form>
													</li>
													<li style="border-color: transparent;">&emsp;</li>
													<li style="border-color: transparent;">
														<form action="/Bartenders/pulMultiTkPD" method="post">
															<input type="text" id="list2" name="listForTkPull">
															<input type="submit" value="批量下架">
														</form>
													</li>
												</ul>
											</li>
										</ul>
									</div>
									<div id="tab2" class="outwrapper">
										<ul class="alt">
											<li>
												<div class="Tl">
													<h2>下架中票券</h2>
													<div>
														&nbsp;&nbsp;&ensp;&emsp;&emsp;<input type="checkbox" id="CheckAllP" align="left"><label for="CheckAllP" align="left">全選</label>
													</div>
												</div>
												<div style="height: 600px;overflow: auto;">
													<table class="pd0">${Pulled}</table>
												</div>
												<ul class="actions B1">
													<li style="border-color: transparent;">
														<form action="/Bartenders/delMultiPTkPD" method="post" id="pMultiDel">
															<input type="text" id="list3" name="listForTkDelete2">
															<input type="submit" value="批量刪除">
														</form>
													</li>
													<li style="border-color: transparent;">&emsp;</li>
													<li style="border-color: transparent;">
														<form action="/Bartenders/lauMultiTkPD" method="post">
															<input type="text" id="list4" name="listForTkLaunch">
															<input type="submit" value="批量上架">
														</form>
													</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>

	<script>
		$('.pdidckPP').hide();
		$('.pdidckLL').hide();
		$('#list1').hide();
		$('#list2').hide();
		$('#list3').hide();
		$('#list4').hide();
		$.noConflict();

		$(document).ready(function() {
			$("#CheckAllL").click(function() {
				if($("#CheckAllL").prop("checked")) {
					var ListL = [];
					$("input[name='pdCheckL']").each(function() {
						$(this).prop("checked", true);
						ListL.push($(this).val());
					})
					$('#list1').val(ListL);
					$('#list2').val(ListL);
				}else {
					$("input[name='pdCheckL']").each(function() {
						$(this).prop("checked", false);
					})
					$('#list1').val('');
					$('#list2').val('');
				}
			});

			$("#CheckAllP").click(function() {
				if ($("#CheckAllP").prop("checked")) {
					var ListP = [];
					$("input[name='pdCheckP']").each(function() {
						$(this).prop("checked", true);
						ListP.push($(this).val());
					})
					$('#list3').val(ListP);
					$('#list4').val(ListP);
				} else {
					$("input[name='pdCheckP']").each(function() {
						$(this).prop("checked", false);
					})
					$('#list3').val('');
					$('#list4').val('');
				}
			});
		})

		$(function() {
			$("input:checkbox[name='pdCheckL']").click(function() {
				listL = $("input:checkbox[name='pdCheckL']:checked").map(function(index, elem) {
					return $(elem).val();
				}).get().join(',');
				$('#list1').val(listL);
				$('#list2').val(listL);
			});
		});

		$(function() {
			$("input:checkbox[name='pdCheckP']").click(function() {
				listP = $("input:checkbox[name='pdCheckP']:checked").map(function(index, elem) {
					return $(elem).val();
				}).get().join(',');
				$('#list3').val(listP);
				$('#list4').val(listP);
			});
		});
		
		$("#lMultiDel").submit(function(e) {
			e.preventDefault();
			var form = this;
			
			swal({
				title: "刪除",
				text: "確定要刪除選擇的項目嗎?",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "確定",
				cancelButtonText: "取消",
				closeOnConfirm: true
			},function(isConfirm) {
				if (isConfirm) {
					form.submit();
				}
			});
		});
		
		$("#pMultiDel").submit(function(e) {
			e.preventDefault();
			var form = this;
			
			swal({
				title: "刪除",
				text: "確定要刪除選擇的項目嗎?",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "確定",
				cancelButtonText: "取消",
				closeOnConfirm: true
			},function(isConfirm) {
				if (isConfirm) {
					form.submit();
				}
			});
		});
		
		$('a.bT4').click(function(e){
            e.preventDefault();
            var link = $(this).attr('href');

            swal({
                title: "刪除",
                text: "確定要刪除選擇的項目嗎?",
                type: "warning",
                confirmButtonText: "確定",
				cancelButtonText: "取消",
                showCancelButton: true
            },
            function(isConfirm) {
				if (isConfirm) {
                	window.location.href = link;
				}
            });
        });

		$(function() {
			if (window.history && window.history.pushState) {
				$(window).on('popstate', function() {
					window.history.pushState('forward', null, '#');
					window.history.forward(1);
				});
			}
			window.history.pushState('forward', null, '#');
			window.history.forward(1);
		})
		</script>
	<script src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/Bartenders/JS/forTabs.js"></script>
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