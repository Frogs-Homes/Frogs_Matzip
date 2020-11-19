<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="ctg_title_wrap">
	<h2 id="ctg_list_title">카테고리별 맛집 목록</h2>
	<p>아침부터 저녁까지 대구에서 다~ 대구!</p>
</div>
<nav id="ctg_lnb"><ul><c:forEach items="${categoryList}" var="item"><li id="label_${item.i_category}">${item.category_val}</li><input type="hidden" id="ctg_${item.i_category}" value="${item.i_category}"></c:forEach></ul>
</nav>

<div id="ctg_list_wrap">
	<!-- 
	<div class="ctg_rest_wrap">
		<div class="rest_pic_wrap">
			<img src="/res/img/rest/${item.i_rest}/food_pic/${item.food_pic}" alt="${item.nm}의 음식 사진">
		</div>
		<div class="rest_ctnt_wrap>
			<div class="rest_ctnt_title_wrap">
				<h3><a href="/rest/detail?i_rest=${item.i_rest}">${item.nm}</a></h3>
				<strong>${item.avg_grade}</strong><br>
				<div>가고싶다친구</div>
			</div>
		       <p>${item.addr}</p><br>
		       <p>review:${item.review_cnt}</p>
		</div>
	</div>
	 -->
</div>

<script>var i_ctg = ${param.i_category == null ? 1 : param.i_category}</script>