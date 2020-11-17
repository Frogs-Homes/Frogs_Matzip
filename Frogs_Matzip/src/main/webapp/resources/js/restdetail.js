var i_user = '${loginUser.i_user}'
var i_rest = '${data.i_rest}'
		
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



/* 좋아요 */
function toggleFavorite() {
	let parameter = {
			params: {
				i_rest: i_rest
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