<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/admin.css"/>
</head>
<body>
    <div class="container-fluid">
        <header class="row-1">
            <h1 class="text-center border">로고이미지</h1>
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
                미구현
                메인페이지
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="fixModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="#" class="close text-black" data-dismiss="modal">
                        <span>&times;</span>
                    </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>수정이 완료 되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="delModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>회원을 정말 탈퇴시키겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <a href="#infoModal" class="btn btn-primary" data-toggle="modal" data-target="#infoModal" data-dismiss="modal">확인</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="infoModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="#" class="close text-black" data-dismiss="modal">
                        <span>&times;</span>
                    </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>탈퇴가 완료되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
