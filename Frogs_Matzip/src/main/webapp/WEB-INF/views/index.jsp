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
 
 
 <div class="theme_wrap">
     <h2>테마별 인기맛집</h2>
     <section id="theme">
         <div class="item1 item"></div>
         <div class="item2 item">
             <p>오늘은 FrogsMatzip에서 추천하는 곳에서 <br>
                 맛있는 한끼 어떠세요?</p>
         </div>
         <div class="item3 item"></div>
         <div class="item4 item"></div>
         <div class="item5 item"></div>
     </section>
 </div>