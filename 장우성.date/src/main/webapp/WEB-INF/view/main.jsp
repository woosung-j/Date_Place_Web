<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="./include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../res/mobile.css" />
</head>
<body>
    <div class="container">
        <header class="row w-auto p-1 bg-light fixed-top shadow">
            <span class="col align-middle">
                <img />
                <p class="text-center border">로고이미지</p>
            </span>
        </header>
        <div class="row-1 mt-80 bg-light mx-3 rounded">
            <div class="col mb-4 pt-3">
                <div>
                    <h5 class="font-weight-bold">지역선택</h5>
                    <hr />
                </div>
                <div class="row text-left">
                    <div class="dropdown col d-inline-block">
                        <a href="#" class="dropdown-toggle text-dark" data-toggle="dropdown">
                            <span class="caret">서울</span>
                        </a>
                        <div class="dropdown-menu">
                            <a href="./place/01.html" class="dropdown-item">강남,서초</a>
                            <a href="./place/01.html" class="dropdown-item">송파,강동</a>
                            <a href="./place/01.html" class="dropdown-item">광진,성동</a>
                        </div>
                    </div>
                    <div class="dropdown col d-inline-block">
                        <a href="#" class="dropdown-toggle text-dark" data-toggle="dropdown">
                            <span class="caret">경기</span>
                        </a>
                        <div class="dropdown-menu">
                            <a href="./place/01.html" class="dropdown-item">수원</a>
                            <a href="./place/01.html" class="dropdown-item">남양주</a>
                            <a href="./place/01.html" class="dropdown-item">시흥</a>
                        </div>
                    </div>
                </div>
                <div class="row text-left">
                    <div class="dropdown col d-inline-block">
                        <a href="#" class="dropdown-toggle text-dark" data-toggle="dropdown">
                            <span class="caret">인천</span>
                        </a>
                        <div class="dropdown-menu">
                            <a href="./place/01.html" class="dropdown-item">계양</a>
                            <a href="./place/01.html" class="dropdown-item">남동</a>
                        </div>
                    </div>
                    <div class="col d-inline-block word-keep">
                        <p>타지역 준비중</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-1">
            <div class="col">
                <h5 class="font-weight-bold mb-2">추천 장소</h5>
            </div>
            <div class="col">
                <div id="imgCarousel1" class="carousel slide text-center border w-auto" style="height: 250px" data-ride="carousel" data-interval="8000">
                    <div class="carousel-inner">
                        <a href="./place/02.html" style="color: black"><p>장소이미지</p></a>
                        <div class="carousel-item active">
                            <a href="#"><img /></a>
                        </div>
                        <div class="carousel-item">
                            <a href="#"><img /></a>
                        </div>
                    </div>
                    <a href="#imgCarousel1" class="carousel-control-prev" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a href="#imgCarousel1" class="carousel-control-next" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                    <ol class="carousel-indicators mx-auto">
                        <li data-target="#imgCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#imgCarousel" data-slide-to="1"></li>
                    </ol>
                </div>
            </div>
        </div>
        <footer class="row mx-auto mt-4 mb-5">
            <p class="col text-center text-black-50" style="font-size: 12px">
                대표전화: 010-1234-5678<br />
                제휴/문의: today_date@gmail.com<br />
                서울특별시 관악구 신림로 340<br />
                사업자 등록번호 123-45-67890
            </p>
        </footer>
        <div class="navbar">
            <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
                <li>
                    <a href="/" class="btn w-auto" type="button">
                        <i class="icon main bi-house-door-fill fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="community" class="btn w-auto" type="button">
                        <i class="icon main bi-file-earmark-text fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/around" class="btn w-auto" type="button">
                        <i class="icon main bi-map fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/myplace" class="btn w-auto" type="button">
                        <i class="icon main bi-heart fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="user/login" class="btn w-auto" type="button">
                        <i class="icon main bi-person-fill fa-3x"></i>
                    </a>
                </li>
            </ul>
        </div>
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
                <a href="<%=request.getContextPath()%>/login" class="btn w-auto" type="button">
                    <i class="icon main bi-person-fill fa-3x"></i>
                </a>
            </li>
        </ul>
    </div>
</body>
