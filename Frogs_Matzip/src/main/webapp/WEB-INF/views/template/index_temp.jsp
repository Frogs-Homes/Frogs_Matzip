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
<title>${title}</title>
</head>
<body>
	<div class="main_back">
        <header>
            <div class="head">
                <a id="nav_logo" href="">FrogsMatzip</a>
                <ul class="nav_wrap">
                    <li onclick="loginChk()">로그인</li>
                    <li>회원가입</li>
                </ul>
            </div>
        </header>
        <div class="find_con">
            <a class="title" href="#">솔직한 리뷰, 믿을 수 있는 평점!<br>FrogsMatzip</a>

            <form>
                <fieldset>
                        <legend class="hidden">검색</legend>
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
    
    <div>
    	
    </div>
    <script>
    	function loginChk() {
    		
    	}
    </script>
</body>
</html>

