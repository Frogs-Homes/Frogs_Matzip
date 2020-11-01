<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css?fddf=2">
</c:forEach>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>${title}</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/${header_temp}.jsp"></jsp:include>
	<div id="container">
		<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	</div>
	<footer>
        <dl>
            <dt>이 페이지는 포트폴리오를 위해서 제작되었습니다.</dt>
            <dd>상호 및 서비스는 실제와 무관합니다.</dd>
        </dl>
    </footer>

	<div id="modal_bg"></div>
    <div id="modal_container">
        <div id="modal_login_wrap">
            <div id="modal_login">
                <h3>로그인</h3>
            </div>
            <div id="modal_ctnt"><p>로그인하면 가고싶은 식당을<br>저장할 수 있어요</p></div>
            <div class="modal_value">
            	<div id="login_error_msg" class="msg"></div>
                <form id="login_frm">
                    <label for="user_id" class="hidden"></label>
                    <input type="text" name="user_id" class="login_id" placeholder="   아이디"><br>
                    <label for="user_pw" class="hidden"></label>
                    <input type="password" name="user_pw" class="login_pw" placeholder="   비밀번호"><br>
                    <input type="button" id="login_submit_btn" value="로그인" onclick="loginChk()">
                </form>
                <div class="join">
                	<p class="join_ctnt">개굴플레이트 계정이 없으세요? <span class="join_btn">회원 가입</span></p>
                </div>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>

        <div id="modal_join_wrap">
            <div id="modal_join">
                <h3>회원가입</h3>
            </div>
            <div class="modal_value">
                <form id="join_frm">
                    <label for="user_id" class="hidden"></label>
                    <input type="text" name="user_id" class="join_id" placeholder="    아이디"><br>
                    <button type="button" id="id_check_btn" class="check_id" onclick="joinChkId()">중복체크</button>
                    <label for="user_pw" class="hidden"></label>
                    <input type="password" name="user_pw" class="join_pw" placeholder="   비밀번호"><br>
                    <label for="user_pw_chk" class="hidden"></label>
                    <input type="password" name="user_pw_chk" class="join_pw" placeholder="   비밀번호 확인"><br>
                    <label for="user_nm" class="hidden"></label>
                    <input type="text" name="user_nm" class="join_nm" placeholder="  이름"><br>
                    <input type="button" id="join_submit_btn" value="회원가입" onclick="joinChk()">
                </form>
                <div id="join_error_msg" class="msg"></div>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>
    </div>
    
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d88fdcc4a19e51b35f8bf4dc0300b352&libraries=services"></script>
    <script> 	
    	
 		// -------------user menu 시작------------------------------------------------------------------------
 		function userMenuBtn() {
 			list_wrap.classList.toggle('show')
 		}
 		// -------------user menu 끝------------------------------------------------------------------------
    	
    	// -------------join 시작------------------------------------------------------------------------
    	// join id 체크
    	function joinChkId() {
    		if(join_frm.user_id.value == "") {
				alert('아이디를 입력하세요.')
				join_frm.user_id.focus()
				return false
			} else if(join_frm.user_id.value.length < 5) {
				join_error_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
				join_frm.user_id.focus()
				return false
			}
    		
    		axios.post('/user/ajaxCheckId', {
    			'user_id': join_frm.user_id.value
    		}).then(function(res) {
   				if (res.data =='2') {
   					join_error_msg.innerText = '사용할 수 있는 아이디입니다.'
       			} else if(res.data == '3') {
       				join_error_msg.innerText = '이미 사용중인 아이디입니다.' 
       			} else {
       				join_error_msg.innerText = '문제 발생.'
       			}
    		})
    	}
    	
    	// join submit 체크
    	function joinChk() {
    		if(join_error_msg.innerText == '') {
    			alert('아이디 중복체크를 완료해주세요.')
    			join_error_msg.innerText = ''
    			id_check_btn.focus()
    			return false
    		} else if(join_error_msg.innerText == '이미 사용중인 아이디입니다.') {
    			alert('새로운 아이디를 입력해주세요.')
    			join_error_msg.innerText = ''
    			join_frm.user_id.focus()
    			return false
    		} else if(join_error_msg.innerText != '사용할 수 있는 아이디입니다.') {
    			alert('문제가 발생했습니다. 다시 시도해주세요.')
    			join_error_msg.innerText = ''
    			return false
    		} else if(join_frm.user_pw.value.length < 5) {
				//alert('비밀번호는 5글자 이상이 되어야 합니다')
				join_error_msg.innerHTML = '비밀번호는 5글자 이상이 되어야 합니다'
				join_frm.user_pw.focus()
				return false
			} else if(join_frm.user_pw.value != join_frm.user_pw_chk.value) {
				//alert('비밀번호가 일치하지 않습니다')
				join_error_msg.innerHTML = '비밀번호가 일치하지 않습니다'
				join_frm.user_pw.focus()
				return false
			} else if(join_frm.user_nm.value  == "") {
				alert('이름을 입력하세요.')
				join_frm.user_nm.focus()
				return false
			} else if(join_frm.user_nm.value.length > 0) {
				const korean= /[^가-힣]/
				if(korean.test(join_frm.user_nm.value)) {
					//alert('올바른 이름을 입력하세요')
					join_error_msg.innerHTML = '올바른 이름을 입력하세요'
					join_frm.user_nm.focus()
					return false
				}
			}
    		
    		// join - ajax
    		let parameter = {
					'user_id': join_frm.user_id.value,
					'user_pw': join_frm.user_pw.value,
					'nm': join_frm.user_nm.value
			}
			axios.post('/user/ajaxJoin', parameter).then(function(res) {
				if(res.data == '1') {
					// 회원가입 성공, 자동로그인, index페이지
					alert('회원가입을 축하합니다!')
					location.reload()
				} else {
					join_error_msg.innerText = '문제가 발생했습니다.'
				}
			})
    	}
    	// -------------join 끝------------------------------------------------------------------------
    	
    	// -------------login 시작------------------------------------------------------------------------
		// login - check
		function loginChk() {
			if(login_frm.user_id.value.length < 5) {
				login_error_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
				login_frm.user_id.focus()
				return false
			} else if(login_frm.user_pw.value.length < 5) {
				login_error_msg.innerHTML = '비밀번호를 확인해 주세요'
				login_frm.user_pw.focus()
				return false
			}
			
			// login - ajax
			let parameter = {
    				'user_id': login_frm.user_id.value,
    				'user_pw': login_frm.user_pw.value
    		}
    		
    		axios.post('/user/ajaxLogin', parameter).then(function(res) {
    			// 1: 로그인 성공 2: 아이디없음 3: 비밀번호틀림 
    			if(res.data == '1') {
    				// 로그인 성공
    				location.reload()
    			} else if(res.data == '2') {
    				error_msg.innerText = '아이디를 확인해 주세요.'
    				login_frm.user_id.focus()
    			} else if(res.data == '3') {
    				error_msg.innerText = '비밀번호를 확인해 주세요.'
    				login_frm.user_pw.focus()
    			} else {
    				// 로그인 실패, 에러메시지 띄우기
    				error_msg.innerText = '에러가 발생했습니다.'
    			}
    		})
		}
		// -------------login 끝------------------------------------------------------------------------
		
		/*
		// email check 부분
		if(frm.email.value.length > 0) {
			const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
			if(!email.test(frm.email.value)) {
				alert('이메일을 확인해 주세요')
				frm.email.focus()
				return false
			}
		}
		*/
    	
		// -------------user menu 모달창 시작------------------------------------------------------------------------
        function loginBtnClick() {
			modalOffClick()
            document.querySelector('#modal_login_wrap').style.display = 'block'
            document.querySelector('#modal_bg').style.display = 'block'

            document.querySelector('html').classList.add('scrollDisable')
            document.querySelector('body').classList.add('scrollDisable')
        }

        function joinBtnClick() {
        	modalOffClick()
            document.querySelector('#modal_join_wrap').style.display = 'block'
            document.querySelector('#modal_bg').style.display = 'block'
            
           	document.querySelector('html').classList.add('scrollDisable')
            document.querySelector('body').classList.add('scrollDisable')
        }

        function modalOffClick() {  
            document.querySelector('#modal_login_wrap').style.display = 'none'
            document.querySelector('#modal_join_wrap').style.display = 'none'
            document.querySelector('#modal_bg').style.display = 'none'

            document.querySelector('html').classList.remove('scrollDisable')
            document.querySelector('body').classList.remove('scrollDisable')
        }

        document.querySelector('#login_btn').addEventListener('click', loginBtnClick)
        
        var joinBtnArr = document.querySelectorAll('.join_btn')
        joinBtnArr.forEach(function(item) {
            item.addEventListener('click', joinBtnClick)
        })
        
        var modalCloseArr = document.querySelectorAll('.modal_close')
        modalCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffClick)
        })
    	// -------------user menu 모달창 끝------------------------------------------------------------------------
        
    	// -------------chkSearchRest 시작------------------------------------------------------------------------
 		function chkSearchRest() {
 			
 			if(keyword.value == '') {
 				alert('검색어를 입력하세요.')
 				keyword.focus()
 				return false
 			} else if(keyword.value.length < 2) {
 				alert('검색어를 두 글자 이상 입력하세요.')
 				keyword.focus()
 				return false
 			}
 			
 			return true
 		}
 		// -------------chkSearchRest 끝------------------------------------------------------------------------
    	
 		
 		
 		
 		
 		
 		
        // -------------list map js 시작------------------------------------------------------------------------
	    //chkKeyword
		function chkKeyword(e) {
			if(e.keyCode == 13) {
				getSearchRestList()
				getBoundRestList()
			}
		}
		
		// 마커를 담을 배열입니다
		var markerList = [];
		
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.865280, 128.593418), // 지도의 중심좌표 
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var search_text = keyword.value;
		
		// ajax - latlng 내 db값 가져오기
		function getBoundRestList() {
			// 마커 모두 지우기
			markerList.forEach(function(marker) {
				marker.setMap(null)
			})
			
			// 리스트 모두 지우기
			while ( list_back.hasChildNodes() ) { list_back.removeChild( list_back.firstChild ); }
			
			let title = '현재';
			if(search_text != '') { title = search_text }
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
				
				search_text = ''
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
					search_text
				}
			}).then(function(res) {
				
				console.log(res.data)
				
				// db에 값이 없을 경우 에러메시지 출력 후 기본지도 위치로 재설정, 리스트에는 추천식당 띄우기
				if(res.data == '' || res.data.length == 0) {
					alert('검색 결과가 존재하지 않습니다.')
					location.href = '/index'
					return;
				}
				
				// 리스트 모두 지우기			
				list_back.innerHTML = ''
				
				//마커 모두 지우기
				markerList.forEach(function(marker) {
					marker.setMap(null)
				})
				
				createTitle(search_text)
				const bounds = new kakao.maps.LatLngBounds();
				
				/*
				res.data.forEach(function(item) {
					createMarker(item)
					createRestDiv(item)
				})
				*/
				//bounds.extend(new kakao.maps.LatLng(res.data[0].lat, res.data[0].lng));
				
				
				//map.setBounds(bounds);
				
				 var moveLatLon = new kakao.maps.LatLng(res.data[0].lat, res.data[0].lng);
				 map.setCenter(moveLatLon);
			})
		}
		
		kakao.maps.event.addListener(map, 'tilesloaded', getBoundRestList)
		
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
				
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
			let heading = document.createElement('h2')
			let rest_list_wrap = document.createElement('div')
			rest_list_wrap.id = 'rest_list_wrap'
			
			heading.innerHTML = `\${e} 지역의 맛집 목록`
			
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
	
		kakao.maps.load(function() {
			getSearchRestList()
	 	})
	 	// -------------list map js 끝------------------------------------------------------------------------
    </script>
</body>
</html>

