<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<title>Add News and Event</title>
</head>
<body>
	<div class="outwrap">
		<div class="inwrap">
			<h3>新增最新消息與活動</h3>
			<form action="<c:url value="/addNew.EN"></c:url>" method="POST">
				<table>
					<tr>
						<td><label>標題</label></td>
						<td><input type="text" name="neTitle" required="required"></td>
					</tr>
					<tr>
						<td><label>詳細</label></td>
						<td><textarea name="neText" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<a href="/Bartenders/NewsAndEvents.All">
								<div class="bT">取消</div>
							</a>
							<input class="bT" type="submit" value="發佈">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<%@ include file="menu.jsp"%>

	<script type="text/javascript">
		$(function() {
			if (window.history && window.history.pushState) {
				$(window).on('popstate', function() {
					window.history.pushState('forward', null, '#');
					window.history.forward(1);
				});
			}
			window.history.pushState('forward', null, '#');
			window.history.forward(1);
		})
	</script>
</body>
</html>