<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .circle-icon {
            background: whitesmoke;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            text-align: center;
            line-height: 2.5rem;
            padding: 25px;
            margin-left: 1.5rem;
        }

        .bi-image {
            font-size: 40px;
        }

        .icon.main:hover {
            color: #ff5858;
        }
        
        #nickname {
        	width: 100px;
        	height: 50px;
        }
    </style>
    <script>
        $(() => {
            $('#fixUserBtn').click(() => {
                location.href = 'user/fixUser';
            });
            
            $('#uploadBtn').click(() => {
            	$.ajax({
            		url: 'profile',
            		method: 'post',
            		data: $('#uploadForm').val(),
            		contentType: 'application/text',
            		success: function(response){
            			console.log('success')
            			$('#profile').append('<img src="<c:url value="/attach/${profileImage}"/>"/><br>')
            		}
            	})
            })
        });
    </script>
</head>
<body>
<div class="container">
    <header class="mb-2">
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <h3 class="col font-gamja-flower">마이페이지</h3>
        </nav>
    </header>
    <div class="row pt-62 mt-5">
        <div class="col-1">
            <div id='profile' class="circle-icon">
                 ${profileImage}
            </div>
            <div class='mt-3 mx-5 text-center'>
            	<p id='nickname' class="img-font d-flex">${nickname}</p>
            </div>
        </div>
        <div class="col-10 text-right">
            <div class="userEmail">${email}</div>
            <button type="button" class="btn btn-secondary btn-sm col-6 mt-3 ml-0" data-target="#fileUpload" data-toggle="modal">프로필 사진 업로드</button>
            <a id="fixUserBtn" href="fixuser" type="button" class="btn btn-secondary btn-sm col-6 mt-3">회원 프로필 수정</a>
        </div>
    </div>
    <hr class="mt-1" />
    <div class="row-1 pb-5 mb-3">
        <a href="../place/06.html">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">찜</button>
        </a>
        <a href="<%=request.getContextPath()%>/region/myregion">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">관심 지역</button>
        </a>
        <a href="<%=request.getContextPath()%>/review/myreview">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">리뷰 내역</button>
        </a>
        <a href="../community/06.html">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">피드 내역</button>
        </a>
        <a href="<%=request.getContextPath()%>/declaration">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">신고 내역</button>
        </a>
        <a href="logout">
            <button type="button" class="btn btn-primary btn-lg col-12 mt-3">로그 아웃</button>
        </a>
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
<div class="modal fade" id="fileUpload" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body text-center py-5">
                <form method="post" id='uploadForm' enctype="multipart/form-data">
                    <label>
                        <input type="file" name="userFace" />
                    </label>
                    <br />
                    <button id='uploadBtn' type="submit" class="btn btn-info btn-lg col-12" data-dismiss="modal"> 확인 </button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
