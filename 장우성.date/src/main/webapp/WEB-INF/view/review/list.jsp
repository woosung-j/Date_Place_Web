<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .reImg {
            height: 3rem;
            width: 3rem;
            border: 0.1rem solid;
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
            border: 0.1rem solid;
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

        function listReviews() {
            $('#reviews').empty();

            $.ajax({
                url: '<%=request.getContextPath()%>/review/getReviewList/' + $('#placeId').val(),
                method: 'get',
                success: (reviews) => {
                    if (reviews.length) {
                        const reviewArr = [];

                        $.each(reviews, (i, review) => {
                            const reviewImgArr = [];
                            const delDiv = [];

                            $.each(review.reviewImages, (i, reviewImage) => {
                                reviewImgArr.push(`<img class="reImg ml-3" src="attach/review/\${reviewImage.fileName}'/>"/>`);
                            });

                            reviewArr.unshift(
                                `<tr>
                                    <td style='border:none;'>
                                        <div class="row-1 border rounded mb-2">
                                            <div class="col pt-2">
                                                <div class="row text-start ml-1 mr-1">
                                                    <img class="profile" src="attach/user/\${review.profileImage}'/>"/>
                                                    <p class="mt-1 ml-1">\${review.nickname}</p>
                                                    <p class="mt-1 ml-1 star-rating">
                                                        <div class="stars">
                                                            \${setStarRating(review.starRating)}
                                                        </div>
                                                    </p>
                                                    <p class="mt-1 ml-1">\${review.createdAt}</p>
                                                </div>
                                                <a href="<%=request.getContextPath()%>/review/detailview/\${review.reviewId}" style="color: inherit; text-decoration: none;">
                                                    <div class="row reviewImg mb-2">
                                                    \${reviewImgArr.join('')}
                                                    </div>
                                                    <div class="row dell text-start ml-1 mr-1"  font-size: 14px">
                                                        <p class="content" id="content">\${review.content}</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>`
                            );
                        });
                        $.ajax({
                            url: '<%=request.getContextPath()%>/review/avg/' + $('#placeId').val(),
                            method: 'get',
                            success: (data) => {
                                $('#reviewInfo').append(
                                    '<p class="text-center"><strong>' +
                                    `\${reviews[0].placeName}` +
                                    '<span style="color: #fb3959">★ ' +
                                    `\${data}` +
                                    '</span></strong><br/>' +
                                    '<span style="color: #fb3959">' +
                                    `\${reviews.length}` +
                                    '</span> 개의 리뷰가 있어요.<br /></p>'
                                );
                            },
                        });
                        $('#reviews').append(reviewArr.join(''));
                    } else {
                        $('#reviews').append('<tr><td colspan=5 class=text-center>후기가 없습니다.</td></tr>');
                    }
                },
            });
        }

        $(() => {
            listReviews();
        });
    </script>
</head>
<body>
    <div class="container">
        <header style="padding-top: 80px">
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-6 font-gamja-flower">리뷰보기</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="row-1 mx-3"></div>
        <table class="table">
            <thead>
                <tr id="reviewInfo"></tr>
            </thead>
            <tbody id="reviews"></tbody>
        </table>
        <input type="hidden" id="placeId" value="${placeId}" />
        <footer style="padding-top: 100px">
            <nav class="row navbar fixed-bottom text-center justify-content-center bg-light">
                <% int userId = 0; if(session.getAttribute("userId") != null) userId = (int) session.getAttribute("userId"); if(userId > 0) { %>
                <a type="button" class="col-12 btn w-100 font-gamja-flower" href="<%=request.getContextPath()%>/review/add/${placeId}" style="display: block">
                    다녀온 리뷰 쓰기 <i class="bi bi-pencil-square"></i>
                </a>
                <% } else { %>
                <a type="button" class="col-12 btn w-100 font-gamja-flower" href="<%=request.getContextPath()%>/user/login" style="display: block">
                    로그인 <i class="bi bi-door-open" style="font-size: 20px"></i>
                </a>
                <% } %>
            </nav>
        </footer>
    </div>
</body>
