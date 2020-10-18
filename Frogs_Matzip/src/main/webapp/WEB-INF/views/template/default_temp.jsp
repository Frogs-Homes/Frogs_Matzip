<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css?fa=1">
</c:forEach>

<title>${title}</title>
</head>
<body>
	<header>
		<div id="header_back">
			<div id="logo_back">
				<a id="header_logo" href="">FrogsMatzip</a>
			</div>
			<div id="search_back">
				<div class="search_wrap">
					<form onsubmit="searchPlaces(); return false;" id="search_bar">
						<input type="text" name="search_place" class="search_bar" id="keyword" placeholder="지역, 식당 또는 음식" >
						<button type="submit" class="search_icon"><span class="material-icons" >search</span></button>	
					</form>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
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

	<div id="container">
		<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	</div>
	
	<footer>
        <dl>
            <dt>이 페이지는 포트폴리오를 위해서 제작되었습니다.</dt>
            <dd>상호 및 서비스는 실제와 무관합니다.</dd>
        </dl>
    </footer>
    
    <script>
 		// -------------user menu 시작------------------------------------------------------------------------
		function userMenuBtn() {
			list_wrap.classList.toggle('show')
		}
		// -------------user menu 끝------------------------------------------------------------------------
    </script>
</body>
</html>