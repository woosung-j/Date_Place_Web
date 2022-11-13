<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <script>
        function isVal(field) {
            let isGood = false;
            let errMsg;

            if (!field.val()) {
                errMsg = field.attr('name') + '을 입력하세요.';
            } else {
                isGood = true;
            }

            if (!isGood) {
                $('#errMsg').text(errMsg).css('color', 'red');
                $('#modalBtn').hide();
                $('#modal').modal();
            }
            return isGood;
        }

        function init() {
            $('#uploadBtn').click(() => {
                console.log('btnClick');
                if (isVal($('#title')) && isVal($('#content'))) {
                    console.log('if');
                    const tagArr = $('#hashtag').val().split(' ');
                    $.ajax({
                        url: '<%=request.getContextPath()%>/community/addFeed',
                        method: 'post',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            feedId: '${feedId}',
                            userId: '${userId}',
                            createdAt: '${createdAt}',
                            title: $('#title').val(),
                            content: $('#content').val(),
                            tags: $('#hashtag').val().split(' '),
                        }),
                        success: (data) => {
                            console.log(data);
                        },
                    });
                    console.log('end');
                }
            });
        }

        $(() => {
            init();
        });
    </script>
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
</head>
<body>
    <div class="container">
        <header>
            <nav class="row navbar bg-light text-center align-middle fixed-top">
                <a href="javascript:window.history.back();" class="col btn" onsubmit="return check()"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-6 font-gamja-flower">게시글 작성</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="container min-vh-100">
            <div id="mainContent">
                <form class="col form">
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
                        <button type="button" class="col-12 btn btn-primary mx-0 px-0" id="uploadBtn">업로드</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal" tabindex="-1" id="modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="errMsg"></p>
                    </div>
                    <div class="modal-footer" id="modalBtn">
                        <button type="button" class="btn btn-primary">예</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="navbar">
            <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
                <li>
                    <a href="/" class="btn w-auto" type="button">
                        <i class="icon main bi-house-door-fill fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="community" class="btn w-auto" type="button">
                        <i class="icon main bi-file-earmark-text fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/around" class="btn w-auto" type="button">
                        <i class="icon main bi-map fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="place/myplace" class="btn w-auto" type="button">
                        <i class="icon main bi-heart fa-3x"></i>
                    </a>
                </li>
                <li>
                    <a href="user/login" class="btn w-auto" type="button">
                        <i class="icon main bi-person-fill fa-3x"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>
