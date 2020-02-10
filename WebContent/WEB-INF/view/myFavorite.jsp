<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<style type="text/css">
.allwrapper0 {
	text-align: center;
	margin: auto;
}

.allwrapper {
	width: 1410px;
	margin: 35px auto;
}

.outwrapper {
	margin: auto;
	text-align: center;
	width: 650px;
	border: 1px solid black;
}

.bt {
	margin: 30px auto;
	border: none;
	text-align: right;
	margin-left: 530px;
}

.lb {
	margin: 30px 250px;
}

.inwrapper {
	margin: 20px;
	width: 600px;
	height: 350px;
	overflow: auto;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.pd0 {
	padding: 10px;
	margin: auto;
	width: 550px;
	border-radius: 3px;
}

.pd0.td {
	border-top: 1px solid gray;
}

.pd00 {
	padding: 10px;
	margin: auto;
	width: 550px;
}

.pd01 {
	padding: 10px;
	margin: auto;
	width: 545px;
}

.pd01:hover {
	box-shadow: 0px 0px 5px blue;
}

.pd00.tr {
	width: 410px;
	text-align: left;
}

.pdidckP,pdidckL {
	width: 10px;
	text-align: left;
}

.pdRow {
	margin: 5px;
	line-height: 45px;
	border-radius: 3px;
}

.pdRow1 {
	line-height: 30px;
}

.LSide {
	padding: 10px;
	width: 20px;
	text-align: left;
}

.MidS1 {
	width: 320px;
	text-align: left;
}

.pdId, .pdNm {
	text-align: left;
}

.MidS2, .MidS3 {
	text-align: center;
	width: 75px;
}

.RSide {
	width: 20px;
}

#addBt {
	margin-top: 50px;
	margin-right: 1100px;
}

</style>

</head>
<body>
	<div class="allwrapper0">
<!-- 		<div id="addBt"> -->
<%-- 			<form action="/Bartenders/Product.Add" method="get"> --%>
<!-- 				<input type="submit" value="新增商品+"> -->
<!-- 				<a href="/Bartenders/Dashboard.TkProducts"> -->
<!-- 				<input class="bt01 bt0" type="button" value="票券商品管理"/></a> -->
<%-- 			</form> --%>
<!-- 		</div> -->
		<div class="allwrapper">
			<Table class="outwrapper">
				<tr>
						<td>
							<div class="lb">我的最愛列表</div>
							<div class="inwrapper">
								<table class="pd0">${Myfav}</table>
							</div>
						</td>
				</tr>
			</table>
		</div>

		<script>
// 		$('.pdidckPP').hide();
		$('.pdidckLL').hide();
		</script>
</body>
</html>