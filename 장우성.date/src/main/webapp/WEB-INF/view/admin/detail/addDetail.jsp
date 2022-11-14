<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    function addDetail() {
        $.ajax({
            url: '<%=request.getContextPath()%>/admin/detail/add/' + $('#placeId').val(),
            method: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                address: $('#address').val(),
                tel: $('#tel').val(),
                openingHours: $('#openingHours').val(),
                closingHours: $('#closingHours').val(),
                dayOff: $('#dayOff').val(),
                contact: $('#contact').val(),
                parking: $('#parking option').val(),
            }),
            success: (data) => {
                console.log(data);
                const list = [];  
            }
        })
            
                
        function PostCodeSearch() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('address').value = data.address;
                },
            }).open();
        }
        
        $('#addBtn').click(() => {
            addDetail();
        });
    };

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
                    <li><a href="<%=request.getContextPath()%>/admin/">회원 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/declare">신고 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/review">리뷰 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/place">장소 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/logo">로고 추가</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/logout">로그아웃</a></li>
                </ul>
            </div>
            <div class="col mt-4">
                <div class="row">
                    <div class="col-8">
                        <h1>장소 소개 추가</h1>
                    </div>
                    <div class="col mb-3">
                        <input type="hidden" id="placeId" name="placeId" value="${placeId}" />
                        <nav class="d-flex justify-content-end mt-4">
                            <button onclick="addDetail()" type="button" class="btn btn-primary col-3" data-toggle="modal" data-target="#submitModal">
                                <span class="label">완료</span>
                            </button>
                        </nav>
                    </div>
                </div>
                <hr />
                  <table class="table-borderless">
                        <tbody>
                            <tr>
                                <td>
                                    <label for="address" class="col-form-label">주&emsp;&emsp;소:</label>
                                </td>
                                <td><input type="text" id="address" class="form-control" style="width: 700px" /><br /></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="tel" class="col-form-label">전화번호:</label>
                                </td>
                                <td><input type="text" id="tel" class="form-control" style="width: 700px" /><br /></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="openingHours" class="col-form-label">오픈 시각:</label>
                                </td>
                                <td><input type="text" id="openingHours" class="form-control" style="width: 700px" /><br /></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="closignHours" class="col-form-label">마감 시각:</label>
                                </td>
                                <td><input type="text" id="closignHours" class="form-control" style="width: 700px" /><br /></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="dayOff" class="col-form-label">휴&emsp;&emsp;무:</label>
                                </td>
                                <td><input type="text" id="dayOff" class="form-control" style="width: 700px" /><br /></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="parking" class="col-form-label">주&emsp;&emsp;차:</label>
                                </td>
                                <td>
                                    <select id="parking" id="parking" class="dropdown-toggle text-dark" style="width: 15rem">
                                        <option value="0">불가능</option>
                                        <option value="1">가능</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <label for="contact" class="col-form-label">홈페이지:</label>
                                </td>
                                <br />
                                <td><input type="text" id="contact" class="form-control" style="width: 700px" /></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="submitModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="<%=request.getContextPath()%>/admin/place/detail/${placeId}" class="close text-black"> <span>&times;</span> </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>완료되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="<%=request.getContextPath()%>/admin/place/detail/${placeId}" class="btn btn-primary btn-lg col-12">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>