<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>User Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">


  <!-- <style type="text/css">
@import
 url('https://fonts.googleapis.com/css?family=Encode+Sans+Condensed:400,600')
 ;

@font-face {
	font-family:TaipeiSansTCBeta;
	src: url(TaipeiSansTCBeta-Regular.ttf);
}

* {
 outline: none;
 top: 0px;
font-family:TaipeiSansTCBeta;
}

strong {
 font-weight: 600;
}

.page {
 width: 100%;
 height: 100vh;
 background: #fdfdfd;
font-family:TaipeiSansTCBeta;
 font-weight: 600;
 letter-spacing: .03em;
 color: #212121;
}

header {
 font-size: 20px;
 display: flex;
 position: fixed;
 width: 100%;
 height: 70px;
 background: #212121;
 color: #fff;
 justify-content: center;
 align-items: center;
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
 color: #CCBBFF;
 font-family:TaipeiSansTCBeta;
}

main {
 padding: 70px 20px 0;
 display: flex;
 flex-direction: column;
 height: 100%;
}

main>div {
 margin: auto;
 max-width: 600px;
}

main h2 span {
 color: #BF7497;
}

main p {
 line-height: 1.5;
 font-weight: 200;
 margin: 20px 0;
}

main small {
 font-weight: 300;
 color: #888;
}

#nav-container {
 position: fixed;
 height: 100vh;
 width: 100%;
 pointer-events: none;
}

#nav-container .bg {
 position: absolute;
 top: 70px;
 left: 0;
 width: 100%;
 height: calc(100% - 70px);
 visibility: hidden;
 opacity: 0;
 transition: .3s;
 background: #000;
}

#nav-container:focus-within .bg {
 visibility: visible;
 opacity: .6;
}

#nav-container * {
 visibility: visible;
}

.button {
 position: relative;
 display: flex;
 flex-direction: column;
 justify-content: center;
 z-index: 1;
 -webkit-appearance: none;
 border: 0;
 background: transparent;
 border-radius: 0;
 height: 70px;
 width: 30px;
 cursor: pointer;
 pointer-events: auto;
 margin-left: 25px;
 touch-action: manipulation;
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.icon-bar {
 display: block;
 width: 100%;
 height: 3px;
 background: #aaa;
 transition: .3s;
}

.icon-bar+.icon-bar {
 margin-top: 5px;
}

#nav-container:focus-within .button {
 pointer-events: none;
}

#nav-container:focus-within .icon-bar:nth-of-type(1) {
 transform: translate3d(0, 8px, 0) rotate(45deg);
}

#nav-container:focus-within .icon-bar:nth-of-type(2) {
 opacity: 0;
}

#nav-container:focus-within .icon-bar:nth-of-type(3) {
 transform: translate3d(0, -8px, 0) rotate(-45deg);
}

#nav-content {
 margin-top: 70px;
 padding: 20px;
 width: 90%;
 max-width: 300px;
 position: absolute;
 top: 0;
 left: 0;
 height: calc(100% - 70px);
 background: #ececec;
 pointer-events: auto;
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
 transform: translateX(-100%);
 transition: transform .3s;
 will-change: transform;
 contain: paint;
}

#nav-content ul {
 height: 100%;
 display: flex;
 flex-direction: column;
}

#nav-content li a {
 padding: 10px 5px;
 display: block;
 text-transform: uppercase;
 transition: color .1s;
}

#nav-content li a:hover {
 color: #BF7497;
}

#nav-content li:not (.small ) +.small {
 margin-top: auto;
}

.small {
 display: flex;
 align-self: center;
}

.small a {
 font-size: 16px;
 font-weight: 400;
 color: #888;
}

.small a+a {
 margin-left: 15px;
}

#nav-container:focus-within #nav-content {
 transform: none;
}

* {
 box-sizing: border-box;
 margin: 0;
 padding: 0;
}

html, body {
 height: 100%;
font-family:TaipeiSansTCBeta;
}

a, a:visited, a:focus, a:active, a:link {
 text-decoration: none;
 outline: 0;
}

a {
 color: currentColor;
 transition: .2s ease-in-out;
}

h1, h2, h3, h4 {
 margin: 0;
}

ul {
 padding: 0;
 list-style: none;
}

img {
 vertical-align: middle;
 height: auto;
 width: 100%;
}
</style> -->


</head>

<body class="is-preload">
  <div id="page-wrapper">
    <header id="header">
      <h1><a href="UserFirstPage">Bartenders</a></h1>
      <nav id="nav">
        <ul>
          <li class="special">
            <a href="#menu" class="menuToggle"><span>Menu</span></a>
            <div id="menu">
              <ul>
                <li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
                <li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
                <li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
                <li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
                <li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
                <li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
                <li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
                <li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
                <li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
                <li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
    </header>
    <!-- <header tabindex="0">Welcome back! Let's get legless!</header> -->
    <!-- <div id="nav-container">
      <div class="bg"></div>
      <div class="button" tabindex="0">
        <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
      </div>
      <div id="nav-content" tabindex="0">
        <ul>
          <li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
          <li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
          <li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
          <li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
          <li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
          <li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
          <li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
          <li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
          <li class="small"><a href="UserFirstPage">首頁</a><a href="javascript:signOut()">登出</a></li>
        </ul>
      </div> -->
    </div>

  </div>


  <script type="text/javascript">
    function signOut() {
      gapi.auth2.init().then(() => {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
        });
      })
      document.location.href = "http://localhost:8080/Bartenders/logout";
    }

    function onLoad() {
      gapi.load('auth2', function () {
        gapi.auth2.init();
      });
    }
  </script>

  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

  <script src="/Bartenders/assets/js/jquery.min.js"></script>
  <script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
  <script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
  <script src="/Bartenders/assets/js/browser.min.js"></script>
  <script src="/Bartenders/assets/js/breakpoints.min.js"></script>
  <script src="/Bartenders/assets/js/util.js"></script>
  <script src="/Bartenders/assets/js/main.js"></script>
</body>

</html>