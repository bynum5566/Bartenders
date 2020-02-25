		var mapReal = [];
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		
		var mapId = pre;
		var mapNumber = number;
		var mapIndex = pre;
		var markers = new Array(mapNumber);
		for(var i=0; i<mapNumber;i++){
			markers[i] = new Array();
		}
		function initMap() {
//			var bounds  = new google.maps.LatLngBounds();
//			console.log('this is bounds:',bounds)
			for(var i=0; i<number;i++){
				mapIndex[i] = new google.maps.Map(document.getElementById(mapId[i]),mapStyle);
				mapReal.push(mapIndex[i]);
				console.log('creating mapId success: ',mapReal[i]);
			}
			infowindow = new google.maps.InfoWindow;
			
		}
		
		function reloadMarkers(prefix,input,mapId) {
		    for (var i=0; i<markers[mapId].length; i++) {
		    	console.log(markers[mapId][i]);
		        markers[mapId][i].setMap(null);
		    }
		    markers[mapId] = [];
		}
		
		function getMarkers(prefix,input,mapId){
			var targetMap = mapReal[mapId];
			
			console.log('targetMap is: ',targetMap);
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
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
						icon: 'images/'+type+'.png'
					});
					
					targetMap.panTo(point);
					markers[mapId].push(marker);
					//建立個別window
					var contentString = 
						'<div class="infoDiv">'+
						'<div class="infoTitle">'+
							'<h1 class="infoH1">'+name+'</h1>'+
						'</div>'+
						'<img class="infoImg" alt="未設定照片" src="images/'+img+'">'+
						'<div class="detailDiv">'+
							'<p class="infoDetail">2020/02/21</p>'+
							'<p class="infoDetail">16:00 ~ 20:00</p>'+
							'<p class="infoDetail">'+address+'</p>'+
							'<a href="/Bartenders/queryActivityByActivityId.do?activityId='+id+'"/>活動詳情</a>'+
						'</div>'+
						'<div class="infoBrief" >'+brief+'</div>'+
					'</div>';
					
					marker.addListener('click', function() {
						infowindow.setContent(contentString);
						infowindow.open(targetMap, marker);
					});
					}else if(prefix=='ActivityUserId'||prefix=='ActivityType'||prefix=='ActivityActivityId'||prefix=='ActivityJoker'){
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
							icon: 'images/'+type+'.png'
						});
						
						targetMap.panTo(point);
						markers[mapId].push(marker);
						//建立個別window
						var contentString = 	
							'<div class="infoDiv">'+
							'<div class="infoTitle">'+
								'<h1 class="infoH1">'+name+'</h1>'+
							'</div>'+
							'<img class="infoImg" alt="未設定照片" src="images/'+img+'">'+
							'<div class="detailDiv">'+
								'<p class="infoDetail">2020/02/21</p>'+
								'<p class="infoDetail">16:00 ~ 20:00</p>'+
								'<p class="infoDetail">'+address+'</p>'+
								'<a href="/Bartenders/queryActivityByActivityId.do?activityId='+id+'"/>活動詳情</a>'+
							'</div>'+
							'<div class="infoBrief" >'+brief+'</div>'+
						'</div>';
						
						marker.addListener('click', function() {
							infowindow.setContent(contentString);
							infowindow.open(targetMap, marker);
						});
					}//if結尾
				})	
			});
			

		}

		