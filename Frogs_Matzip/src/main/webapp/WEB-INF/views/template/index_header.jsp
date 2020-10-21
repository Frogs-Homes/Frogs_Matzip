<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<div class="main_back">
        <header>
            <div class="head">
               <h2><a id="lnb_logo" href="/index">FrogsMatzip</a></h2>
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
			<c:if test="${loginUser.admin == '1'}">
				<a href="/rest/reg">신규 가게 등록</a>
				<hr>
			</c:if>
			<a>로그인필요없는메뉴</a>
			<a>로그인필요없는메뉴</a>
			<a>로그인필요없는메뉴</a>
			<hr>
			<c:choose>
				<c:when test="${loginUser == null}">
					<a id="login_btn">로그인</a>
					<a class="join_btn">회원가입</a>
				</c:when>
				<c:otherwise>
					<a>마이페이지</a>
					<a>내가 쓴 리뷰</a>
					<a>좋아요 목록</a>
					<a href="/user/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
       </div>
            </nav>
         </div>
     </header>
     <div class="search_wrap">
         <h1 class="hidden">개굴플레이트</h1>
         <p>솔직한 리뷰, 믿을 수 있는 평점!<br>FrogsMatzip</p>
          <form action="/rest/listMap" method="GET">
           <fieldset>
            <legend class="hidden">검색창</legend>
            <label for="search_bar" class="hidden">위치</label>
            <input type="text"  name="search_place" id="search_bar" placeholder="지역,식당 또는 음식">
            <input type="submit" id="search_btn" onclick="searchRest()" value="검색">
           </fieldset>
        </form>
    </div>
</div>