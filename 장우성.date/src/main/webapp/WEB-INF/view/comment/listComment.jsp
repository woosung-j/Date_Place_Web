<%@ page language="java" contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
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
    	function showModal(msg, isOk, commentId) {
    		$('#cancleBtn').toggle(isOk);
    		$('#okBtn').toggle(isOk);
    		$('#onClickBtn').toggle(!isOk);
    		$('#modalMsg').text(msg);
    		$('#modalMsg2').text(msg);
    		$('#commentIdInput').val(commentId);
    		$('#delModal').modal();
    		$('#delCheckModal').modal();
    	}
    	
    	function del() {
    		$('.delBtn').on('click', function (e) {
    			showModal('삭제하시겠습니까?', true, e.target.value);
    		});
    	}
    	 
    	function delBtn() {
    		$('.delBtn').on('click', function(e) {
    			showModal('삭제하시겠습니까?', true, e.target.value);
    		});
    	}
    	
    	function delComment(commentId) {
    		$.ajax({
    			url: '/comment/del/' + $('#commentId').val(),
    			method: 'delete',
    			success: (data) => {
    				if(data > 0) {
    					showModal('삭제가 완료되었습니다.', false);
    				} else {
    					showModal('권한이 없습니다.', false);
    				}
    			},
    		});
    	}
    	
        function getCommentList() {			
			$('#commentList').empty();
        	
            $.ajax({
                url: '<%=request.getContextPath()%>/comment/listComment/' + $('#feedId').val(),
                method: 'get',
                contentType: 'application.json',
                success: (commentList) => {	
                    if (commentList.length) {
                    	const list = []
                        $.each(commentList, (i, item) => {
                        	const delbtn = []
                        	if($('#userId').val() == item.userId) {
                        		delbtn.push(
                                 	`<button type="button" class="delBtn dropdown-item" id="deleteBtn">삭제</button>	`	
                        		)
                        	}
                            list.unshift(
                                `<div class="card" id="card1">
                                    <div class="card-body row-11">
                                        <div class="row">
                                            <span class="col-5"><i class="fa-solid fa-circle-user fa-2x"></i>\${item.nickname}</span>
                                            <span class="col-5">\${item.createdAt}</span>
                                            <div class="btn-group">
                                            	<input type="hidden" id="commentId" value="\${item.commentId}"/>
                                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
                                                <div class="dropdown-menu">
                                                    <a href="<%=request.getContextPath()%>/comment/fix/\${item.commentId}" class="dropdown-item">수정</a>
                                                    <hr/>
													\${delbtn.join('')}
                                                </div>
                                            </div>
                                        </div>
                                        <p class="card=text mt-3">\${item.content}</p>
                                    </div>   
                                </div>`
                            );
                        });
    					$('#list').append(list.join(''));
    					del();
                     }
                },	
            });
        }
        
        $(() => {
			getCommentList();
        });
		
		function addComment() {
			$('#replyAddBtn').click(() => {
				$.ajax({
					url: '<%=request.getContextPath()%>/comment/add/' + $('#feedId').val(),
					method: 'post',
					contentType: 'application/json',
					data: JSON.stringify({
						feedId: $('#feedId').val(),
						content: $('#inputTextArea').val(),
					}),
					success: (data) => {
						getCommentList()
					},
				});
			});
		}
		$(addComment)
		
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
                        <div class="card-footer border-0 px-3 py-3">
                        <form name="addComment" action="add" method="post" class="my-0">
                         <input type="hidden" id="feedId" value="${feedId}"/>
                         <input type="hidden" id="userId" value="${userId}"/>
                            <div class="d-flex row">
                               	<input type="hidden" id="feedId" value="${feedId}"/>
                                <div class="form float-left col-11" >
                                    <textarea class="form-control" style="resize: none; width: 95%;" id="inputTextArea" placeholder="내용을 입력해주세요..."></textarea>
                                </div>
                                <div class="col-1">
                                    <button type="button" class="btn btn-primary btn-sm pt-1" id="replyAddBtn" style="height: 70px">추가</button>
                                </div>
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
                    </div>
                    <div class="modal-footer" id="modalBtn">   
                        <button type="button" id="cancleBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <a href="#infoModal"> 
                        	<button type="button" class="btn btn-primary" onClick="delComment($('#commentIdInput').val())" data-toggle="modal" data-target="#infoModal" id="okBtn">확인</button>
                    	</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="infoModal" tabindex="-1" id="delCheckModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content mx-5">
                    <div class="modal-body text-center py-3">
                        <p id="modalMsg2"></p>
                    </div>
                    <div class="modal-footer">    
                        <button type="button" data-dismiss="modal" class="btn btn-primary" id="onClickBtn" onClick="location.href = document.referrer;">확인</button>
                        <input type="hidden" id="commentIdInput" name="commentIdInput" value="" />
					</div>
                </div>
            </div>
        </div>
    </div>
</body>
