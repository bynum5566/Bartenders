<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${barName}</title>

<style type="text/css">
body {
	background-image: url(/Bartenders/images/bg15.png);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-position: top;
}

.pdImg {
	min-width: 180px;
	max-width: 200px;
	height: 200px;
}

div.inwrap1 {
	width: 700px;
	margin: auto;
}

table.inwrap1 {
	color: ghostwhite;
	text-align: center;
	margin: auto;
	width: 700px;
}

.inwrap1 tr, .inwrap1 td {
	padding: 10px;
	font-size: 18px;
	font-weight: 600;
	color: ghostwhite;
}

#outwrap {
	text-align: center;
	margin: auto;
	width: 750px;
 	top: 80px;
	position: relative;
	padding-top: 10px;
}
</style>

</head>
<body>

		<div id="outwrap">

			<div class="inwrap1">
				<div class="inwrap1">
					<table class="inwrap1">
						<tr>
							<td>${kWord}的相關搜尋結果:</td>
						</tr>
						${barRes}
					</table>
				</div>
			</div>

		</div>

	<%@ include file="UserMenu.jsp"%>
</body>
</html>