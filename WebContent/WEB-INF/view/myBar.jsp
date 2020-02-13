<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>My Bar</title>

<style type="text/css">
body {
	background-image: url(/Bartenders/images/bg4.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-position: top;
}

.bt00 {
	color: white;
	font-size: 12px;
	background-color: transparent;
	border: none;
	border-color: transparent;
}

#outwrap {
	text-align: center;
	margin: auto;
}

#cover {
	width: 800px;
}
</style>

</head>
<body>
	<div id="outwrap">
		<div id="barName">
			<h1>${barName}</h1>
		</div>

		<div id="coverImg">
			<img id="cover" src="<c:out value="${barImgUrl}"/>">
		</div>

		<div id="about">
			<div>
				<div>
					<div id="about">${aboutBar}</div>
					<div id="myMenu">${myMenu}</div>
				</div>
				
				<div id="event">${myEvent}</div>
			</div>
		</div>

		<div id="contact">
			<ul>
				<li>${barAdd}</li>
				<li>${barPhone}</li>
			</ul>
			<div>
				<img><a>${barFb}</a>
			</div>
			<div>
				<img>
				<p>${barLine}</p>
			</div>
			<div>
				<img><a>${barIg}</a>
			</div>
		</div>

		<div id="pdroducts">
			<table>
				<tr>${pDs}</tr>
			</table>
			<form action="/Bartenders/Product.All" method="get">
				<div id="hdId">
					<input class="bt0" name="barName" type="text"
						value="<c:out value="${barId}"/>" readonly="readonly">
				</div>
				<input type="submit" class="bt00" value="more...">
				<%-- 			<a href="/bartenders/Product.All?<c:out value="${barId}"/>">more...</a> --%>
			</form>
		</div>
	</div>
	<script>
		$('#hdId').hide();
	</script>

	<%@ include file="menu.jsp"%>
</body>
</html>