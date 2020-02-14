<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>Edit News and Events</title>
</head>
<body>
	<div class="outwrap">
		<h3>編輯最新消息與活動</h3>
		<form action="/Bartenders/EN.edit" method="POST">
			<div>
				<label>標題</label>
				<input type="text" name="neTitle" value="<c:out value="${neTitle}"></c:out>" required="required"/>
			</div>

			<div>
				<label>內容</label>
				<textarea name="neText" required="required">${neText}</textarea>
			</div>
			
			<div id="neId">
				<input name="neId" type="text" value="<c:out value="${neId}"/>" readonly="readonly">
			</div>
			
			<div>
				<a href="/Bartenders/NewsAndEvents.All"><div class="bT">取消</div></a>
				<input class="bT" type="submit" value="更新">
			</div>
		</form>
	</div>
	
	<%@ include file="menu.jsp"%>
	
	<script>
	$('#neId').hide();
	</script>
</body>
</html>