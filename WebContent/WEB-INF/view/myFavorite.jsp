<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/user_dashboardView.css">
<title>DashBoard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
</head>

<body>
	<div class="allwrapper">
		<Table class="outwrapper">
			<tr>
				<td class="box0">
					<label>我的最愛列表</label>
					<div class="inwrapper">
						<table class="pd0">${Myfav}
							<tr class="pdRow">
								<td class="MidS1">
								<!-- <td> -->
									<form action="/Bartenders/Product.show" method="GET">
										<input type="text" name="pdidck" class="pdidckLL" value="prod.getPdId()" readonly="readonly"> 
										<!-- <div class="pdId" name="pdId1">編號:</div> -->
										<div>
											<input type="submit" value="prod.getPdId()"/>
										</div>
									</form>
								<!-- </td> -->
									<!-- <div class="pdNm" name="pdNm1">名稱:<div/> -->
									<div>prod.getProductName()</div>
								</td>
								<td class="RSide">
									<form action="/Bartenders/pdDisLike" method="POST">
										<input type="text" name="pdidck" class="pdidckLL" value="prod.getPdId()" readonly="readonly">
										<input type="submit" value="刪除">
									</form>
								</td>
							</tr>
							
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<script>
		$('.pdidckLL').hide();
	</script>
	<%@include file="UserMenu.jsp"%>
</body>
</html>