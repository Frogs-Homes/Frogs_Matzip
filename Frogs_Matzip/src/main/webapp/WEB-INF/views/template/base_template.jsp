<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css?ddf=2">
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
    	
 		// -------------searchRest 시작------------------------------------------------------------------------
	 	kakao.maps.load(function() {
	 		var ps = new kakao.maps.services.Places(); 
	 		let keyword = "${place.search_place}"
	 		
			
	 		ps.keywordSearch( keyword, function(data, status, pagination) {
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
	 	});
 	
 		function searchRest() {
 			
 			if(search_bar.value == "") {
 				alert('검색어를 입력하세요.')
 				search_bar.focus()
 				return false
 			}
 		}	

 		
 		// -------------searchRest 끝------------------------------------------------------------------------
 		
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
    	
    	// 모달창
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
        
    </script>
</body>
</html>

