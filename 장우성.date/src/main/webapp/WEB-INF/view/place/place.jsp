<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <link rel="stylesheet" href="../../res/kakaoMap.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ae0f4d8a7c4511de8de27cd0e165da0&libraries=services,clusterer,drawing"></script>
    <style>
        .border {
            margin-top: 13rem;
            top: 50%;
            left: 50%;
            border-style: solid;
        }

        .btn-lg {
            padding: 10px 83px;
            font-size: 15px;
            line-height: 1.2;
            border-radius: 5px;
        }

        .menuImg {
            width: 3.5rem;
            height: 3.5rem;
            border: 0.1rem solid black;
            margin-right: 0.5rem;
            font-size: 13px;
            text-align: center;
            display: flex;
            align-items: center;
        }

        .myReviewImg {
            height: 6rem;
            width: 9rem;
            border: 0.1rem solid;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
            font-size: 15px;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .swiper {
            width: auto;
            height: 250px;
        }

        .swiper-slide {
            text-align: center;
            background: #fff;

            /* Center slide text vertically */

            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .fill {
            color: #fb3959;
        }

        div.stop-dragging {
            -ms-user-select: none;
            -moz-user-select: none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
    </style>
    <script>
        let map;

        async function kakaoMapInit(addr) {
            await getMap();
            getXY(addr);
        }

        function getXY(obj) {
            let geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch(obj.addr, (result, status) => {
                if (status === kakao.maps.services.Status.OK) {
                    let moveLatLon = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 지도 중심을 부드럽게 이동시킵니다
                    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
                    map.panTo(moveLatLon);

                    getCustomOverlay(obj.name, obj.addr, result[0]);
                }
            });
        }
        function js() {}
        function getCustomOverlay(title, addr, position) {
            // 지도에 마커를 표시합니다
            let marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(position.y, position.x),
            });

            // 커스텀 오버레이에 표시할 컨텐츠 입니다
            // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
            // 별도의 이벤트 메소드를 제공하지 않습니다
            let content = `<div class=" wrap">
                                <div class="info text-center stop-dragging"><br><br>
                                    <p id="address_div">\${addr}</p>
                                    <a href='#' class='btn'>
                                    <div class="infoBody mt-2" style='font-size:14px;'>
                                    </div><hr class='mt-2'>
                                    <div class='infoFooter mt-3'>
                                        <a href="javascript:void(0);" id="copy_btn" onclick="copy()" type="button" class='btn btn-white' style="color:grey"><i class="bi bi-paperclip"></i>주소 복사</a>
                                        <a href="javascript:void(0);" type="button" class='btn btn-white' style="color:grey"><i class="bi bi-share"></i>공유하기</a>
                                    </div>
                                </div>
                            </div>`;

            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition(),
            });

            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                overlay.setMap(map);
            });
        }
        function copy() {
            let content = $('#address_div').text();

            navigator.clipboard
                .writeText(content)
                .then(() => {
                    console.log('Text copied to clipboard...');
                })
                .catch((err) => {
                    console.log('Something went wrong', err);
                });
        }
        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
        function closeOverlay() {
            overlay.setMap(null);
        }

        async function getMap() {
            let mapContainer = await document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.48457, 126.93028), // 지도의 중심좌표
                    level: 3, // 지도의 확대 레벨
                };

            map = await new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            map.setZoomable(false);
        }

        function setStarRating(starRating) {
            const starArr = [];

            for (i = 0; i < starRating; i++) {
                starArr.push(`<i class="fa fa-star fill mt-1"></i>`);
            }
            for (i = 0; i < 5 - starRating; i++) {
                starArr.push(`<i class="fa fa-star"></i>`);
            }

            return starArr.join('');
        }

        function getPlace() {
            $.ajax({
                url: '<%=request.getContextPath()%>/place/get/' + $('#placeId').val(),
                method: 'get',
                success: (data) => {
                    const detail = data.detail;
                    const review = data.review;

                    $('#placeName').text(data.placeName);
                    $('#subPlaceName').text(data.placeName);
                    $('#introduction').text(data.introduction);
                    $('#place_like').text(`찜 \${data.placeLikeCount}`);
                    
                    $('#searchNaver').append(
                        `<a href="#" class="btn">
                            <i class="bi bi-search-heart mr-4"></i>
                        네이버에서 \${data.placeName} 검색
                        </a>`
                    )
                    
                    if (detail != null) {
                        $('#address').val(detail.address);
                    }

                    if (data.isLike > 0) {
                        $('#place_heart').addClass('bi bi-heart-fill').attr('style', 'color:#E14D2A;');
                    } else {
                        $('#place_heart').addClass('bi bi-heart');
                    }

                    const placeImageArr = [];
                    $.each(data.placeImages, (i, img) => {
                        placeImageArr.push(`<img class="swiper-slide reImg" src="/attach/placeImage/\${img.fileName}" />`);
                    });

                    $('#placeImage').append(`
                        <div class="swiper-wrapper">\${placeImageArr.join('')}</div>
                        <div class="swiper-pagination"></div>
                    `);

                    if (detail?.tel) {
                        $('#tel').text($('#tel').text() + detail.tel);
                    }

                    if (detail?.parking == null && detail?.openingHours == null && detail?.closingHours == null && detail?.dayOff == null) {
                        $('#info').hide();
                        $('#detail').hide();
                    } else {
                        const detailArr = [];

                        if (detail?.openingHours) {
                            detailArr.push(`
                                <tr class="border-bottom border-top">
                                    <td class="col-4 text-center pt-2 pb-2">시간</td>
                                    <td id="time" class="text-center">\${detail.openingHours} ~ \${detail.closingHours}</td>
                                </tr>
                            `);
                        }

                        if (detail?.dayOff) {
                            detailArr.push(`
                                <tr class="border-bottom border-top">
                                    <td class="col-4 text-center pt-2 pb-2">휴무</td>
                                    <td id="parking" class="text-center">\${detail.dayOff}</td>
                                </tr>
                            `);
                        }

                        if (detail?.parking) {
                            detailArr.push(`
                                <tr class="border-bottom border-top">
                                    <td class="col-4 text-center pt-2 pb-2">주차</td>
                                    <td id="parking" class="text-center">\${data.detail.parking == 0 ? "불가능" : "가능"}</td>
                                </tr>
                            `);
                        }
                        $('#detail_body').append(detailArr.join(''));
                    }
                    if (detail?.contact) {
                        $('#homepage').attr('href', `\${detail.contact}`);
                    }

                    if (data.menus?.length == 0) {
                        $('#menu').hide();
                        $('#menu_table').hide();
                    } else {
                        let menuArr = [];
                        $.each(data.menus, (i, menu) => {
                        	let result = (menu.price).toLocaleString('ko-KR');
                            menuArr.push(`
                                <tr class="border-bottom border-top">
                                    <td class="col-9 pt-2 pb-2">\${menu.menuName}</td>
                                    <td>\${result}원</td>
                                </tr>
                            `);
                        });

                        $('#menu_table_body').append(menuArr.join(''));
                    }

                    let reviewHeader = $('#review_header');
                    reviewHeader.text(`다녀온 유저 리뷰 \n \${review?.reviewCount != null ? review.reviewCount : '0'}개의 리뷰가 있어요.`);
                    reviewHeader.html(reviewHeader.html().replace(/\n/g, '<br>'));
                    if (review == null) {
                        $('#review_thead').hide();
                    } else {
                        $('#review_nickname').text(`\${review.nickname}`);
                        $('#review_starRating').html(`\${setStarRating(review.starRating)}`);
                        $('#review_createdAt').text(`\${review.createdAt}`);
                        $(`#review_content`).text(`\${review.content}`);
                    }

                    let addr = {
                        name: data?.placeName,
                        addr: detail?.address,
                    };

                    kakaoMapInit(addr);
                    swiper();
                },
            });
        }

        function swiper() {
            var swiper = new Swiper('.mySwiper', {
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
            });
        }

        $(() => {
            getPlace();
            copy();
        });
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar white text-center align-middle px-0">
            <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h4 id="placeName" class="col-6 font-gamja-flower"></h4>
            <p class="col"></p>
            <a href="#" class="col btn">
                <i class="bi bi-share-fill"></i>
            </a>
        </nav>
    </header>
    <div id="placeImage" class="swiper mySwiper"></div>
    <div class="row">
        <div class="col">
            <div class="text-center mt-4">
                <h4 id="subPlaceName" class="text-center"></h4>
            </div>
            <div id="introduction" class="text-center pl-2 pr-2 mt-6 mb-5"><br /></div>

            <h6 class="mt-3">
                <i class="bi bi-clock"></i>
                <span id="tel"> 예약/문의하기 &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; </span>
            </h6>

            <h6 id="menu" class="mt-5">
                <i class="bi bi-list"></i>
                <span>주요 메뉴</span>
            </h6>

            <table id="menu_table" class="tg" style="width: 100%; font-size: 15px">
                <tbody id="menu_table_body"></tbody>
            </table>
            <h6 id="info" class="mt-5">
                <i class="bi bi-clock"></i>
                <span>영업 안내</span>
            </h6>

            <table id="detail" class="tg" style="width: 100%; font-size: 15px">
                <tbody id="detail_body"></tbody>
            </table>

            <a id="homepage" href="#" class="btn w-auto mt-4" type="button" style="display: block">
                <span>홈페이지/인스타그램 보러가기</span>
            </a>

            <div id="map" class="col mt-5 w-auto" style="width: 120px; height: 180px; margin-bottom: 30px"></div>
        </div>
    </div>
    <div id="review" class="allReview pb-5 mb-3">
        <p id="review_header" class="text-center"></p>
        <table class="col mb-3">
            <thead id="review_thead">
            <tr>
                <td class="row-1 mt-5 border rounded mb-3">
                    <div class="col pt-1">
                        <div class="row text-start ml-1">
                            <p id="review_nickname" class="mt-1 ml-1" style="font-size: 13px"></p>
                            <p id="review_starRating" class="mt-1 ml-1" style="font-size: 13px"></p>
                            <p id="review_createdAt" class="mt-1 ml-1" style="font-size: 13px"></p>
                        </div>
                        <div class="row text-start ml-1 mr-1 mb-2" style="font-size: 14px">
                            <p id="review_content"></p>
                        </div>
                        <div class="row reviewImg mb-2">
                        </div>
                    </div>
                </td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="row-1 mt-5 border mb-3">
                    <a href="<%=request.getContextPath()%>/review/list/${placeId}" class="btn" style="display: block"> 리뷰 전체 보기 </a>
                </td>
            </tr>
            </tbody>
        </table>
        <table class="col">
            <tbody>
            <tr>
                <td class="mt-5 border mb-3">
                    <a href="<%=request.getContextPath()%>/declaration/add/${placeId}" class="btn">
                        <i class="bi bi-exclamation-octagon mr-4"></i>
                        잘못된 장소 신고
                    </a>
                </td>
            </tr>
            <tr>
                <td class="mt-5 border mb-3" id="searchNaver">
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="navbar mt-80">
        <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
            <li>
                <a href="#" class="btn w-auto" type="button">
                    <i id="place_heart" class=""></i><br />
                    <span id="place_like">찜 0</span>
                </a>
            </li>
            <li>
                <button type="button" class="btn btn-primary btn-lg disabled" data-target="#Modal" data-toggle="modal">예약하기</button>
                <a href="#" class="btn w-auto" type="button"> </a>
            </li>
        </ul>
    </div>
</div>
<input type="hidden" id="placeId" name="placeId" value="${placeId}" />
<!-- 모달창 -->
<div class="modal fade" id="Modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p>예약/문의하고 싶어요!<br />그림화원</p>
                <a href="#infoModal" class="btn btn-primary" data-toggle="modal" data-target="#infoModal" data-dismiss="modal">전화하기</a>
            </div>
        </div>
    </div>
</div>
</body>
