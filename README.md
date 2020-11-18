# Frogs_Matzip
맛집 프로젝트

201117 한 일
- 테마별 리스트창 html 구현
- 메인화면에 카테고리별 가게 list로 연결
- Search map 맛집목록의 음식사진 클릭 시 디테일창 이동 구현

201116 한 일
- placesList 기능 구현
- 웹사이트 호스팅하기
- Search bar의 autocomplete 끄기
- 메인헤더 배경 높이 조정

201108 한 일
- AutoSlider 기능 구현

201107 한 일
- selRestList 조인 걸기 -> 앞단 수정 ㅇ

201105 한 일
- selRestList 조인 걸기(sql문 수정)
- 맛집프로젝트 html, css 수정
- Restcontroller -> foodmenu, food_category 이름 수정
- 카카오지도 컴퓨터에 불러오지 못하는 문제 해결

201104 한 일
- 인덱스 카테고리별 식당 부분 디자인
- Js 파일 window.onload 오류 고치기

201103 한 일
- 메인화면에 추천식당 뿌리기
- 추천식당 슬라이드 구현 
- Js 파일 따로 빼기
- Default header 검색바 가운데로 조절, 길이조절
- 사용자 메뉴 모달창 위치 조절
- listmap createTitle 함수 수정

201102 한 일
- 리뷰 i_rest 값 한정해서 뿌리기
- 찜 기능 구현
- 로그아웃 상태에서 디테일 창에 찜 하트 해제시키기
- 디테일 영업시간 형식 셀렉트
- 평점 구현
- 리뷰 모달창 등록/수정 (빈값일 때 막기)
- 인덱스헤더 html, css 다듬기 <- div 통합, 검색바 부분 헤더 안에 넣기
- 디폴트헤더 html, css 다듬기 <- 로고, 사용자메뉴 양옆 끝부분에 갖다박기
- List map 지도 영역 조정하여 화면에 보이는 범위와 실제 범위가 일치하도록 수정하기

201031~201101 한 일
- Default header logo 수정
- 검색 시 카카오 라이브러리 대신 frogs_matzip db에서 검색 기능 구현
- default_header에서 검색 기능 가능하게 하기

201028~201030 한 일
- 리뷰 등록, 삭제 백엔드 연결
- 리뷰 수정 백엔드 해결
- 지도 getBoundRestList() JS 해결

201027 한 일
- list_map.jsp에서 js로 db 값 뿌리는 변수명 수정하기
- 리뷰 프론트단 구현

201026 한 일
- Detail 리뷰 부분 프론트단 구현
- Detail 리뷰 모달창 구현
- map ajax 검색 기능 백엔드단 구현

201023 한 일
- 디테일 food_img파일 등록창 만들고 db에 이미지 등록 완료
- 등록한 이미지 detail에 뿌리기 완료
- list 클릭 시 detail창 이동 구현 완료

201022 한 일
- 대구지역으로 한정 -> index 페이지 수정
- listMap에서 지도의 latlng 영역값 안의 db 뿌리기
- js로 지도 영역 내 db 값들 마커 찍기
- db에 district 추가
- 가게 등록창에 i_district 부분 추가
- 테스트용 db 값 넣기 (수성구까지)

201021 한 일
1. 지도 검색기능 구현
2. 지도 마커 찍기
3. 메뉴 사진 등록 구현 - 관리자 계정 시 가게 디테일 페이지에서 food_pic 입력페이지 이동시키기
4. 신규 가게 등록창에 menu_pic, price_range 값 넣게 수정 -> menu_pic 폴더 추가, UUID 사용하여 저장해야 함
5. detail 페이지 앞단 구현 프로토타입 완성
6. 테스트용 db 값 넣기 - 북구까지
7. default header에 검색버튼 작동하게 수정
8. 테스트용 db lat, lng 수정

201020 한 일
1. user, user/model로 바꾸기
2. /rest/reg, 음식사진 등록창에서 admin 계정인지 확인 후 들어가게 하기 추가
3. login interceptor 추가
4. 트랜잭션 구현중
5. JS kakao Map 검색 기능 구현중

201019 한 일
1. Rest/reg tel문제 해결
2. Reg 백엔드단 연결
3. Db  수정하기 - t_user admin, t_rest phone, price_range, open_time, close_time
4. 관리자 계정일 경우에만 신규 가게 등록
5. User menu에 회원가입 버튼 추가
6. User menu에 신규 가게 등록 뜨게 하기
7. 가게 등록창에서 주소 가져오기 해결해야
8. Logo 클릭 시 index 페이지로 이동 구현
9. Default header에 modal 수정하기
