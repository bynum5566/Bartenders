<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>推送通知 WebPush</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/infoWindow.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/progressBar.css">
</head>
<body>
	<div class="infoDiv">
		<div class="infoTitle">
			<h1 class="infoH1">周末狂歡外加吃吃喝喝就是要大玩特玩</h1>
			<img class="infoType" alt="未設定類型" src="images/show.png">
		</div>
		<img class="infoImg" alt="未設定照片" src="images/demo.jpg">
		<div class="detailDiv">
			<p class="infoDetail">2020/02/21</p>
			<p class="infoDetail">16:00 ~ 20:00</p>
			<p class="infoDetail">台北市信義區民狀街45巷16號5樓</p>
			<p class="infoDetail">主辦人:林靖</p>
			<p class="infoDetail">0921228145</p>
			<p class="infoDetail">人數: 2 / 5</p>
			<p class="infoDetail"><a>活動詳情</a></p>
		</div>
		<div class="outer">
			<div class="ground">
				<p class="limitP" class="num"><img src="images/arrowLimit.png"></p>
				<div class="targetD">
					<p class="targetP" class="num"><img src="images/arrowTarget.png"></p>
				</div>
				<div class="currentD">
					<img class="currentP" src="images/arrowCurrent.png">
				</div>
			</div>
		</div>
		<div class="infoBrief" >
			歡樂狼人殺 看過娛樂百分百的凹嗚狼人殺嗎 是不是覺得很有趣很好玩呢 不用懷疑快來報名吧！ 內有新手，歡迎新手一起來玩 新手都會有教學 遊戲過成中請勿貼臉 請尊重所有玩家，不得謾罵指責 禁負面情緒，拉低在場所有人遊戲體驗 但可以講講笑話，唱首歌XDD 被狼人殺死時，是否覺得很無聊呢 不用擔心，此桌遊店有店貓 死亡還有貓咪可以陪妳玩呢 喜歡貓咪的更不能錯過唷
		</div>
	</div>
	
	<hr>
	<label>輸入上限<input id="limitNum" type="text" name="limit"></label><br>
		<label>輸入目標<input id="targetNum" type="text" name="target"></label><br>
		<input type="submit" onclick="reSet()" value="設定"><br>
	<button id="per">增加1份</button>
	<button id="plus">增加10</button>
	<button id="reduce">減少10</button>
	<script>
	var fix = $('.ground').width()-20;
	console.log('fix width: ',fix);
	var per;
	var limitNum = document.getElementById('limitNum');
	var targetNum = document.getElementById('targetNum');
	var currentNum = 0;

	var current;
	var reach;
	var target;
	function reSet(){
		console.log(' limit is: ',limitNum.value,' target is: ',targetNum.value);
		per = fix/limitNum.value;
		reach = per*targetNum.value;
		currentNum = 0;
		console.log('per is:',per);
		console.log('reach is:',reach);
		$('.targetD').width(reach);
		$('.currentD').width(0);
		$('.currentD').css('background-color','pink');
		$('.targetP').css("display","block");
	}
	
	
	
	$('#per').on('click',function(){
		currentNum++;
		console.log('number is: ',currentNum,'/',targetNum.value)
		current = $('.currentD').width();
		console.log('jquery current is: ',current);
		$('.currentD').width(current+per);
		console.log('jquery after is: ',$('#total').width());
		if(currentNum==targetNum.value){
			console.log('target reached')
			$('.currentD').css('background-color','lightgreen');
			$('.targetP').css("display","none");
		}
		
	})
	
	</script>
</body>
</html>