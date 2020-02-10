<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>物流登入</h3>
<form action="<c:url value="/logistic/LogisticLogin.do" />" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td><input type="text" name="username"></td>
			<td>${errors.account}</td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="userpwd"></td>
			<td>${errors.password}</td>
		</tr>
		<tr>
			<td><input type="hidden" name="orderID" value="${orderID}"></td>
			<td><input type="hidden" name="orderStatus" value="${orderStatus}"></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
			<td>${errors.msg}</td>
		</tr>
		<tr>
			<td>${msg}</td>
		</tr>
		<tr>
			<td>orderID:${orderID}</td>
		</tr>
		<tr>
			<td>orderStatus:${orderStatus}</td>
		</tr>
	</table>
</form>
