<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="msg">${msg}</div>
<form id="frm" action="/rest/reg" method="post" onsubmit="return chkFrm()">
    <label for="rest_nm">가게명</label>
    <input type="text" id="rest_nm" name="nm" required autofocus><br>
    <label for="addr">주소</label>
    <input type="text" id="addr" name="addr" placeholder="주소를 검색해주세요." onkeyup="changeAddr()">
    <button type="button" onclick="getLatLng()">좌표 가져오기</button><span id="resultGetLatLng"></span><br> <!--주소 검색하고 lat, lng에 담기-->
    <input type="hidden" name="lat" value="${data.lat == null ? 0 : data.lat}">
    <input type="hidden" name="lng" value="${data.lng == null ? 0 : data.lng}">
    <fieldset>
    	<legend>전화번호</legend>
    	<select id="phone_1">
    		<option value="0">--선택--</option>
    		<option value="053">053</option>
    		<option value="010">010</option>
    	</select>
    	<input type="tel" id="phone_2" minlength="3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">-
    	<input type="tel" id="phone_3" minlength="4" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">
		<input type="hidden" name="phone">
    </fieldset>
    <fieldset>
        <legend>영업시간</legend>
        <label for="open_time" class="hidden">영업 시작시간</label>
        <input type="time" name="open_time" id="open_time">
        ~
        <label for="close_time" class="hidden">영업 종료시간</label>
        <input type="time" name="close_time" id="close_time">
    </fieldset>
    <label for="category">음식 종류</label>
    <select id="category" name="i_category">
        <option value="0">--선택--</option>
            <c:forEach items="${categoryList}" var="item">
                <option value="${item.i_category}">${item.val}</option>
            </c:forEach>
    </select><br>
    <fieldset>
    	<legend>가격대</legend>
    	<input type="text" id="price_1">~
    	<input type="text" id="price_2">
    	<input type="hidden" name="price_range">
    </fieldset>
    <label for="menu_pic">메뉴판 사진</label>
    <input type="file" name="menu_pic" accept="image/*"><br>
    <label for="ctnt">비고</label>
    <input type="text" id="ctnt" name="ctnt"><br>
    <input type="submit" value="등록">
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94c71877afeaf03a3aba3cf7f9905b26&libraries=services"></script>
<script>
	// 가격대 input 합치기
	function addPriceRange() {
		let price_1 = document.querySelector('#price_1').value
		let price_2 = document.querySelector('#price_2').value
		
		frm.price_range.value = price_1 + '-' + price_2
	}

	// 전화번호 input 합치기
	function addPhone() {
		let phone_1 = document.querySelector('#phone_1').value
		let phone_2 = document.querySelector('#phone_2').value
		let phone_3 = document.querySelector('#phone_3').value
		
		frm.phone.value = phone_1 + '-' + phone_2 + '-' + phone_3
	}

	// submit 시 폼 양식 확인
	function chkFrm() {
		if(frm.rest_nm.value.length == 0) {
			alert('가게명을 입력해주세요')
			frm.rest_nm.focus()
			return false
		} else if(frm.addr.value.length < 9) {
			alert('주소를 확인해 주세요')
			frm.addr.focus()
			return false
		} else if(frm.lat.value == '0' || frm.lng.value == '0') {
			alert('좌표값을 가져와 주세요')
			return false
		} else if(frm.i_category.value == '0') {
			frm.cd_category.focus()
			return false
		} else if(document.querySelector('#phone_1').value == '0' || document.querySelector('#phone_2').value < 3 || document.querySelector('#phone_3').value < 4) {
			alert('전화번호를 입력해주세요.')
			return false
		} else if(frm.open_time.value == '' || frm.close_time.value == '') {
			alert('영업시간을 입력해주세요.')
			return false
		} else if(frm.i_category.value == '0') {
			alert('음식 종류를 선택해주세요.')
			return false
		} else if(document.querySelector('#price_1').value == '' || document.querySelector('#price_2').value == '') {
			alert('가격대를 입력해주세요.')
			return false
		}
		
		addPhone()
		addPriceRange()
	}
	
	function changeAddr() {
		resultGetLatLng.innerText = ''
		frm.lat.value = '0'
		frm.lng.value = '0'
	}

	var geocoder = new kakao.maps.services.Geocoder();

	function getLatLng() {
		var addrStr = frm.addr.value
		
		if(addrStr.length < 9) {
			alert('주소를 확인해 주세요')
			frm.addr.focus()
			return
		}
		
		geocoder.addressSearch(addrStr, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
		        console.log(result[0]);
		        
		        if(result.length > 0) {
		        	resultGetLatLng.innerText = 'v'
		        	frm.lat.value = result[0].y
			        frm.lng.value = result[0].x
		        }
		    }	
		})
	}
</script>