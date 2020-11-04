// -------------chkSearchRest 시작------------------------------------------------------------------------
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
// -------------chkSearchRest 끝------------------------------------------------------------------------
