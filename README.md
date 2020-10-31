# Frogs_Matzip
맛집 프로젝트

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
