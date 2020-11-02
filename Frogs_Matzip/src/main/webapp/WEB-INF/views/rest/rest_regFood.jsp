<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="inputFood" style="margin-top: 250px;">
	<div class="msg">${msg}</div>

	<form id="frm" action="/rest/regFood" method="post" enctype="multipart/form-data">
		<label for="menu_pic_file">음식 사진</label>
		<input type="hidden" name="i_rest" value="${data.i_rest}">
	    <input type="file" name="food_list" multiple><br>
	    
	    <input type="submit" value="등록">
	</form>
	
	<button onclick="moveDetail(${data.i_rest})">이전</button>
</div>


<script>
	function moveDetail(i_rest) {
		location.href = '/rest/detail?i_rest=' + i_rest
	}
</script>
