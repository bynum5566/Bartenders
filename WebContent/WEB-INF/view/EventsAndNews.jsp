<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/dashboardView.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>Event and News</title>
<style>
@font-face {
	font-family: Taipei;
	src: url(/Bartenders/CSS/TaipeiSansTCBeta-Regular.ttf);
}
.allwrapper0{
margin: auto;
}
allwrapper0 tr, allwrapper0 td{
text-align: center !important;
margin: auto;
}
.outwrapper{
margin-top: 30px;
}
.MidS1 input[type=submit] {
background-color: transparent;
border-color: transparent;
border: none;
font-size:20px;
line-height:22px;
color: #08fdd1;
font-family: Taipei;
}
.RSide input[type=submit] {
color: #FFFF78	 !important;
text-transform: uppercase;
background: transparent;
padding: 10px;
border: 4px solid #FFFF78 !important;
border-radius: 6px;
display: inline-block;
transition: all 0.3s ease 0s;
font-family: Taipei;
}
.RSide input[type=submit]:hover {
	color: #FFFFE8 !important;
    border-radius: 50px;
    border-color: 	ghostwhite !important;
    transition: all 0.3s ease 0s;
} 
</style>
</head>
<body>
	<table class="allwrapper0">
		<tr class="box0">
			<td class="flos1">
				<a href="/Bartenders/NewsAndEvents.Add">
					<div  class="btn btn-one">
						<input class="bT" type="button" value="新增+"/>
					</div>
				</a>
			</td>
		</tr>
	<tr class="allwrapper">
		<td>
			<table class="outwrapper">
				<tr>
					<td class="box0">
						<label>最新消息與活動</label>
						<div class="inwrapper">
							<table class="pd0">${NewsEvents}</table>
						</div>
					</td>
				</tr>
			</table>
		<td>
	</tr>
</table>

<%@ include file="menu.jsp"%>

	<script>
		$('.pdidckLL').hide();
	</script>
</body>
</html>