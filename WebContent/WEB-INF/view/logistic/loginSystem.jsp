<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物流登入</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
<style type="text/css">
a{
color: #E8CCFF;

}
a:hover {
color: 	#9F88FF;
}
.mydiv {
	min-width: auto;
	top: 80px;
	position: sticky;
	text-align: center;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5)34%, rgba(163, 163, 163, 0.5)99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	color: #E8CCFF;
}


body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

label{
color:blue;
}

</style>

</head>
<body>
<h1 style="color:white;font-size:48px" align="center">物流登入</h1>
<div align="center">
<form action="<c:url value="/logistic/LogisticLogin.do" />" method="post" >
	<table>
		<tr>
			<td style="color:white;font-size:24px">物流帳號:</td>
			<td><input type="text" name="username"></td>
			<td>${errors.account}</td>
		</tr>
		<tr>
			<td style="color:white;font-size:24px">帳號密碼:</td>
			<td><input type="password" name="userpwd"></td>
			<td>${errors.password}</td>
		</tr>
		<tr>
			<td><input type="hidden" name="orderID" value="${orderID}"></td>
			<td><input type="hidden" name="orderStatus" value="${orderStatus}"></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
			<td>${errors.msg}</td>
		</tr>
		<tr>
			<td>${msg}</td>
		</tr>
		<tr style="display:none">
			<td>orderID:${orderID}</td>
		</tr>
		<tr style="display:none">
			<td>orderStatus:${orderStatus}</td>
		</tr>
	</table>
</form>
</div>

<div class="box">
	<br>
	<br>
	<div class="outer">
		
		<div class="ground">
			<p class="limitP" class="num"><img src="images/arrowLimit.png"></p>
			<div class="targetD">
				<p class="targetP" class="num"><img src="images/arrowTarget.png"></p>
			</div>
			<div class="currentD">
				<img class="currentP" src="images/arrowCurrent.png">
			</div>
			
		</div>
	</div>
	<br>
	<br>
		<label>輸入上限<input id="limitNum" type="text" name="limit"></label><br>
		<label>輸入目標<input id="targetNum" type="text" name="target"></label><br>
		<input type="submit" onclick="reSet()" value="設定"><br>
	<button id="per">增加1份</button>
	<button id="plus">增加10</button>
	<button id="reduce">減少10</button>
</div>
<script>
	var fix = $('#ground').width()-20;
	console.log('fix width: ',fix);
	var per;
	var limitNum = document.getElementById('limitNum');
	var targetNum = document.getElementById('targetNum');
	var currentNum = 0;
	var total = document.getElementById('currentD');
	var current;
	var reach;
	var target;
	function reSet(){
		console.log(' limit is: ',limitNum.value,' target is: ',targetNum.value);
		per = fix/limitNum.value;
		reach = per*targetNum.value;
		currentNum = 0;
		console.log('per is:',per);
		console.log('reach is:',reach);
		$('#targetD').width(reach);
		$('#currentD').width(0);
		$('#currentD').css('background-color','pink');
	}
	
	
	
	$('#per').on('click',function(){
		currentNum++;
		console.log('number is: ',currentNum,'/',targetNum.value)
		current = $('#currentD').width();
		console.log('jquery current is: ',current);
		$('#currentD').width(current+per);
		console.log('jquery after is: ',$('#total').width());
		if(currentNum==targetNum.value){
			console.log('target reached')
			$('#currentD').css('background-color','lightgreen');
			$('#targetP').css("display","none");
		}
		
	})
	
	$('#plus').on('click',function(){
		console.log('+10');
		current = $('#currentD').width();
		console.log('jquery current is: ',current);
		$('#currentD').width(current+10);
		console.log('jquery after is: ',$('#currentD').width());
	})
</script>
<script>
	
</script>
</body>
</html>