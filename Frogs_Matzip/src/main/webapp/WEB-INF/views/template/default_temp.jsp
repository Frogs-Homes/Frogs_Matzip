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
    <div id="header_back">
        <div id="logo_back">
            <a id="header_logo" href="">FrogsMatzip</a>
        </div>
        <div id="search_back">
            <div class="search_wrap">
                <input type="text" class="search_bar" placeholder="지역, 식당 또는 음식">
                <div class="search_icon">
                    <span class="material-icons">search</span>
                </div>
            </div>
        </div>
        <div id="img_back">
            <div class="user_button">
                <span class="material-icons">menu</span>
                <div class="img_wrap">
                	<c:choose>
                		<c:when test="${loginUser.profile_img != null}">
                			<img class="default_img" src="/res/img/user/${loginUser.i_user}/${loginUser.profile_img}">
                		</c:when>
                		<c:otherwise>
                			<img class="default_img" src="/res/img/default_img.png">
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
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
</body>
</html>