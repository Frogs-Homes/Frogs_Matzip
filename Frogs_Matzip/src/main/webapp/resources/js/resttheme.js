// 식당 content 생성 함수
function createCtgRest(item) {
	var ctg_rest_wrap = document.createElement('div')
	ctg_rest_wrap.classList.add('ctg_rest_wrap')
	
	var rest_img_src = `/res/img/rest/${item.i_rest}/food_pic/${item.food_pic}`
	if(item.food_pic == null) { rest_img_src = '/res/img/default_rest.png' }
	
	var is_fav = 'favorite_border'
	if (item.is_favorite == 1) { is_fav = 'favorite' } 
	
	var fav_span = `<span class="favorite material-icons" onclick="toggleFavorite(${item.i_rest}, event)">
						${is_fav}</span>`
	if(i_user == 0) { `<span class="favorite material-icons" onclick="loginBtnClick()">${is_fav}</span>` }
	
	ctg_rest_wrap.innerHTML = `<div class="rest_pic_wrap">
									<img class="food_pic" src="${rest_img_src}" alt="${item.nm}의 음식 사진">
								</div>
								<div class="rest_ctnt_wrap">
									<div class="rest_ctnt_title_wrap">
										<h3><a href="/rest/detail?i_rest=${item.i_rest}">${item.nm}</a><span>${item.avg_grade}</span></h3>
										<div class="favorite_wrap">
					                    	${fav_span}
					                        <span class="icons_ctnt">가고싶다</span>
					                    </div>
									</div>
							        <p>${item.addr}</p>
							        <p>review:${item.review_cnt}</p>
								</div>`
	
	ctg_list_wrap.append(ctg_rest_wrap)
}

// 카테고리별 식당 목록 생성 함수
function createCtgList(i_category) {
	ctg_list_wrap.innerHTML = ''
	// axios로 i_category 값이 파라미터와 같은 친구들의 식당 리스트 뽑아와서 foreach로 createCtgRest() 찍기
	axios.get('/rest/ajaxGetList', {
		params: {
			i_category
		}
	}).then(function(res) {
		if(res.data.length == 0) {
			ctg_list_wrap.innerHTML = '<div id="no_ctg_rest_msg" class="no_drag">아직 이 카테고리에 해당하는 맛집이 없어요ㅠㅠ</div>'
		}
		else { res.data.forEach(function(item) {
				createCtgRest(item)
			})
		}
	})
}

// 카테고리 버튼 누를 시 카테고리별 식당 목록 생성 함수
function changeCtg(e) {
	//console.log(e.target.nextElementSibling.value)
	let i_category = e.target.nextElementSibling.value;
	
	removeOnCtg()
	addOnCtg(i_category)
}

// 해당 카테고리 제목에 .on 넣기
function addOnCtg(i_ctg) {
	removeOnCtg();
	var cate_parent = document.querySelector('#label_' + i_ctg);
	cate_parent.classList.add('on');
	createCtgList(i_ctg);
}

// 모든 카테고리 제목에 .on 빼기
function removeOnCtg() {
	let ctgValArr = document.querySelectorAll('#ctg_lnb ul li');

	ctgValArr.forEach(function(item) {
		item.classList.remove('on')
	})
}

// 가고싶다 친구 toggle
function toggleFavorite(i_rest, e) {

	let parameter = {
			params: {
				i_rest
			}
	}
	
	var fav_btn = e.target
	var icon = e.target.innerHTML.trim()
	console.log(fav_btn)
	console.log(icon)
	
	switch(icon) {
	case 'favorite':
		parameter.params.fav_type = 'del'
		break;
	case 'favorite_border':
		parameter.params.fav_type = 'ins'
		break;
	}
	
	axios.get('/user/ajaxToggleFavorite', parameter).then(function(res) {
		if(res.data == '1') {
			fav_btn.innerHTML = (icon == 'favorite' ? 'favorite_border' : 'favorite')
		} else {
			alert('로그인이 필요한 서비스입니다.')
		}
	})
	
}


addOnCtg(i_ctg)