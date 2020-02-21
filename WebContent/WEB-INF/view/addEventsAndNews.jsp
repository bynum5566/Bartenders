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
		<button style="width:40px; height:40px; background-color: transparent; border-color: transparent; border: none; background-image: url(/Bartenders/images/contract.png);" align="right" id="Input"></button>
		<div class="inwrap">
			<h3>新增最新消息</h3>
			<form action="<c:url value="/addNew.EN"></c:url>" method="POST">
				<table>
					<tr>
						<td><label>標題</label></td>
						<td><input id="newsTitle" type="text" name="neTitle" required="required"></td>
					</tr>
					<tr>
						<td><label>詳細</label></td>
						<td><textarea id="newsDetail" name="neText" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<a href="/Bartenders/NewsAndEvents.All">
								<div class="bT">取消</div>
							</a>
							<input class="bT" type="submit" value="發表">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<%@ include file="menu.jsp"%>

	<script type="text/javascript">
		$('#Input').click(function(){
			$('#newsTitle').val('新分店台北信義店新開幕!');
			$('#newsDetail').val('慶祝信義分店新開幕，<br>即日起全店品項5折優惠!<br>活動期限至2020/3/30止。<br>(本活動僅限信義分店有效，其他分店無此優惠。)');
		})
	
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