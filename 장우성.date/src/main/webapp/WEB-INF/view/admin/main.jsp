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
                    <li><a href="<%=request.getContextPath()%>/">회원 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/declare">신고 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/review">리뷰 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/place">장소 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/logo">로고 추가</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/logout">로그아웃</a></li>
                </ul>
            </div>
            <div class="col mt-4">
                <form>
                    <div class="row">
                        <div class="col-3">
                            <input id="inputText" type="text" class="form-control" placeholder="회원이름" />
                        </div>
                        <div class="col mb-2">
                            <div class="button">
                                <button type="button" class="btn btn-info col-3 mr-4">조회</button>
                                <button type="button" class="btn btn-warning col-3 mr-4" data-toggle="modal" data-target="#fixModal">선택 수정</button>
                                <button type="button" class="btn btn-danger col-3" data-toggle="modal" data-target="#delModal">선택 탈퇴</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control" placeholder="이름" />
                        </div>
                        <div class="col">
                            <input type="text" class="form-control" placeholder="닉네임" />
                        </div>
                        <div class="col">
                            <input type="tel" class="form-control" placeholder="전화번호" />
                        </div>
                        <div class="col">
                            <input type="email" class="form-control" placeholder="이메일" />
                        </div>
                        <div class="col">
                            <input type="datetime" class="form-control" placeholder="생년월일" />
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
                        <tbody>
                        <tr>
                            <td><input type="radio" class="radio" name="check"/></td>
                            <td>1</td>
                            <td>최한석</td>
                            <td>하루000</td>
                            <td>010-1234-1234</td>
                            <td>ws@gmail.com</td>
                            <td>2022-08-08</td>
                        </tr>
                        <tr>
                            <td><input type="radio" class="radio" name="check"/></td>
                            <td>2</td>
                            <td>한아름</td>
                            <td>Hyeflower</td>
                            <td>010-5678-5678</td>
                            <td>sh@gmail.com</td>
                            <td>2022-08-09</td>
                        </tr>
                        </tbody>
                    </table>
                </form>
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
