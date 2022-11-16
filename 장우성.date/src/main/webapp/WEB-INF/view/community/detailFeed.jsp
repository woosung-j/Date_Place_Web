<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
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
    <script>
        function getFeed() {
            $('#detail').empty();

            $.ajax({
                url: '<%=request.getContextPath()%>/community/getFeed/' + $('#feedId').val(),
                method: 'get',
                contentType: 'application/json',
                success: (feed) => {
                    if (Object.values(feed).length) {
                        const feedList = [];
                        const tagList = [];
                        const btnList = [];

                        if (feed.hashtag.length != 0 && feed.hashtag[0]?.tag != null) {
                            $.each(feed.hashtag, (i, item) => {
                                tagList.push(`<span class="badge badge-secondary badge-pill">\${item.tag}</span>`);
                            })
                        }

                        const profileImage =
                            feed.profileImage != null
                                ? `<img class="img-fluid" style="width:20px; height: 20px;" src="/attach/profileImage/\${feed.profileImage}"/>`
                                : `<i class="fas fa-user-circle fa-2x"></i>`;

                        if ($('#userId').val() == feed.userId) {
                            btnList.push(`
                                <button type="button" class="btn dropdown-toogle" data-toggle="dropdown">
                                    <i class="fas fa-ellipsis-h"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a href="<%=request.getContextPath()%>/community/fix/\${feed.feedId}" class="dropdown-item">수정</a>
                                    <hr />
                                    <button type="button" class="dropdown-item" id="delFeedBtn" value="\${feed.feedId}" data-toggle="modal" data-target="#delPost">삭제</button>
                                </div>
                            `);
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

                        feedList.unshift(`
                            <div class="card mb-3">
                                <div class="card-header row-11">
                                    <div class="text_output">
                                        <div class="row">
                                            <span class="col-5">\${profileImage}&nbsp;\${feed.nickname}</span>
                                            <span class="col-5">\${feed.createdAt}</span>
                                            <div class="btn-gruop">
                                                <div class="btn-group">
                                                    \${btnList.join('')}
                                                </div>
                                            </div>
                                        </div>
                                        <h6 class="card-title"><br />\${feed.title}</h6>
                                        <p class="card-text">\${feed.content}</p>
                                        \${tagList.join('')}
                                    </div>
                                    <hr />
                                    <div class="checkLike">
                                        <div id="likeCnt">
                                        	<i class="fas fa-heart" type="button">&nbsp;\${feed.likeCnt}</i>&nbsp;&nbsp;
	                                        <i id="commentCnt" class="fas fa-comment">\${feed.commentCnt}</i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `);

                        $('#detail').append(feedList.join(''));
                        delBtnClickEventListener()
                    }
                },
            });
        }

        function delBtnClickEventListener() {
            $('#delFeedBtn').on('click', function (e) {
                showModal('게시글을 삭제하시겠습니까?', true, e.target.value, delFeed(e.target.value));
            });
        }

        function delFeed(feedId) {
            $.ajax({
                url: '<%=request.getContextPath()%>/community/delFeed/' + $('#feedId').val(),
                method: 'delete',
                success: (data) => {
                    if (data > 0) {
                        showModal('삭제가 완료되었습니다.', false);
                        location.href = "<%=request.getContextPath()%>/community"
                    } else {
                        showModal('권한이 없습니다.', false);
                    }
                },
            });
        }

        function getComments() {
            $('#list').empty();

            $.ajax({
                url: '<%=request.getContextPath()%>/comment/listComment/' + $('#feedId').val(),
                method: 'get',
                contentType: 'application.json',
                success: (commentList) => {
                    if (commentList.length) {
                        const list = [];
                        $.each(commentList, (i, item) => {
                            const btnList = [];
                            if ($('#userId').val() == item.userId) {
                                btnList.push(`
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
                                    <div class="dropdown-menu">
                                        <a href="<%=request.getContextPath()%>/comment/fix/\${$('#feedId').val()}/\${item.commentId}" class="dropdown-item">수정</a>
                                        <hr/>
                                        <button type="button" class="delCommentBtn dropdown-item" id="deleteBtn" value="\${item.commentId}">삭제</button>
                                    </div>
                                `);
                            }
                            list.unshift(
                                `<div class="card" id="card1">
                                    <div class="card-body row-11">
                                        <div class="row">
                                            <span class="col-5"><i class="fa-solid fa-circle-user fa-2x"></i>\${item.nickname}</span>
                                            <span class="col-5">\${item.createdAt}</span>
                                            <div class="btn-group col-2">
                                                <input type="hidden" id="commentId" value="\${item.commentId}"/>
                                                \${btnList.join('')}
                                            </div>
                                        </div>
                                        <p class="card=text mt-3">\${item.content}</p>
                                    </div>
                                </div>`
                            );
                        });
                        $('#list').append(list.join(''));
                        delCommentBtnEvent();
                    }
                },
            });
        }

        function addComment() {
            $('#replyAddBtn').click(() => {
                $.ajax({
                    url: '<%=request.getContextPath()%>/comment/add',
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        feedId: $('#feedId').val(),
                        content: $('#inputTextArea').val(),
                    }),
                    success: (data) => {
                        getComments();
                        $('#inputTextArea').val('');
                        $('#commentCnt').text(1 + Number($('#commentCnt').text()))
                    },
                });
            });
        }

        function delComment() {
            $.ajax({
                url: '<%=request.getContextPath()%>/comment/del/' + $('#commentId').val(),
                method: 'delete',
                success: (data) => {
                    if (data > 0) {
                        showModal('삭제가 완료되었습니다.', false);
                        getComments();
                    }
                },
            });
        }

        function delCommentBtnEvent() {
            $('.delCommentBtn').on('click', function (e) {
                showModal('삭제하시겠습니까?', true, e.target.value, delComment);
            });
        }

        function showModal(msg, isOk, saveId, onclickEvent) {
            $('#cancelBtn').toggle(isOk);
            $('#okBtn').toggle(isOk);
            if (onclickEvent != null) $('#okBtn').click(onclickEvent);
            $('#onClickBtn').toggle(!isOk);
            $('#modalMsg').text(msg);
            $('#saveId').val(saveId);
            $('#delCheckModal').modal();
        }

        $(() => {
            getFeed();
            getComments();
            addComment();
        });
    </script>
</head>
<body>
<input type="hidden" id="feedId" value="${feedId}" />
<input type="hidden" id="userId" value="${userId}" />
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle px-0">
            <a href="<%=request.getContextPath()%>/community" class="col btn"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">게시글 조회</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="commmunity"></div>
    <div class="col w-auto" id="detail"></div>
    <div class="col w-auto">
        <div class="card mb-3" id="list"></div>
        <div id="reply" class="community row-1 mt-4"></div>
        <div class="community row-1 mb-5 pb-3">
            <div class="card mx-auto" id="card2">
                <div class="card-footer border-0 px-3 py-3">
                    <form name="addComment" action="add" method="post" class="px-0 mx-0">
                        <div class="d-flex row">
                            <textarea class="form-control col-8 mx-3" style="resize: none; width: 95%" id="inputTextArea" placeholder="내용을 입력해주세요..."></textarea>
                            <button type="button" class="btn btn-primary btn-sm col-2 pt-1 mr-3" id="replyAddBtn" style="height: 70px">추가</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="pb-5 mb-3"></div>
<div class="navbar">
    <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
        <li>
            <a href="<%=request.getContextPath()%>/" class="btn w-auto" type="button"> <i class="icon main bi-house-door-fill fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/community" class="btn w-auto" type="button"> <i class="icon main bi-file-earmark-text fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/place/around" class="btn w-auto" type="button"> <i class="icon main bi-map fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/place/myplace" class="btn w-auto" type="button"> <i class="icon main bi-heart fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/user/login" class="btn w-auto" type="button"> <i class="icon main bi-person-fill fa-3x"></i> </a>
        </li>
    </ul>
</div>

<div class="modal fade" id="delCheckModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content mx-5">
            <div class="modal-body text-center py-3">
                <p id="modalMsg"></p>
                <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="okBtn" class="btn btn-primary">확인</button>
                <button type="button" id="onClickBtn" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
                <input type="hidden" id="saveId" name="saveId" value="" />
            </div>
        </div>
    </div>
</div>
</body>
