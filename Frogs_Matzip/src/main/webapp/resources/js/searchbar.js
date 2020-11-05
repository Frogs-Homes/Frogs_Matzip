// -------------search bar 시작------------------------------------------------------------------------
// chkSearchRest
function chkSearchRest() {
	if(keyword.value == '') {
		alert('검색어를 입력하세요.')
		keyword.focus()
		return false;
	} else if(keyword.value.length < 2) {
		alert('검색어를 두 글자 이상 입력하세요.')
		keyword.focus()
		return false;
	}
	
	return true
}

// setPlaceNm
function setPlaceNm(e) {
	keyword.value = e.target.innerText
}

let placesListArr = document.querySelectorAll('#placesList li')
placesListArr.forEach(function(item) {
	item.addEventListener('click', setPlaceNm)
})
// -------------search bar 끝------------------------------------------------------------------------
