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
                <form action="">
                    <label for="user_id" class="hidden"></label>
                    <input type="text" name="user_id" class="input_id" placeholder="   아이디"><br>
                    <label for="user_pw" class="hidden"></label>
                    <input type="password" name="user_pw" class="input_pw" placeholder="   비밀번호"><br>
                    <input type="button" class="login_btn" value="로그인">
                </form>
                <div class="join"><p class="join_ctnt">개굴플레이트 계정이 없으세요? <span id="join_btn">회원 가입</span></p></div>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>
        <div id="modal_join_wrap">
            <div id="modal_join">
                <h3>회원가입</h3>
                <p>로그인하면 가고싶은 식당을<br>저장할 수 있어요</p>
                <form id="join_frm">
                    <label for="user_id">ID</label>
                    <input type="text" name="user_id">
                    <label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw">
                    <label for="user_pw_chk">비밀번호 확인</label>
                    <input type="password" name="user_pw_chk">
                    <label for="user_nm">이름</label>
                    <input type="text" name="user_nm">
                    <input type="button" value="회원가입" onclick="ajaxJoin()">
                </form>
            </div>
            <div class="modal_close"><span class="material-icons">clear</span></div>
        </div>
    </div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
    	// join ajax
    	
    	function ajaxJoin() {
    		let parameter = {
    				'user_id': join_frm.user_id.value,
    				'user_pw': join_frm.user_pw.value,
    				'nm': join_frm.user_nm.value
    		}
    		
    		axios.post('/ajaxJoin', parameter).then(function(res) {
    			if(res.data==1) {
    				// 성공, 자동로그인, index페이지
    			} else {
    				// 실패, paramter값 다시 박기, 회원가입 모달창
    			}
    		})
    	}
    
    	// 모달창
        function loginBtnClick() {
            document.querySelector('#modal_login_wrap').style.display = 'block'
            document.querySelector('#modal_bg').style.display = 'block'

            document.querySelector('html').classList.add('scroll_disable')
            document.querySelector('body').classList.add('scroll_disable')
        }

        function joinBtnClick() {
            document.querySelector('#modal_join_wrap').style.display = 'block'
            document.querySelector('#modal_bg').style.display = 'block'

            document.querySelector('html').classList.add('scroll_disable')
            document.querySelector('body').classList.add('scroll_disable')
            
        }

        function modalOffClick() {            
            document.querySelector('#modal_login_wrap').style.display = 'none'
            document.querySelector('#modal_join_wrap').style.display = 'none'
            document.querySelector('#modal_bg').style.display = 'none'

            document.querySelector('html').classList.remove('scroll_disable')
            document.querySelector('body').classList.remove('scroll_disable')
        }

        document.querySelector('#login_btn').addEventListener('click', loginBtnClick)
        document.querySelector('#join_btn').addEventListener('click', joinBtnClick)
        
        var modalCloseArr = document.querySelectorAll('.modal_close')
        
        modalCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffClick)
        })
        
        
        
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
    </script>
</body>
</html>

