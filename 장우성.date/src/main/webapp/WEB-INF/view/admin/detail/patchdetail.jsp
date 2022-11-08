<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
     function detailList() {
            $.ajax({
                url: 'detail/getDetails',
                method: 'get',
                contentType: 'application/json',
                success: (data) => {
                	console.log()
                    const list = [];

                    if (data.length) {
                        $.each(data, (i, item) => {
                            list.unshift(
                                `<tr>
                                    <td><input type='text' class='form-control' id='address' name='address' value='\${item.address}'/></td>
                                    <td><input type='text' class='form-control' id='tel' name='tel' value='\${item.tel}'/></td>
                                    <td><input type='text' class='form-control' id='openingHours' name='openingHours' value='\${item.openingHours}'/></td>
                                    <td><input type='text' class='form-control' id='closingHours' name='closingHours' value='\${item.closingHours}'/></td>
                                    <td><input type='checkbox' class='check' id='dayoff' name='dayoff' value='\$("#dayoff").checkbox;'/></td>
                                    <td><select type='dropdown' class='dropdown-toggle text-dark' id='parkingLot' name='parkingLot' value='\${item.parkingLot}'/></td>
                                    <td><input type='text' class='form-control' id='contact' name='contact' value='\${item.contact}'/></td>
                                </tr>
`
                            );
                        });
                    }
                    $('#details').empty();
                    $('#details').append(list.join(''));
                },
            });
        }
        $(() => {
            detailList();
        });
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
                    <li><a href="<%=request.getContextPath()%>/">회원 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/declare">신고 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/review">리뷰 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/place">장소 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/logo">로고 추가</a></li>
                </ul>
            </div>
            <div class="col mt-4">
                <form>
                    <div class="row">
                        <h1 class="col-6">
                            <p>장소 소개 수정</p>
                        </h1>
                        <div class="col mt-4">
                            <div class="button">
                                <button type="button" class="btn btn-primary col-3" data-toggle="modal" data-target="#submitModal">완료</button>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <br />
                    <div class="mb-3 row">
                        <label for="address" class="col-sm-2 col-form-label">주소:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="address" />
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                            <script>
                                window.onload = function () {
                                    document.getElementById('address').addEventListener('click', function () {
                                        new daum.Postcode({
                                            oncomplete: function (data) {
                                                document.getElementById('address').value = data.address;
                                            },
                                        }).open();
                                    });
                                };
                            </script>
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
                            <input type="text" class="form-control" id="openingHours" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="closingHours" class="col-sm-2 col-form-label">마감 시간:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="closingHours" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="dayoff" class="col-sm-2 col-form-label">휴무:</label>
                        <div class="col-sm-6">
                            <label><input type="checkbox" name="dayoff" value="월요일" /> 월요일</label>
                            <label><input type="checkbox" name="dayoff" value="화요일" /> 화요일</label>
                            <label><input type="checkbox" name="dayoff" value="수요일" /> 수요일</label>
                            <label><input type="checkbox" name="dayoff" value="목요일" /> 목요일</label>
                            <label><input type="checkbox" name="dayoff" value="금요일" /> 금요일</label>
                            <label><input type="checkbox" name="dayoff" value="토요일" /> 토요일</label>
                            <label><input type="checkbox" name="dayoff" value="일요일" /> 일요일</label>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="parkingLot" class="col-sm-2 col-form-label">주차:</label>
                        <div class="dropdown col d-inline-block">
                            <select id="parkingLot" class="dropdown-toggle text-dark" style="width: 15rem">
                                <option>불가능</option>
                                <option>가능</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="contact" class="col-sm-2 col-form-label">홈페이지:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="contact" />
                        </div>
                        <div id="details"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="submitModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="../place/02.html" class="close text-black"> <span>&times;</span> </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>완료되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="/admin/place" class="btn btn-primary btn-lg col-12">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>