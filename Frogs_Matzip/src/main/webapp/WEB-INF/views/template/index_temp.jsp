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
                <h2><a id="lnb_logo" href="">FrogsMatzip</a></h2>
                <nav class="lnb">
                    <h2 class="hidden">사용자 이용메뉴</h2>
                    <ul class="lnb_wrap">
                        <li id="login_btn">로그인</li>
                    </ul>
                </nav>
             </div>
         </header>
         <div class="search_wrap">
             <h1 class="hidden">개굴플레이트</h1>
             <p>솔직한 리뷰, 믿을 수 있는 평점!</p>
             <form>
                 <fieldset>
                         <legend class="hidden">검색창</legend>
                         <label for="location" class="hidden">위치</label>
                         <input class="main_input" type="text" id="location"  value="지역,식당 또는 음식">
                         <input class="main_input button" type="button" value="검색" id="button">
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
            <div id="modal_value">
                <form id="login_frm">
                    <label for="user_id" class="hidden"></label>
                    <input type="text" name="user_id" class="login_id" placeholder="   아이디"><br>
                    <label for="user_pw" class="hidden"></label>
                    <input type="password" name="user_pw" class="login_pw" placeholder="   비밀번호"><br>
                    <input type="button" class="login_btn" value="로그인">
                </form>
                <div class="join"><p class="join_ctnt">개굴플레이트 계정이 없으세요? <span class="join_click">회원 가입</span></p></div>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>

        <div id="modal_join_wrap">
            <div id="modal_join">
                <h3>회원가입</h3>
                <div class="msg">${msg}</div>
            </div>
            <div id="modal_value">
                <form id="join_frm">
                    <label for="user_id" class="hidden"></label>
                    <input type="text" name="user_id" class="join_id" placeholder="    아이디"><br>
                    <button type="button" class="check_id" onclick="checkId()">중복체크</button>
                    <label for="user_pw" class="hidden"></label>
                    <input type="password" name="user_pw" class="join_pw" placeholder="   비밀번호"><br>
                    <label for="user_pw_chk" class="hidden"></label>
                    <input type="password" name="user_pw_chk" class="join_pw" placeholder="   비밀번호 확인"><br>
                    <label for="user_nm" class="hidden"></label>
                    <input type="text" name="user_nm" class="join_nm" placeholder="  이름"><br>
                    <input type="submit" class="join_btn" value="회원가입">
                </form>
                <div id="idChkResult" class="msg"></div>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>
    </div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
    
    	// join - ajax
    	function joinAjax() {
    		let parameter = {
    				'user_id': join_frm.user_id.value,
    				'user_pw': join_frm.user_pw.value,
    				'nm': join_frm.user_nm.value
    		}
    		
    		axios.post('/ajaxJoin', parameter).then(function(res) {
    			if(res.data==1) {
    				// 성공, 자동로그인, index페이지
    				
    			}
    		})
    	}
    
    	function checkId() {
    		const user_id = join_frm.user_id.value
    		axios.post('/ajaxCheckId', {
    			user_id
    		}).then(function(res) {
    			
    			if(user_id !=""){
    				if(res.data =='2'){
        				idChkResult.innerText = '사용할 수 있는 아이디 입니다.'
        			} else if(res.data == '3') {
        				idChkResult.innerText = '이미 사용중인 아이디 입니다.' 
        			}
    			} else {
    				alert('아이디를 입력하세요.')
    			}
    			
    		})
    	}
    	
    	// join - check
    	function joinChk() {
			if(frm.user_id.value.length < 5) {
				//alert('아이디는 5글자 이상이 되어야 합니다')
				join_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
				frm.user_id.focus()
				return false
			} else if(frm.user_pw.value.length < 5) {
				//alert('비밀번호는 5글자 이상이 되어야 합니다')
				join_msg.innerHTML = '비밀번호는 5글자 이상이 되어야 합니다'
				frm.user_pw.focus()
				return false
			} else if(frm.user_pw.value != frm.user_pwre.value) {
				//alert('비밀번호가 일치하지 않습니다')
				join_msg.innerHTML = '비밀번호가 일치하지 않습니다'
				frm.user_pw.focus()
				return false
			} else if(frm.nm.value.length > 0) {
				const korean= /[^가-힣]/
				if(korean.test(frm.nm.value)) {
					//alert('올바른 이름을 입력하세요')
					join_msg.innerHTML = '올바른 이름을 입력하세요'
					frm.nm.focus()
					return false
				}
			}
			
			joinAjax()
    	}
    	
    	// login - ajax
    	function loginAjax() {
    		let parameter = {
    				'user_id': join_frm.user_id.value,
    				'user_pw': join_frm.user_pw.value
    		}
    		
    		axios.post('/ajaxLogin', parameter).then(function(res) {
    			if(res.data==1) {
    				// 로그인 성공
    			} else {
    				// 로그인 실패, 에러메시지 띄우기
    			}
    		})
    	}
    	
		// login - check
		function loginChk() {
			if(frm.user_id.value.length < 5) {
				//alert('아이디는 5글자 이상이 되어야 합니다')
				login_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
				frm.user_id.focus()
				return false
			} else if(frm.user_pw.value.length < 5) {
				//alert('비밀번호는 5글자 이상이 되어야 합니다')
				login_msg.innerHTML = '비밀번호는 5글자 이상이 되어야 합니다'
				frm.user_pw.focus()
				return false
			}
			
			loginAjax()
		}
		
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

        function modalOffjoinClick() {
            document.querySelector('#modal_login_wrap').style.display = 'none'
        }

        document.querySelector('#login_btn').addEventListener('click', loginBtnClick)
        document.querySelector('.join_click').addEventListener('click', joinBtnClick)
        var modalCloseArr = document.querySelectorAll('.modal_close')
        var modalLoginCloseArr = document.querySelectorAll('.join_click')
        modalCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffClick)
        })
        modalLoginCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffjoinClick)
        })
        
        
        /*
        // ajax 참고용
        function ajaxSelMenuList() {
			axios.get('/rest/ajaxSelMenuList', {
				params: {
					i_rest: ${data.i_rest}
				}
			}).then(function(res) {
				menuList = res.data
				refreshMenu()			
			})
		}
        */
    </script>
</body>
</html>

