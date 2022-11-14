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

        #replyAddBtn {
            float: right;
            width: 45px;
            height: 45px;
            margin-right: 1px;
        }

        #inputTextArea {
            float: left;
            width: 200px;
            height: 70px;
        }

        a:visited {
            color: black;
        }

        #top {
            margin-top: 80px;
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
        function getCommentList() {
            $('#list').empty();

            $.ajax({
                url: 'comment/listComments/' + $('#feedId').val(),
                method: 'get',
                success: (commentList) => {
                    console.log(commentList);
                    if (commentList.length) {
                        const list = [];

                        $.each(commentList, (i, comment) => {
                            list.unshift(
                                `<div class="card" id="card1">
                                    <div class="card-body row-11">
                                        <div class="row">
                                            <span class="col-5"><i class="fa-solid fa-circle-user fa-2x"></i>\${comment.feedId}</span>
                                            <span class="col-5">\${comment.createdAt}</span>
                                            <div class="btn-group">
                                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
                                                <div class="dropdown-menu">
                                                    <a href="#" class="dropdown-item">수정</a>
                                                    <hr/>
                                                    <button type="button" class="dropdown-item" data-toggle="modal" data-target="#delModal" id="delBtn">삭제</button>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="card=text mt-3">\${comment.content}</p>
                                    </div>   
                                </div>`
                            );
                        });
                        $('#list').append(list.join(''));
                    } else {
                        $('#list').append('<p class="text-center">댓글이 없습니다.</p>');
                    }
                },
            });
        }
        $(() => {
            getCommentList();
        });
    </script>
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
        <div class="commmunity row-1 mt-4 pt-62">
            <div class="col w-auto">
                <div class="card mb-3">
                    <div class="card-header row-11">
                        <div class="text_output">
                            <div class="row">
                                <span class="col-5"><i class="fas fa-user-circle fa-2x"></i> User</span>
                                <span class="col-5">22-10-18</span>
                                <div class="btn-gruop">
                                    <div class="btn-group">
                                        <button type="button" class="btn dropdown-toogle" data-toggle="dropdown">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a href="../community/04.html" class="dropdown-item" id="replyFixBtn">수정</a>
                                            <hr />
                                            <button type="button" class="dropdown-item" data-toggle="modal" data-target="#delPost">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="card-title"><br />카페 추천 받아요</h6>
                            <p class="card-text">신림역 근처 분위기 좋은 카페 추천해주세요~~</p>
                            <span class="badge badge-secondary badge-pill">#카페</span>
                            <span class="badge badge-secondary badge-pill">#신림</span>
                        </div>
                        <hr />
                        <div class="checkLike">
                            <span id="checkLike">
                                <i class="fas fa-heart" id="heart_icon"></i>
                            </span>
                            <span id="like-cnt">&nbsp;0</span>&nbsp;
                            <i class="fas fa-comment">&nbsp;1</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="community row-1 mt-4 pt-62">
            <div class="col w-auto">
                <div class="card mb-3" id="list"></div>
                <input type="hidden" id="feedId" value="${feedId}" />
                <div id="reply" class="community row-1 mt-4"></div>
                <div class="community row-1 mb-5 pb-3">
                    <div class="card mx-auto" id="card2">
                        <div class="card-footer border-0">
                            <div class="d-flex">
                                <div class="form float-left col-0">
                                    <textarea class="form-control mr-2" id="inputTextArea" placeholder="내용을 입력해주세요..."></textarea>
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-primary btn-sm pt-1" id="replyAddBtn" style="height: 70px">추가</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <div class="modal" id="delModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content mx-5">
                    <div class="modal-body text-center py-3">
                        <p id="modalMsg"></p>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancleBtn">취소</button>
                        <a href="#infoModal" class="btn btn-primary" data-toggle="modal" data-target="#infoModal" id="okBtn">확인</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="infoModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content mx-5">
                    <div class="modal-body text-center py-3">
                        <p id="modalMsg2"></p>
                        <a href="../community/02.html" class="btn btn-primary" id="okBtn2">확인</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
