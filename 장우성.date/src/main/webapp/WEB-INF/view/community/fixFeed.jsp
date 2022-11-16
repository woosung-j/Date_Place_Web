<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        #title {
            width: 100%;
            font-weight: bold;
            font-size: 12px;
            height: 3rem;
            resize: none;
            margin-top: 100px;
            border-left-width: 0;
            border-right-width: 0;
            border-top-width: 0;
            border-bottom-width: 1;
        }

        #content {
            width: 100%;
            font-size: 12px;
            height: 20rem;
            resize: none;
            border-left-width: 0;
            border-right-width: 0;
            border-top-width: 0;
            border-bottom-width: 1;
        }

        #hashtag {
            width: 100%;
            font-size: 12px;
            height: 3rem;
            resize: none;
            border-left-width: 0;
            border-right-width: 0;
            border-top-width: 0;
            border-bottom-width: 1;
        }

        *:focus {
            outline: 0;
        }

        *::placeholder {
            font-size: 10px;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
    <script>
        function isVal(field) {
            let isGood = false;
            let errMsg;

            if (!field.val()) {
                errMsg = field.attr('name') + '을 입력하세요.';
            } else isGood = true;

            if (!isGood) {
                $('#modalMsg').text(errMsg).css('color', 'red');
                $('#modalBtn').hide();
                $('#modal').modal();
            }
            return isGood;
        }

        function getFeed() {
            $.ajax({
                url: '<%=request.getContextPath()%>/community/getFeed/' + $('#feedId').val(),
                method: 'get',
                success: (data) => {
                    $('#title').val(data.title);
                    $('#content').text(data.content);
                    if (data.hashtag[0].tag != null) {
                        const arr = [];
                        $.each(data.hashtag, (i, item) => {
                            arr.push(item.tag);
                        });
                        $('#hashtag').val(arr.join(' '));
                    }
                },
            });
        }

        function init() {
            getFeed();

            $('#updateBtn').click(() => {
                if (isVal($('#title')) && isVal($('#content'))) {
                    const tagArr = $('#hashtag').val().split(' ');
                    $('#modalMsg').text('수정 하시겠습니까?');
                    $('#modalBtn').show();
                    $('#modal').modal();

                    $.ajax({
                        url: '<%=request.getContextPath()%>/community/fixFeed',
                        method: 'patch',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            feedId: $('#feedId').val(),
                            title: $('#title').val(),
                            content: $('#content').val(),
                            tags: $('#hashtag').val().split(' '),
                        }),
                    });
                }
            });
        }

        $(() => {
            init();
        });
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn" onsubmit="return check()"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">게시글 수정</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="container min-vh-100">
        <div id="mainContent">
            <form class="col form" id="fixFeed">
                <div class="row form-group">
                    <input id="title" type="text" class="form-control" placeholder="제목을 입력하세요" maxlength="20" name="제목" />
                </div>
                <div class="row form-group">
                    <textarea id="content" class="form-control" rows="20" placeholder="내용을 입력하세요.&#13;&#10;(최대 500자 까지 입력가능합니다.)" maxlength="500" name="내용"></textarea>
                </div>
                <div class="row form-group">
                    <br />(선택)해시태그<br />
                    <textarea id="hashtag" class="form-control tag" placeholder="해시태그를 입력하세요.&#13;&#10;"></textarea>
                </div>
                <div class="row mt-3 p-3">
                    <button type="button" class="col-12 btn btn-primary mx-0 px-0" id="updateBtn">수정</button>
                </div>
            </form>
        </div>
    </div>
    <input type="hidden" id="feedId" value="${feedId}" />
    <div class="modal" tabindex="-1" id="modal">
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
                <div class="modal-footer" id="modalBtn">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='<%=request.getContextPath()%>/community/detail/${feedId}'">예</button>
                </div>
            </div>
        </div>
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
</body>
