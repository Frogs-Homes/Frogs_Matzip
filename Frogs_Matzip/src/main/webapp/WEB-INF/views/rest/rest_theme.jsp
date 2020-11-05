<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="ctg_title_wrap">
	<h2 id="ctg_list_title">카테고리별 식당 목록</h2>
	<nav id="ctg_lnb">
		<ul>
			<c:forEach items="${categoryList}" var="item">
				<li>${item.category_val}</li>
			</c:forEach>
		</ul>
	</nav>
</div>

<div id="ctg_list_wrap">
	<c:forEach items="${categoryList}" var="item">
		let i_category = ${item.i_category}
		<div class="ctg_rest_wrap">
			<div>이미지영역</div>
			<div>내용영역</div>
		</div>
	</c:forEach>
</div>