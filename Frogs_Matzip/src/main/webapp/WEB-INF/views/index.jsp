<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="best_wrap">
     <section id="best">
        <div class="rest_wrap">
            <h2>Best restaurants in Frogs</h2>
            <div id="rest_menu_wrap">
            	<div id="slider">
	            	<ol>
		            	<c:forEach items="${recRestList}" var="item">
		                <li>
		                    <dl><a href="/rest/detail?i_rest=${item.i_rest}">
		                            <div class="restaurant">
		                                <img src="/res/img/rest/${item.i_rest}/food_pic/${item.food_pic}" alt="">
		                                <dt class="rest_nm">${item.nm} <span class="score">${item.avg_grade}</span></dt>
		            					<dd class="address">${item.addr} - ${item.food_category}</dd>
		                            </div>
		                        </a>
		                    </dl>
		                </li>
		                </c:forEach>
		            </ol>  
		        </div>
            </div>
            <div id="btnWrap">
                    <button class="btnPrev"><span class="material-icons">keyboard_arrow_left</span></button>
                    <button class="btnNext"><span class="material-icons">keyboard_arrow_right</span></button>
            </div>
        </div>
     </section>
 </div>
 
 
<div class="thema_container">
    <div class="thema_wrap">
        <h2>FROGS THEMA PICK</h2>
        <a href="rest/theme">About <span class="material-icons">east</span></a>
        <div class="con">
            <div class="left">
                <img src="/res/img/food.jpg" alt="">
            </div>
            <div class="right">
                <div class="thema1">
                    <div class="thema_ctnt">
                        <div class="title_wrap">
                            <p class="title">KOREAN FOOD</p><br>
                            <p class="sub_title">한식    <span class="click">Click</span></p><br><br><br>
                            <p class="memo">"한식 맛집은 다모았다!!"</p>
                        </div>
                        <div class="title_img"></div>
                    </div>
                </div>
                <div class="thema2">
                    <div class="thema_ctnt">
                        <div class="title_wrap">
                            <p class="title">Cafe & Dessert</p><br>
                            <p class="sub_title">카페 디저트    <span class="click">Click</span></p><br><br><br>
                            <p class="memo">"#카페 는 말이야..!"</p>
                        </div>
                        <div class="title_img"></div>
                    </div>
                </div>
                <div class="thema3">
                    <div class="thema_ctnt">
                        <div class="title_wrap">
                            <p class="title">WESTERN FOOD</p><br>
                            <p class="sub_title">양식    <span class="click">Click</span></p><br><br><br>
                            <p class="memo">"언제나 배고픈 당신을 위해!"</p>
                        </div>
                        <div class="title_img"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>