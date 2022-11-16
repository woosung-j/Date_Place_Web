<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        header {
            margin-bottom: 20px;
        }

        .date::before {
            content: attr(placeholder);
            color: gray;
            width: 100%;
        }

        .date:focus::before,
        .date:valid::before {
            display: none;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
    <script>
        const auth = { isId: false, isEmail: false, isEmailAuth: false };
        function isValidate() {
            let isGood = false;
            let errMsg = '';

            if (!$('#id').val()) errMsg = '아이디를 입력하세요.';
            else if (!$('#email').val()) errMsg = '이메일을 입력하세요.';
            else if (!$('#auth').val()) errMsg = '인증번호를 입력하세요.';
            else if (!$('#password').val()) errMsg = '비밀번호를 입력하세요.';
            else if (!$('#userName').val()) errMsg = '이름을 입력하세요.';
            else if (!$('#nickname').val()) errMsg = '닉네임을 입력하세요.';
            else if (!$('#phoneNumber').val()) errMsg = '전화번호를 입력하세요.';
            else if (!$('#birthday').val()) errMsg = '생년월일을 입력하세요.';
            else if (auth.isId == false) errMsg = '아이디 중복 확인이 완료되지 않았습니다.';
            else if (auth.isEmail == false) errMsg = '이메일 인증이 완료되지 않았습니다.';
            else if (auth.isEmailAuth == false) errMsg = '인증번호 입력이 완료되지 않았습니다.';
            else isGood = true;

            if (!isGood) showModal(errMsg, 'red');

            return isGood;
        }

        function showModal(msg, color, href) {
            $('#modalMsg')
                .text(msg)
                .css('color', color ? color : 'black');
            if (href == null) {
                $('#modalBtn')[0].dataset.dismiss = 'modal';
            } else {
                $('#modalBtn')[0].dataset.dismiss = null;
                $('#modalBtn')[0].href = href;
            }
            $('#modal').modal();
        }

        function signup() {
            if (isValidate()) {
                $.ajax({
                    url: 'signup',
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        id: $('#id').val(),
                        email: $('#email').val(),
                        auth: $('#auth').val(),
                        password: $('#password').val(),
                        userName: $('#userName').val(),
                        nickname: $('#nickname').val(),
                        profileImage: '',
                        phoneNumber: $('#phoneNumber').val(),
                        birthday: $('#birthday').val(),
                    }),
                    success: (data) => {
                        if (data == 0) showModal('회원가입을 실패했습니다.', 'red');
                        else {
                            showModal('회원가입이 완료되었습니다.', null, 'login');
                        }
                    },
                });
            }
        }

        function idCheck() {
            let val = $('#id').val();
            if (val != '') {
                $.ajax({
                    url: `idCheck/` + val,
                    method: 'get',
                    contentType: 'application/text',
                    success: (data) => {
                        if (data == 0) showModal('이미 사용중인 아이디입니다.', 'red');
                        else {
                            showModal('사용 가능한 아이디입니다.');
                            auth.isId = true;
                        }
                    },
                });
            }
        }

        function emailCheck() {
            let email = $('#email').val();
            if (email != '') {
                $.ajax({
                    url: 'emailCheck/' + email,
                    method: 'get',
                    success: (data) => {
                        if (data != '') showModal('이미 사용중인 이메일입니다.', 'red');
                        else {
                            emailAuth(email);
                        }
                    },
                });
            }
        }

        function emailAuth(email) {
            showModal('인증번호를 전송했습니다.');
            $.ajax({
                url: 'emailAuthCheck/' + email,
                method: 'get',
                success: (data) => {
                    code = data;
                    auth.isEmail = true;
                },
            });
        }

        function emailAuthCheck() {
            const inputAuthCode = $('#auth').val();

            if (inputAuthCode == code) {
                auth.isEmailAuth = true;
                showModal('인증이 완료되었습니다.');
            } else {
                showModal('인증번호가 일치하지 않습니다. 다시 확인해주세요.');
            }
        }

        function init() {
            // 회원가입 버튼
            $('#signupBtn').click((e) => {
                signup();
            });

            // 아이디 중복확인 버튼
            $('#idCheckBtn').click((e) => {
                idCheck();
            });

            // // 인증 버튼
            $('#emailCheckBtn').click((e) => {
                emailCheck();
            });

            // 인증확인 버튼
            $('#authBtn').click((e) => {
                emailAuthCheck();
            });

            $('#id').change((e) => {
                auth.isId = false;
            });

            $('#email').change((e) => {
                auth.isEmail = false;
            });

            $('#auth').change((e) => {
                auth.isEmailAuth = false;
            });
        }

        $(() => {
            init();
        });
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn">
                <i class="bi bi-chevron-left"></i>
            </a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">회원가입</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="row pt-62 pb-5 mb-3">
        <form class="d-grid col-11 mx-auto">
            <div class="input-group mb-2">
                <input type="id" id="id" class="col form-control mr-2 rounded" placeholder="아이디" aria-label="id" aria-describedby="addon-wrapping" />
                <button type="button" id="idCheckBtn" class="col-4 border-0 rounded" data-toggle="modal" data-target="#checkModal">중복확인</button>
            </div>
            <div class="input-group mb-2">
                <input type="email" id="email" name="email" class="col form-control mr-2 rounded" placeholder="이메일" aria-label="email" aria-describedby="addon-wrapping" autofocus />
                <button type="button" id="emailCheckBtn" class="col-4 border-0 rounded" data-toggle="modal" data-target="#checkModal">인증하기</button>
            </div>
            <div class="input-group mb-2">
                <input type="text" id="auth" class="col form-control mr-2 rounded" placeholder="인증번호 입력" aria-label="auth" aria-describedby="addon-wrapping" />
                <button type="button" id="authBtn" class="col-4 border-0 rounded" data-toggle="modal" data-target="#assignModal">확인</button>
            </div>
            <div class="input-group mb-2">
                <input type="password" id="password" class="form-control" placeholder="비밀번호" aria-label="password" aria-describedby="addon-wrapping" />
            </div>
            <div class="input-group mb-2">
                <input type="text" id="userName" class="form-control" placeholder="이름" aria-label="name" aria-describedby="addon-wrapping" />
            </div>
            <div class="input-group mb-2">
                <input type="text" id="nickname" class="form-control" placeholder="닉네임" aria-label="nickname" aria-describedby="addon-wrapping" />
            </div>
            <div class="input-group mb-2">
                <input
                        type="tel"
                        id="phoneNumber"
                        class="form-control userCellNum"
                        placeholder="전화번호(&#39;-&#39;&nbsp;제외)"
                        maxlength="11"
                        aria-label="phone"
                        aria-describedby="addon-wrapping"
                />
            </div>
            <div class="input-group mb-2">
                <input type="date" id="birthday" max="9999-12-31" class="form-control date" placeholder="날짜 선택" aria-label="birth" aria-required="true" aria-describedby="addon-wrapping" />
            </div>
            <button type="button" id="signupBtn" class="btn btn-primary btn-lg col-12">회원가입</button>
        </form>
    </div>
    <div class="navbar">
        <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
            <li>
                <a href="<%=request.getContextPath()%>/" class="btn w-auto" type="button">
                    <i class="icon main bi-house-door-fill fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/community" class="btn w-auto" type="button">
                    <i class="icon main bi-file-earmark-text fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/place/around" class="btn w-auto" type="button">
                    <i class="icon main bi-map fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/place/myplace" class="btn w-auto" type="button">
                    <i class="icon main bi-heart fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/user/login" class="btn w-auto" type="button">
                    <i class="icon main bi-person-fill fa-3x"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="modal" id="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p id="modalMsg">인증번호를 이메일로 전송했습니다. <br />이메일을 확인해 주세요.</p>
                <a href="#" id="modalBtn" class="btn btn-primary"> 확인 </a>
            </div>
        </div>
    </div>
</div>
</body>
