<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="frm" action="/rest/reg" method="post" onsubmit="return chkFrm()">
    <label for="rest_nm">가게명</label>
    <input type="text" id="rest_nm" name="nm" required autofocus><br>
    <label for="addr">주소</label>
    <input type="text" id="addr" name="addr" placeholder="주소를 검색해주세요." onkeyup="changeAddr()">
    <button type="button" onclick="getLatLng()">좌표 가져오기</button><span id="resultGetLatLng"></span><br> <!--주소 검색하고 lat, lng에 담기-->
    <input type="hidden" name="lat" value="${data.lat == null ? 0 : data.lat}">
    <input type="hidden" name="lng" value="${data.lng == null ? 0 : data.lng}">
    <label for="phone">전화번호</label>
    <input type="tel" name="phone" id="phone" maxlength="13"><br>
    <fieldset id="frm_field">
        <legend>영업시간
            <label for="open_time" class="hidden">영업 시작시간</label>
            <input type="time" name="open_time" id="open_time">
            ~
            <label for="close_time" class="hidden">영업 종료시간</label>
            <input type="time" name="close_time" id="close_time">
        </legend>
    </fieldset>
    <label for="category">음식 종류</label>
    <select id="category" name="i_category">
        <option value="0">--선택--</option>
            <c:forEach items="${categoryList}" var="item">
                <option value="${item.i_category}">${item.val}</option>
            </c:forEach>
    </select><br>
    <input type="submit" value="등록">
</form>
<!-- 내 맛집스프링 앱키임 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=appkey=ef93669481fc09a5adb9cdbabc25ba28"></script>
<script>
	/*
	let patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
	let res = patt.test(phone.value)
	
	if( !patt.test() ){
	    alert("전화번호를 정확히 입력하여 주십시오.");
	    return false;
	}
	*/

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
		}
	}
	
	function changeAddr() {
		resultGetLatLng.innerText = ''
		frm.lat.value = '0'
		frm.lng.value = '0'
	}

	const geocoder = new kakao.maps.services.Geocoder();

	function getLatLng() {
		const addrStr = frm.addr.value
		
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