<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .text-12 {
            font-size: 12px;
        }

        textarea {
            width: 100%;
            height: 8rem;
            resize: none;
        }
    </style>
    <script>
        function isVal(field) {
            let isGood = false;
            let errMsg;

            if (!field) {
                errMsg = '내용을 입력하세요.';
            } else isGood = true;

            if (!isGood) {
                $('#modalMsg').text(errMsg);
                $('#closeBtn').show();
                $('#addCancelBtn').hide();
                $('#addOkBtn').hide();
                $('#okBtn').hide();
                $('#modal').modal();
            }

            return isGood;
        }

        function init() {
            $.ajax({
                url: '<%=request.getContextPath()%>/declaration/add/getPlaceName/' + $('#placeId').val(),
                method: 'get',
                success: (data) => {
                    $('#placeName').text(`\${data}`);
                },
            });
        }
        $(init);

        function addDeclaration() {
            $('#addBtn').click(() => {
                if (isVal($('#textBox').val())) {
                    $('#modalMsg').text('신고를 하시겠습니까?');
                    $('#closeBtn').hide();
                    $('#addCancelBtn').show();
                    $('#okBtn').show();
                    $('#addOkBtn').hide();
                    $('#modal').modal();
                }
            });

            $('#okBtn').click(() => {
                $.ajax({
                    url: '<%=request.getContextPath()%>/declaration/add/' + $('#placeId').val(),
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        content: $('#textBox').val(),
                        placeId: $('#placeId').val(),
                    }),
                    success: (data) => {
                        addDeclaration();
                    },
                });
                $('#modalMsg').text('신고가 완료되었습니다.');
                $('#closeBtn').hide();
                $('#addCancelBtn').hide();
                $('#okBtn').hide();
                $('#addOkBtn').show();
                $('#modal').modal();
            });
        }
        $(addDeclaration);
    </script>
</head>
<body>
    <div class="container">
        <header>
            <nav class="row navbar bg-light text-center align-middle">
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-6 font-gamja-flower">신고</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="pb-5 mb-3">
            <form class="form row mx-3 mt-3">
                <input type="hidden" id="placeId" value="${placeId}" />
                <h3 class="col-12 mb-4 p-0">장소명 : <span id="placeName"></span></h3>
                <h5 class="col-12 mb-3 p-0">신고 내용</h5>
                <textarea id="textBox" class="col-12 w-100 border border-secondary rounded text-12 mb-3" placeholder="신고하실 내용을 입력해주세요."></textarea>
                <div class="text-12 col-12 p-0">안내사항<br /></div>
                <p class="text-12 col-12 p-0">
                    - 신고는 24시간 가능하며, 순차적으로 확인합니다.
                    <br />가게와 무관하거나 불법적인 내용은 통보없이 삭제될 수 있습니다.
                </p>
                <button type="button" id="addBtn" class="btn btn-primary btn-lg col-12">신고하기</button>
            </form>
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

    <div class="modal" tabindex="-1" id="modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content mx-5">
                <div class="modal-body text-center py-3">
                    <p id="modalMsg"></p>
                    <button type="button" id="addCancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <a href="javascript:window.history.back();" id="addOkBtn" class="btn btn-primary">확인</a>
                    <a id="okBtn" class="btn btn-primary">확인</a>
                    <button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>