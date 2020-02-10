<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">

<title>Welcome</title>
</head>
<body>
	<h1>
		<button onclick="signOut();">Sign out</button>
		
	</h1>

	<h1>
		<a href="<c:url value="/DisplayProductList.controller"/>">商城</a>
	</h1>
	
	 <h1>
  <a href="<c:url value="/userOrder.controller"/>">UserOrder</a>
 </h1>

<h1><a href="<c:url value="/messageBoardShow.controller"/>">留言板</a></h1>



	<script type="text/javascript">
	  function signOut() {
			gapi.auth2.init().then( () => {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		   		});
			})
			document.location.href="http://localhost:8080/Bartenders/logout";
		  }
		  
		  function onLoad() {
		      gapi.load('auth2', function() {
		        gapi.auth2.init();
		      });
		    }
	</script>

	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>
</html>