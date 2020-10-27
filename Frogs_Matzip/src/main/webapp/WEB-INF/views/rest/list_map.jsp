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
		<h2>${place} 지역의 맛집 목록</h2>
	    <div id="rest_list_wrap"></div>
	    <!-- 
	    <c:forEach items="${recRestList}" var="item">
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
	</div>
	
	<div class="map_wrap">
	    <div id="map" style="width:100vw; height:100vh; position:fixed;overflow:hidden; "></div>
	</div>
	
</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d88fdcc4a19e51b35f8bf4dc0300b352&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
	var markerList = [];
	
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.865280, 128.593418), // 지도의 중심좌표 
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// ajax로 db값 가져오기
	function getRestList() {
		// search_text 값이 빈 값이 아닌지, 2글자 이상인지 체크
		searchRest()
		
		//마커 모두 지우기
		markerList.forEach(function(marker) {
			marker.setMap(null)
		})
		
		// 리스트 모두 지우기
		while ( list_back.hasChildNodes() ) { list_back.removeChild( list_back.firstChild ); }
		
		let search_text = frm_search.search_text.value
		
		
		
		const bounds = new kakao.maps.LatLngBounds();
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
				sw_lat, sw_lng, ne_lat, ne_lng, 
				search_text
			}
		}).then(function(res) {
			console.log(res.data)
			
			// db에 값이 없을 경우 에러메시지 출력 후 기본지도 위치로 재설정, 리스트에는 추천식당 띄우기
			if(res.data == null) {
				alert('검색 결과가 존재하지 않습니다.')
				location.href = '/rest/listMap?search_text=대구'
				return false;
			}
			
			var bounds = new kakao.maps.LatLngBounds();
			createTitle(search_text)
			
			res.data.forEach(function(item) {
				bounds.extend(new kakao.maps.LatLng(item.lat, item.lng));
				createMarker(item)
				createRestDiv(item)
			})
			
			map.setBounds(bounds);
		})
	}
	
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
	
	kakao.maps.event.addListener(map, 'tilesloaded', getRestList)
	
	// 마커 생성 함수
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
	
	// 맛집 목록 제목 생성
	function createTitle(e) {
		var heading = document.createElement('h2')
		heading.innerHTML = e + ' 지역의 맛집 목록'
		
		var rest_list_wrap = document.createElement('div')
		rest_list_wrap.id = 'rest_list_wrap'
		
		list_back.prepend(heading)
		list_back.append(rest_list_wrap)
	}
	
	// 맛집 목록 내 content 생성
	function createRestDiv(item) {
		var list_wrap = document.createElement('div')
		list_wrap.classList.add('list_wrap')
		
		var list_ctnt_wrap = document.createElement('div')
		list_ctnt_wrap.classList.add('list_ctnt_wrap')
		
		var matzip_list = document.createElement('div')
		matzip_list.classList.add('matzip_list')
		
		var food_img = document.createElement('img')
		food_img.classList.add('food_img')
		food_img.setAttribute('src', item.food_pic)
		food_img.setAttribute('alt', item.nm+'의 음식 사진')
		
		var ctnt_wrap = document.createElement('div')
		ctnt_wrap.classList.add('ctnt_wrap')
		
		var rest_nm = document.createElement('h3')
		
		var rest_nm_a = document.createElement('a')
		rest_nm_a.setAttribute('href', '/rest/detail?i_rest=' + item.i_rest)
		rest_nm_a.innerHTML = item.nm
		
		var avg_grade = document.createElement('strong')
		avg_grade.innerHTML = item.avg_grade
		
		var br1 = document.createElement('br')
		var br2 = document.createElement('br')
		
		var rest_info = document.createElement('p')
		rest_info.innerHTML = item.district + ' - ' + item.category_nm
		
		var rest_review = document.createElement('p')
		rest_review.innerHTML = 'review: ' + item.review
		
		matzip_list.append(food_img)
		
		rest_nm.append(rest_nm_a)
		ctnt_wrap.append(rest_nm)
		ctnt_wrap.append(avg_grade)
		ctnt_wrap.append(br1)
		ctnt_wrap.append(rest_info)
		ctnt_wrap.append(br2)
		ctnt_wrap.append(rest_review)
		
		list_ctnt_wrap.append(matzip_list)
		list_ctnt_wrap.append(ctnt_wrap)
		list_wrap.append(list_ctnt_wrap)
		
		rest_list_wrap.append(list_wrap)
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
	
	/* kakao.maps.load(function() {
 		var ps = new kakao.maps.services.Places();
 		let keyword = "${place}"
 	
 		ps.keywordSearch(keyword, function(data, status, pagination) {
 		    //if (status === kakao.maps.services.Status.OK) {
 		    if (status === kakao.maps.services.Status.OK) {
 		        // 데이터 확인
 		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
	 		    console.log(data);
 		          
 		      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
 		          alert('검색 결과가 존재하지 않습니다.');
 		          return;
 		      } else if (status === kakao.maps.services.Status.ERROR) {
 		          alert('검색 결과 중 오류가 발생했습니다.');
 		          return;
 		      }
 		});
 	}); */

</script>