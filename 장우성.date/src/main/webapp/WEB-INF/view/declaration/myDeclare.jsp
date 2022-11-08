<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .decralation {
            font-size: 14px;
            overflow: hidden;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
    <script>
        function showModal(msg, isOk, declareId) {
            $('#cancelBtn').toggle(isOk);
            $('#okBtn').toggle(isOk);
            $('#onClickBtn').toggle(!isOk);
            $('#modalMsg').text(msg);
            $('#declareIdInput').val(declareId);
            $('#delCheckModal').modal();
        }

        function delDeclare(declareId) {
            $.ajax({
                url: 'declaration/del/' + declareId,
                method: 'delete',
                success: (data) => {
                    console.log(data);
                    if (data > 0) {
                        showModal('삭제가 완료되었습니다.', false);
                        getList();
                    } else {
                        showModal('삭제를 실패했습니다.', false);
                    }
                },
            });
        }
        function getList() {
            $.ajax({
                url: 'declaration/list',
                method: 'get',
                contentType: 'application/json',
                success: (data) => {
                    const list = [];

                    $('#list').empty();

                    if (data.length) {
                        $.each(data, (i, item) => {
                            list.unshift(
                                `<div id="declare\${item.declareId} \${item.declareId}" class="col-12 w-auto">
                                    <div class="card mb-3">
                                        <div class="card-header row-12 px-0">
                                            <span class="col overflow-hidden">
                                                장소 :
                                                <a href="#">
                                                    <u>\${item.placeName}</u>
                                                </a>
                                            </span>
                                            <span class="col status"> \${item.confirm == 0 ? "해결중" : "해결 완료"} </span>
                                        </div>
                                        <div class="card-body">
                                            <div>
                                                \${item.content}
                                            </div>
                                            <div class="text-right">
                                                <button type="button" id="delBtn"  value="\${item.declareId}" class="delBtn border-0">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>`
                            );
                        });
                        $('#list').append(list.join(''));
                    } else {
                        const html =
                            `<div id="declare" class="col-12 w-auto">
                                <div class="card mb-3">
                                    <div class="card-header row-12 px-0">
                                        <span class="col overflow-hidden">
                                            신고 내역이 없습니다.
                                        </span>
                                    </div>
                                </div>
                            </div>`;

                        $('#list').append(html);
                    }
                    init();
                },
            });
        }

        function init() {
            $('.delBtn').on('click', function (e) {
                showModal('삭제하시겠습니까?', true, e.target.value);
            });
        }

        $(() => {
            getList();
        });
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn">
                <i class="bi bi-chevron-left"></i>
            </a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">나의 신고</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="list pt-62 mt-3 pb-5 mb-3">
        <h5 class="my-2">신고내용</h5>
        <div id="list" class="decralation row mt-2"></div>
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
<div class="modal fade" id="delCheckModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p id="modalMsg"></p>
                <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" onCLick="delDeclare($('#declareIdInput').val())" id="okBtn" class="btn btn-primary">확인</button>
                <button type="button" id="onClickBtn" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
                <input type="hidden" id="declareIdInput" name="declareIdInput" value="" />
            </div>
        </div>
    </div>
</div>
</body>
