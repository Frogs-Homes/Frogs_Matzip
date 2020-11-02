<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="list_back">
	<h2><span id="place_nm"></span> 지역의 맛집 목록</h2>
    <div id="rest_list_wrap"></div>
    <!-- 
    <c:forEach items="${recRestList}" var="item">
	    <div class="list_wrap">
	        <div class="list_ctnt_wrap">
	            <div class="matzip_list">
	                <img src="${item.food_pic}" class="food_img" alt="${item.nm}의 음식 사진">
	            </div>
	            <div class="ctnt_wrap">
	                <h3><a href="#">${item.nm}</a></h3>
	                <strong>${item.avg_grade}</strong><br>
	                <p>${item.district}-${item.category_nm}</p><br>
	                <p>review:${item.review}</p>
	            </div>
	        </div>
	    </div>
    </c:forEach>
     -->
</div>

<div id="map"></div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d88fdcc4a19e51b35f8bf4dc0300b352&libraries=services"></script>