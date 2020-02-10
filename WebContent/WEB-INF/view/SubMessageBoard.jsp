<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主題留言板</title>

<style type="text/css">
.allwrapper0 {
	text-align: center;
	margin: auto;
}
</style>
</head>
<body>
	<h1>
		<a href="<c:url value="/messageBoardShow.controller"/>">返回留言板</a>
	</h1>
	<div align="center">
		<h1>主題留言板</h1>

		<form action='subMessageBoard.controller' method='post'>
			<table border='1' class='center'>

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
					<td><input type="file" name="picture"><input
						class="hide" type="checkbox" name="reply" value="yes"> [<label
						for="noimg">無相片</label>]
				<tr>
					<td colspan='2'><input type='submit' value='提交'></td>
				</tr>
			</table>
		</form>
	</div>
	<hr>

	<div
		style="padding: 10px; margin: auto; width: 550px; border-radius: 3px;">
		<c:forEach var="MessageBoard" items="${newest}">
			<div>
				<tr>
					<td>${MessageBoard.picture}</td>
					<td style='vertical-align: top bottom:;'>帳號:${MessageBoard.account}
						&nbsp &nbsp ID:${MessageBoard.id}<br> ${MessageBoard.blabla}<br>
						${MessageBoard.time}<br>

						<hr>
					</td>
				</tr>


			</div>
		</c:forEach>


		<div>
			<c:forEach var="subMessageBoard" items="${subnewest}">
				<tr>
					<td>${subMessageBoard.picture}</td>
					<td style='vertical-align: top bottom:;'>帳號:${subMessageBoard.account}
						&nbsp &nbsp SubID:${subMessageBoard.subId}<br>
						${subMessageBoard.blabla}<br> ${subMessageBoard.time}<br>

						<hr>
					</td>
				</tr>

			</c:forEach>
		</div>



	</div>


	<form action='subMessageBoardDelete.controller' method='post'>

		<div id="del">
			<table style="float: right;">
				<tbody>
					<tr>
						<td align="center" style="white-space: nowrap;">刪除留言: <input
							type="text" name="subId" placeholder="留言SubID" value="留言SubID"><input
							type="password" name="deletePassword" size="8" maxlength="8"
							placeholder="投稿鍵" value="投稿鍵"> <input type="submit"
							value=" 實行 "></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

</body>
</html>