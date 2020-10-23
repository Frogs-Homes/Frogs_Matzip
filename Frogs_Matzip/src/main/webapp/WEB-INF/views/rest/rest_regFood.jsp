<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="msg">${msg}</div>

<form id="frm" action="/rest/regFood" method="post" enctype="multipart/form-data">
	<label for="menu_pic_file">음식 사진</label>
	<input type="hidden" name="i_rest" value="${data.i_rest}">
    <input type="file" name="food_list" multiple><br>
    
    <input type="submit" value="등록">

</form>