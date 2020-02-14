<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/dashboardView.css">
<title>DashBoard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
</head>

<body>
	<div class="allwrapper0">
				<div class="box0">
					<div class="flos1">
						<a class="f1" href="/Bartenders/TicketProduct.Add">
					 		<div class="btn btn-one">
								<input class="bT" type="submit" value="新增票券+">
							</div>
						</a>
					</div>
					<div class="flos2">
						<a class="f1" href="/Bartenders/Dashboard.Products">
					 			<div class="btn btn-one">
								<input class="bT" type="button" value="商品管理"/>
							</div>
						</a>
					</div>
				</div>

		<div class="allwrapper">
			<Table class="outwrapper blurred-box1">
				<tr>
					<td>
						<div class="box0">
							<div class="flos1">
								<label>上架中票券</label>
								<div class="inwrapper blurred-box0">
									<table class="pd0">${Launched}</table>
								</div>
							</div>
							<div class="flos2">
								<label>下架中票券</label>
								<div class="inwrapper blurred-box2">
									<table class="pd0">${Pulled}</table>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="menu.jsp"%>
	
		<script>
			$('.pdidckPP').hide();
			$('.pdidckLL').hide();
		</script>
</body>
</html>