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

var s_idx = '${param.s_idx}'
var review_cnt = '${param.review_cnt}'


/*리뷰더보기*/
function reviewMore(s_idx) {
	// 1. 전체 리뷰 개수보다 작은지 체크, ㄴㄴ일 경우 더보기 버튼 안 뜨게 하고 ajax 실행 ㄴㄴ
	
	// 2. ㅇㅇ 일 경우 ajax로 보내서 값 받아서 뿌리기
	
	// 3. s_idx ++
	let parameter = {
		params: {
			i_rest: ${data.i_rest},
			s_idx: s_idx,
			review_cnt: review_cnt
		}  
	}
	
	axios.get('/rest/ajaxSelReview', parameter).then(function(res) {
		console.log(res.data)
		res.data.forEach(function(item){
			
		}) 
	})
	
}

function moreReviewClick() {
	rest_review.innerHTML = `<div class = "review_ctnt_back" id="review_ctnt_back_${item.seq}">`
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