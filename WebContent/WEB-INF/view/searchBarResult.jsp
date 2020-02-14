<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${barName}</title>

<style type="text/css">
body{
  color:white;
  background-image:  url(/Bartenders/images/bg14.png);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  background-position: top;
}
.pdImg{
	min-width:180px;
	max-width:200px;
	height: 200px;
}
.inwrap1{
  top:80px;
  position:relative;
  padding-top:10px;
  text-align: center;
  margin: auto;
}
.inwrap1 tr, .inwrap1 td{
padding:10px;
font-size: 18px;
font-weight: 600;
color: ghostwhite;
}

#outwrap{
  text-align: center;
  margin: auto;
}
</style>

</head>
<body>
<div id="outwrap">
	
	<div class="inwrap1">
<!-- 		<h3 class="inwrap1">Looking for drinks?</h3> -->
		<div class="inwrap1"><table class="inwrap1">${barRes}</table></div>
	</div>
	
</div>

<%@ include file="UserMenu.jsp"%>
</body>
</html>