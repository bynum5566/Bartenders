<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>My bar</title>

<style type="text/css">
a.bT:link, a.bT:hover, a.bT:visited {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="outwrap">
		<div class="inwrap">
			<h2>編輯Bar</h2>
			<form action="/Bartenders/editBar" method="post"
				enctype="multipart/form-data">
				<table>
					<tr id="hdId">
						<td colspan="2"><input class="bt0" name="pdId" type="text"
							value="<c:out value="${barId}"/>" readonly="readonly"></td>
					</tr>

					<tr>
						<td><label>Bar名稱</label></td>
						<td><input type="text" name="barName" required="required"
							value="<c:out value="${barName}"/>"></td>
					</tr>

					<tr>
						<td><label>Bar Logo</label></td>
						<td>
							<div class="dropzone">
								<div class="info"></div>
							</div>
							<div id="imgPlace1">
								<img id="oriImg" src="<c:out value="${pdpicUrl}"/>" />
							</div>
							<input id="imgPlace2" type="text" name="pdImg" class="image-url"
							value="<c:out value="${barLogoUrl}"/>" readonly="readonly" />
							<script type="text/javascript" src="/Bartenders/JS/imgur.js"></script>
							<script type="text/javascript" src="/Bartenders/JS/upload.js"></script>
						</td>
					</tr>

					<tr>
						<td><label>封面圖片</label></td>
						<td>
							<div id="imgs">
								<div id="img1">
									<div class="dropzone1">
										<div class="info1"></div>
									</div>
									<div id="imgPlace01">
										<img id="oriImg" src="<c:out value="${barImgUrl1}"/>" />
									</div>
									<input id="imgPlace02" type="text" name="cover1" class="image-url"
									value="<c:out value="${barImgUrl1}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur1.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload1.js"></script>
								</div>

								<div id="img2">
									<div class="dropzone2">
										<div class="info2"></div>
									</div>
									<div id="imgPlace03">
										<img id="oriImg" src="<c:out value="${barImgUrl2}"/>" />
									</div>
									<input id="imgPlace04" type="text" name="cover2" class="image-url"
									value="<c:out value="${barImgUrl2}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload2.js"></script>
								</div>

								<div id="img3">
									<div class="dropzone3">
										<div class="info3"></div>
									</div>
									<div id="imgPlace05">
										<img id="oriImg" src="<c:out value="${barImgUrl3}"/>" />
									</div>
									<input id="imgPlace06" type="text" name="cover3" class="image-url"
									value="<c:out value="${barImgUrl3}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload3.js"></script>
								</div>

								<div id="img4">
									<div class="dropzone4">
										<div class="info4"></div>
									</div>
									<div id="imgPlace07">
										<img id="oriImg" src="<c:out value="${barImgUrl4}"/>" />
									</div>
									<input id="imgPlace08" type="text" name="cover4" class="image-url"
									value="<c:out value="${barImgUrl4}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur4.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload4.js"></script>
								</div>
								<div id="img5">
									<div class="dropzone5">
										<div class="info5"></div>
									</div>
									<div id="imgPlace09">
										<img id="oriImg" src="<c:out value="${barImgUrl5}"/>" />
									</div>
									<input id="imgPlace10" type="text" name="cover5" class="image-url"
									value="<c:out value="${barImgUrl5}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur5.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload5.js"></script>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td><label>關於</label></td>
						<td><textarea name="aboutBar">${aboutBar}</textarea></td>
					</tr>

					<tr>
						<td><label>Menu</label></td>
						<td><textarea name="barMenu">${barMenu}</textarea></td>
					</tr>

					<tr>
						<td><label>地址</label></td>
						<td><input type="text" name="barAddress" required="required"
							value="<c:out value="${barAdd}"/>"></td>
					</tr>

					<tr>
						<td><label>電話</label></td>
						<td><input type="tel" name="barPhone" required="required"
							value="<c:out value="${barPhone}"/>"></td>
					</tr>

					<tr>
						<td><label>Facebook連結</label></td>
						<td><input type="url" name="barFb"
							value="<c:out value="${barFb}"/>"></td>
					</tr>

					<tr>
						<td><label>Line帳號</label></td>
						<td><input type="text" name="barLine"
							value="<c:out value="${barLine}"/>"></td>
					</tr>

					<tr>
						<td><label>Instgram連結</label></td>
						<td><input type="url" name="barIG"
							value="<c:out value="${barIg}"/>"></td>
					</tr>

					<tr>
						<td id="bT" colspan="2">
							<a href="/Bartenders/My.Bar">
								<div class="bT">回上頁</div>
							</a>
							<input class="bT" type="submit" value="確認修改" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>

	<script>
		$("#hdId").hide();
	</script>

	<%@ include file="menu.jsp"%>

</body>
</html>