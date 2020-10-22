<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!--menuList-->
<div id="menu_back">
    <div id="menu_wrap">
        <div class="menulist"><img src="./img/곱창.jpg" class="menu" alt=""></div>
        <div class="menulist"><img src="./img/곱창.jpg" class="menu" alt=""></div>
        <div class="menulist"><img src="./img/곱창.jpg" class="menu" alt=""></div>
        <div class="menulist"><img src="./img/곱창.jpg" class="menu" alt=""></div>
        <div class="menulist"><img src="./img/곱창.jpg" class="menu" alt=""></div>
    </div>
</div>

<!--ctnt-->
<div id="column_back">
    <div id="ctnt_back">
		<div id="title_wrap">
            <div id="title">
                <h1>${data.nm}</h1>
                <strong id="grade"><span>4.2</span></strong>
                <!-- 관리자용 음식사진등록창 이동 -->
				<div>
					<c:if test="${loginUser.admin == '1'}">
						<a href="/rest/regFood">음식사진 등록창 이동</a>
					</c:if>
				</div>
            </div>
            <div id="rest_action_button">

            </div>
		</div>

        <div id="user_content_wrap">

        </div>

        <section id="rest_detail">
            <div id="ctnt">
                <table>
                    <caption class="hidden">rest_detail</caption>
                    <tbody>
                        <tr>
                            <th>주소</th>
                            <td>${data.addr}</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${data.phone}</td>
                        </tr>
                        <tr>
                            <th>음식종류</th>
                            <td>${data.i_category}</td>
                        </tr>
                        <tr>
                            <th>가격대</th>
                            <td>${data.price_range}</td>
                        </tr>
                        <tr>
                            <th>영업시간</th>
                            <td>${data.open_time} ~ ${data.close_time}</td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td>${data.ctnt}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="menu_pic">
                <img src="./img/menu/미성옥메뉴판.jpg" alt="">
            </div>
        </section>

        <section id="rest_review">
            <div id="review_title">
                <h2>리뷰</h2>
                <span>(53)</span>
            </div>
            <div id="review_ctnt">
                <div id="user_wrap">

                </div>
                <div id="user_ctnt">

                </div>
            </div>
        </section>
    </div>
</div>  

    
    
    
    
    
    
    