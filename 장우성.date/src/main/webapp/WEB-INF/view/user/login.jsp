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
    </style>
    <script>
    	function
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
                <h3 class="col-6 font-gamja-flower">로그인</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="row pt-62">
            <form action="login" method="post" class="d-grid col-11 mx-auto">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="bi bi-person-fill"></i>
                    </span>
                    <input type="text" name="id" class="form-control" placeholder="id" aria-label="id" aria-describedby="addon-wrapping" />
                </div>
                <div class="input-group mt-3">
                    <span class="input-group-text">
                        <i class="bi bi-key-fill"></i>
                    </span>
                    <input type="password" name="password" class="form-control" placeholder="password" aria-label="password" aria-describedby="addon-wrapping" />
                </div>
                <input type="checkbox" class="mt-3" />아이디 저장
                <button type="submit" class="btn btn-primary btn-lg col-12 mt-3">로그인</button>
            </form>
        </div>
        <div class="row pb-5 mb-3">
            <div class="col text-center overflow-auto word-keep mt-3">
                <a href="./03.html">아이디 찾기</a> | <a href="./05.html">비밀번호 찾기</a> |
                <a href="signup">회원가입</a>
            </div>
        </div>
        <div class="navbar">
            <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
                <li>
                    <a href="/" class="btn w-auto" type="button">
                        <i class="icon main bi-house-door-fill fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="../community" class="btn w-auto" type="button">
                        <i class="icon main bi-file-earmark-text fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="../place/around" class="btn w-auto" type="button">
                        <i class="icon main bi-map fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="../place/myplace" class="btn w-auto" type="button">
                        <i class="icon main bi-heart fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="login" class="btn w-auto" type="button">
                        <i class="icon main bi-person-fill fa-3x"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>
