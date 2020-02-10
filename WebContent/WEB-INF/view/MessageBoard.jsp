<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言板</title>
</head>
<body>

	<div align="center">
		<h1>留言版</h1>
		<a href="/Bartenders/WelcomeUser">返回大廳</a>
		<form action='messageBoard.controller' method='post'>
			<table border='1' class='center'>
				<tr>
					<td class="Form_bg"><b>主 題</b></td>
					<td><input class="hide" type="text" name="title">
					<td>${errors.title}</td>
				</tr>

				<tr>
					<td class="Form_bg" width='80'>內文:</td>
					<td width='580'><textarea rows='10' cols='70' name='blabla'></textarea></td>
					<td>${errors.blabla}</td>
				</tr>

				<tr>
					<td class="Form_bg"><b>投稿鍵</b></td>
					<td><input type="password" name="deletePassword" size="8"
						maxlength="8" value=""><small>(留言刪除用，英文數字最多8個)</small></td>
					<td>${errors.deletePassword}</td>
				</tr>
				<tr>
					<td class="Form_bg"><b>照片上傳</b></td>
					<td><input type="file" name="picture">
					<input class="hide" type="checkbox" name="reply" value="yes"> [<label
						for="noimg">無相片</label>]
				<tr>
					<td colspan='2'><input type='submit' value='提交'></td>
				</tr>
			</table>
		</form>
	</div>
	<hr>

	<div>
		<c:forEach var="messageBoard" items="${newest}">
			<div>
				<tr>
					<td>${messageBoard.picture}</td>
					<td style='vertical-align: top bottom:;'>帳號:${messageBoard.account}
						&nbsp &nbsp ID:${messageBoard.id} &nbsp &nbsp
						<a href="<c:url value="/submessageBoardShow.controller"/>?resId=${messageBoard.id}&resAccount=${messageBoard.account}">回覆</a><br>
						主題:${messageBoard.title}<br> ${messageBoard.blabla}<br>
						${messageBoard.time}<br>

						<hr>
					</td>
				</tr>

			</div>
		</c:forEach>
	</div>


	<form action='messageBoardDelete.controller' method='post'>

		<div id="del">
			<table style="float: right;">
				<tbody>
					<tr>
						<td align="center" style="white-space: nowrap;"> 
							刪除留言: <input type="text" name="id" placeholder="留言ID" value="留言ID"><input
							type="password" name="deletePassword" size="8"  maxlength="8" placeholder="投稿鍵" value="投稿鍵">
							<input type="submit" value=" 實行 "></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

</body>
</html>