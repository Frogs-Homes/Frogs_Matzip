<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container_back">
    <div class="container">
        <div class="title">
            <h1><span class="material-icons">home</span>MY PAGE</h1>
        </div>
        <div class="usermenu_back">
            <div class="usermenu_wrap">
                <img src="./img/default_img.png" id="profile_img" alt="기본 프로필">
                <div class="user_nm">박철민 님</div><br>
                <button class="pw_change"><span class="material-icons">create</span>비밀번호 변경</button>
                <button class="profile_change"><span class="material-icons">photo_camera</span>프로필 변경</button>
            </div>
        </div>
        <div class="fav_list_back">
            <div class="fav_list_title"><span class="material-icons">favorite</span>나의 찜 목록</div>
            <div class="fav_list_wrap">
                <div class="fav_list">
                    <img src="./img/돼지고기.jpg" class="fav_img" alt="">
                    <div class="fav_list_nm">이모네 돼지국밥<span>3.8</span></div>
                </div>
                <div class="fav_list">
                    <img src="./img/돼지고기.jpg" class="fav_img" alt="">
                    <div class="fav_list_nm">이모네 돼지국밥<span>3.8</span></div>
                </div>
                <div class="fav_list">
                    <img src="./img/돼지고기.jpg" class="fav_img" alt="">
                    <div class="fav_list_nm">이모네 돼지국밥<span>3.8</span></div>
                </div>
                <div class="fav_list">
                    <img src="./img/돼지고기.jpg" class="fav_img" alt="">
                    <div class="fav_list_nm">이모네 돼지국밥<span>3.8</span></div>
                </div>
            </div>
            <div class="more_btn_wrap">
                <div id="moreBtn" class="more_btn"><span class="material-icons">expand_more</span><button id="reviewMoreBtn">더 보기</button><span class="material-icons">expand_more</span></div>
            </div>
        </div>
        <div class="review_list_back">
            <div class="review_list_title"><span class="material-icons">notifications</span>나의 REVIEW</div>
            <div class="review_list_wrap">
                <div class="review_list">
                    <img src="./img/돼지고기.jpg" class="review_img" alt="">
                    <div class="ctnt_wrap">
                        <div class="list_nm">이모네 돼지국밥<span>3.8</span></div>
                        <div class="list_ctnt"><span>안녕하세요 ddddddddddddddddddddddddddddddddddddddddddddddgk하하</span></div>
                    </div>
                    <div id="user_btn">
                        <button class="review_mod">수정</button>
                        <button class="review_del">삭제</button>
                    </div>
                </div>
                <div class="review_list">
                    <img src="./img/돼지고기.jpg" class="review_img" alt="">
                    <div class="ctnt_wrap">
                        <div class="list_nm">이모네 돼지국밥<span>3.8</span></div>
                        <div class="list_ctnt"><span>안녕하세요 하하하하하하하</span></div>
                    </div>
                    <div id="user_btn">
                        <button class="review_mod">수정</button>
                        <button class="review_del">삭제</button>
                    </div>
                </div> 
            </div>
            <div class="more_btn_wrap">
                <div id="moreBtn" class="more_btn"><span class="material-icons">expand_more</span><button id="reviewMoreBtn">더 보기</button><span class="material-icons">expand_more</span></div>
            </div>
        </div>
    </div>
</div>