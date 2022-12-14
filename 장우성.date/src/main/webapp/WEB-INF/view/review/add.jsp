<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .exImg {
            height: 7rem;
            width: 7rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.5rem;
        }

        .reImg {
            height: 4rem;
            width: 4rem;
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
                if ($('#textBox').val() == null || $('#textBox').val() == '') {
                    $('#textBox').val(' ');
                }

                const data = {
                    content: $('#textBox').val(),
                    starRating: $('.active').length,
                    placeId: $('#placeId').val(),
                };

                formData = new FormData($('#form')[0]);
                formData.append('files', $('#files'));
                formData.append('key', new Blob([JSON.stringify(data)], { type: 'application/json' }));

                $.ajax({
                    url: '<%=request.getContextPath()%>/review/add/' + $('#placeId').val(),
                    method: 'post',
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: (data) => {},
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
            <h3 class="col-7 font-gamja-flower">??????????????????!</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <table class="tg col-12">
        <thead>
        <tr>
            <td class="tg-0lax text-center">
                <h5 class="col" style="font-size: 17px; color: #ff5858">????????? ????????? ???????????? ??????????????????<br /></h5>
                <p class="col" style="font-size: 14px">
                    ????????? ?????????<br />
                    ????????? ???????????? ????????????<br />
                    ??? ????????? ?????????.<br />
                </p>
            </td>
        </tr>
        </thead>
    </table>
    <form enctype="multipart/form-data" id="form" action="add" method="post" action="<%=request.getContextPath()%>/review/add/${placeId}">
        <div class="row-1 border mx-3">
            <p class="col"></p>
            <div class="row-1 text-center border mx-3 mb-3 bg-light filebox">
                <label for="files" style="cursor: pointer; font-size: 14px"> <i class="bi bi-camera" style="font-size: 18px"></i><br />??????????????? </label>
                <input type="file" id="files" name="files" class="pb-5 form-control" multiple />
            </div>
            <div class="row-1 text-center border mx-3 mb-3 bg-light" style="height: 14rem">
                    <textarea
                            class="form-control bg-light"
                            placeholder="&#13;&#10;&#13;&#10;&#13;&#10;&#13;&#10;?????? ???????????? ????????? ????????? &#13;&#10; ????????? ????????? ???????????????."
                            rows="3"
                            id="textBox"
                            name="textBox"
                            style="font-size: 13px"
                    ></textarea>
                <p class="text-right textCount" id="count" style="font-size: 13px">(0/500)</p>
            </div>
            <div class="star-rating">
                <div class="stars">
                    <i class="fa fa-star active"></i> <i class="fa fa-star active"></i> <i class="fa fa-star active"></i> <i class="fa fa-star active"></i>
                    <i class="fa fa-star active"></i>
                </div>
            </div>
            <input type="hidden" id="placeId" value="${placeId}" />
        </div>
        <div>
            <p class="col text-start text-black-50" style="font-size: 11px">
                <strong>?????? ?????? ??? ????????????</strong><br />
                -????????? ???????????? ????????? ?????? ??? ????????? ????????? ??? ????????????.<br />
            </p>
        </div>
        <footer style="padding-top: 100px">
            <nav class="row navbar fixed-bottom text-center justify-content-center bg-light">
                <button type="button" id="addReviewBtn" class="btn col-12 btn w-100 font-gamja-flower" id="successBtn" data-toggle="modal" data-target="#infoModal">????????????</button>
            </nav>
        </footer>
    </form>
</div>

<div class="modal fade" id="infoModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p>????????? ?????????????????????.</p>
                <a href="<%=request.getContextPath()%>/review/list/${placeId}" class="btn btn-primary"> ?????? </a>
            </div>
        </div>
    </div>
</div>
</body>
