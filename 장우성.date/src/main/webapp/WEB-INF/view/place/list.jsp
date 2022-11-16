<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .mint {
            background-color: #ff5858;
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

        h3 {
            white-space: nowrap;
        }
    </style>
    <script>
        function listPlace(orderBy = 0) {
            $('input').not(':radio').val('');
            $('#places').empty();
            const url = 'list/' + $('#si')[0].name + '/' + $('#gu')[0].name + '/' + orderBy;
            $.ajax({
                url,
                success: (placeList) => {
                    if (placeList.length) {
                        places = [];
                        placeList.forEach((place) => {
                            const imgArr = [];
                            if (place.placeImage.length > 0) {
                                let url = '<%=request.getContextPath()%>/attach/placeImage/' + place.placeImage[0].fileName;
                                imgArr.push(`<img class="img-fluid" src="\${url}" />`);
                            } else {
                                imgArr.push(`<div class="img-fluid"></div>`);
                            }
                            places.push(
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

                        $('#places').append(places.join(''));
                    } else {
                        $('#places').append(`
                            <li class="row border-bottom pt-3 pb-3">
                                <div class="col-8">
                                    <h6>등록된 장소가 없습니다.</h6>
                                </div>
                            </li>
                        `);
                    }
                },
            });
        }

        function toggleBookmark() {
            const bookmark = $('#bookmark');
            const bookmarkNum = $('#isBookmark').val();

            if (bookmarkNum == -1) return 0;

            if (bookmarkNum == 0) {
                $.ajax({
                    url: '<%=request.getContextPath()%>/region/bookmark/add',
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        siName: $('#si')[0].name,
                        guName: $('#gu')[0].name,
                    }),
                    success: (data) => {
                        bookmark.attr('class', 'bi bi-bookmark-fill icon');
                        $('#isBookmark').val(data);
                    },
                });
            } else {
                $.ajax({
                    url: '<%=request.getContextPath()%>/region/bookmark/del/' + bookmarkNum,
                    method: 'delete',
                    success: (data) => {
                        bookmark.attr('class', 'bi bi-bookmark icon');
                        $('#isBookmark').val(0);
                    },
                });
            }
        }

        function isMyRegion() {
            $.ajax({
                url: '<%=request.getContextPath()%>/region/isMyRegion/' + $('#si')[0].name + '/' + $('#gu')[0].name,
                type: 'get',
                success: (data) => {
                    if (data > 0) $('#bookmark').attr('class', 'bi bi-bookmark-fill icon');
                    else $('#bookmark').attr('class', 'bi bi-bookmark icon');
                    $('#isBookmark').val(data);
                },
            });
        }

        function init() {
            $('#bookmark').click(() => {
                toggleBookmark();
            });

            listPlace();
        }
        $(() => {
            init();
            isMyRegion();
        });
    </script>
</head>
<body>
    <div class="container">
        <header>
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="<%=request.getContextPath()%>/" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-7 font-gamja-flower">${si} ${gu == "없음" ? "" : gu}<i id="bookmark" class="bi bi-bookmark-fill icon"></i></h3>
                <p class="col"></p>
                <p class="col"></p>
                <input type="hidden" id="isBookmark" name="isBookmark" />
            </nav>
        </header>
        <div class="row pt-62 mt-3">
            <nav class="navbar nav-item bg-light text-center align-middle flex-fill">
                <button type="button" onclick="listPlace(0)" class="btn flex-fill mr-4 text-white mint">전체</button>
                <button type="button" onclick="listPlace(1)" class="btn flex-fill mr-4 text-white mint">맛집</button>
                <button type="button" onclick="listPlace(2)" class="btn flex-fill mr-4 text-white mint">카페</button>
                <button type="button" onclick="listPlace(3)" class="btn flex-fill text-white mint">놀거리</button>
            </nav>
        </div>
        <div class="container heart_list px-0 pb-5 mb-3">
            <ul id="places" class="box col list-unstyled mt-2 border-top"></ul>
        </div>
        <input type="hidden" id="si" name="${si}" value="${si}" />
        <input type="hidden" id="gu" name="${gu}" value="${gu}" />
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
