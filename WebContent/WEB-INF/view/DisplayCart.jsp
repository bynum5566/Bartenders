<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車</title>
</head>
<body>
	<!-- 顯示剛才加入的訂單 -->
		<form>
		<table>
			<thead>
				<tr align="center">
					<td>產品名稱</td>
					<td>購買數量</td>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${ProductName}</td>
					<td>${PdStock}</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>