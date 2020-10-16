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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef93669481fc09a5adb9cdbabc25ba28"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.8641294, 128.592569), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();



//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

</script>