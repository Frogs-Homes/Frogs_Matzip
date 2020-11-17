<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css?dww=23333">
</c:forEach>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>${title}</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/${header_temp}.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
		
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
	    <footer>
	        <dl>
	            <dt>이 페이지는 포트폴리오를 위해서 제작되었습니다.</dt>
	            <dd>상호 및 서비스는 실제와 무관합니다.</dd>
	        </dl>
	    </footer>
    </div>
</body>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
<script>
window.onload = function() {
	 $('#slider').slick({
		    slidesToShow: 4,
		    slidesToScroll: 1,
		    autoplay: true,
		    autoplaySpeed: 4000,
		    nextArrow:$('.next'),
		    prevArrow:$('.prev'), 
		    pauseOnHover: false,
		    responsive: [{
		        breakpoint: 768,
		        settings: {
		            slidesToShow: 3
		        }
		    }, {
		        breakpoint: 520,
		        settings: {
		            slidesToShow: 3
		        }
		    }]
	});
}
</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d88fdcc4a19e51b35f8bf4dc0300b352&libraries=services"></script>
<c:forEach items="${js}" var="item">
	<script src="/res/js/${item}.js"></script>
</c:forEach>
</html>

