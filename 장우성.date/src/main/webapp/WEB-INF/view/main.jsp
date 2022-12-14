<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="./include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../res/mobile.css" />
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

        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
    <script>
        const sigu = [
            [
                { si: '서울', siName: '서울시', gu: ['강남구', '서초구', '송파구', '강동구'] },
                { si: '경기', gu: ['수원시', '안양시', '용인시', '고양시'] },
            ],
            [{ si: '인천', siName: '인천시', gu: ['계양구', '남동구'] }, { null: null }],
        ];

        function setDropdown() {
            let dropdown = [];

            sigu.forEach((row) => {
                dropdown.push(`<div class="row text-left">`);
                row.forEach((col) => {
                    if (col.gu == null) {
                        dropdown.push(`
                        <div class="col d-inline-block word-keep">
                            <p>타지역 준비중</p>
                        </div>
                    `);
                    } else {
                        dropdown.push(`
                        <div class="dropdown col d-inline-block">
                            <a href="#" class="dropdown-toggle text-dark" data-toggle="dropdown">
                                <span class="caret">\${col.si}</span>
                            </a>
                            <div class="dropdown-menu">
                    `);
                        col.gu?.forEach((gu) => {
                            if (col.si == '경기') {
                                dropdown.push(`
                                <a href="<%=request.getContextPath()%>/place/list?si=\${gu}&gu=없음" class="dropdown-item">\${gu}</a>
                            `);
                            } else {
                                dropdown.push(`
                                <a href="<%=request.getContextPath()%>/place/list?si=\${col.siName}&gu=\${gu}" class="dropdown-item">\${gu}</a>
                            `);
                            }
                        });
                        dropdown.push(`</div></div>`);
                    }
                });
                dropdown.push('</div>');
            });

            $('#dropdown-div').append(dropdown.join(''));
        }

        function init() {
            setDropdown();
        }

        function getRecommend() {
            $.ajax({
                url: '<%=request.getContextPath()%>place/recommand',
                method: 'get',
                success: (data) => {
                    if (data) {
                        $('#recommendImg').append(`<img src="/attach/placeImage/\${data.fileName}" />`);
                        $('#recommendPlace').attr('href', `<%=request.getContextPath()%>/place/place/\${data.placeId}`);
                    }
                },
            });
        }

        $(() => {
            init();
            getRecommend();
        });
    </script>
</head>
<body>
<div class="container">
    <header class="row w-auto bg-light fixed-top">
            <span class="col align-middle">
                <img src="<%=request.getContextPath()%>/attach/logo.jpg" style="width: 100%; height: 68px" />
            </span>
    </header>
    <div class="row-1 mt-80 bg-light rounded">
        <div class="col mb-4 pt-3">
            <div>
                <h5 class="font-weight-bold">지역선택</h5>
                <hr style="border-color: #ff5858" />
            </div>
            <div id="dropdown-div"></div>
        </div>
        <div class="row-1 mb-2">
            <div class="col">
                <h5 class="font-weight-bold mb-1">추천 장소</h5>
            </div>
            <div class="col">
                <div id="imgCarousel1" class="carousel slide text-center border w-auto" style="height: 250px" data-ride="carousel" data-interval="8000">
                    <div class="carousel-inner">
                        <a id="recommendPlace" href="" style="color: black">
                            <div id="recommendImg" class="carousel-item active"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <footer class="row mx-auto mt-5 mb-5">
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
</div>
</body>
