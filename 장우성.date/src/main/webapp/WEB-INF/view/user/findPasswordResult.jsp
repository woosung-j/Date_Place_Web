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
</head>
<body>
    <div class="container">
        <header class="mb-3">
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
            <form class="d-grid col-11 mx-auto mt-5">
                <h5 id="errMsg" class="info text-center">
                    <p>
                        가입하신 이메일로 <br />
                        임시 비밀번호를 <br />
                        전송하였습니다.
                    </p>
                </h5>
                <a href="login" type="button" class="btn btn-primary btn-lg col-12 mt-3">로그인</a>
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
</body>