<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>QRcode生成中，請勿關閉頁面</title>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:400|Raleway:300);

html {
	padding-top: 50px;
	font-family: 'Open Sans', Helvetica, arial, sans-serif;
	text-align: center;
	/* 	background-color: #eeeeee; */
}

html *, html *:before, html *:after {
	box-sizing: border-box;
	transition: 0.5s ease-in-out;
}

html i, html em, html b, html strong, html span {
	transition: none;
}

*:before, *:after {
	z-index: -1;
}

h1, h4 {
	font-family: 'Raleway', 'Open Sans', sans-serif;
	margin: 0;
	line-height: 1;
}

a {
	text-decoration: none;
	line-height: 80px;
	color: black;
}

.centerer {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
	padding: 0 1rem;
}

@media ( min-width : 600px) {
	.wrap {
		width: 100%;
		/* float: left; */
		margin: 0 auto;
	}
}

[class^="btn-"] {
	position: relative;
	display: block;
	overflow: hidden;
	width: 100%;
	height: 80px;
	max-width: 250px;
	margin: 1rem auto;
	text-transform: uppercase;
	border: 1px solid currentColor;
}

.btn-6 {
	color: #44944e;
}

.btn-6 span {
	position: absolute;
	display: block;
	width: 0;
	height: 0;
	border-radius: 50%;
	background-color: #154d1c;
	transition: width 0.4s ease-in-out, height 0.4s ease-in-out;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	z-index: -1;
}

.btn-6:hover {
	color: #c8e0cb;
}

.btn-6:hover span {
	width: 225%;
	height: 562.5px;
}

.btn-6:active {
	background-color: #23812f;
}

@-webkit-keyframes criss-cross-left { 0% {
	left: -20px;
}
50%
{
left:50%;
width:20px;
height:20px;
}
100%
{
left:50%;
width:375px;
height:375px;
}
}
@keyframes criss-cross-left { 0% {
	left: -20px;
}
50%
{
left:50%;
width:20px;
height:20px;
}
100%
{
left:50%;
width:375px;
height:375px;
}
}
@-webkit-keyframes criss-cross-right { 0% {
	right: -20px;
}
50%
{
right:50%;
width:20px;
height:20px;
}
100%
{
right:50%;
width:375px;
height:375px;
}
}
@keyframes criss-cross-right { 0% {
	right: -20px;
}
50%
{
right:50%;
width:20px;
height:20px;
}
100%
{
right:50%;
width:375px;
height:375px;
}
}
.pic {
	width: 400px;
}
div.panel{
  margin: 0px;
  padding: 5px;
  text-align: center;
  background: #e5eecc;
  border: solid 1px #c3c3c3;
}
div.panel {
  height: 120px;
  display: none;
}
</style>
</head>
<body>
	<br />
	<h3>請點擊按鈕以利生成您的QRcode票券</h3>
	<br>
	<div class="centerer">
		<form:form id="deal" action="rqQR" method="post">
			<div class="wrap">
				<!-- <a type="submit" class="btn-6">訂單結單<span></span></a> -->
				<a type="submit" href="javascript:$('#deal').submit()" class="btn-6">產生QRcode<span></span></a>
			</div>
		</form:form>
	</div>
	<br>
	<img class="pic" id="imgpic" src="<c:url value="${qrUrl}"></c:url>" style="width:250px; background-color: #EEF7FB; border-radius:3px;" />
<%-- 	<div class="panel">
		<img class="pic" src="<c:url value="${qrUrl}"></c:url>" />
	</div>  --%>
	<br>
	<a href="<c:url value="/userOrder.controller"/>">返回訂單頁面 </a>
</body>
<script>
function codeBorder() {
	if (document.getElementById("imgpic").src != "http://localhost:8080/Bartenders/finishPay")
	{
		document.getElementById("imgpic").style.padding = "10px";
	}
}
window.onload = codeBorder;
/* console.log(document.getElementById("imgpic").src); */
</script>
<script>
	$(".btn-6").click(function() {
		$(".panel").slideToggle("slow");
	});
</script>
<script>
		$(function() {
			$('.btn-6').on(
					'mouseenter',
					function(e) {
						var parentOffset = $(this).offset(), relX = e.pageX
								- parentOffset.left, relY = e.pageY
								- parentOffset.top;
						$(this).find('span').css({
							top : relY,
							left : relX
						})
					}).on(
					'mouseout',
					function(e) {
						var parentOffset = $(this).offset(), relX = e.pageX
								- parentOffset.left, relY = e.pageY
								- parentOffset.top;
						$(this).find('span').css({
							top : relY,
							left : relX
						})
					});
			$('[href=#]').click(function(){
				/* return false  */
			});
		});
	</script>
</html>