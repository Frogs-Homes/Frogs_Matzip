<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <style>
        #modalWrap {
            display: none;
            width: 500px;
            height: 500px;
            position: absolute;
            top:50%;
            left: 50%;
            margin: -250px 0 0 -250px;
            background:#eee;
            z-index: 2;
        }
        #modalBg {
            display: none;
            position: absolute;
            width: 100%;
            height: 100%;
            background-color:rgba(0, 0,0, 0.5);
            top:0;
            left: 0;
            z-index: 1;
        }
        .modalClose {
            width: 26px;
            height: 26px;
            position: absolute;
            top: -30px;
            right: 0;
        }

        .modalClose a {
            display: block;
            width: 100%;
            height: 100%;
            background-color: blue;
            text-indent: -9999px;
        }

        #modalLogin {
            width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <button type="button" id="modalBtn">모달창버튼</button>
    <div id="modalBg"></div>
    <div id="modalWrap">
        <div class="modalClose"><a href="#">close</a></div>
        <div id="modalLogin">
            <h1>로그인</h1>
            <p>로그인 하면 가고싶은 식당을<br>저장할 수 있어요</p>
            <form action="">
                <label for="user_id"></label>
                <input type="text" name="user_id">
                <label for="user_pw"></label>
                <input type="password" name="user_pw">
                <input type="button" value="로그인">
            </form>
            <p>개굴플레이트 계정이 없으세요? <span id="join">회원 가입</span></p>
        </div>
    </div>
    
    <script>

            function modalOnClick() {
                document.querySelector('#modalWrap').style.display = 'block'
                document.querySelector('#modalBg').style.display = 'block'
            }

            function modalOffClick() {
                document.querySelector('#modalWrap').style.display = 'none'
                document.querySelector('#modalBg').style.display = 'none'
            }

            document.querySelector('#modalBtn').addEventListener('click', modalOnClick)
            document.querySelector('.modalClose').addEventListener('click', modalOffClick)

    </script>
</body>
</html>