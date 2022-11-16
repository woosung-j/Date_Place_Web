<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .font-gamja-flower {
            font-family: 'Gamja Flower', cursive;
            font-size: 1.7rem;
        }

        .heart_list {
            display: flex;
        }

        .img-style {
            position: relative;
            width: 5rem;
            height: 6rem;
        }

        .img-fluid {
            position: absolute;
            width: 5rem;
            height: 6rem;
        }

        a {
            color: black;
            text-decoration: none !important;
        }

        a:hover {
            color: black;
            text-decoration: none !important;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
    <script>
        function init() {
            $.ajax({
                url: '<%=request.getContextPath()%>/place/place/my',
                method: 'get',
                success: (data) => {
                    const arr = [];
                    if (data.length) {
                        data.forEach((place) => {
                            const imgArr = [];
                            if (place.placeImage.length > 0) {
                                let url = '<%=request.getContextPath()%>/attach/placeImage/' + place.placeImage[0].fileName;
                                imgArr.push(`<img class="img-fluid" src="\${url}" />`);
                            } else {
                                imgArr.push(`<div class="img-fluid"></div>`);
                            }
                            arr.push(
                                `<li class="row border-bottom pt-3 pb-3">
                                    <div class="img-style">
                                        <a href="<%=request.getContextPath()%>/place/place/\${place.placeId}">
                                            \${imgArr.join('')}
                                        </a>
                                    </div>
                                    <div class="col-8">
                                        <a href="<%=request.getContextPath()%>/place/place/\${place.placeId}">
                                            <h5>\${place.placeName}</h5>
                                            \${place.introduction}
                                        </a>
                                    </div>
                                    <span>조회수 \${place.views}&nbsp;&nbsp;&nbsp;찜\${place.likeCount}</span>
                                </li>`
                            );
                        });
                        $('#MyPlaceList').empty();
                        $('#MyPlaceList').append(arr.join(''));
                    } else {
                        $('#MyPlaceList').append(`
                            <li class="row border-bottom pt-3 pb-3">
                                <div class="col-8">
                                    <h6>관심장소가 없습니다.</h6>
                                </div>
                            </li>
                        `);
                    }
                },
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
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-7 font-gamja-flower">관심장소<i id="bookmark" class="bi bi-bookmark-fill icon"></i></h3>
                <p class="col"></p>
                <p class="col"></p>
                <input type="hidden" id="isBookmark" name="isBookmark" />
            </nav>
        </header>
        <div class="row pt-62 mt-3"></div>
        <div class="container heart_list px-0 pb-5 mb-3">
            <ul id="MyPlaceList" class="box col list-unstyled mt-2 border-top"></ul>
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
