		var mapReal = [];
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
		var mapId = pre;
		var mapNumber = number;
		var mapIndex = pre;

		function initMap() {
//			var bounds  = new google.maps.LatLngBounds();
//			console.log('this is bounds:',bounds)
			for(var i=0; i<number;i++){
				console.log('creating mapId: ',mapId[i]);
				mapIndex[i] = new google.maps.Map(document.getElementById(mapId[i]),mapStyle);
				mapReal.push(mapIndex[i]);
				console.log('creating success: ',mapReal[i]);
			}
			infowindow = new google.maps.InfoWindow;
			
		}
		
		function testInit() {
			console.log('hello, this is callback');
		}
		
		function reloadMarkers(prefix,input,mapId) {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    console.log('marker clear!');
		    markers = [];
		}
		
		function getMarkers(prefix,input,mapId){
			var targetMap = mapReal[mapId];
			
			console.log('targetMap is: ',targetMap);
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
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
						map : targetMap,
						position : point,
						icon: 'images/'+type+'.jpg'
					});
					
					bounds.extend(point);
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
						infowindow.open(targetMap, marker);
					});
					}else if(prefix=='ActivityUserId'||prefix=='ActivityType'||prefix=='ActivityActivityId'){
						var id = item.activityId;
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
							map : targetMap,
							position : point,
							icon: 'images/'+type+'.jpg'
						});
						console.log('try to re-locating');
						targetMap.panTo(point);
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
							infowindow.open(targetMap, marker);
						});
					}//if結尾
				})	
			});
			

		}

		