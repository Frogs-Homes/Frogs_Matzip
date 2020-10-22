<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	    .label {margin-bottom: 96px;}
		.label * {display: inline-block;vertical-align: top;}
		.label .left {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
		.label .center {background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
		.label .right {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
</style>

<div class="back_wrap">
	<div id="list_back">
	    <h2>${place.search_place} 지역의 맛집 목록(평점 순)</h2>
	    <!-- 
	    <c:forEach items="${restMenuList}" var="item">
		    <div class="list_wrap">
		        <div class="list_ctnt_wrap">
		            <div class="matzip_list">
		                <img src="${item.food_pic}" class="food_img" alt="${item.nm}의 음식 사진">
		            </div>
		            <div class="ctnt_wrap">
		                <h3><a href="#">${item.nm}</a></h3>
		                <strong>${item.avg_grade}</strong><br>
		                <p>${item.district}-${item.category_nm}</p><br>
		                <p>review:${item.review}</p>
		            </div>
		        </div>
		    </div>
	    </c:forEach>
	     -->
	    <div class="list_wrap">
	        <div class="list_ctnt_wrap">
	            <div class="matzip_list">
	                <img src="/res/img/곱창.jpg" class="food_img" alt="">
	            </div>
	            <div class="ctnt_wrap">
	                <a href="#"><h3>쿠이곱창</h3></a>
	                <Strong>4.8</Strong><br>
	                <p>홍대-곱창</p><br>
	                <p>review:90</p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="list_wrap">
	        <div class="list_ctnt_wrap">
	            <div class="matzip_list">
	                <img src="/res/img/곱창.jpg" class="food_img" alt="">
	            </div>
	            <div class="ctnt_wrap">
	                <a href="#"><h3>쿠이곱창</h3></a>
	                <Strong>4.8</Strong><br>
	                <p>홍대-곱창</p><br>
	                <p>review:90</p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="list_wrap">
	        <div class="list_ctnt_wrap">
	            <div class="matzip_list">
	                <img src="/res/img/곱창.jpg" class="food_img" alt="">
	            </div>
	            <div class="ctnt_wrap">
	                <a href="#"><h3>쿠이곱창</h3></a>
	                <Strong>4.8</Strong><br>
	                <p>홍대-곱창</p><br>
	                <p>review:90</p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="list_wrap">
	        <div class="list_ctnt_wrap">
	            <div class="matzip_list">
	                <img src="/res/img/곱창.jpg" class="food_img" alt="">
	            </div>
	            <div class="ctnt_wrap">
	                <a href="#"><h3>쿠이곱창</h3></a>
	                <Strong>4.8</Strong><br>
	                <p>홍대-곱창</p><br>
	                <p>review:90</p>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="map_wrap">
	    <div id="map" style="width:1500px; height:100%; position:relative;overflow:hidden; "></div>
	</div>
	
</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef93669481fc09a5adb9cdbabc25ba28"></script>
<script>
	// 마커를 담을 배열입니다
	var markerList = [];
	console.log("markerList :" + markerList)
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.8641294, 128.592569), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	function searchRest() {
		
		if(search_bar.value == "") {
			alert('검색어를 입력하세요.')
			search_bar.focus()
			return false
		}
	}
	
	function getRestList() {
		//마커 모두 지우기
		markerList.forEach(function(marker) {
			marker.setMap(null)
		})
		
		const bounds = map.getBounds()
		const southWest = bounds.getSouthWest()
		const northEast = bounds.getNorthEast()
		
		console.log('southWest: ' + southWest)
		console.log('northWest: ' + northEast)
		
		const sw_lat = southWest.getLat()
		const sw_lng = southWest.getLng()
		const ne_lat = northEast.getLat()
		const ne_lng = northEast.getLng()
		
		axios.get('/rest/ajaxGetList', {
			params: {
				sw_lat, sw_lng, ne_lat, ne_lng
			}
		}).then(function(res) {
			console.log(res.data)
			
			res.data.forEach(function(item) {					
				createMarker(item)
			})
		})		
	}
	
	kakao.maps.event.addListener(map, 'tilesloaded', getRestList)
	
	function createMarker(item) {
			
		var content = document.createElement('div')
		content.className = 'label'
		
		var leftSpan = document.createElement('span')
		leftSpan.className = 'left'
		
		var rightSpan = document.createElement('span')
		rightSpan.className = 'right'
		
		var centerSpan = document.createElement('span')
		centerSpan.className = 'center'
		
		var restNm = item.nm
		
		centerSpan.innerText = restNm
		content.appendChild(leftSpan)
		content.appendChild(centerSpan)
		content.appendChild(rightSpan)
		
		
		var mPos = new kakao.maps.LatLng(item.lat, item.lng)
		var marker = new kakao.maps.CustomOverlay({
		    position: mPos,
		    content: content
		});
		addEvent(content, 'click', function() {
			console.log('마커 클릭: ' + item.i_rest)
			moveToDetail(item.i_rest)
		})
		
		marker.setMap(map)
		
		markerList.push(marker)
	}
	
	function moveToDetail(i_rest) {
		location.href = '/rest/detail?i_rest=' + i_rest
	}
	
	function addEvent(target, type, callback) {
		if (target.addEventListener) {
			target.addEventListener(type, callback);
		} else { //인터넷익스플로러에는 addEventListener가 없음
			target.attachEvent('on' + type, callback);
		}
	}
		
	//check for Geolocation support
	if (navigator.geolocation) { //navigator.geolocation은 os와 브라우저가 현재위치값을 제공해줄수있으면 true 아니면 false
		console.log('Geolocation is supported!');
		
		var startPos;
		
		var geoSuccess = function(position) {
			startPos = position;
			console.log('lat: ' + startPos.coords.latitude)
			console.log('lng: ' + startPos.coords.longitude)
			
			if(map) {
				var moveLatLon = new kakao.maps.LatLng(startPos.coords.latitude, startPos.coords.longitude)
				
				map.panTo(moveLatLon)
			}
		}	
	
		navigator.geolocation.getCurrentPosition(geoSuccess);
	}	else {
		console.log('Geolocation is not supported for this Browser/OS.')
	}

</script>