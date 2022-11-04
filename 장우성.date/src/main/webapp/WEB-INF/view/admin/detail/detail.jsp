<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/admin.css" />
    <style>
            header {
                padding: 1.7rem;
            }

            hr {
                padding: 0;
                margin: 0;
            }

            ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #7882A4;
            }

            li a {
                display: block;
                color: #D6E5FA;
                margin: 0 1rem;
                padding: 1.5rem 1.5rem;
                text-decoration: none;
            }

            li a:hover:not(.active) {
                background-color: #D6E5FA;
                color: #7882A4;
                margin: 0;
            }
            
    </style>
    <script>
    	function 
    </script>
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
                        <li><a href="../main.html">회원 조회</a></li>
                        <li><a href="../declaration/01.html">신고 조회</a></li>
                        <li><a href="../review/01.html">리뷰 조회</a></li>
                        <li><a href="../place/01.html">장소 조회</a></li>
                        <li><a href="../logo/01.html">로고 추가</a></li>
                    </ul>
                </div>
                <div class="col mt-4">
                    <form>
                        <div class="row">
                            <h1 class="col-6">
                                <p>장소 소개 추가</p>
                            </h1>
                            <div class="col mt-4">
                                <div class="button">
                                    <button type="button" class="btn btn-primary col-3" data-toggle="modal" data-target="#submitModal">완료</button>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="mb-3 row">
                            <label for="address" class="col-sm-2 col-form-label">주소:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="address" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="tel" class="col-sm-2 col-form-label">전화번호:</label>
                            <div class="col-sm-6">
                                <input type="tel" class="form-control" id="tel" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="openingHours" class="col-sm-2 col-form-label">오픈 시간:</label>
                            <div class="col-sm-6">
                                <input type="openingHours" class="form-control" id="openingHours" placeholder="09:00 형식으로 입력하세요." />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="closingHours" class="col-sm-2 col-form-label">마감 시간:</label>
                            <div class="col-sm-6">
                                <input type="closingHours" class="form-control" id="closingHours" placeholder="18:00 형식으로 입력하세요." />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="dayoff" class="col-sm-2 col-form-label">휴무:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="dayoff" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="parkingLot" class="col-sm-2 col-form-label">주차:</label>
                            <div class="dropdown col d-inline-block">
                                <select id="parkingLot" class="dropdown-toggle text-dark" style="width: 15rem">
                                    <option>불가능</option>
                                    <option value="possible">가능</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="contact" class="col-sm-2 col-form-label">홈페이지:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="contact" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal" tabindex="-1" id="submitModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="../place/02.html" class="close text-black">
                            <span>&times;</span>
                        </a>
                    </div>
                    <div class="modal-body text-center py-3">
                        <p>완료되었습니다.</p>
                    </div>
                    <div class="modal-footer">
                        <a href="../place/02.html" class="btn btn-primary btn-lg col-12">확인</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>