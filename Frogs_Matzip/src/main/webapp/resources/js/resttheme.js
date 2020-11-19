// 식당 content 생성 함수
function createCtgRest(item) {
	var ctg_rest_wrap = document.createElement('div')
	ctg_rest_wrap.classList.add('ctg_rest_wrap')
	
	ctg_rest_wrap.innerHTML = `<div class="rest_pic_wrap">
									<img src="/res/img/rest/${item.i_rest}/food_pic/${item.food_pic}" alt="${item.nm}의 음식 사진">
								</div>
								<div class="rest_ctnt_wrap>
									<div class="rest_ctnt_title_wrap">
										<h3><a href="/rest/detail?i_rest=${item.i_rest}">${item.nm}</a></h3>
										<strong>${item.avg_grade}</strong><br>
										<div>가고싶다친구</div>
									</div>
							        <p>${item.addr}</p><br>
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
		res.data.forEach(function(item) {
			createCtgRest(item)
		})
	})
}

// 카테고리 버튼 누를 시 카테고리별 식당 목록 생성 함수
function changeCtg(e) {
	//console.log(e.target.nextElementSibling.value)
	let i_category = e.target.nextElementSibling.value;
	createCtgList(i_category)
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
	let ctgValArr = document.querySelectorAll('#ctg_lnb ul label');

	ctgValArr.forEach(function(item) {
		item.classList.remove('on')
	})
}

addOnCtg(i_ctg)