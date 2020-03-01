<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0">
	<title>MAP</title>
	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
    </style>
</head>
<body>
	<div id="map"></div>
	
	<script>
		var bNm = document.getElementById("bNm").value;
		var aDd = document.getElementById("bAd").value;
		var aDds = "'"+aDd+"'";
	    var iMg = document.getElementById("bImg").value;
	
		function initMap() {
	        var markers = [];
	        var infoWindows = [];
	        var loaction;
	        var geocoder = new google.maps.Geocoder();
	        var info_config = [
	            '<div id="infoDiv">'+
	            '<span style="font-size: 16pt;"><b>'+bNm+'</b></span><br/>'+
	            '<span>'+aDd+'</span><br/>'+
 	            '<img class="infoImg" style="width:200px;" src="'+iMg+'"><br/>'+
	            '</div>'
	        ];
	
	        //建立地圖 marker 的集合
	        var marker_config = [{
	            address: aDds,
	            icon:'https://i.imgur.com/3JgzHss.png'
	        }];  
	        
	        //geocoder主程式
	        function _geocoder(address, callback){
	            geocoder.geocode({
	            address: address
	            }, function(results, status) {
	            if (status == google.maps.GeocoderStatus.OK) {
	                loaction = results[0].geometry.location;
	                callback(loaction); //用一個 callback 就不用每次多寫上面這段
	            }
	            });
	        }
	        
	        //使用地址或名稱標出位置
	        _geocoder(aDds,function(address){
	            var map = new google.maps.Map(document.getElementById('map'), {
	            center: address,
	            zoom: 14
	            });
	        
	            //設定資訊視窗內容
	            info_config.forEach(function(e,i){
	            infoWindows[i] = new google.maps.InfoWindow({
	                content: e
	            });
	            });
	        
	            //標出 marker
	            marker_config.forEach(function(e,i){
	            _geocoder(e.address,function(address){
	                var marker = {
	                position:address,
	                map:map,
	                icon:e.icon
	                };
	                markers[i] = new google.maps.Marker(marker);
	                markers[i].setMap(map);
	                markers[i].addListener('click', function() {
	                infoWindows[i].open(map, markers[i]);
	                });
	                _setIcon(markers[i],'https://i.imgur.com/wGpd0lG.png');
	            });
	            });
	        });
	
	        function _setIcon(e,icon){
	            e.setIcon(icon);
	        }
        
        }
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQSxkb9GTtPwminPpk88vuulGQFJVMvQA&callback=initMap"
    async defer></script>
</body>
</html>