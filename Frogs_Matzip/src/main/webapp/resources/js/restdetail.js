
		


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

function reviewIns(i_rest) {
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
			i_rest, 
			grade: review_frm.grade_result.value,
			ctnt: review_frm.review_user.value
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
	review_frm.grade_result.value = grade_result.value
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


window.onload = reviewMore;
/*리뷰더보기*/
function reviewMore(i_rest, s_idx, review_cnt, loginUser) {

	let parameter = {
		params: { i_rest, s_idx, review_cnt }  
	}
	
	axios.get('/rest/ajaxSelReview', parameter).then(function(res) {
		console.log(res.data)
		console.log("리스트 갯수 : " + res.data.length)
		
		res.data.forEach(function(item){
			moreReviewClick(item, loginUser);			
		})
	})
	
	this.s_idx += this.review_cnt
	
	addMoreBtn(i_rest, this.s_idx, review_cnt, i_user, review_total)
}



function addMoreBtn(i_rest, s_idx, review_cnt, i_user, review_total) {
	if(s_idx >= review_total) {
		moreBtn.innerHTML = ' ';
		return;
	}
	
	// 더보기버튼 추가
	//more_btn_wrap.innerHTML = `<div class="more_btn"><button id="reviewMoreBtn" onclick="reviewMore(${i_rest}, ${s_idx}, ${review_cnt}, ${i_user})">더 보기</button></div>`

	
	
}

function moreReviewClick(item, loginUser) {
	var review_ctnt_back = document.createElement('div')
	review_ctnt_back.id = `review_ctnt_back_${item.seq}`
	review_ctnt_back.classList.add('review_ctnt_back')
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
	user_nm.innerHTML = `${item.nm}`;
	var user_ctnt_wrap = document.createElement('div');
	user_ctnt_wrap.id = 'user_ctnt_wrap';
	var user_ctnt = document.createElement('div');
	user_ctnt.classList.add('user_ctnt');
	var day = document.createElement('div');
	day.classList.add('day');
	day.innerHTML = `${item.m_dt}`;
	var write = document.createElement('p');
	write.classList.add('write')
	write.innerHTML = `${item.ctnt}`;
	var user_like_wrap = document.createElement('div')
	user_like_wrap.classList.add('user_like_wrap')
	var user_like = document.createElement('div')
	user_like.classList.add('user_like')
	var user_btn = document.createElement('div')
	user_btn.id = 'user_btn'
	

	if(item.grade == 1) {
		user_like.innerHTML = `<label for="one"><span class="material-icons">mood_bad</span><span class="icon_ctnt">최악이다</span></label>
						                    <input type="hidden" name="one" value="1">`
	}
	else if(item.grade == 2) {
		user_like.innerHTML = `<label for="two"><span class="material-icons">mood_bad</span><span class="icon_ctnt">별로다</span></label>
						                    <input type="hidden" name="two" value="2">`
	}
	else if(item.grade == 3) {
		user_like.innerHTML = `<label for="three"><span class="material-icons">mood_bad</span><span class="icon_ctnt">보통이다</span></label>
						                    <input type="hidden" name="three" value="3">`
	}
	else if(item.grade == 4) {
		user_like.innerHTML = `<label for="four"><span class="material-icons">mood_bad</span><span class="icon_ctnt">괜찮다</span></label>
						                    <input type="hidden" name="four" value="4">`
	}
	else if(item.grade == 5) {
		user_like.innerHTML = `<label for="five"><span class="material-icons">mood_bad</span><span class="icon_ctnt">맛있다</span></label>
						                    <input type="hidden" name="five" value="5">`
	}
	
	if(loginUser == item.i_user) {
		user_btn.innerHTML = `<button class="review_mod" onclick="reviewUpd(${item.seq}, '${item.ctnt}', ${item.grade})">수정</button>
								         <button class="review_del" onclick="reviewDel(${item.seq})">삭제</button>`;	
	}
	
	
	rest_review.append(review_ctnt_back)
	user_like_wrap.append(user_like)
	user_like_wrap.append(user_btn)
	user_ctnt.append(day)
	user_ctnt.append(write)
	user_ctnt_wrap.append(user_ctnt)
	user_ctnt_wrap.append(user_like_wrap)
	profile_img_wrap.append(profile_img)
	user_nm_wrap.append(user_nm)
	user_wrap.append(profile_img_wrap)
	user_wrap.append(user_nm_wrap)
	review_ctnt.append(user_wrap)
	review_ctnt.append(user_ctnt_wrap)
	review_ctnt_back.prepend(review_ctnt)

}


/* 좋아요 */
function toggleFavorite(i_rest) {
	let parameter = {
			params: {
				i_rest
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


