<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="best_wrap">
     <section id="best">
        <div class="res1_wrap">
            <h2>Best restaurants in Frogs</h2>
            <div id="rest_menu_wrap">
            	<for:each items="${recRestList}" var="item">
            		<dl>
            			<a href="#">
            				<div class="restaurant">
            					<img src="/res/img/${item.menu_pic}.jpg" alt="">
            					<dt class="rest_nm">${item.rest_nm} <span class="rest_score">${item.score}</span></dt>
            					<dd class="rest_category">${item.category}</dd>
            					<dd class="address">${item.addr}</dd>
            				</div>
            			</a>
            		</dl>
            	</for:each>
            </div>
            <!-- 
            <ol>
                <li>
                    <dl><a href="#">
                            <div class="restaurant">
                                <img src="/res/img/곱창.jpg" alt="">
                                <dt class="rest_nm">맛집부추곱창</dd>
                                <dd class="score">평점 4.3</dd>
                                <dd class="address">방배/반포 - 고기요리</dd>
                            </div>
                        </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/돼지고기.jpg" alt="">
                            <dt class="rest_nm">더꽃돈</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/파스타.jpg" alt="">
                            <dt class="rest_nm">마리오파스타</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/새우.jpg" alt="">
                            <dt class="rest_nm">새우22</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
            </ol>
        </div>
        두번째 줄 시작
        <div class="res2_wrap">
            <ol>
                <li>
                    <dl><a href="#">
                            <div class="restaurant">
                                <img src="/res/img/곱창.jpg" alt="">
                                <dt class="rest_nm">맛집부추곱창</dt>
                                <dd class="score">평점 4.3</dd>
                                <dd class="address">방배/반포 - 고기요리</dd>
                            </div>
                        </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/돼지고기.jpg" alt="">
                            <dt class="rest_nm">더꽃돈</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/파스타.jpg" alt="">
                            <dt class="rest_nm">마리오파스타</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
                <li>
                    <dl><a href="#">
                        <div class="restaurant">
                            <img src="/res/img/새우.jpg" alt="">
                            <dt class="rest_nm">새우22</dt>
                            <dd class="score">평점 4.3</dd>
                            <dd class="address">방배/반포 - 고기요리</dd>
                        </div>
                    </a>
                    </dl>
                </li>
            </ol>
             -->
        </div>
     </section>
 </div>
 
 <div class="theme_wrap">
    <h2 class="hidden">테마별 인기맛집</h2>
     <section id="theme">
         <div class="item1 item"></div>
         <div class="item2 item"></div>
         <div class="item3 item"></div>
         <div class="item4 item"></div>
         <div class="item5 item"></div>
     </section>
 </div>