<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .stars .fa {
            font-size: 12px;
            color: #555;
        }

        .fa-star.fill {
            color: #fb3959;
        }

        .myReviewImg {
            height: 4.5rem;
            width: 4rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }

        .profile {
            border-radius: 50%;
            height: 2rem;
            width: 2rem;
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

        function getReviews() {
            $.ajax({
                url: 'review/myReview',
                method: 'get',
                contentType: 'application/json',
                success: (reviews) => {
                    const myReviews = [];

                    $('#myReviews').empty();

                    if (reviews.length) {
                        $.each(reviews, (i, review) => {
                            const reviewImgArr = [];

                            $.each(review.reviewImages, (i, reviewImage) => {
                                reviewImgArr.push(`<img class="myReviewImg ml-2" src="/attach/reviewImages/\${reviewImage.fileName}"/>`);
                            });

                            myReviews.unshift(
                                `<table class="col mb-3">
                                    <thead>
                                        <tr>
                                            <td class="row-1 mt-5 border rounded mb-3">
                                                <div class="col pt-1">
                                                <div class="row text-start">
                                                    <img class="profile" src="attach/user/\${review.profileImage}'/>"/>
                                                    <p class="mt-1 ml-1" style="font-size: 13px">\${review.nickname}</p>
                                                       <p class="mt-1 ml-1 star-rating">
                                                           <div class="stars">
                                                               \${setStarRating(review.starRating)}
                                                           </div>
                                                       </p>   
                                                    <p class="mt-1 ml-1" style="font-size: 13px">\${review.createdAt}</p>
                                                    <p class="mt-2 ml-5" style="font-size: 11px">\${review.placeName}</p>
                                                </div>
                                                <div class="row text-start ml-1 mr-1" style="font-size: 14px">
                                                    <p>\${review.content}</p>
                                                </div>
                                                    <div class="row reviewImg mb-2">
                                                        \${reviewImgArr.join('')} 
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="row-1 mt-5 border rounded mb-3">
                                                <a href="<%=request.getContextPath()%>/review/detailview/\${review.reviewId}" class="btn btn-outline-secondary btn-sm bg-light" style="float: right">상세보기</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>`
                            );
                        });
                        $('#myReviews').append(myReviews.join(''));
                    } else {
                        const html = `<div id="myReview" class="col-12 w-auto text-center">
                              <p>작성한 리뷰가 없습니다.</p>
                            </div>
                        </div>`;
                        $('#myReviews').append(html);
                    }
                },
            });
        }

        $(() => {
            getReviews();
        });
    </script>
</head>
<body>
    <div class="container">
        <header style="padding-bottom: 100px">
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-6 font-gamja-flower">나의 리뷰</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="pb-5 mb-3" id="myReviews"></div>
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