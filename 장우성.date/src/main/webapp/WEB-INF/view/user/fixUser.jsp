<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        header {
            margin-bottom: 40px;
        }

        .login {
            margin-top: 13rem;
            top: 50%;
            left: 50%;
            padding: 5px;
        }

        .circle-icon {
            background: whitesmoke;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            text-align: center;
            line-height: 2.5rem;
            padding: 25px;
            margin-left: 1.5rem;
        }

        .bi-image {
            font-size: 40px;
        }

        .icon.main:hover {
            color: #ff5858;
        }

        h4 {
            white-space: nowrap;
        }

        input[type='date']::before {
            content: attr(data-placeholder);
            width: 100%;
            font-size: 1rem;
            color: rgba(0, 0, 0, 0.55);
        }

        input[type='date']:focus::before,
        input[type='date']:valid::before {
            display: none;
        }
    </style>
    <script>
        function isValidate() {
            let isGood = false;
            let msg = '';

            if (!$('#pw').val()) msg = '비밀번호를 입력해주세요';
            else if (!$('#nickname').val()) msg = '닉네임을 입력하세요';
            else if (!$('#tel').val()) msg = '전화번호를 입력하세요';
            else if (!$('#birth').val()) msg = '생년월일을 입력하세요';
            else isGood = true;

            if (!isGood) $('#msg').text(msg).css('color', 'red');

            return isGood;
        }

        function fixUser() {
            if (isValidate()) {
                $.ajax({
                    url: 'fixuser',
                    method: 'put',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        password: $('#pw').val(),
                        nickname: $('#nickname').val(),
                        phoneNumber: $('#tel').val(),
                        birthday: $('#birth').val(),
                    }),
                    success: function (data) {
                        $('#fixModal').modal('show');
                    },
                });
            }
        }

        function init() {
            $('#fixUserBtn').click((e) => {
                fixUser();
            });
        }

        $(() => {
            init();
        });
    </script>
</head>
<body>
<div class="container">
    <header class="">
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn">
                <i class="bi bi-chevron-left"></i>
            </a>
            <h4 class="col-6 font-gamja-flower ml-2 text-center">회원 프로필 수정</h4>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="row pt-62">
        <div id="fixForm" class="d-grid col-11 mx-auto mt-4">
            <div class="hidden" value="${userId}"></div>
            <div class="input-group">
                <div class="input-group-text"><i class="bi bi-key-fill"></i></div>

                <input id="pw" type="password" class="form-control password" placeholder="비밀번호" aria-describedby="addon-wrapping" value="${password}" />
            </div>
            <div class="input-group mt-3">
                <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
                <input id="nickname" type="text" class="form-control" placeholder="닉네임" aria-describedby="addon-wrapping" name="${nickname}" />
            </div>
            <div class="input-group mt-3">
                <div class="input-group-text"><i class="bi bi-telephone-fill"></i></div>
                <input id="tel" type="text" class="form-control userCellNum" placeholder="전화번호(&#39;-&#39;&nbsp;제외)" aria-describedby="addon-wrapping" value="${phoneNumber}" />
            </div>
            <div class="input-group mt-3">
                <div class="input-group-text"><i class="bi bi-calendar-date"></i></div>
                <input id="birth" type="date" class="form-control birthday" data-placeholder="생년월일" aria-describedby="addon-wrapping" value="${birth}" required />
            </div>
            <div id="msg" style="color: red"></div>
            <button type="button" id="fixUserBtn" class="btn btn-primary btn-lg col-12 mt-3">수정하기</button>
        </div>
        <div class="d-grid col-11 mx-auto mt-0">
            <a href="removeuser" type="button" class="btn btn-danger btn-lg col-12 mt-3 mx-auto"> 탈퇴하기 </a>
        </div>
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
<div class="modal" id="fixModal" tabindex="-1" aria-hidden="true" style="display: none">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div id="modalMsg" class="modal-body text-center py-3">
                <p>수정이 완료 되었습니다.</p>
                <a href="/" class="btn btn-primary"> 확인 </a>
            </div>
        </div>
    </div>
</div>
</body>
