window.onload = function(){

	// -------------user menu 시작------------------------------------------------------------------------
	function userMenuBtn() {
		list_wrap.classList.toggle('show')
	}
	// -------------user menu 끝------------------------------------------------------------------------
	
	// -------------join 시작------------------------------------------------------------------------
	// join id 체크
	function joinChkId() {
		if(join_frm.user_id.value == "") {
			alert('아이디를 입력하세요.')
			join_frm.user_id.focus()
			return false
		} else if(join_frm.user_id.value.length < 5) {
			join_error_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
			join_frm.user_id.focus()
			return false
		}
		
		axios.post('/user/ajaxCheckId', {
			'user_id': join_frm.user_id.value
		}).then(function(res) {
			if (res.data =='2') {
				join_error_msg.innerText = '사용할 수 있는 아이디입니다.'
   			} else if(res.data == '3') {
   				join_error_msg.innerText = '이미 사용중인 아이디입니다.' 
   			} else {
   				join_error_msg.innerText = '문제 발생.'
   			}
		})
	}
	
	// join submit 체크
	function joinChk() {
		if(join_error_msg.innerText == '') {
			alert('아이디 중복체크를 완료해주세요.')
			join_error_msg.innerText = ''
			id_check_btn.focus()
			return false
		} else if(join_error_msg.innerText == '이미 사용중인 아이디입니다.') {
			alert('새로운 아이디를 입력해주세요.')
			join_error_msg.innerText = ''
			join_frm.user_id.focus()
			return false
		} else if(join_error_msg.innerText != '사용할 수 있는 아이디입니다.') {
			alert('문제가 발생했습니다. 다시 시도해주세요.')
			join_error_msg.innerText = ''
			return false
		} else if(join_frm.user_pw.value.length < 5) {
			//alert('비밀번호는 5글자 이상이 되어야 합니다')
			join_error_msg.innerHTML = '비밀번호는 5글자 이상이 되어야 합니다'
			join_frm.user_pw.focus()
			return false
		} else if(join_frm.user_pw.value != join_frm.user_pw_chk.value) {
			//alert('비밀번호가 일치하지 않습니다')
			join_error_msg.innerHTML = '비밀번호가 일치하지 않습니다'
			join_frm.user_pw.focus()
			return false
		} else if(join_frm.user_nm.value  == "") {
			alert('이름을 입력하세요.')
			join_frm.user_nm.focus()
			return false
		} else if(join_frm.user_nm.value.length > 0) {
			const korean= /[^가-힣]/
			if(korean.test(join_frm.user_nm.value)) {
				//alert('올바른 이름을 입력하세요')
				join_error_msg.innerHTML = '올바른 이름을 입력하세요'
				join_frm.user_nm.focus()
				return false
			}
		}
		
		// join - ajax
		let parameter = {
				'user_id': join_frm.user_id.value,
				'user_pw': join_frm.user_pw.value,
				'nm': join_frm.user_nm.value
		}
		axios.post('/user/ajaxJoin', parameter).then(function(res) {
			if(res.data == '1') {
				// 회원가입 성공, 자동로그인, index페이지
				alert('회원가입을 축하합니다!')
				location.reload()
			} else {
				join_error_msg.innerText = '문제가 발생했습니다.'
			}
		})
	}
	// -------------join 끝------------------------------------------------------------------------
	
	// -------------login 시작------------------------------------------------------------------------
	// login - check
	function loginChk() {
		if(login_frm.user_id.value.length < 5) {
			login_error_msg.innerHTML = '아이디는 5글자 이상이 되어야 합니다'
			login_frm.user_id.focus()
			return false
		} else if(login_frm.user_pw.value.length < 5) {
			login_error_msg.innerHTML = '비밀번호를 확인해 주세요'
			login_frm.user_pw.focus()
			return false
		}
		
		// login - ajax
		let parameter = {
				'user_id': login_frm.user_id.value,
				'user_pw': login_frm.user_pw.value
		}
		
		axios.post('/user/ajaxLogin', parameter).then(function(res) {
			// 1: 로그인 성공 2: 아이디없음 3: 비밀번호틀림 
			if(res.data == '1') {
				// 로그인 성공
				location.reload()
			} else if(res.data == '2') {
				error_msg.innerText = '아이디를 확인해 주세요.'
				login_frm.user_id.focus()
			} else if(res.data == '3') {
				error_msg.innerText = '비밀번호를 확인해 주세요.'
				login_frm.user_pw.focus()
			} else {
				// 로그인 실패, 에러메시지 띄우기
				error_msg.innerText = '에러가 발생했습니다.'
			}
		})
	}
	// -------------login 끝------------------------------------------------------------------------
	
	/*
	// email check 부분
	if(frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('이메일을 확인해 주세요')
			frm.email.focus()
			return false
		}
	}
	*/
	
	// -------------user menu 모달창 시작------------------------------------------------------------------------
    function loginBtnClick() {
		modalOffClick()
        document.querySelector('#modal_login_wrap').style.display = 'block'
        document.querySelector('#modal_bg').style.display = 'block'

        document.querySelector('html').classList.add('scrollDisable')
        document.querySelector('body').classList.add('scrollDisable')
    }

    function joinBtnClick() {
    	modalOffClick()
        document.querySelector('#modal_join_wrap').style.display = 'block'
        document.querySelector('#modal_bg').style.display = 'block'
        
       	document.querySelector('html').classList.add('scrollDisable')
        document.querySelector('body').classList.add('scrollDisable')
    }

    function modalOffClick() {  
        document.querySelector('#modal_login_wrap').style.display = 'none'
        document.querySelector('#modal_join_wrap').style.display = 'none'
        document.querySelector('#modal_bg').style.display = 'none'

        document.querySelector('html').classList.remove('scrollDisable')
        document.querySelector('body').classList.remove('scrollDisable')
    }

    document.querySelector('#login_btn').addEventListener('click', loginBtnClick)
    
    var joinBtnArr = document.querySelectorAll('.join_btn')
    joinBtnArr.forEach(function(item) {
        item.addEventListener('click', joinBtnClick)
    })
    
    var modalCloseArr = document.querySelectorAll('.modal_close')
    modalCloseArr.forEach(function(item) {
        item.addEventListener('click', modalOffClick)
    })
	// -------------user menu 모달창 끝------------------------------------------------------------------------


}