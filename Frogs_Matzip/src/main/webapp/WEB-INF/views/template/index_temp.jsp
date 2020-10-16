<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css">
</c:forEach>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>${title}</title>
</head>
<body>
	<div class="main_back">
         <header>
             <div class="head">
                <h2><a id="lnb_logo" href="#">FrogsMatzip</a></h2>
                <nav class="lnb">
                    <h2 class="hidden">사용자 이용메뉴</h2>
                    <div id="lnb_wrap">
	                    <div id="img_back">
	                    	<div class="user_button" onclick="userMenuBtn()">
				                <span class="material-icons">menu</span>
				                <div class="img_wrap">
				                	<c:choose>
				                		<c:when test="${loginUser.profile_img != null}">
				                			<img class="default_img" src="/res/img/user/${loginUser.i_user}/${loginUser.profile_img}.png">
				                		</c:when>
				                		<c:otherwise>
				                			<img class="default_img" src="/res/img/default_img.png">
				                		</c:otherwise>
				                	</c:choose>
				                </div>
				            </div>
				        </div>
				        <div id="list_wrap">
				        	<c:choose>
		                		<c:when test="${loginUser == null}">
		                			<a id="login_btn">로그인</a>
		                			<a>회원가입(넣을거여?)</a>
		                		</c:when>
		                		<c:otherwise>
		                			<a>마이페이지</a>
		                			<a>내가 쓴 리뷰</a>
		                			<a>좋아요 목록</a>
		                		</c:otherwise>
		                	</c:choose>
		                	<hr>
		                	<a>로그인필요없는메뉴</a>
		                	<a>로그인필요없는메뉴</a>
		                	<a>로그인필요없는메뉴</a>
				        </div>
			        </div>
                </nav>
             </div>
         </header>
         <div class="search_wrap">
             <h1 class="hidden">개굴플레이트</h1>
             <p>솔직한 리뷰, 믿을 수 있는 평점!</p>
              <form>
	              <fieldset>
		              <legend class="hidden">검색창</legend>
		              <label for="search_bar" class="hidden">위치</label>
		              <input type="text" id="search_bar" placeholder="지역,식당 또는 음식">
		              <input type="button" id="search_btn" onclick="searchRest()" value="검색">
	              </fieldset>
            </form>
        </div>
    </div>

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
                	<p class="join_ctnt">개굴플레이트 계정이 없으세요? <span id="join_btn">회원 가입</span></p>
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
    <script>
 		// -------------user menu 시작------------------------------------------------------------------------
 		function userMenuBtn() {
 			list_wrap.classList.toggle('show')
 		}
 		// -------------user menu 끝------------------------------------------------------------------------
    	
 		// -------------searchRest 시작------------------------------------------------------------------------
 		function searchRest() {
 			if(search_bar.value == "") {
 				alert('검색어를 입력하세요.')
 				search_bar.focus()
 				return false
 			} else {
 				let search = search_bar.value
 				location.href='/rest/listMap'
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
    		
    		axios.post('/ajaxCheckId', {
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
			axios.post('/ajaxJoin', parameter).then(function(res) {
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
    		
    		axios.post('/ajaxLogin', parameter).then(function(res) {
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
            document.querySelector('#modal_login_wrap').style.display = 'block'
            document.querySelector('#modal_bg').style.display = 'block'

            document.querySelector('html').classList.add('scrollDisable')
            document.querySelector('body').classList.add('scrollDisable')
        }

        function joinBtnClick() {
        	document.querySelector('#modal_login_wrap').style.display = 'none'
            document.querySelector('#modal_join_wrap').style.display = 'block'
        }

        function modalOffClick() {  
            document.querySelector('#modal_login_wrap').style.display = 'none'
            document.querySelector('#modal_join_wrap').style.display = 'none'
            document.querySelector('#modal_bg').style.display = 'none'

            document.querySelector('html').classList.remove('scrollDisable')
            document.querySelector('body').classList.remove('scrollDisable')
        }

        document.querySelector('#login_btn').addEventListener('click', loginBtnClick)
        document.querySelector('#join_btn').addEventListener('click', joinBtnClick)
        
        var modalCloseArr = document.querySelectorAll('.modal_close')
        
        modalCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffClick)
        })
    </script>
</body>
</html>

