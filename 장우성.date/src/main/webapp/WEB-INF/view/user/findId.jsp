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
    </style>
</head>
<body>
<div class="container">
    <header class="mb-5">
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn">
                <i class="bi bi-chevron-left"></i>
            </a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">아이디 찾기</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="row pt-62">
        <form action="<%=request.getContextPath()%>/user/findidresult" method="post" class="d-grid col-11 mx-auto">
            <div class="input-group">
                    <span class="input-group-text">
                        <i class="bi bi-person-fill"></i>
                    </span>
                <input id="userName" type="text" class="form-control userName" placeholder="이름" aria-describedby="addon-wrapping" name="userName" />
            </div>
            <div class="input-group mt-3">
                    <span class="input-group-text">
                        <i class="bi bi-telephone-fill"></i>
                    </span>
                <input id="userTel" type="tel" class="form-control userPhoneNum" placeholder="전화번호(&#39;-&#39;&nbsp;제외)" aria-describedby="addon-wrapping" name="phoneNumber" />
            </div>
            <button id="findIdBtn" type="submit" class="btn btn-primary btn-lg col-12 mt-3">아이디 찾기</button>
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
                <p id="modalMsg"></p>
                <a href="#" id="modalBtn" class="btn btn-primary" data-dismiss="modal"> 확인 </a>
            </div>
        </div>
    </div>
</div>
</body>
