
		function reloadMarkers(prefix,input,mapIndex) {
		    for (var i=0; i<markers[mapIndex].length; i++) {
		    	console.log(markers[mapIndex][i]);
		        markers[mapIndex][i].setMap(null);
		    }
		    markers[mapIndex] = [];
		}
		
		function getMarkers(prefix,input,mapIndex){
			var targetMap = mapReal[mapIndex];
			
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
						icon: 'images/'+type+'.jpg'
					});
					
					targetMap.panTo(point);
					markers[mapIndex].push(marker);
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
						'</div>'+
						
							'<div class="outer">'+
								'<div class="ground">'+
									'<p class="limitP" class="num"><img src="images/arrowLimit.png"></p>'+
									'<div class="targetD">'+
										'<p class="targetP" class="num"><img src="images/arrowTarget.png"></p>'+
									'</div>'+
									'<div class="currentD">'+
										'<img class="currentP" src="images/arrowCurrent.png">'+
									'</div>'+
								'</div>'+
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
						markers[mapIndex].push(marker);
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
							/*
								'<div class="outer">'+
									'<div class="ground">'+
										'<p class="limitP" class="num"><img src="images/arrowLimit.png"></p>'+
										'<div class="targetD">'+
											'<p class="targetP" class="num"><img src="images/arrowTarget.png"></p>'+
										'</div>'+
										'<div class="currentD">'+
											'<img class="currentP" src="images/arrowCurrent.png">'+
										'</div>'+
									'</div>'+
								'</div>'+
							*/
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

		