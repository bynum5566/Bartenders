<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="/Bartenders/CSS/add_editView.css">
<title>討論列表</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>


</head>

<body>
<h1>&nbsp;</h1>
<h1>&nbsp;</h1>
		<div >
			<div style="color: WhiteSmoke;">
				[<a href=<c:url value="/messageBoardShowList.controller"/>>主題列表</a>]
			</div>
		</div>

		<div id="contents" style="color: WhiteSmoke; margin: 20px;">
			<h3 align="center">列表模式</h3>
			<form action="xxx" method="post">
				<table width="1000" height="80" >
					<tbody>
						<tr style="align: center;">
							<td>&nbsp;<b>帳號</b>&nbsp;
							</td>
							<td>&nbsp;<b>標題</b>&nbsp;
							</td>
							<td>&nbsp;<b>發文者</b>&nbsp;
							</td>
							<td>&nbsp;<b>回應數</b>&nbsp;
							</td>
							<td>&nbsp;<b>日期</b>&nbsp;
							</td>
						</tr>
						<c:forEach var="messageBoard" items="${newest}">
							<tr style="align: center;">
								<td>&nbsp;${messageBoard.account}&nbsp;</td>
								<td style="color: bisque; "><a
									href="<c:url value="/submessageBoardShow.controller"/>?resId=${messageBoard.id}&resAccount=${messageBoard.account}">&nbsp;${messageBoard.title}&nbsp;</a></td>
								<td>&nbsp;${messageBoard.userName}&nbsp;</td>
								<td>&nbsp;${messageBoard.subMessageAmount}&nbsp;</td>
								<td>&nbsp;${messageBoard.time}&nbsp;</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>



			</form>


		</div>









	<%--左側工具列，開始 --%>
	<%@include file="UserMenu.jsp"%>
	<%--左側工具列，結束--%>
</body>
</html>