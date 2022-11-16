<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/admin.css" />
</head>
<script>
    function isVal(field) {
        let isGood = false;
        let errMsg;

        if (!field.length) {
            errMsg = '회원을 선택하세요.';
        } else {
            if (!field.val()) {
                errMsg = field.attr('placeholder') + '입력하세요.';
            } else {
                isGood = true;
            }
        }

        if (!isGood) {
            $('#modalMsg').text(errMsg);
            $('#modalBtn').hide();
            $('#modal').modal();
        }

        return isGood
    }

    function listUsers() {
        $('input').not(':radio').val('')
        $('#userList').empty()

        $.ajax({
            url: '<%=request.getContextPath()%>/admin/list',
            method: 'get',
            dataType: 'json',
            success: (userList) => {
                if (userList.length) {
                    const userListArr = [];

                    $.each(userList, (i, user) => {
                        userListArr.unshift(
                            `<tr>
								<td > 
									<input type='radio' name='userId' id='userId' value='\${user.userId}'/>
								</td>
								<td>\${user.userId}</td>
								<td id='userName' name='userName' value='\${user.userName}'>\${user.userName}</td>
								<td>\${user.nickname}</td>
								<td>\${user.phoneNumber}</td>
								<td>\${user.email}</td>
								<td>\${user.birthday}</td>
		                     </tr>`
                        );
                    })

                    $('#userList').append(userListArr.join(''))
                } else {
                    $('#userList').append('<tr><td colspan=6 class=text-center>회원이 없습니다.</td></tr>')
                }
            }
        })
    }

    function init() {
        listUsers()

        $('#getUserBtn').click(() => {
            if (!($('#inputName').val())) {
                $('#modalMsg').text('회원의 이름을 입력하세요.')
                $('#modalBtn').hide()
                $('#modal').modal()
            } else {
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/get/' + $('#inputName').val(),
                    method: 'get',
                    dataType: 'json',
                    success: (data) => {
                        $('#inputName').val('')
                        let input = $('#inputName').val()
                        if (input != data.userName) {
                        	data = (
									`<tr>
										<td> 
											<input type='radio' name='userId' id='userId' value='\${data.userId}'/>
										</td>
										<td>\${data.userId}</td>
										<td>\${data.userName}</td>
										<td>\${data.nickname}</td>
										<td>\${data.phoneNumber}</td>
										<td>\${data.email}</td>
										<td>\${data.birthday}</td>
									</tr>`
                    		 		);
                        	$('#userGet').append('')
                            $('#userGet').append(data)                            
                            $('#userGet').attr('style', "border-style: solid")
                            $('#userList').attr('style', "display:'';");
                            $('#userGet').eq(0).append('<button id="showListBtn" class="btn btn-primary ml-3" value="\${data.userId}">회원목록 보기</button>')                            
                           	$('#userGet').val('')

                            $('#fixUserBtn').click(() => {
                            	if (isVal($('#userId:checked')) && isVal($('#userName')) &&
                                        isVal($('#nickname')) && isVal($('#userTel')) &&
                                        isVal($('#email')) && isVal($('#birthday'))) {
	                                $.ajax({
	                                    url: '<%=request.getContextPath()%>/admin/fix',
	                                    method: 'put',
	                                    contentType: 'application/json',
	                                    data: JSON.stringify({ data }),
	                                    success: function Check() {	                                    	
	                                    	setTimeout(function timerModal() {	       
	     	                                	$('#xBtn').click(() => {
	     	                                		location.href='/admin'
	     	                                	})
     	                                		location.href='/admin'	                                    		
	                                    	}, 1000)
                               			}
	                                })
                            	}
                            })

                            $('#delUserBtn').click(() => {
                            	if (isVal($('#userId:checked')) && isVal($('#userName')) &&
                                        isVal($('#nickname')) && isVal($('#userTel')) &&
                                        isVal($('#email')) && isVal($('#birthday'))) {
                                    $('#modalMsg').text('회원을 탈퇴 하시겠습니까?')
                                    $('#modalBtn').show()
                                    $('#modal').modal()
                           		}
                               
                            })

                            $('#delUserOkBtn').click(() => {
                                $.ajax({
                                    url: '<%=request.getContextPath()%>/admin/del/' + $('#userId:checked').val(),
                                    method: 'put'
                                })
                                
                                setTimeout(function delCheck() {	                                    	
									setTimeout(function timerModal() {	                                    				                                    	 										
										$('#xBtn').click(() => {
											location.href='/admin'
										})
										location.href='/admin'	                                    		
									}, 1000)
								}, 1000)			     	                                	
                            })
                        }
                    }
                })
            }
        })

        $('#fixUserBtn').click(() => {
            if (isVal($('#userId:checked')) && isVal($('#userName')) &&
                isVal($('#nickname')) && isVal($('#userTel')) &&
                isVal($('#email')) && isVal($('#birthday'))) {
                let user = {
                    userId: $('#userId:checked').val(),
                    userName: $('#userName').val(),
                    nickname: $('#nickname').val(),
                    phoneNumber: $('#userTel').val(),
                    email: $('#email').val(),
                    birthday: $('#birthday').val()
                }

                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/fix',
                    method: 'put',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        userId: $('#userId:checked').val(),
                        userName: $('#userName').val(),
                        nickname: $('#nickname').val(),
                        phoneNumber: $('#userTel').val(),
                        email: $('#email').val(),
                        birthday: $('#birthday').val()
                    }),
                    success: listUsers
                })

                $('#modalMsg').text('수정이 완료되었습니다.').css('color', 'black')
                $('#modalBtn').hide()
                $('#modal').modal()
            }
        })

        $('#delUserBtn').click(() => {
            if (isVal($('#userId:checked'))) {
                $('#modalMsg').text('회원을 탈퇴 하시겠습니까?')
                $('#modalBtn').show()
                $('#modalCloseBtn').hide()
                $('#modal').modal()
            }
        })

        $('#delUserOkBtn').click(() => {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/del/' + $('#userId:checked').val(),
                method: 'put',
                success: listUsers
            })

            function checkModal() {
                $('#modal').modal()
                $('#modalMsg').text('삭제되었습니다.').css('color', 'black')
                $('#modalBtn').hide()
                $('#modalCloseBtn').show()

            }
            $(checkModal)
        })

        $('#userList').on({
            change() {
                $('#userName').val($(this).parent().siblings().eq(1).text())
                $('#nickname').val($(this).parent().siblings().eq(2).text())
                $('#userTel').val($(this).parent().siblings().eq(3).text())
                $('#email').val($(this).parent().siblings().eq(4).text())
                $('#birthday').val($(this).parent().siblings().eq(5).text())
            }
        }, '#userId')

        $('#userGet').on({
            change() {
                $('#userName').val($(this).parent().siblings().eq(1).text())
                $('#nickname').val($(this).parent().siblings().eq(2).text())
                $('#userTel').val($(this).parent().siblings().eq(3).text())
                $('#email').val($(this).parent().siblings().eq(4).text())
                $('#birthday').val($(this).parent().siblings().eq(5).text())
            }
        }, '#userId')
    }

    $(() => {
        init()
    })
</script>

<body>
    <div class="container-fluid">
        <header class="row-1">
            <img src="<%=request.getContextPath()%>/attach/logo_admin.jpg" style="width:100%; height:70px;"/>
        </header>
        <hr />
        <div class="row">
            <div class="col-2">
                <ul class="text-center">
                    <li><a href="<%=request.getContextPath()%>/admin/">회원 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/declare">신고 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/review">리뷰 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/place">장소 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/logo">로고 추가</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/logout">로그아웃</a></li>
                </ul>
            </div>
            <div class="col mt-4">
                <div class="col mt-4">
                    <div id='errMsg'></div>
                    <form>
                        <div class="row">
                            <div class="col-3">
                                <input id="inputName" type="text" class="form-control" placeholder="회원검색" />
                            </div>
                            <div class="col mb-2">
                                <div class="button">
                                    <button id='getUserBtn' type="button"
                                        class="btn btn-info col-3 mr-4">조회</button>
                                    <button id='fixUserBtn' type="button" class="btn btn-warning col-3 mr-4">선택
                                        수정</button>
                                    <button id='delUserBtn' type="button" class="btn btn-danger col-3">선택
                                        탈퇴</button>
                                </div>
                            </div>
                        </div>
                        <div class="row" id='getUser'>
                            <div class="col">
                                <input id='userName' type="text" class="form-control" placeholder="이름" />
                            </div>
                            <div class="col">
                                <input id='nickname' type="text" class="form-control" placeholder="닉네임" />
                            </div>
                            <div class="col">
                                <input id='userTel' type="tel" class="form-control" placeholder="전화번호" />
                            </div>
                            <div class="col">
                                <input id='email' type="email" class="form-control" placeholder="이메일" />
                            </div>
                            <div class="col">
                                <input id='birthday' type="datetime" class="form-control" placeholder="생년월일" />
                            </div>
                        </div>
                        <table class="table mt-3">
                            <thead class="" style="color: #D6E5FA; background-color: #7882A4;">
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>생년월일</th>
                                </tr>
                            </thead>
                            <tbody id='userGet'>
                            </tbody>
                            <tbody id='userList'>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button id='xBtn' type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id='modalMsg' class='text-center'></p>
                </div>
                <div id='modalBtn' class="modal-footer">
                    <button type='button' class='btn btn-secondary' data-dismiss='modal'>아니오</button>
                    <button type='button' class='btn btn-primary' id='delUserOkBtn'>예</button>
                </div>
                <div id='modalCloseBtn' class="modal-footer">
                    <button type="button" class="btn btn-secondary text-center" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
