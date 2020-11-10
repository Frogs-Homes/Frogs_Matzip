<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!--menuList-->

<div id="menu_wrap">
 <c:forEach items="${foodMenuList}" var="item">
		<div class="menulist">
 		<c:if test="${item.food_pic != null && item.food_pic != '' }">
 			<img src="/res/img/rest/${data.i_rest}/food_pic/${item.food_pic}" class="menu" >
 		</c:if>
		</div>	 
</c:forEach>   
</div>


<!--ctnt-->
<div id="column_back">
    <div id="ctnt_back">
		<div id="title_wrap">
            <span id="title">
                <h1>${data.nm}</h1>
                <strong id="grade"><span>${data.avg_grade == 0 ? '' : data.avg_grade}</span></strong>
                <!-- 관리자용 음식사진등록창 이동 -->
				<div>
					<c:if test="${loginUser.admin == '1'}">
						<a href="/rest/regFood?i_rest=${data.i_rest}">음식사진 등록창 이동</a>
					</c:if>
				</div>
            </span>
            <div id="rest_action_button">
                    <div class="edit">
                        <span class="material-icons" id="review_write">edit</span>
                        <span class="icons_ctnt">리뷰쓰기</span>
                    </div>
                    <div class="favorite">
                    	<c:choose>
                    		<c:when test="${loginUser.i_user > 0 }">
                    			<span id="favorite" class="material-icons" onclick="toggleFavorite()">
									<c:if test="${data.is_favorite == 1}">favorite</c:if>
									<c:if test="${data.is_favorite == 0}">favorite_border</c:if>
								</span>
                    		</c:when>
                    		<c:otherwise>
                    			<span id="favorite" class="material-icons" onclick="loginBtnClick()">favorite_border</span>
                    		</c:otherwise>
                    	</c:choose>
						
                        <span class="icons_ctnt">가고싶다</span>
                    </div>
            </div>
		</div>

        <div id="user_content_wrap">
                <span class="material-icons" id="review_write">edit</span><span class="write_cnt">${count.review_cnt}</span>
                <span class="material-icons">favorite</span><span class="favorite_cnt">${data.fav_cnt}</span>
        </div>

        <section id="rest_detail">
            <div id="ctnt">
                <table>
                    <caption class="hidden">rest_detail</caption>
                    <tbody>
                        <tr>
                            <th>주소</th>
                            <td>${data.addr}</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${data.phone}</td>
                        </tr>
                        <tr>
                            <th>음식종류</th>
                            <td>${data.category_val}</td>
                        </tr>
                        <tr>
                            <th>가격대</th>
                            <td>${data.price_range}</td>
                        </tr>
                        <tr>
                            <th>영업시간</th>
                            <td>${data.open_time} ~ ${data.close_time}</td>
                        </tr>
                        <tr>
                            <th>비고</th>
                            <td>${data.ctnt}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="menu_pic">
                <img src="/res/img/rest/${data.i_rest}/menu_pic/${data.menu_pic }" alt="menuList_img">
            </div>
        </section>

        <section id="rest_review">
            <div id="review_title">
                <h2>리뷰</h2>
                <span>(${count.review_cnt})</span>
            </div>
            <c:choose>
            <c:when test="${count.review_cnt == '0'}">
            	<div id="review_null">앗! 아직 작성된 리뷰가 없어요. 지금 ${data.nm}의 첫 리뷰를 등록해 보세요.</div>
            </c:when>
            <c:otherwise>
             <c:forEach items="${reviewList}" var="item">
		             <div class="review_ctnt_back" id="review_ctnt_back_${item.seq}">
			             <div id="review_ctnt">
			                 <div id="user_wrap">
			                     <div class="profile_img_wrap">
			                         <img src="/res/img/default_img.png" class="profile_img" alt="">
			                     </div>
			                     <div class="user_nm_wrap">
			                         <div class="user_nm">${item.nm}</div>
			                     </div>
			                 </div>
			                 <div id="user_ctnt_wrap">
			                     <div class="user_ctnt">
			                         <div class="day">${item.m_dt}</div>
			                         <p class="write">${item.ctnt}</p>
			                     </div>
			                     <div class="user_like_wrap">
			                         <div class="user_like">
			                         	<c:if test="${item.grade == 1}">
						                    <label for="one"><span class="material-icons">mood_bad</span><span class="icon_ctnt">최악이다</span></label>
						                    <input type="hidden" name="one" value="1">
			                         	</c:if>
			                         	<c:if test="${item.grade == 2}">
						                    <label for="two"><span class="material-icons">sentiment_very_dissatisfied</span><span class="icon_ctnt">별로다</span></label>
						                    <input type="hidden" name="two" value="2">
			                         	</c:if>
			                         	<c:if test="${item.grade == 3}">
						                    <label for="three"><span class="material-icons">sentiment_dissatisfied</span><span class="icon_ctnt">보통이다</span></label>
						                    <input type="hidden" name="three" value="3">
			                         	</c:if>
			                         	<c:if test="${item.grade == 4}">
						                    <label for="four"><span class="material-icons">sentiment_satisfied</span><span class="icon_ctnt">괜찮다</span></label>
						                    <input type="hidden" name="four"  value="4">
			                         	</c:if>
			                         	<c:if test="${item.grade == 5}">
						                    <label for="five"><span class="material-icons">sentiment_very_satisfied</span><span class="icon_ctnt">맛있다</span></label>
						                    <input type="hidden" name="five" value="5">
			                         	</c:if>
			                         </div>
			                     </div>
			                 </div>
			             </div>
			             <c:if test="${item.i_user == loginUser.i_user}">
			       			<div id="user_btn">
		                        	<button class="review_mod" onclick="reviewUpd(${item.seq}, '${item.ctnt}', ${item.grade})">수정</button>
		                        	<button class="review_del" onclick="reviewDel(${item.seq})">삭제</button>     
		                 	</div>
						</c:if>
			         </div>
		      </c:forEach>

		      </c:otherwise>
		      </c:choose>
		      <div class="more_btn">
		      		<button onclick="reviewMore(${s_idx+5})">더 보기</button>
		      </div>
        </section>
    </div>
</div>  

<div id="modal_bg"></div>
    <div id="modal_review_back">
        <div class="review_title">
            <span class="title">${data.nm}</span><p class="title_ctnt"> 에 대한 솔직한 리뷰를 써주세요.</p>
        </div>
        <form id="review_frm">
        	<input type="hidden" name="typ">
        	<input type="hidden" name="seq">
            <div class="review_ctnt_wrap">
                <div id="grade_icons">
                    <label for="one"><span class="material-icons">mood_bad</span><span class="icon_ctnt">최악이다</span></label>
                    <input type="hidden" name="one" value="1">
                    <label for="two"><span class="material-icons">sentiment_very_dissatisfied</span><span class="icon_ctnt">별로다</span></label>
                    <input type="hidden" name="two" value="2">
                    <label for="three"><span class="material-icons">sentiment_dissatisfied</span><span class="icon_ctnt">보통이다</span></label>
                    <input type="hidden" name="three" value="3">
                    <label for="four"><span class="material-icons">sentiment_satisfied</span><span class="icon_ctnt">괜찮다</span></label>
                    <input type="hidden" name="four"  value="4">
                    <label for="five"><span class="material-icons">sentiment_very_satisfied</span><span class="icon_ctnt">맛있다</span></label>
                    <input type="hidden" name="five" value="5">

                    <input id="grade_result" name="grade_result" type="hidden" value="0">
                    
                </div>
                <div class="review_ctnt">
                    <textarea name="review_user" id="review_user" maxlength="400" placeholder="박철민님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!!" ></textarea>
                </div>
                <div class="btn_back">
                    <div class="btn_wrap">
                        <input type="button" id="cancel_btn" value="취소">   
                     	<input type="button" id="submit_btn" onclick="reviewIns()" value="리뷰 올리기">
                    </div>  
                </div>
            </div>
        </form>
    <div class="modal_close"><span class="material-icons">clear</span></div>
</div>

<script>
		var i_user = '${loginUser.i_user}'
		
		
		 document.querySelector('#review_write').addEventListener('click', function(){
        	if(i_user == "" || i_user == null) {
        		loginBtnClick()
        	} else {
        		reviewInsClick()
        	}
        })
		
		function modalOn() {
			document.querySelector('#modal_review_back').style.display = 'block'
	        document.querySelector('#modal_bg').style.display = 'block'

	        document.querySelector('html').classList.add('scrollDisable')
	        document.querySelector('body').classList.add('scrollDisable')
		}

        function modalOffClick() {  
            document.querySelector('#modal_review_back').style.display = 'none'
            document.querySelector('#modal_bg').style.display = 'none'

            document.querySelector('html').classList.remove('scrollDisable')
            document.querySelector('body').classList.remove('scrollDisable')
        }

        var modalCloseArr = document.querySelectorAll('.modal_close')

        modalCloseArr.forEach(function(item) {
            item.addEventListener('click', modalOffClick)
        })
        
        
        /*modal grade*/
         var gradeIconsArr = document.querySelectorAll('#grade_icons span.material-icons')

	    gradeIconsArr.forEach(function(item) {
	        item.addEventListener('click', iconsClick)
	    })

	    function disableIcons() {        	
	        gradeIconsArr.forEach(function(item) {
	        	item.classList.remove('on')
		    })	 
        }

	    function iconsClick() {
	    	disableIcons()
	
	        var e = window.event,
	        icon = e.target || e.srcElement;
	        icon.classList.add('on')
	        grade_result.value = icon.parentNode.nextElementSibling.value
	    }
        
		/*review*/
        function reviewInsClick() {	
        	disableIcons()
 	        
			review_frm.typ = '1'
			review_frm.review_user.value = ''
            submit_btn.value = "리뷰 올리기"
            
          	modalOn()
        }
        
        function reviewIns() {
        	if( review_frm.grade_result.value == 0) {
        		alert('평점을 등록해주세요')
        		return false
        	} else if( review_frm.review_user.value == '') {
        		alert('내용을 입력해주세요.')
        		return false
        	}
        	
        	var typ = review_frm.typ.value
        	
        	var url = '/rest/ajaxInsReview' //기본 주소는 등록
        	var msg = '댓글이 등록되었습니다.'
        	
        	
        	// review - ajax
       		let parameter = {
       				'i_rest': '${data.i_rest}', 
   					'grade': review_frm.grade_result.value,
   					'ctnt': review_frm.review_user.value
   			}
        	
        	if(typ == '2') { //수정이면 주소 변경
        		url = '/rest/ajaxUpdReview'
        		msg = '댓글이 수정되었습니다.'
        		
        		parameter.seq = review_frm.seq.value
        	}
    	 			
   			axios.post(url, parameter).then(function(res) {
   				if(res.data == '1') {
   					alert(msg)
   					location.reload()
   				} else {
   					alert('문제가 발생하였습니다.')
   				}
   			})
    		
			
        }
        
        /*리뷰수정*/
        function reviewUpd(seq, ctnt, grade) {
        	//document.querySelectorAll('#grade_icons .material-icons').
        	disableIcons()
        	
        	var gradeIcon
        	
        	switch(grade) {
        	case 1:
        		gradeIcon = document.querySelectorAll('#grade_icons span.material-icons')[0]
        		break;
        	case 2:
        		gradeIcon = document.querySelectorAll('#grade_icons span.material-icons')[1]
        		break;
        	case 3:
        		gradeIcon = document.querySelectorAll('#grade_icons span.material-icons')[2]
        		break;
        	case 4:
        		gradeIcon = document.querySelectorAll('#grade_icons span.material-icons')[3]
        		break;
        	case 5:
        		gradeIcon = document.querySelectorAll('#grade_icons span.material-icons')[4]
        		break;
        	}
        	
        	gradeIcon.classList.add('on')
        	
        	review_user.value = ctnt
        	review_frm.typ.value = '2'
        	review_frm.seq.value = seq
        	review_frm.grade_result.value = grade
        	submit_btn.value = '수정'
        	modalOn()
        }
        
        /*리뷰삭제*/
        function reviewDel(seq) {
        	if(!confirm('삭제하시겠습니까?')) {
    			return
    		}
        	
        	let parameter = {
					'seq': seq 
			}
        	
			axios.post('/rest/ajaxDelReview', parameter).then(function(res) {
				if(res.data == '1') {
					alert('댓글이 삭제되었습니다.')
					location.reload()
				} else {
					alert('문제가 발생하였습니다.')
				}
			})
        }
        
        var s_idx = ${param.s_idx}
    	var review_cnt = ${param.review_cnt}
    	
        /*리뷰더보기*/
        function reviewMore(s_idx) {
        	// 1. 전체 리뷰 개수보다 작은지 체크, ㄴㄴ일 경우 더보기 버튼 안 뜨게 하고 ajax 실행 ㄴㄴ
        	
        	// 2. ㅇㅇ 일 경우 ajax로 보내서 값 받아서 뿌리기
        	
        	// 3. s_idx ++
        }
        
        /* 좋아요 */
        function toggleFavorite() {
        	let parameter = {
        			params: {
        				i_rest: ${data.i_rest}
        			}
        	}
        	
        	var icon = favorite.innerText.trim()
        	
        	switch(icon) {
        	case 'favorite':
        		parameter.params.fav_type = 'del'
        		break;
        	case 'favorite_border':
        		parameter.params.fav_type = 'ins'
        		break;
        	}
        	
        	axios.get('/user/ajaxToggleFavorite', parameter).then(function(res) {
    			if(res.data == 1) {
    				favorite.innerText = (icon == 'favorite' ? 'favorite_border' : 'favorite')
    			}
    		})
        	
        }
        
</script>   
    
    
    
    
    
    