<%@ page language="java" contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Noto Sans KR', sans-serif;
        }

        header {
            margin-bottom: 20px;
        }

        .bi {
            font-size: 16px;
        }

        .icon {
            font-size: 24px;
        }

        .pt-62 {
            padding-top: 62px;
        }

        .list-style-none {
            list-style: none;
        }

        .word-keep {
            word-break: keep-all;
        }

        .font-gamja-flower {
            font-family: 'Gamja Flower', cursive;
            font-size: 2rem;
        }

        .textarea {
            width: 100%;
            height: 150px;
            padding: 12px 20px;
            box-sizing: border-box;
            border-radius: 4px;
            font-size: 16px;
            resize: none;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
    <script>
        function isVal(field) {
            let isGood = false;
            let errMsg;

            if (!field) {
                errMsg = '내용을 입력해주세요.';
            } else isGood = true;

            if (!isGood) {
                $('#modalMsg').text(errMsg);
                $('#addCancleBtn').hide();
                $('#addOkBtn').hide();
                $('#replyFix').hide();
                $('#modal').modal();
            }
            return isGood;
        }

        function fixComment() {
            $('#replyFixBtn').click(() => {
                if (isVal($('#inputText').val())) {
                    $('#modalMsg').text('수정하시겠습니까?');
                    $('#addCancleBtn').show();
                    $('#replyFix').show();
                    $('#modal').modal();
                }
            });

            $('#addOkBtn').click(() => {
                $('#modalMsg2').text('수정되었습니다.');
                $('#addCancleBtn').hide();
                $('#replyFix').show();
                $('#modal').modal();
            });

            $('#replyFix').click(() => {
                $.ajax({
                    url: '<%=request.getContextPath()%>/comment/fix',
                    method: 'patch',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        commentId: $('#commentId').val(),
                        content: $('#inputText').val(),
                    }),
                    success: (data) => {
                        window.history.back();
                    },
                });
            });
        }
        $(fixComment);
    </script>
    <body>
        <div class="container">
            <header>
                <nav class="row navbar bg-light text-center align-middle fixed-top">
                    <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                    <p class="col"></p>
                    <h3 class="col-6 font-gamja-flower">댓글 수정</h3>
                    <p class="col"></p>
                    <p class="col"></p>
                </nav>
            </header>
            <input type="hidden" id="commentId" name="${commentId}" value="${commentId}" />
            <div class="row pt-62">
                <form action="fix" class="d-grid col-11 mx-auto mt-4" id="fixComment">
                    <tr>
                        <h3>내용</h3>
                        <hr />
                        <td>
                            <textarea name="content" class="form-control mt-3 mb-4" placeholder="내용을 입력해주세요." maxlength="1000"></textarea>
                        </td>
                    </tr>
                    <button type="button" class="btn btn-primary btn-lg col-12" data-toggle="modal" data-target="#fixModal" id="replyFixBtn">수정</button>
                </form>
            </div>
            <div class="pb-5 mb-3"></div>
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

        <div class="modal fade" id="fixModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content mx-5">
                    <div class="modal-body text-center py-3">
                        <p id="modalMsg"></p>
                        <button type="button" id="addCancleBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <a href="#infoModal" class="btn btn-primary" data-toggle="modal" data-target="#infoModal" data-dismiss="modal" id="addOkBtn">확인</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="infoModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content mx-5">
                    <div class="modal-body text-center py-3">
                        <p id="modalMsg2"></p>
                        <button type="button" class="btn btn-primary" id="replyFix" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</head>
