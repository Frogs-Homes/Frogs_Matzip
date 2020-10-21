<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<div class="back_wrap">
	<div id="list_back">
	    <h2>** 맛집 인기 검색 순위</h2>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef93669481fc09a5adb9cdbabc25ba28&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
	var markers = [];
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.8641294, 128.592569), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			kakao.maps.load(function() {
			var ps = new kakao.maps.services.Places(); 
			var keyword = "${place.search_place}"
		
			ps.keywordSearch( keyword, function(data, status, pagination) {
			      if (status === kakao.maps.services.Status.OK) {
			          // 데이터 확인
			          console.log(data);
			      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			          alert('검색 결과가 존재하지 않습니다.');
			          return;
			      } else if (status === kakao.maps.services.Status.ERROR) {
			          alert('검색 결과 중 오류가 발생했습니다.');
			          return;
			      }
			});	
		});

	function searchRest() {
		
		if(search_bar.value == "") {
			alert('검색어를 입력하세요.')
			search_bar.focus()
			return false
		}
	}	
		
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

</script>