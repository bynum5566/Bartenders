<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>DashBoard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/user_dashboardView.css">
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
</head>

<body>
	<div class="allwrapper">
		<div id="tabs">
			<ul class="fav">
				<li><a class="tabA" href="#tabs-1">Bar</a></li>
				<li><a class="tabA" href="#tabs-2">Alcohol</a></li>
			</ul>

		<div id="content">
				<div id="tabs-1" class="outwrapper">
<!-- 					<tr> -->
						<div id="" class="box0">
							<label>我的最愛清單──酒吧</label>
							<div class="inwrapper">
								<table class="pd0">${MyfavB}
<!-- 									<tr class="pdRow"> -->
<!-- 										<td class="MidS1"> -->
<%-- 											<form action="/Bartenders/Product.show" method="GET"> --%>
<!-- 												<input type="text" name="pdidck" class="pdidckLL" -->
<!-- 													value="prod.getPdId()" readonly="readonly"> -->
<!-- 												<div> -->
<!-- 													<input type="submit" value="prod.getPdId()" /> -->
<!-- 												</div> -->
<%-- 											</form> --%>
<!-- 											<div>prod.getProductName()</div> -->
<!-- 										</td> -->
<!-- 										<td class="RSide"> -->
<%-- 											<form action="/Bartenders/pdDisLike" method="POST"> --%>
<!-- 												<input type="text" name="pdidck" class="pdidckLL" value="prod.getPdId()" readonly="readonly"> -->
<!-- 												<input type="submit" value="刪除"> -->
<%-- 											</form> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
								</table>
							</div>
						</div>
<!-- 					</tr> -->
				</div>

				<div id="tabs-2" class="outwrapper">
<!-- 					<tr> -->
						<div id="" class="box0">
							<label>我的最愛清單──酒</label>
							<div class="inwrapper">
								<table class="pd0">
									${Myfav}
<!-- 									<tr class="pdRow"> -->
<!-- 										<td class="MidS1"> -->
<%-- 											<form action="/Bartenders/Product.show" method="GET"> --%>
<!-- 												<input type="text" name="pdidck" class="pdidckLL" value="prod.getPdId()" readonly="readonly"> -->
<!-- 												<div> -->
<!-- 													<input type="submit" value="prod.getPdId()" /> -->
<!-- 												</div> -->
<%-- 											</form> --%>
<!-- 											<div>prod.getProductName()</div> -->
<!-- 										</td> -->
<!-- 										<td class="RSide"> -->
<%-- 											<form action="/Bartenders/pdDisLike" method="POST"> --%>
<!-- 												<input type="text" name="pdidck" class="pdidckLL" value="prod.getPdId()" readonly="readonly"> -->
<!-- 												<input type="submit" value="刪除"> -->
<%-- 											</form> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
								</table>
							</div>
						</div>
<!-- 					</tr> -->
				</div>
			</div>
		</div>

	</div>
	<script>
		$('.pdidckLL').hide();
	</script>
	<script type="text/javascript" src="/Bartenders/JS/forTabs.js"></script>
	<%@include file="UserMenu.jsp"%>
</body>
</html>