<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />

    <style>
        .table {
            margin-bottom: 0;
        }

        .reImg {
            height: 5rem;
            width: 5rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
            font-size: 12px;
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

        #reportDate::before {
            content: attr(placeholder);
            color: gray;
            width: 100%;
        }

        #reportDate:focus::before,
        #reportDate:valid::before {
            display: none;
        }
    </style>
    <script>
        function setStarRating(starRating) {
            const starArr = [];

            for (i = 0; i < starRating; i++) {
                starArr.push(`<i class="fa fa-star fill mt-2"></i>`);
            }
            for (i = 0; i < 5 - starRating; i++) {
                starArr.push(`<i class="fa fa-star"></i>`);
            }

            return starArr.join('');
        }

        function search() {
            $('#btn_search').click(() => {
            	if(!($('#word').val())) {
            		$('#modalMsg').text("장소명을 입력하세요.");
     	            $('#cancelBtn').hide();
     	            $('#okBtn').hide();
     	            $('#onClickBtn').show();
     	            $('#delCheckModal').modal();
            	} else 
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/search/' + $('#word').val(),
                    method: 'get',
                    success: (reviews) => {
                        const list = [];

                        if (reviews.length) {
                            $.each(reviews, (i, review) => {
                                const reviewImgArr = [];
                                $.each(review.reviewImages, (i, reviewImage) => {
                                    reviewImgArr.push(`<img class="reImg ml-3" src="/attach/reviewImages/\${reviewImage.fileName}"/>`);
                                });

                                list.unshift(
                                    `<div class="card-body border mb-2">
                                        <button type="button" id="deleteBtn" class="btn btn-danger deleteBtn" style="float: right"
                                                 data-toggle="modal" value="\${review.reviewId}">삭제</button>
                                        <div class="row text-start ml-1 mr-1">
                                            <p class="mt-1 ml-2">\${review.nickname}</p>
                                            <p class="mt-1 ml-2" style="color: #fb3959">
                                                <div class="stars">
                                                    \${setStarRating(review.starRating)}
                                                </div>
                                            </p>
                                            <p class="mt-2 ml-2" style="font-size: 13px">\${review.createdAt}</p>
                                            <p class="mt-1 ml-4">장소: \${review.placeName}</p>
                                            </div>
                                            <div class="row reviewImg mb-2">
                                                \${reviewImgArr.join('')}
                                            </div>
                                            <p class="col card-text mt-3">\${review.content}</p>
                                        </div>
                                    </div>`
                                );
                            });
                        } else {
                            list.push(`<div class="card-body border mb-2 text-center">등록된 리뷰가 없습니다.</div>`);
                        }
                        $('#searchReviews').empty();
                        $('#searchReviews').append(list.join(''));
                        init();
                    },
                });
            });
        }
        $(() => {
            search();
        });

        function showModal(msg, isOk, reviewId) {
            $('#cancelBtn').toggle(isOk);
            $('#okBtn').toggle(isOk);
            $('#onClickBtn').toggle(!isOk)
            $('#modalMsg').text(msg);
            $('#reviewIdInput').val(reviewId);
            $('#delCheckModal').modal();
        }

        function delReview(reviewId) {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/review/del/' + reviewId,
                method: 'delete',
                success: (reviews) => {
                    if (reviews > 0) {
                        showModal('삭제가 완료되었습니다.', false);
                    } else {
                        showModal('삭제를 실패했습니다.', false);
                    }
                },
            });
        }

        function listReviews() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/review/list',
                method: 'get',
                contentType: 'application/json',
                success: (reviews) => {
                    const list = [];

                    if (reviews.length) {
                        $.each(reviews, (i, review) => {
                            const reviewImgArr = [];

                            $.each(review.reviewImages, (i, reviewImage) => {
                                reviewImgArr.push(`<img class="reImg ml-3" src="/attach/reviewImages/\${reviewImage.fileName}"/>`);
                            });

                            list.unshift(
                                `<div type="button" class="row accordion text-center border-bottom mx-1 py-3"
                                    style="font-size: 14px" id="acco\${review.reviewId}" data-toggle="collapse"
                                    data-target="#coll\${review.reviewId}" aria-expanded="true" aria-controls="coll\${review.reviewId}">
                                    <div class="col">\${review.reviewId}</div>
                                    <div class="col">\${review.placeName}</div>
                                    <div class="col">\${review.createdAt}</div>
                                </div>
                                <div id="coll\${review.reviewId}" class="collapse" aria-labelledby="hea\${review.reviewId}" data-parent="#acco\${review.reviewId}">
                                    <div class="row">
                                       <div class="col mx-1">
                                            <div class="card">
                                                <div class="card-body">
                                                    <button type="button" id="deleteBtn" class="btn btn-danger deleteBtn" style="float: right"
                                                        data-toggle="modal" value="\${review.reviewId}">삭제</button>
                                                    <div class="row text-start ml-1 mr-1">
                                                        <p class="mt-1 ml-2">\${review.nickname}</p>
                                                        <p class="mt-1 ml-2" style="color: #fb3959">
                                                            <div class="stars">
                                                                \${setStarRating(review.starRating)}
                                                            </div>
                                                        </p>
                                                        <p class="mt-2 ml-2" style="font-size: 13px">\${review.createdAt}</p>
                                                        <p class="mt-1 ml-4">장소: \${review.placeName}</p>
                                                    </div>
                                                    <div class="row reviewImg mb-2">
                                                        \${reviewImgArr.join('')}
                                                    </div>
                                                    <p class="col card-text mt-3">\${review.content}</p>
                                                </div>
                                            </div>
                                       </div>
                                    </div>
                                </div> `
                            );
                        });
                    } else {
                        list.push(`<div class="card-body border ml-1 mb-2 text-center">등록된 리뷰가 없습니다.</div>`)

                    }
                    $('#reviews').empty();
                    $('#reviews').append(list.join(''));
                    init();
                },
            });
        }

        function init() {
            $('.deleteBtn').on('click', function (e) {
                showModal('삭제하시겠습니까?', true, e.target.value);
            });
        }

        $(() => {
            listReviews();
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <header class="row-1">
        <img src="<%=request.getContextPath()%>/attach/logo_admin.jpg" style="width: 100%; height: 70px" />
    </header>
    <hr />
    <div class="row">
        <div class="col-2">
            <ul class="text-center">
                <li><a href="<%=request.getContextPath()%>/admin/">회원 조회</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/declare">신고 조회</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/review">리뷰 조회</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/place">장소 조회</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/logo">로고 추가</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/logout">로그아웃</a></li>
            </ul>
        </div>
        <div class="col mt-2">
            <div class="row">
                <div class="col-5">
                    <h3 class="ml-2 mt-4">리뷰 조회</h3>
                </div>
                <div class="col-7">
                    <nav class="d-flex justify-content-end mt-4 mb-3">
                        <div class="d-flex col-5">
                            <input type="text" class="form-control mr-2" id="word" name="placeName" placeholder="장소명" />
                            <button type="button" id="btn_search" class="btn btn-info col-3 mr-2 label text-center">조회</button>
                        </div>
                    </nav>
                </div>
            </div>
            <div id="searchReviews">
                <table class="table mx-1">
                    <thead style="background-color: #7882a4; color: #d6e5fa">
                    <tr>
                        <th class="col-4 text-center">No.</th>
                        <th class="col-4 text-center">장소</th>
                        <th class="col-4 text-center">등록일</th>
                    </tr>
                    </thead>
                </table>
                <div id="reviews" class="mb-5 pb-5"></div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="delCheckModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="modalMsg"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" onCLick="delReview($('#reviewIdInput').val())" id="okBtn" class="btn btn-primary">확인</button>
                    <button onCLick="location.reload()" type="button" id="onClickBtn" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
                    <input type="hidden" id="reviewIdInput" name="reviewIdInput" value="" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
