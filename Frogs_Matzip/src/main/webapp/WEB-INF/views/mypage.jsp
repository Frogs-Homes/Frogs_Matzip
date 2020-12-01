<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <div class="fav_list_wrap">
        <div class="fav_list_title"><span class="material-icons">favorite</span>나의 찜 목록</div>
    </div>
    <div class="review_list_wrap">
        <div class="review_list_title"><span class="material-icons">notifications</span>나의 REVIEW</div>
    </div>
</div>