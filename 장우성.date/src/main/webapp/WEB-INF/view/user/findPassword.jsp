<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="../../res/mobile.css" />
<style>
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
</style>
<script>
    function emailCheck() {
        var emailCheck = false;
        var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

        $('#emailSendBtn').click(() => {
            if (!getMail.test($('#email').val())) {
                $('#errMsg').text('이메일 형식으로 입력하세요.').css('color', 'red');
                $('#errMsg').show();
            } else {
                $.ajax({
                    url: 'findpasswordresult/' + $('#email').val(),
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        email: $('#email').val(),
                    }),
                    success: (data) => {
                        if (data === 0) {
                            $('#errMsg').text('등록된 이메일이 아닙니다.').css('color', 'red');
                            $('#errMsg').show();

                            return 0;
                        } else {
                            location.href = 'findpasswordresult';
                        }
                    },
                });
            }
        });
    }

    $(() => {
        emailCheck();
    });
</script>
</head>
<body>
    <div class="container">
        <header class="mb-5">
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="javascript:window.history.back();" class="col btn">
                    <i class="bi bi-chevron-left"></i>
                </a>
                <p class="col"></p>
                <h4 class="col-6 font-gamja-flower">비밀번호 찾기</h4>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="row pt-62 pb-5 mb-3">
            <div class="d-grid col-11 mx-auto">
                <h6 class="info mb-3">가입시 작성했던 이메일을 입력하세요.</h6>
                <div class=""></div>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                    <input id="email" type="text" name="email" class="form-control" placeholder="이메일" aria-label="email" aria-describedby="addon-wrapping" />
                </div>
                <div id="errMsg"></div>
                <h6 class="info mt-4">이메일 전송으로 받기</h6>
                <button id="emailSendBtn" type="button" class="btn btn-primary btn-lg col-12 mt-2">비밀번호 찾기</button>
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
</body>