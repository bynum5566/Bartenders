<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/Bartenders/images/dashboardView.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>Event and News</title>
</head>
<body>
	<div class="allwrapper0">
		<div>
			<a href="/Bartenders/NewsAndEvents.Add"><div class="bT">新增+</div></a>
		</div>
	</div>
	<div class="allwrapper">
		<Table class="outwrapper">
			<tr>
				<td class="box0">
					<label>最新消息與活動</label>
					<div class="inwrapper">
						<table class="pd0">${NewsEvents}</table>
					</div>
				</td>
			</tr>
		</table>
	</div>

<%@ include file="menu.jsp"%>

	<script>
		$('.pdidckLL').hide();
	</script>
</body>
</html>