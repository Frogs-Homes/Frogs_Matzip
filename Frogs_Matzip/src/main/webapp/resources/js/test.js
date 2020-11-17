var i_rest = '${data.i_rest}'

var s_idx = '${param.s_idx}'
var review_cnt = '${param.review_cnt}'


/*리뷰더보기*/
function reviewMore(sIdx) {
	// 1. 전체 리뷰 개수보다 작은지 체크, ㄴㄴ일 경우 더보기 버튼 안 뜨게 하고 ajax 실행 ㄴㄴ
	
	// 2. ㅇㅇ 일 경우 ajax로 보내서 값 받아서 뿌리기
	
	// 3. s_idx ++
	let parameter = {
		params: {
			i_rest: i_rest,
			s_idx: sIdx,
			review_cnt: review_cnt
		}  
	}
	
	axios.get('/rest/ajaxSelReview', parameter).then(function(res) {
		console.log(res.data)
		
		res.data.forEach(function(item){
			moreReviewClick(item)
		}) 
	})
	
}

/*리뷰 html생성*/
function moreReviewClick() {
	var review_ctnt_back = document.createElement('div')
	review_ctnt_back.id = 'review_ctnt_back_${item.seq}'
	var review_ctnt = document.createElement('div')
	review_ctnt.id = 'review_ctnt'
	var user_wrap = document.createElement('div')
	user_wrap.id = 'user_wrap'
	var profile_img_wrap = document.createElement('div')
	profile_img_wrap.classList.add('profile_img_wrap')
	var profile_img = document.createElement('img')
	profile_img.classList.add('profile_img')
	profile_img.setAttribute('src', `/res/img/default_img.png`)
	profile_img.setAttribute('alt', item.nm+'프로필사진')
	var user_nm_wrap = document.createElement('div')
	user_nm_wrap.classList.add('user_nm_wrap')
	var user_nm = document.createElement('div')
	user_nm.classList.add('user_nm')
	user_nm.innerHTML(item.nm)
	var user_ctnt_wrap = document.createElement('div')
	user_ctnt_wrap.id = 'user_ctnt_wrap'
	var user_ctnt = document.createElement('div')
	user_ctnt.classList.add('user_ctnt')
	var day = document.createElement('div')
	day.classList.add('day')
	user_nm.innerHTML(item.m_dt)
	var write = document.createElement('p')
	day.classList.add('write')
	write.innerHTML(item.ctnt)
	var user_like_wrap = document.createElement('div')
	user_like_wrap.classList.add('user_like_wrap')
	var user_like = document.createElement('div')
	user_like.classList.add('user_like')
	
	user_like.innerHTML = `<c:if test="${item.grade == 1}">
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
			                         	</c:if>`
	
	review_ctnt_back.innerHTML = `<c:if test="${item.i_user == loginUser.i_user}">
									       			<div id="user_btn">
								                        	<button class="review_mod" onclick="reviewUpd(${item.seq}, '${item.ctnt}', ${item.grade})">수정</button>
								                        	<button class="review_del" onclick="reviewDel(${item.seq})">삭제</button>     
								                 	</div>
												</c:if>`
	
	rest_review.append(review_ctnt_back)
	user_like_wrap.append(user_like)
	user_ctnt.append(day)
	user_ctnt.append(write)
	user_ctnt_wrap(user_ctnt)
	user_ctnt_wrap(user_like_wrap)
	profile_img_wrap.append(profile_img)
	user_nm_wrap(user_nm)
	user_wrap.append(profile_img_wrap)
	user_wrap.append(user_nm_wrap)
	review_ctnt.append(user_wrap)
	review_ctnt.append(user_ctnt_wrap)
	review_ctnt_back.prepend(review_ctnt)
	
	
	
	
	
	
	

	
	
}