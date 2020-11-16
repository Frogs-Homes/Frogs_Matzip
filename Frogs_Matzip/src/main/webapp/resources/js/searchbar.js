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


function openPlacesList() {
	placesList.classList.add('show_placesList');
}

function closePlacesList(event) {
	if(event.target == keyword) {
		return;
	}
	placesList.classList.remove('show_placesList');
}

/*
function togglePlacesList() {
	placesList.classList.toggle('show_placesList');
	console.log(placesList.classList.value);
}
*/

// setPlaceNm
function setPlaceNm(e) {
	keyword.value = e.target.innerText;
	closePlacesList()
}

function addClickEvent() {
	let placesListArr = document.querySelectorAll('#placesList li');

	placesListArr.forEach(function(item) {
		item.addEventListener('click', setPlaceNm)
	})
}

addClickEvent();

document.querySelector('body').addEventListener('click', closePlacesList);

// -------------search bar 끝------------------------------------------------------------------------
