<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="ctg_title_wrap">
	<h2 id="ctg_list_title">카테고리별 식당 목록</h2>
	<nav id="ctg_lnb">
		<ul>
			<c:forEach items="${categoryList}" var="item">
				<label for="ctg_${item.i_category}" onclick="addOnCtg(${item.i_category})" id="label_${item.i_category}">${item.category_val}</label>
				<input type="hidden" id="ctg_${item.i_category}" value="${item.i_category}">
			</c:forEach>
		</ul>
	</nav>
</div>

<div id="ctg_list_wrap"></div>
<script>var i_ctg = ${param.i_category == null ? 1 : param.i_category}</script>