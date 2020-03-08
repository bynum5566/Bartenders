		var mapReal = [];
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var infolimitList = [];
		var infotargetList = [];
		var infocurrentList = [];
		var infoperList = [];
		var mapId = pre;
		var mapNumber = number;
		var mapIndex = pre;
		var tempMarkList = [];
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
		//重新定位
		function relocate(lat,lng){
			for(var i=0;i<tempMarkList.length;i++){
				tempMarkList[i].setMap(null);
			}
			
			var place = new google.maps.LatLng(lat, lng);
			mapIndex[0].panTo(place); 
			tempMark = new google.maps.Marker({
                position: place,
//                draggable: true,
                icon:'images/defaultMarker.png',
                map: mapIndex[0]
            });
			tempMarkList.push(tempMark);
		};
		
		//自動定位
		async function autoLocating(){
			
			if (navigator.geolocation) {
				for(var i=0;i<tempMarkList.length;i++){
					tempMarkList[i].setMap(null);
				};
				await navigator.geolocation.getCurrentPosition(function(position) {
	                var pos = {
	                    lat: position.coords.latitude,
	                    lng: position.coords.longitude
	                };
	                console.log('目前位置',pos.lat,'; ',pos.lng);
	                relocate(pos.lat,pos.lng);
	                tempMark = new google.maps.Marker({
	                    position: pos,
//	                    draggable: true,
	                    icon:'images/defaultMarker.png',
	                    map: mapIndex[0]
	                });
	                tempMarkList.push(tempMark);
	            })
	        } else {
	            alert("未允許或遭遇錯誤！");
	        };
		};
		//清除Marker
		function reloadMarkers(prefix,input,mapId) {
		    for (var i=0; i<markers[mapId].length; i++) {
		    	console.log(markers[mapId][i]);
		        markers[mapId][i].setMap(null);
		    }
		    markers[mapId] = [];
		}
		
		function getMarkers(prefix,input,mapId){
			var targetMap = mapReal[mapId];
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						return response.json();
					}).then(function(JSONdata) {
				console.log('this is data: ', JSONdata);
					var currentIndex = 0;
					
				var all = JSONdata.forEach(function(item){
					if(prefix=='Bar'){
					var id = item.barId;
					var name = item.name;
					var address = item.address;
					var lat = item.lat;
					var lng = item.lng;
					var type = item.type;
					
					var img = item.img;
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
						var beginTime = item.beginTime;
						var endTime = item.endTime;
						//console.log('date: ',beginTime.substring(5,10),' ; ',endTime.substring(5,10))
						var activityDate;
						if(beginTime.substring(5,10)==endTime.substring(5,10)){
							
							activityDate = beginTime.substring(5,10);
						}else{
							activityDate = beginTime.substring(5,10)+'~'+endTime.substring(5,10);;
						}
						var img = item.img;
						var brief = item.brief;
						var limitNum = item.limitNum;
						var targetNum = item.targetNum;
						var actualNum = item.actualNum;
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
						if(type=='bar'||type=='shop'){
							var contentString = 	'<div class="barDiv">'+
							'<div class="infoName">'+name+'</div>'+
							'<div class="infoDetail" >營業時間:'+beginTime.substring(11)+' ~ '+endTime.substring(11)+'</div>'+
							'<div class="infoAddr" >'+address+'</div>'+
							'</div>';
						}else{
							
						
						var contentString = 	
							'<div class="infoDiv">'+
							'<div class="infoTitle">'+
								'<h1 class="infoH1">'+name+'</h1>'+
							'</div>'+
							
							'<img class="infoImg" alt="未設定照片" src="images/'+img+'">'+
							'<div class="detailDiv">'+
							
								'<p class="infoDetail">'+activityDate+'</p>'+
								'<p class="infoDetail">'+beginTime.substring(11)+'~'+endTime.substring(11)+'</p>'+
								'<p class="infoAddress">'+address+'</p>'+
								
							'</div>'+
							'<div id="infoouter'+currentIndex+'" class="infoouter" title="">'+
								'<div id="infogroundD'+currentIndex+'" class="infoground">'+
									'<img id="infolimitP'+currentIndex+'" class="infolimitP NP" title="上限: '+limitNum+'人" src="images/arrowLimit.png">'+
									'<div id="infotargetFor1" class="infotargetD">'+
										'<img class="infotargetP NP" title="成團: '+targetNum+'人" src="images/arrowTarget.png">'+	
									'</div>'+
									'<div id="infocurrentFor'+currentIndex+'" class="infocurrentD NP">'+
										'<p><img class="infocurrentP NP" title="現在: '+actualNum+'人" src="images/arrowCurrent.png"></p>'+
									'</div>'+
								'</div>'+
							'</div>'+
							'<div class="infoBrief" >'+brief+'</div>'+
							'<a class="infoA" href="/Bartenders/queryActivityByActivityId.do?activityId='+id+'"/>活動詳情</a>'+
						'</div>';
						}
						
						//個別進度條設定
						infolimitList.push(limitNum);
						infotargetList.push(targetNum);
						infocurrentList.push(actualNum);
						
						marker.addListener('click', function() {
							infowindow.setContent(contentString);
							infowindow.open(targetMap, marker);
							setProgress(currentIndex);
						});
						
						
						
						console.log('index:',currentIndex)
						currentIndex++;
					}//if結尾
				})	
				
				console.log('infolimitList:',infolimitList,';infotargetList:',infotargetList,';infocurrentList:',infocurrentList,'infoperList:',infoperList)
			});
			

		}
		
		function setProgress(currentIndex){
			//info進度條
			console.log('limit is: ',infolimitList[currentIndex],' target is: ',infotargetList[currentIndex],' current is: ',infocurrentList[currentIndex]);
			var infoWidth = 180;
			console.log('this is width of info: ',infoWidth,$('#infogroundD'+currentIndex+''));
			if(limitNum==999){
				//console.log('no limit')
				if(targetNum!=0){
					//console.log('target != 0')
					per = infoWidth/infotargetList[currentIndex];
					$('#infotargetFor'+currentIndex).width(infoWidth);
					console.log('目標寬度:',$('#infotargetFor'+currentIndex).width());
					//perNum.push(per);
					if(actualNum>=targetNum){
						
						$('#infocurrentFor'+currentIndex).width(per*parseInt(infotargetList[currentIndex]));
						
						//console.log('現在寬度:',$('#currentFor${status.index}').width());
						//console.log('人數無上限 有目標 已達標')
						//$('#outer'+currentIndex).prop('title',"不限人數   已成團   現在: ${Activity.actualNum}人");
					}else{
						
						$('#infocurrentFor'+currentIndex).width(per*parseInt(infocurrentList[currentIndex]));
						//$('#currentFor${status.index}').css('background-color','pink');
						//console.log('現在寬度:',$('#currentFor${status.index}').width());
						//console.log('人數無上限 有目標 未達標')
						//$('#outer${status.index}').prop('title',"不限人數   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
					}
					
				}else if(targetNum==0){
					//console.log('target = 0')
					per = infoWidth/parseInt(infocurrentList[currentIndex]);
					$('#infotargetFor'+currentIndex).css('display','none');
					//perNum.push(per);
					$('#infocurrentFor'+currentIndex).width(per*parseInt(infocurrentList[currentIndex]));
					//$('#currentFor${status.index}').css('background-color','pink');
					//console.log('現在寬度:',$('#currentFor${status.index}').width());
					//console.log('人數無上限 沒目標')
					//$('#outer${status.index}').prop('title',"不限人數   直接成團   現在: ${Activity.actualNum}人");
				}
				$('#infolimitP'+currentIndex).css('display','none');
			}else{
				
				per = infoWidth/parseInt(infolimitList[currentIndex]);
				//console.log('has limit, per= ',per)
				$('#infotargetFor'+currentIndex).width(per*parseInt(infotargetList[currentIndex]));
				//console.log('目標寬度: ',$('#targetFor${status.index}').width())
				//perNum.push(per);
				$('#infocurrentFor'+currentIndex).width(per*parseInt(infocurrentList[currentIndex]));
				//$('#currentFor${status.index}').css('background-color','pink');
				//console.log('現在寬度:',$('#currentFor${status.index}').width());
				//console.log('人數有上限 可能有目標')
				//$('#outer${status.index}').prop('title',"上限: ${Activity.limitNum}人   成團: ${Activity.targetNum}人   現在: ${Activity.actualNum}人");
			}
			//infoperList.push(per);
		}
		