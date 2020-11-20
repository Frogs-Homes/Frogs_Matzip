<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<div id="list_back">
		<h2 id="place_title"><span id="place_nm"></span> 지역의 맛집 목록</h2>
	    <div id="rest_list_wrap"></div>
	    <!-- 
	    <div class="list_wrap">
	    	<div class="list_ctnt_wrap">
	    		<div class="matzip_list">
	    			<a href="/rest/detail?i_rest=${item.i_rest}">
	    				<img src="/res/img/rest/${item.i_rest}/food_pic/${item.food_pic} alt="${item.nm}의 음식 사진">
	    			</a>
	    		</div>
	    		<div class="ctnt_wrap">
	    			<h3><a href="/rest/detail?i_rest=${item.i_rest}">${item.nm}</a></h3>
	    			<strong>${item.avg_grade}</strong>
	    			<br>
	    			<p>${item.district_val} - ${item.category_val}</p>
	    			<br>
	    			<p>review: ${item.review_cnt}</p>
	    		</div>
	    	</div>
	    </div>
	     -->
	</div>
	
	<div id="map"></div>
</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d88fdcc4a19e51b35f8bf4dc0300b352&libraries=services"></script>