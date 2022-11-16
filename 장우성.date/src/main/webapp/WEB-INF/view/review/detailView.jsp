<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <style>
        .reImg {
            height: 100%;
            width: 100%;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .swiper {
            width: 250px;
            height: 250px;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
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
        .stars .fa {
            font-size: 13px;
            color: #555;
        }

        .fa-star.fill {
            color: #fb3959;
        }

        .profile {
            border-radius: 50%;
            height: 2rem;
            width: 2rem;
        }
    </style>
</head>
<script>
    function showModal(msg, isOk, reviewId) {
        $('#cancelBtn').toggle(isOk);
        $('#okBtn').toggle(isOk);
        $('#onClickBtn').toggle(!isOk);
        $('#modalMsg').text(msg);
        $('#reviewIdInput').val(reviewId);
        $('#delCheckModal').modal();
    }

    function del() {
        $('.delBtn').on('click', function (e) {
            showModal('삭제하시겠습니까?', true, e.target.value);
        });
    }

    function setStarRating(starRating) {
        const starArr = [];
        for (i = 0; i < starRating; i++) {
            starArr.push(`<i class="fa fa-star fill"></i>`);
        }
        for (i = 0; i < 5 - starRating; i++) {
            starArr.push(`<i class="fa fa-star"></i>`);
        }
        return starArr.join('');
    }

    function init() {
        var swiper = new Swiper('.mySwiper', {
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    }

    function delBtn() {
        $('.delBtn').on('click', function (e) {
            showModal('삭제하시겠습니까?', true, e.target.value);
        });
    }

    function delDetailReview(reviewId) {
        $.ajax({
            url: '/review/del/' + $('#reviewId').val(),
            method: 'delete',
            success: (data) => {
                if (data > 0) {
                    showModal('삭제가 완료되었습니다.', false);
                } else {
                    showModal('권한이 없습니다.', false);
                }
            },
        });
    }

    function detailReview() {
        $.ajax({
            url: '/review/detailView/' + $('#reviewId').val(),
            method: 'get',
            success: (reviews) => {
                if (reviews.length) {
                    const reviewArr = [];
                    $.each(reviews, (i, review) => {
                        const reviewImgArr = [];
                        $.each(review.reviewImages, (i, reviewImage) => {
                            reviewImgArr.push(`<img class="swiper-slide reImg" src="/attach/reviewImages/\${reviewImage.fileName}"/>`);
                        });

                        const profileImage = review.profileImage != null ? `<img class="profile" src="/attach/profileImage/\${review.profileImage}"/>` : `<i class="fas fa-user-circle fa-2x"></i>`;

                        const delbtn = [];
                        if ($('#userId').val() == review.userId) {
                            delbtn.push(`<button class="delBtn mr-3" type="button" id="deleteBtn"  data-toggle="modal" data-target="#deleteModal" style="border:none; background:none;">삭제</button>`);
                        }

                        reviewArr.push(
                            `<header style="padding-top: 62px">
                            <nav class="row navbar bg-light text-center align-middle fixed-top" id="delbtn">
                                <a href="javascript:window.history.back();" class="col-2 btn"><i class="bi bi-chevron-left"></i> </a>
                                <h3 class="col-7 font-gamja-flower">리뷰상세</h3>
                                <p class="col mt-1">\${delbtn.join('')}</p>

                            </nav>
                        </header>
                            <div class="pb-5 mb-3">
                                <div class="row-1 mt-5 border mx-3 rounded">
                                    <div class="col pt-2">
                                        <div class="row text-start ml-1 mr-1">
                                            \${profileImage}
                                            <p class="mt-1 ml-1">\${review.nickname}</p>
                                            <p class="mt-2 ml-1">\${setStarRating(review.starRating)}</p>
                                            <p class="mt-2 ml-1" style="font-size: 13px">\${review.createdAt}</p>
                                        </div>
                                        <div class="swiper mySwiper">
                                            <div class="swiper-wrapper">\${reviewImgArr.join('')}</div>
                                            <div class="swiper-pagination"></div>
                                        </div>
                                        <div class="row text-start ml-1 mr-1 mt-2" style="font-size: 14px">
                                            <p>\${review.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>`
                        );
                    });
                    $('#detailReview').append(reviewArr.join(''));
                    init();
                    del();
                }
            },
        });
    }
    $(() => {
        detailReview();
    });
</script>
<body>
<input type="hidden" id="reviewId" value="${reviewId}" />
<input type="hidden" id="userId" name="userId" value="${userId}" />
<div class="container" id="detailReview"></div>
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
<div class="modal fade" id="delCheckModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p id="modalMsg"></p>
                <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" onCLick="delDetailReview($('#reviewIdInput').val())" id="okBtn" class="btn btn-primary">확인</button>
                <button type="button" id="onClickBtn" onCLick="location.href = document.referrer;" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
                <input type="hidden" id="reviewIdInput" name="reviewIdInput" value="" />
            </div>
        </div>
    </div>
</div>
</body>
