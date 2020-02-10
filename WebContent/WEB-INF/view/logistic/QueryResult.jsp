<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QueryResult</title>
<style>
table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}
</style>
</head>
<body>

test:${result}<br>

	<form>
		<fieldset>
			<legend>查詢結果</legend>
			<table align=center>
				<thead>
					<tr>
						<td>序號</td>
						<td>訂單號碼</td>
						<td>送貨類型</td>
						<td>送貨地址</td>
						<td>取件人姓名</td>
						<td>取件人手機</td>
						<td>訂單金額</td>
						<td>狀態</td>
						<td>送達時間</td>
						<td>取貨時間</td>
						<td>完成</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Logistic" items="${result}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${Logistic.oID}</td>
						<td>${Logistic.oType}</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
						</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</form>
</body>
</html>