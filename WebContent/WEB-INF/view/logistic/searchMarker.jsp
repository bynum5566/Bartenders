<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateActivity</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>


.container {
	margin: auto;
	border:2px black solid;
	width:800px;
	height: 800px;
	
}
.mapDiv {
	height: 600px;
	width: 600px;
	display: inline-block;
}
.chooseType{
	border:2px black solid;
	width:100px;
	height: 200px;
	display: inline-block;
	vertical-align:top;
}

label{
	display: inline-block;
	vertical-align:top;
}

input{
	display: inline-block;
	vertical-align:top;
}

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
	<h1 align=center>地圖搜尋</h1>
	<div align=center>
		<button id="shop" class="search">查詢洋酒專賣</button>
		<button id="bar" class="search">查詢酒吧</button>
		<button id="show" class="search">查詢酒展</button>
		<button id="party" class="search">查詢派對</button>
		<button class="return">回上一頁</button>
	</div>
	<div class="container" align=center>
		<div id="map" class="mapDiv"></div>
		<div id="choose" class="chooseType" >
			<form action="searchMarker.do" method="post">
				<label>搜尋類型:</label>
				<label><input type="checkbox" name="type" value="bar">酒吧</label>
				<label><input type="checkbox" name="type" value="shop">專賣店</label>
				<label><input type="checkbox" name="type" value="show">酒展</label>
				<label><input type="checkbox" name="type" value="party">派對</label>
				
				<hr>
				<label><input type="submit"  value="查詢"></label>
			</form>
		</div>
		
	</div>
	

	<script>
	$('.search').on('click', function(){
		var type = this.id;
		var prefix = 'ActivityType';
		reloadMarkers(prefix,type);
		getMarkers(prefix,type);
	})
	
	$(".return").on("click", function() {
			window.location.href = '<c:url value="/ManageActivity"/>';
		})
	
	</script>
	<script src="scripts/MapStyle.js"></script>
	<script src="scripts/mapForSingleMapWithMarker.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	
</body>
</html>