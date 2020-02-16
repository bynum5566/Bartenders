<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">

<head>

<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>Bartenders' place</title>

    <link rel="shortcut icon" href="#" />


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">

<!-- ----------------------------------------------↓網頁title icon複製這句link -->
    <link rel="icon" href="img/smallLogo.ico" type="image/x-icon" / >
<!-- ----------------------------------------------↑網頁title icon複製這句link -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.3/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>

    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-interval="false">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="logo col-12 vh-100">



<!-- Modal -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered " role="document">
    <div class="modal-content bg_w">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">準備到酒吧狂歡了嗎?</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <nav>
          <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link text-dark active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">一般會員</a>
            <a class="nav-item nav-link text-dark" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">酒吧專區</a>
          </div>
        </nav>

        <div class="tab-content" id="nav-tabContent">
          <div class="p-2"></div>
        <!-- ----------------------------------------------一般會員 -->
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">        
            <form action="<c:url value="/UcheckLogin.controller" />" method="post">
            <div class="form-group row">
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">帳號</label>
              <div class="col-10 input_bgg">
                <input type="id" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入帳號" name="userAccount">
              </div>
            </div>
            <div class="form-group row">
              
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">密碼</label>
              <div class="col-10">
                <input type="password" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入密碼" name="userPwd">
              </div>
            </div>
         
                 <div class="col-12 p-0 ">
                 <div class="row">
  <div class="col-sm-7 dis480">
  <!--     <button class="text-center loginBtn loginBtn--facebook">
        Facebook
      </button> -->
      <div class="g-signin2" data-onsuccess="onSignIn">
      <!-- class="text-center loginBtn loginBtn--google" -->
        Google
      </div>
      <br>
      <!-- <a href="/Bartenders/CLogin" style="padding: 10px" class="login text-center loginBtn" >
        酒吧用戶
      </a> -->
      <br>
      <a href="/Bartenders/ResetPassword" style="padding: 10px; color:#343a40;" class="login text-center loginBtn" >
        忘記密碼
      </a>
  </div>
                  <div class="col-sm-5 text-right">       
                <button type="button" class=" btn btn-light" data-dismiss="modal">取消</button>
                <button value="submit" class="btn btn-dark ">送出</button>
                  </div>
                 </div>
                 <div class="display480">
  <!--                 <div class="col-12  p-0">
                    <button class="text-center col-12 loginBtn loginBtn--facebook">
                      Facebook
                    </button></div> -->
                    <!-- <div class="col-12  p-0"><button onclick="location.href='/Bartenders/CLogin'" class="login text-center loginBtn" >
               酒吧用戶
              </button></div> -->

                  <div class="col-12  p-0 mt-1" > <div class="g-signin2" class="text-center col-12 loginBtn loginBtn--google" data-onsuccess="onSignIn">
                    Google &nbsp;
                  </div></div>
                  <div class="col-12 p-0 mt-1">
                    <button onclick="location.href='/Bartenders/ResetPassword'" class="login text-center loginBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                        忘記密碼
                    </button></div>
              </div>
                 </div>
            
            </form> 
            
            <div class="p-2"></div>
            <div class="modal-footer">
              <a href="/Bartenders/Register">還沒有帳號? 點我申請</a>
            </div>
          </div>
        <!-- ----------------------------------------------酒吧專區 -->
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <form action="<c:url value="/CcheckLogin.controller" />" method="post">
            <div class="form-group row">
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">帳號</label>
              <div class="col-10 input_bgg">
                <input type="id" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入帳號" name="companyAccount">
              </div>
            </div>
            <div class="form-group row">
              
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">密碼</label>
              <div class="col-10">
                <input type="password" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入密碼" name="companyPwd">
              </div>
            </div>
         
          
                 <div class="col-12 p-0 ">
                 <div class="row">
  <div class="col-sm-7 dis480">
  <!--     <button class="text-center loginBtn loginBtn--facebook">
        Facebook
      </button> -->
      <div class="g-signin2" data-onsuccess="onSignIn">
      <!-- class="text-center loginBtn loginBtn--google" -->
        Google
      </div>
      <br>
      <!-- <a href="/Bartenders/CLogin" style="padding: 10px" class="login text-center loginBtn" >
        酒吧用戶
      </a> -->
      <br>
      <a href="/Bartenders/ResetCompanyPassword" style="padding: 10px; color:#343a40;" class="login text-center loginBtn" >
        忘記密碼
      </a>
  </div>
                  <div class="col-sm-5 text-right">       
                <button type="button" class=" btn btn-light" data-dismiss="modal">取消</button>
                <button value="submit" class="btn btn-dark ">送出</button>
                  </div>
                 </div>
                 <div class="display480">
  <!--                 <div class="col-12  p-0">
                    <button class="text-center col-12 loginBtn loginBtn--facebook">
                      Facebook
                    </button></div> -->
                    <!-- <div class="col-12  p-0"><button onclick="location.href='/Bartenders/CLogin'" class="login text-center loginBtn" >
               酒吧用戶
              </button></div> -->

                  <div class="col-12  p-0 mt-1" > <div class="g-signin2" class="text-center col-12 loginBtn loginBtn--google" data-onsuccess="onSignIn">
                    Google &nbsp;
                  </div></div>
                  <div class="col-12  p-0 mt-1">
                    <button onclick="location.href='/Bartenders/ResetCompanyPassword'" class="login text-center loginBtn" data-toggle="modal" data-target="#exampleModalCenter1">忘記密碼
                    </button></div>
              </div>
                 </div>
                 
           </form>
            
            <div class="p-2"></div>
            <div class="modal-footer">
              <a href="/Bartenders/CRegister">還沒有帳號? 點我申請</a>
            </div>
          </div>
        
        </div>

                
                
      </div>

    </div>
  </div>
</div>

                <div class="vh-100 w-100" id="scene">
                    <div data-depth="0.2" >
                      <img src="img/bg1-1.png" alt="" >
                   </div>
                    <div class="layer" data-depth="0.05">
                      <img class="bottom0" src="img/bg1-2.png" alt="">
                    </div>
                    <div data-depth="0.3">
                      <img src="img/bg1-3.png" alt="">
                    </div>
                    <div data-depth="0.6">
                      <img src="img/bg1-4.png" alt="">
                    </div>
                    <div class="layer" data-depth="0.1"> 
                      <img class="top1" src="img/Home_Logo.png" alt="">
                    </div class="layer">

                  </div>
            </div>
            <div class="bg1 w-100">
            </div>
            <div class="bg1_right">
              <h2>想找酒友?</h2>
              <h2>想找酒吧?</h2>
            </div>
            <div class="carousel-caption d-none d-md-block">
              <div class="loginbox">
                <button class="login" data-toggle="modal" data-target="#exampleModalCenter1">會員登入</button>
                <p style="color:red;">
                ${errors.account}
			        	${errors.password}
                ${msg}
              </p>
                <p><a href="/Bartenders/Register">還沒有帳號?</a></p>
              </div>
              <h5>準備啟程</h5>
              <p>抓穩了，準備好啜飲每一口的驚喜</p>
            </div>
          </div>


          <div class="carousel-item">
            <div class="logo">
              <div id="scene2">
                  <div data-depth="0.2">
                    <img src="img/bg2-1.png" alt="">
                 </div>
                  <div class="layer" data-depth="0.05">
                    <img class="bottom0" src="img/bg2-2.png" alt="">
                  </div>
                  <div data-depth="0.3">
                    <img src="img/bg1-3.png" alt="">
                  </div>
                  <div data-depth="0.6">
                    <img src="img/bg1-4.png" alt="">
                  </div>

                </div>
          </div>
          <div class="bg2 w-100">
          </div>
          <div class="carousel-caption d-none d-md-block">
            <div class="loginbox2">
              <a href="/Bartenders/messageBoardShow.controller"><button class="login" data-toggle="modal" data-target="#exampleModalCenter1">討論區</button></a>
              <p>
            </div>
            <h5>前進討論天地!!</h5>
            <p>無論您是職業調酒師或業餘玩家，都歡迎暢所欲言、分享心得</p>
          </div>
          
          </div>
          <div class="carousel-item">
            <div class="logo">
              <div id="scene3">
                  
                  <div data-depth="0.6">
                    <img src="img/bg1-4.png" alt="">
                  </div>
                  <div data-depth="0.4">
                    <img src="img/bg3-3.png" alt="">
                  </div>
                  <div class="layer" data-depth="0.2">
                    <img class="bottom0 left0" src="img/bg3-2.png" alt="">
                 </div>
                  <div class="layer" data-depth="0.05">
                    <img class="bottom0" src="img/bg3-1.png" alt="">
                  </div>
                 

                </div>
          </div>
            <div class="bg3 w-100">
            </div>
            <div class="carousel-caption d-none d-md-block">
              <div class="loginbox2">
               <a href="/Bartenders/room.chat"><button class="login" data-toggle="modal" data-target="#exampleModalCenter1">即時聊天</button></a>
          
                <p>
              </div>
              <h5>好久沒敘舊了</h5>
              <p>有沒有未讀訊息？快來看看朋友們又發了什麼給你～</p>
            </div>
          </div>
          <div class="carousel-item">
            <div class="logo">
              
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered " role="document">
    <div class="modal-content bg_w">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">準備到酒吧狂歡了嗎?</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <nav>
          <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link text-dark active" id="nav-home-tab" data-toggle="tab" href="#nav-home2" role="tab" aria-controls="nav-home" aria-selected="true">一般會員</a>
            <a class="nav-item nav-link text-dark" id="nav-profile-tab" data-toggle="tab" href="#nav-profile2" role="tab" aria-controls="nav-profile" aria-selected="false">酒吧專區</a>
          </div>
        </nav>

        <div class="tab-content" id="nav-tabContent">
          <div class="p-2"></div>
        <!-- ----------------------------------------------一般會員 -->
          <div class="tab-pane fade show active" id="nav-home2" role="tabpanel" aria-labelledby="nav-home-tab">        
            <form action="<c:url value="/UcheckLogin.controller" />" method="post">
            <div class="form-group row">
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">帳號</label>
              <div class="col-10 input_bgg">
                <input type="id" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入帳號" name="userAccount">
              </div>
            </div>
            <div class="form-group row">
              
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">密碼</label>
              <div class="col-10">
                <input type="password" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入密碼" name="userPwd">
              </div>
            </div>
         
                 <div class="col-12 p-0 ">
                 <div class="row">
  <div class="col-sm-7 dis480">
  <!--     <button class="text-center loginBtn loginBtn--facebook">
        Facebook
      </button> -->
      <div class="g-signin2" data-onsuccess="onSignIn">
      <!-- class="text-center loginBtn loginBtn--google" -->
        Google
      </div>
      <br>
      <!-- <a href="/Bartenders/CLogin" style="padding: 10px" class="login text-center loginBtn" >
        酒吧用戶
      </a> -->
      <br>
      <a href="/Bartenders/ResetPassword" style="padding: 10px; color:#343a40;" class="login text-center loginBtn" >
        忘記密碼
      </a>
  </div>
                  <div class="col-sm-5 text-right">       
                <button type="button" class=" btn btn-light" data-dismiss="modal">取消</button>
                <button value="submit" class="btn btn-dark ">送出</button>
                  </div>
                 </div>
                 <div class="display480">
  <!--                 <div class="col-12  p-0">
                    <button class="text-center col-12 loginBtn loginBtn--facebook">
                      Facebook
                    </button></div> -->
                    <!-- <div class="col-12  p-0"><button onclick="location.href='/Bartenders/CLogin'" class="login text-center loginBtn" >
               酒吧用戶
              </button></div> -->

                  <div class="col-12  p-0 mt-1" > <div class="g-signin2" class="text-center col-12 loginBtn loginBtn--google" data-onsuccess="onSignIn">
                    Google &nbsp;
                  </div></div>
                  <div class="col-12 p-0 mt-1">
                    <button onclick="location.href='/Bartenders/ResetPassword'" class="login text-center loginBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                        忘記密碼
                    </button></div>
              </div>
                 </div>
            </form>
            <div class="p-2"></div>
            <div class="modal-footer">
              <a href="/Bartenders/Register">還沒有帳號? 點我申請</a>
            </div>
          </div>
        <!-- ----------------------------------------------酒吧專區 -->
          <div class="tab-pane fade" id="nav-profile2" role="tabpanel" aria-labelledby="nav-profile-tab">
            <form action="<c:url value="/CcheckLogin.controller" />" method="post">
            <div class="form-group row">
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">帳號</label>
              <div class="col-10 input_bgg">
                <input type="id" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入帳號" name="companyAccount">
              </div>
            </div>
            <div class="form-group row">
              
              <label for="inputPassword" class="col-2 col-form-label text-center color_b px-0">密碼</label>
              <div class="col-10">
                <input type="password" class="form-control-plaintext input_bg" id="inputPassword" placeholder="請輸入密碼" name="companyPwd">
              </div>
            </div>
          
                 <div class="col-12 p-0 ">
                 <div class="row">
  <div class="col-sm-7 dis480">
  <!--     <button class="text-center loginBtn loginBtn--facebook">
        Facebook
      </button> -->
      <div class="g-signin2" data-onsuccess="onSignIn">
      <!-- class="text-center loginBtn loginBtn--google" -->
        Google
      </div>
      <br>
      <!-- <a href="/Bartenders/CLogin" style="padding: 10px" class="login text-center loginBtn" >
        酒吧用戶
      </a> -->
      <br>
      <a href="/Bartenders/ResetCompanyPassword" style="padding: 10px; color:#343a40;" class="login text-center loginBtn" >
        忘記密碼
      </a>
  </div>
                  <div class="col-sm-5 text-right">       
                <button type="button" class=" btn btn-light" data-dismiss="modal">取消</button>
                <button value="submit" class="btn btn-dark ">送出</button>
                  </div>
                 </div>
                 <div class="display480">
  <!--                 <div class="col-12  p-0">
                    <button class="text-center col-12 loginBtn loginBtn--facebook">
                      Facebook
                    </button></div> -->
                    <!-- <div class="col-12  p-0"><button onclick="location.href='/Bartenders/CLogin'" class="login text-center loginBtn" >
               酒吧用戶
              </button></div> -->

                  <div class="col-12  p-0 mt-1" > <div class="g-signin2" class="text-center col-12 loginBtn loginBtn--google" data-onsuccess="onSignIn">
                    Google &nbsp;
                  </div></div>
                  <div class="col-12  p-0 mt-1">
                    <button onclick="location.href='/Bartenders/ResetPassword'" class="login text-center loginBtn" data-toggle="modal" data-target="#exampleModalCenter1">忘記密碼
                    </button></div>
              </div>
                 </div>
            </form>
            <div class="p-2"></div>
            <div class="modal-footer">
              <a href="/Bartenders/CRegister">還沒有帳號? 點我申請</a>
            </div>
          </div>
        
        </div>

                
                
      </div>
    </div>
  </div>
</div>
                <div id="scene4">
                    <div data-depth="0.2">
                      <img src="img/bg1-1.png" alt="">
                   </div>
                    <div class="layer" data-depth="0.05">
                      <img class="bottom0" src="img/bg1-2.png" alt="">
                    </div>
                    <div data-depth="0.3">
                      <img src="img/bg1-3.png" alt="">
                    </div>
                    <div data-depth="0.6">
                      <img src="img/bg1-4.png" alt="">
                    </div>
                    <div class="layer" data-depth="0.1"> 
                      <img class="top1" src="img/Home_Logo.png" alt="">
                    </div>

                  </div>
            </div>
            <div class="bg1 w-100">
            </div>
            <div class="bg1_right">
              <h2>想找酒友?</h2>
              <h2>想找酒吧?</h2>
            </div>
            <div class="carousel-caption d-none d-md-block">
              <div class="loginbox">
                <button class="login" data-toggle="modal" data-target="#exampleModalCenter">會員登入</button>
                <p><a href="/Bartenders/Register">還沒有帳號?</a></p>
              </div>
              <h5>準備啟程</h5>
              <p>抓穩了，準備好啜飲每一口的驚喜</p>
            </div>
          </div>
          <div class="carousel-item">
            <div class="logo">
              <div id="scene6">
                
                  
                  <div data-depth="0.3">
                    <img src="img/bg1-3.png" alt="">
                  </div>
                  <div data-depth="0.6">
                    <img src="img/bg1-4.png" alt="">
                  </div>
                  <div class="layer" data-depth="0.05">
                    <img class="bottom0" src="img/bg5-1.png" alt="">
                  </div>

                </div>
          </div>
          <div class="bg5 w-100">
          </div>
          <div class="carousel-caption d-none d-md-block">
            <div class="loginbox2">
              <a href="/Bartenders/XXX"><button class="login" data-toggle="modal" data-target="#exampleModalCenter1">地圖搜尋</button></a>
              <p>
            </div>
            <h5>迷路了嗎？</h5>
            <p>不論身在何方，都能用最快速度找到鄰近的酒吧！</p>
          </div>
          </div>


          <div class="carousel-item">
            <div class="logo">
              <div id="scene5">
                 <div data-depth="0.3">
                  <img src="img/bg1-3.png" alt="">
                </div>
                <div data-depth="0.6">
                  <img src="img/bg1-4.png" alt="">
                </div>
                  <div class="layer" data-depth="0.05">
                    <img class="bottom0" src="img/bg4-1.png" alt="">
                  </div>

                </div>
          </div>
          <div class="bg4 w-100">
          </div>
          <div class="carousel-caption d-none d-md-block">
            <div class="loginbox2">
              <a href="/Bartenders/DisplayBarList.controller"><button class="login" data-toggle="modal" data-target="#exampleModalCenter1">搜尋酒吧</button></a>
              <p>
            </div>
            <h5>腦中靈光一閃？</h5>
            <p>快利用搜尋您想到的酒吧或酒品，找到最熟悉的那個地方</p>
          </div>
          </div>

        </div> 
        <a class="carousel-control-prev carousel-control-prev_1" href="#carouselExampleCaptions" role="button" data-slide="prev">
          <div class="arrow_box">
            <div class="ararrow_right">
              <span class="arrow_span"></span>
              <span class="arrow_span"></span>
              <span class="arrow_span"></span>
            </div>
          </div>
          <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span> -->
        </a>

        
          <a class="carousel-control-next carousel-control-next_1" href="#carouselExampleCaptions" role="button" data-slide="next">
            <div class="arrow_box2">
              <div class="ararrow_right">
                <span class="arrow_span"></span>
                <span class="arrow_span"></span>
                <span class="arrow_span"></span>
              </div>
            </div>
            <!-- <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span> -->
          </a>
      </div>  
	<script>
		function onSignIn(googleUser) {
			var id_token = googleUser.getAuthResponse().id_token;

			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'http://localhost:8080/Bartenders/googleVerify');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.send('idtokenstr=' + id_token);
			xhr.onload = function() {
				console.log('Signed in as: ' + xhr.responseText);
				document.location.href="http://localhost:8080/Bartenders/checkGLogin";
			};
		}
	</script>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/parallax.js"></script>


    <script>
      
        // var scene = document.querySelector('#scene');
        // var parallaxInstance = new Parallax(scene);

        var scene2 = document.querySelector('#scene2');
        var parallaxInstance = new Parallax(scene2);

        var scene3 = document.querySelector('#scene3');
        var parallaxInstance = new Parallax(scene3);

        var scene4 = document.querySelector('#scene4');
        var parallaxInstance = new Parallax(scene4);

        var scene5 = document.querySelector('#scene5');
        var parallaxInstance = new Parallax(scene5);

        var scene6 = document.querySelector('#scene6');
        var parallaxInstance = new Parallax(scene6);

        
        var scene = document.getElementById('scene');
        var parallax = new Parallax(scene);
        // var scene = document.getElementById('scene01');
        // var parallax = new Parallax(scene);
        // var scene = document.getElementById('scene02');
        // var parallax = new Parallax(scene);
        // var scene = document.getElementById('scene04');
        // var parallax = new Parallax(scene);

    </script>
</body>

</html>