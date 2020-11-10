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
		<input type="hidden" id="ctg_val" value="">
	</nav>
</div>

<div id="ctg_list_wrap"></div>