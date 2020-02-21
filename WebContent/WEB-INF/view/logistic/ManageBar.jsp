<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateMarker</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
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


body {
	margin: 0px auto;
}

table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

div {
	margin: 0px auto;
}

fieldset {
	text-align: center;
	width: 1200px;
}

#map {
	height: 600px;
	width: 600px;
}

button{
font-size:20px;
}

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body align=center>
	<h1 style="color:white;font-size:36px">管理酒吧</h1>

	<div align=center>
		<table>
			<tr>
				<td>
					<button id="Marker" class="setting">設定酒吧地點</button>
					<button id="Show" class="setting">舉辦活動</button>
					<button id="Search" class="setting">活動頁面</button>
					<button class="return">回上一頁</button>
				</td>
			</tr>
		</table>
	</div>
	

	<script>
	//撈取登入者身分
	console.log('preUrl=','${preUrl}');
	var user = '${getUser.userId}';
	console.log('userId is: ','${getUser.userId}');
	var company = '${getCompany.companyId}';
	console.log('companyId is: ','${getCompany.companyId}');
	
	var sendText;
	<c:if test='${empty getUser.userId}'>
		sendText = 'c${getCompany.companyId}';
		<c:set var="finalText" scope="page" value='c${getCompany.companyId}'/>
	</c:if>
	<c:if test='${empty getCompany.companyId}'>
		sendText = 'u${getUser.userId}';
		<c:set var="finalText" scope="page" value='u${getUser.userId}'/>
	</c:if>
	console.log('searching userId: ','${finalText}')
	
		$(".search").on("click", function() {
			var type = this.id;
			if(type=='bar'||type=='shop'){
				var prefix = 'Bar';
			}else if(type=='show'||type=='party'){
				var prefix = 'ActivityType';
			}
			
			reloadMarkers(prefix,type);
		})

		$(".setting").on("click", function() {
			var type = this.id;
			
			if(type=='Search'){
				window.location.href = '<c:url value="/queryAllActive.do"/>';
			}else{
				window.location.href = '<c:url value="/create'+type+'"/>';
			}
			
		})
		
		//回上頁
		$(".return").on("click", function() {
			window.location.href = '<c:url value="/WelcomeCompany"/>';
		})

	</script>
	</body>
</html>