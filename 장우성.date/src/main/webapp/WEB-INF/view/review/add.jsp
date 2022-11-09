<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .exImg {
            height: 7rem;
            width: 7rem;
            border: 0.1rem solid;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
        }

        .reImg {
            height: 4rem;
            width: 4rem;
            border: 0.1rem solid;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
        }

        a {
            text-decoration: none;
            color: #222;
        }

        .star-rating {
            width: 300px;
            height: 30px;
            display: flex;
            flex-direction: row-reverse;
            justify-content: space-around;
            padding: 0 0.1em;
            text-align: center;
            margin: auto;
        }

        .stars .fa {
            font-size: 18px;
            cursor: pointer;
            color: #555;
        }

        .stars .fa.active {
            color: #fb3959;
        }

        .filebox input[type='file'] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        textarea::placeholder {
            font-size: small;
            text-align: center;
        }

        #textBox {
            height: 13.8rem;
            border: none;
            resize: none;
        }
    </style>

    <script>
        function addReview() {
            $(() => {
                $('.stars .fa').click(function () {
                    $(this).addClass('active');
                    $(this).prevAll().addClass('active');
                    $(this).nextAll().removeClass('active');
                    let num = $(this).index();
                    let starRate = num + 1;
                });
            });

            $('#addReviewBtn').click(() => {
                $.ajax({
                    url: 'add',
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        content: $('#textBox').val(),
                        starRating: $('.active').length,
                        placeId: 1,
                    }),
                    success: addReview(),
                });
            });
        }
        $(addReview);

        $(() => {
            $('#textBox').keyup(function (e) {
                let content = $(this).val();

                if (content.length == 0 || content == '') {
                    $('.textCount').text('(0/500)');
                } else {
                    $('.textCount').text('(' + content.length + '/500)');
                }

                if (content.length > 500) {
                    $(this).val($(this).val().substring(0, 500));
                }
            });
        });
    </script>
</head>

<body>
    <div class="container">
        <header style="padding-top: 80px">
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-7 font-gamja-flower">평가해주세요!</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <table class="tg">
            <thead>
                <tr>
                    <td class="tg-0lax">
                        <h5 class="col text-start" style="font-size: 18px">
                            다녀온 후기를<br />
                            사진으로 남겨주세요!<br />
                        </h5>
                    </td>
                    <td class="tg-0lax" rowspan="2">
                        <div class="row mb-2">
                            <div class="row exImg ml-3">예시이미지</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="tg-0lax">
                        <p class="col" style="font-size: 14px">
                            자세한 리뷰는<br />
                            구매를 고민하는 분들에게<br />
                            큰 도움이 됩니다.<br />
                        </p>
                    </td>
                </tr>
            </thead>
        </table>
        <form id="addReview" action="add" method="post">
            <div class="row-1 border mx-3">
                <p class="col"></p>
                <div class="row-1 text-center border mx-3 mb-3 bg-light filebox">
                    <label for="imgFile" style="cursor: pointer; font-size: 14px"> <i class="bi bi-camera" style="font-size: 18px"></i><br />사진업로드 </label>
                    <input type="file" id="imgFile" class="pb-5 form-control" accept="image/*" />
                </div>

                <div class="row-1 text-center border mx-3 mb-3 bg-light" style="height: 14rem">
                    <textarea
                        class="form-control bg-light"
                        placeholder="&#13;&#10;&#13;&#10;&#13;&#10;&#13;&#10;다른 분들에게 도움이 되도록 &#13;&#10; 솔직한 평가를 남겨주세요."
                        rows="3"
                        id="textBox"
                        style="font-size: 13px"
                    ></textarea>
                    <p class="text-right textCount" id="count" style="font-size: 13px">(0/500)</p>
                </div>
                <div class="star-rating">
                    <div class="stars">
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                        <i class="fa fa-star active"></i>
                    </div>
                </div>
            </div>
            <div>
                <p class="col text-start text-black-50" style="font-size: 11px">
                    <strong>후기 작성 시 유의사항</strong><br />
                    -상품과 관계없는 내용은 삭제 및 비공개 처리될 수 있습니다.<br />
                </p>
            </div>
            <input type="hidden" id="placeId" value="${placeId}" />
            <footer style="padding-top: 100px">
                <nav class="row navbar fixed-bottom text-center justify-content-center bg-light">
                    <button type="button" id="addReviewBtn" class="btn col-12 btn w-100 font-gamja-flower" id="successBtn" style="color: #ff5858" data-toggle="modal" data-target="#infoModal">
                        작성완료
                    </button>
                </nav>
            </footer>
        </form>
    </div>

    <!-- 모달창 -->
    <div class="modal fade" id="infoModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content mx-5">
                <div class="modal-body text-center py-3">
                    <p>리뷰가 등록되었습니다.</p>
                    <a href="<%=request.getContextPath()%>/review/list" class="btn btn-primary"> 확인 </a>
                </div>
            </div>
        </div>
    </div>
</body>