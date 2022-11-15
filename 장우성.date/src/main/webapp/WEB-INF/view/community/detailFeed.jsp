<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <script>
    function showModal(msg, isOk, feedId) {
        $('#cancelBtn').toggle(isOk);
        $('#okBtn').toggle(isOk);
        $('#onClickBtn').toggle(!isOk);
        $('#modalMsg').text(msg);
        $('#feedIdInput').val(feedId);
        $('#delCheckModal').modal();
    }
    
    function delBtnClickEventListener() {
        $('#delFeedBtn').on('click', function (e) {
            showModal('게시글을 삭제하시겠습니까?', true, e.target.value);
        });
    }
    
    function delFeed(feedId) {
        $.ajax({
            url: '<%=request.getContextPath()%>/community/delFeed/' + $('#feedId').val(),
            method: 'delete',
            success: (data) => {
                if (data > 0) {
                    showModal('삭제가 완료되었습니다.', false);
                } else {
                    showModal('권한이 없습니다.', false);
                }
            },
        });
    }
    
        function detailFeed() {
            $('#detail').empty();

            $.ajax({
                url: '<%=request.getContextPath()%>/community/getFeed/' + $('#feedId').val(),
                method: 'get',
                contentType: 'application/json',
                success: (feed) => {
					console.log(feed)
                    if (Object.values(feed).length) {
                        const feedList = [];
                        const tagList = [];
                        
						
                        if (Object.values(feed).length) {
                            $.each(feed.hashtag, (i, feed) => {
                                tagList.push(`<span class="badge badge-secondary badge-pill">\${feed.tag}</span>`);
                            });
                        }
                        
                        const editbtn = [];
                        if ($('#userId').val() == feed.userId) {
                            editbtn.push(`
                            		<button type="button" class="btn dropdown-toogle" data-toggle="dropdown">
                                    <i class="fas fa-ellipsis-h"></i>
                                	</button>
                            		<div class="dropdown-menu" id="editBtn">
                                    <a href="" class="dropdown-item">수정</a>
                                    <hr />
                                    <button type="button" class="dropdown-item" data-toggle="modal" data-target="#delCheckModal" id="delFeedBtn">삭제</button>
                                </div>`);
                        }

                        feedList.unshift(
                            `<div class="card mb-3">
                            <div class="card-header row-11">
                                <div class="text_output">
                                    <div class="row">
                                        <span class="col-5"><i class="fas fa-user-circle fa-2x"></i>\${feed.nickname}</span>
                                        <span class="col-5">\${feed.createdAt}</span>
                                        <div class="btn-gruop">
                                                \${editbtn.join('')}
                                        </div>
                                    </div>
                                    <h6 class="card-title"><br/>\${feed.title}</h6>
                                    <p class="card-text">\${feed.content}</p>
                                    \${tagList.join('')}
                                </div>
                                <hr />
                                <div class="checkLike">
                                    <span id="checkLike">
                                        <i class="fas fa-heart" id="heart_icon"></i>
                                    </span>
                                    <span id="like-cnt">\${feed.likeCnt}</span>&nbsp;
                                    <i class="fas fa-comment">&nbsp;0</i>
                                </div>
                            </div>`
                        );

                        $('#detail').append(feedList.join(''));
                        delBtnClickEventListener()
                    }
                },
            });
        }

        $(() => {
            detailFeed();
        });
    </script>
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .word-keep {
            word-break: keep-all;
        }

        .mt-80 {
            margin-top: 80px;
        }

        .bi {
            font-size: 16px;
        }

        .icon {
            font-size: 24px;
        }

        .list-style-none {
            list-style: none;
        }

        .font-gamja-flower {
            font-family: 'Gamja Flower', cursive;
            font-size: 2rem;
        }

        a:visited {
            color: black;
        }

        .write {
            position: fixed;
            right: 5%;
            bottom: 15%;
        }

        .badge {
            margin-right: 10px;
        }

        .text_output {
            margin-bottom: 10px;
        }

        .dropdown:hover {
            display: block;
        }

        #name {
            font-size: 14px;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <nav class="row navbar bg-light text-center align-middle px-0">
                <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                <p class="col"></p>
                <h3 class="col-6 font-gamja-flower">게시글 조회</h3>
                <p class="col"></p>
                <p class="col"></p>
            </nav>
        </header>
        <div class="commmunity"></div>
        <div class="col w-auto" id="detail"></div>
    </div>
    <input type="hidden" id="feedId" value="${feedId}" />
    <input type="hidden" id="userId" value="${userId}" />
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
     <div class="modal fade" id="delCheckModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content mx-5">
                <div class="modal-body text-center py-3">
                    <p id="modalMsg"></p>
                    <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" onCLick="delFeed($('#feedIdInput').val())" id="okBtn" class="btn btn-primary">확인</button>
                    <button type="button" id="onClickBtn" onCLick="location.href = document.referrer;" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
                    <input type="hidden" id="feedIdInput" name="feedIdInput" value="" />
                </div>
            </div>
        </div>
    </div>
</body>