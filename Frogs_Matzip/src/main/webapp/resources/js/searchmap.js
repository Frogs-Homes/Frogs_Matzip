// -------------list map js 시작------------------------------------------------------------------------
//chkKeyword
function chkKeyword(e) {
	if(e.keyCode == 13) {
		getSearchRestList()
	}
}

// 마커를 담을 배열입니다
var markerList = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.865280, 128.593418), // 지도의 중심좌표 
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);


// ajax - latlng 내 db값 가져오기
function getBoundRestList() {
	// 마커 모두 지우기
	markerList.forEach(function(marker) {
		marker.setMap(null)
	})
	
	// 리스트 모두 지우기
	list_back.innerHTML = ''
	
	var title = '현재';

	if(keyword.value != '') { title = keyword.value }
	createTitle(title)
	
	const bounds = map.getBounds();
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
			createRestDiv(item)
		})
		
		keyword.value = ''
	})
}

// ajax - 검색어로 db값 가져오기
function getSearchRestList() {
	// search_text 값이 빈 값이 아닌지, 2글자 이상인지 체크
	if(!chkSearchRest()) {
		return;
	}
	
	axios.get('/rest/ajaxGetList', {
		params: {
			search_text: keyword.value
		}
	}).then(function(res) {
		
		console.log(res.data)
		
		// db에 값이 없을 경우 에러메시지 출력 후 기본지도 위치로 재설정, 리스트에는 추천식당 띄우기
		if(res.data == '' || res.data.length == 0) {
			alert('검색 결과가 존재하지 않습니다.')
			location.href = '/main'
			return;
		}
		
		// 리스트 모두 지우기			
		list_back.innerHTML = ''
		
		//마커 모두 지우기
		markerList.forEach(function(marker) {
			marker.setMap(null)
		})
		
		/*
		res.data.forEach(function(item) {
			createMarker(item)
			createRestDiv(item)
		})
		*/
		//bounds.extend(new kakao.maps.LatLng(res.data[0].lat, res.data[0].lng));
		
		
		//map.setBounds(bounds);
		
		 var moveLatLon = new kakao.maps.LatLng(res.data[0].lat, res.data[0].lng);
		 map.panTo(moveLatLon);
	})
}

kakao.maps.event.addListener(map, 'tilesloaded', getBoundRestList)
		
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
function createTitle(title) {
	let heading = document.createElement('h2')
	heading.id = 'place_title'
	let rest_list_wrap = document.createElement('div')
	rest_list_wrap.id = 'rest_list_wrap'
	
	heading.innerHTML = `${title} 지역의 맛집 목록`
	
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
	
	var food_img_a = document.createElement('a')
	food_img_a.setAttribute('href', `/rest/detail?i_rest=${item.i_rest}`)
	
	var food_img = document.createElement('img')
	food_img.classList.add('food_img')
	food_img.setAttribute('src',`/res/img/rest/${item.i_rest}/food_pic/${item.food_pic}`)
	food_img.setAttribute('alt', item.nm+'의 음식 사진')
	
	var ctnt_wrap = document.createElement('div')
	ctnt_wrap.classList.add('ctnt_wrap')
	
	var rest_nm = document.createElement('h3')
	
	var rest_nm_a = document.createElement('a')
	rest_nm_a.setAttribute('href', `/rest/detail?i_rest=${item.i_rest}`)
	rest_nm_a.innerHTML = item.nm
	
	var avg_grade = document.createElement('strong')
	avg_grade.innerHTML = item.avg_grade
	
	var br1 = document.createElement('br')
	var br2 = document.createElement('br')
	
	var rest_info = document.createElement('p')
	rest_info.innerHTML = `${item.district_val} - ${item.category_val}`
	
	var rest_review = document.createElement('p')
	rest_review.innerHTML = `review: ${item.review_cnt}`
	
	food_img_a.append(food_img)
	matzip_list.append(food_img_a)
	
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
	location.href = `/rest/detail?i_rest=${i_rest}`
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

kakao.maps.load(function() {
	getSearchRestList()
})



// -------------list map js 끝------------------------------------------------------------------------