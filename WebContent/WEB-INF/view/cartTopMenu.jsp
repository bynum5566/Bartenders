<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type= "text/css">
.mydiv {
 width: 100%;
 margin: 0 auto;
 top: 80px;
 position: sticky;
 text-align: center;    
 }
</style>

</head>
<body>
	<main>
	<!-- 
	<nav class = mydiv>
	 -->
		<ul class="mydiv">
		 
			<li><a href="<c:url value="/DisplayBarList.controller"/>">商城</a></li>
			<li><a href="<c:url value="/DisplayCartList.controller"/>">回到購物車</a>
			</li>
		 
			<!--  <li><a href="<c:url value="/userOrder.controller"/>">查看訂單</a></li> -->
			<%--
			<c:choose>
				<c:when test="${LoginStatus=='true'}">
				<!--	<li><a href="/Bartenders/logout">登出</a></li> -->
					<li><a href="${pageContext.request.contextPath}/logout">登出</a></li>
				</c:when>
				<c:otherwise>
				<!-- <li><a href="http://localhost:8080/Bartenders/login">登入</a></li> -->
					<li><a href="http://localhost:8080${pageContext.request.contextPath}/login">登入</a></li>
				</c:otherwise>
			</c:choose>
			  --%>
		</ul>
	<!--  
	</nav>
	 -->
	</main>

</body>
</html>