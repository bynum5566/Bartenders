		var map;
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
		
		
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'),mapStyle); 
			infowindow = new google.maps.InfoWindow;
			Location();
		}
		
		function reloadMarkers(prefix,input) {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    markers = [];
		    getMarkers(prefix,input);
		}
		
		function getMarkers(prefix,input){
			fetch('http://localhost:8080/LogisticSystem/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
				console.log('this is data: ', JSONdata);
				
				var all = JSONdata.forEach(function(item){
					if(prefix=='Bar'){
					var id = item.barId;
					var name = item.name;
					var address = item.address;
					var lat = item.lat;
					var lng = item.lng;
					var type = item.type;
					
					var img = item.img;
					console.log('this is img: ', img);
					var brief = item.brief;
					var point = new google.maps.LatLng(lat, lng);
					//建立個別marker
					var marker = new google.maps.Marker({
						map : map,
						position : point,
						icon: 'images/'+type+'.jpg'
					});
					
					markers.push(marker);
					//建立個別window
					var contentString = 	'<div id="idiv">'+
					'<h3 id="ih3" style="margin:10px 10px 0px 10px;display: inline-block">'+name+'</h3>'+
					'<p id="ip" align="right" style="color:red;margin:10px 20px 10px 70px;display: inline">'+type+'</p>'+
					'<p style="margin:5px">'+address+'</p>'+
					'<img src="images/'+img+'">'+
					'<p style="margin:5px">'+brief+'</p>'
					'</div>';
					
					marker.addListener('click', function() {
						infowindow.setContent(contentString);
						infowindow.open(map, marker);
					});
					}else if(prefix=='ActivityUserId'){
						var id = item.barId;
						var name = item.name;
						var address = item.address;
						var lat = item.lat;
						var lng = item.lng;
						var type = item.type;
						
						var img = item.img;
						console.log('this is img: ', img);
						var brief = item.brief;
						var point = new google.maps.LatLng(lat, lng);
						//建立個別marker
						var marker = new google.maps.Marker({
							map : map,
							position : point,
							icon: 'images/'+type+'.jpg'
						});
						
						markers.push(marker);
						//建立個別window
						var contentString = 	'<div id="idiv">'+
						'<h3 id="ih3" style="margin:10px 10px 0px 10px;display: inline-block">'+name+'</h3>'+
						'<p id="ip" align="right" style="color:red;margin:10px 20px 10px 70px;display: inline">'+type+'</p>'+
						'<p style="margin:5px">'+address+'</p>'+
						'<img src="images/'+img+'">'+
						'<p style="margin:5px">'+brief+'</p>'
						'</div>';
						
						marker.addListener('click', function() {
							infowindow.setContent(contentString);
							infowindow.open(map, marker);
						});
					}//if結尾
				})	
			});
		}
		
/*
		
		*/
			 //透過點擊地圖取得座標
		function CancelLocating(){
			cancelLocating = true;
			console.log('cancel locating');
		}
		function Location(){
			console.log('enable locating');
			google.maps.event.addListener(map, 'click', function(event) {
				if(cancelLocating==true){
					console.log('locating function is stop');
					return;
				}
				alert(event.latLng.lat() + ", " + event.latLng.lng());
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();

				document.getElementById('lat').value = lat;
				document.getElementById('lng').value = lng;

			});
		}