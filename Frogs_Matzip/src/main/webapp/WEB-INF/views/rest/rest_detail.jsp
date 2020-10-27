<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!--menuList-->
<div id="menu_back">
   <div id="menu_wrap">
    <c:forEach items="${foodMenuList}" var="item">
   		<div class="menulist">
    		<c:if test="${item.food_pic != null && item.food_pic != '' }">
    			<img src="/res/img/rest/${data.i_rest}/food_pic/${item.food_pic}" class="menu" >
    		</c:if>
   		</div>	 
  	</c:forEach>   
   </div>
</div>

<!--ctnt-->
<div id="column_back">
    <div id="ctnt_back">
		<div id="title_wrap">
            <span id="title">
                <h1>${data.nm}</h1>
                <strong id="grade"><span>4.2</span></strong>
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
                        <span class="material-icons">favorite_border</span>
                        <span class="icons_ctnt">가고싶다</span>
                    </div>
                </div>
		</div>

        <div id="user_content_wrap">
                <span class="material-icons" id="review_write">edit</span><span class="write_cnt">132</span>
                <span class="material-icons">favorite</span><span class="favorite_cnt">441</span>
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
                            <td>${data.i_category}</td>
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
                <span>(53)</span>
            </div>
             <div class="review_ctnt_back">
	             <div id="review_ctnt">
	                 <div id="user_wrap">
	                     <div class="profile_img_wrap">
	                         <img src="/res/img/default_img.png" class="profile_img" alt="">
	                     </div>
	                     <div class="user_nm_wrap">
	                         <div class="user_nm">박철민</div>
	                     </div>
	                 </div>
	                 <div id="user_ctnt_wrap">
	                     <div class="user_ctnt">
	                         <div class="day">6일전</div>
	                         <p class="write">와 정말 맛있다! 엄청 유명해질 데로 유명해져서 맛도 예전과 좀 달라져버리지 않았을까 하며 기대없이 방문했다가 전복죽에 치이고 물회에 또 치였다.
	                             뜨끈한 전복죽은 내장이 들어가 정말 고소하고 맛났었다. 죽을 먹으며 위장을 워밍업 시키고 본격적으로 물회를 한입 맛 본 순간, 감칠맛과 새콤함이 입안에 퍼지고 신선한 회와 해삼들이 씹는 맛을 재밌게 해준다.
	                             큰 규모덕에 정말 많은 사람들이 몰려오는 가게지만 정말 맛있는 음식으로 이 모두를 감당해내고 있는 느낌이시다.
	                             속초에 올때는 필수 코스가 될 것 같다!</p>
	                     </div>
	                     <div class="user_like_wrap">
	                         <div class="user_like">
	                             <span class="material-icons">sentiment_very_dissatisfied</span>
	                             <span class="like_ctnt">똥이다</span>
	                         </div>
	                     </div>
	                 </div>
	             </div>
	         </div>
        </section>
    </div>
</div>  

<div id="modal_bg"></div>
    <div id="modal_review_back">
        <div class="review_title">
            <span class="title">포폴로피자</span><p class="title_ctnt"> 에 대한 솔직한 리뷰를 써주세요.</p>
        </div>
        <form id="review_frm">
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
                    <textarea name="review_user" id="review_user" maxlength="400" placeholder="박철민님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!!"></textarea>
                </div>
                <div class="btn_back">
                    <div class="btn_wrap">
                       <button class="cancel_btn">취소</button>
                       <button class="submit_btn" onclick="reviewChk()">리뷰 올리기</button>
                    </div>  
                </div>
            </div>
        </form>
    <div class="modal_close"><span class="material-icons">clear</span></div>
</div>

<script>
        document.querySelector('#review_write').addEventListener('click', reviewBtnClick)

        function reviewBtnClick() {
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


	    function iconsClick() {
	        gradeIconsArr.forEach(function(item) {
	            item.classList.remove('on')
	        })
	
	        var e = window.event,
	        icon = e.target || e.srcElement;
	        icon.classList.add('on')
	        grade_result.value = icon.parentNode.nextElementSibling.value
	    }
        
        
        function reviewChk() {
    		// review - ajax
    		let parameter = {
    				'i_rest': '${data.i_rest}', 
					'grade': review_frm.grade_result.value,
					'ctnt': review_frm.review_user.value
			}
			axios.post('/rest/ajaxInsReview', parameter).then(function(res) {
				if(res.data == '1') {
					alert('댓글이 등록되었습니다.')
					location.reload()
				} else {
					alert('문제가 발생하였습니다.')
				}
			})
        }
</script>   
    
    
    
    
    
    