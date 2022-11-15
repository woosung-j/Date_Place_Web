<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        function detailList() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/detail/getDetail/' + $('#placeId').val(),
                method: 'get',
                contentType: 'application/json',
                success: (data) => {
                    console.log(data);
                    const list = [];

                    if (data) {
                        list.unshift(`
                            <tbody>
                                <tr>
                                    <br />
                                    <td>
                                        <label for="address" class="col-form-label">주&emsp;&emsp;소:</label>
                                    </td>
                                    <td>
                                        <br />
                                        <input type="text" class="form-control" id="address" name="address" value="\${data.address}" onclick="PostCodeSearch()" style="width: 700px" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="tel" class="col-form-label">전화번호:</label>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="tel" name="tel" value="\${data.tel}" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="openingHours" class="col-form-label">오픈 시각:</label>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="openingHours" name="openingHours" value="\${data.openingHours}" />
                                        <br />
                                    </td>
                                    <br />
                                </tr>
                                <tr>
                                    <td>
                                        <label for="closignHours" class="col-form-label">마감 시각:</label>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="closingHours" name="closingHours" value="\${data.closingHours}" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="dayOff" class="col-form-label">휴&emsp;&emsp;무:</label>
                                    </td>
                                    <br />
                                    <td>
                                        <input type="text" class="form-control" id="dayOff" name="dayOff" value="\${data.dayOff}" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="parking" class="col-form-label">주&emsp;&emsp;차:</label>
                                    </td>
                                    <td>
                                        <select id="parking" name="parking" class="dropdown-toggle text-dark" style="width: 15rem">
                                            <option value="0" \${data.parking == 0 ? "selected" : ""}>불가능</option>
                                            <option value="1" \${data.parking == 1 ? "selected" : ""}>가능</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <label for="contact" class="col-form-label">홈페이지:</label>
                                    </td>
                                    <td>
                                        <br />
                                        <input type="text" class="form-control" id="contact" name="contact" value="\${data.contact}" /><br />
                                    </td>
                                </tr>
                            </tbody>
                        `);
                    }
                    $('#details').empty();
                    $('#details').append(list.join(''));
                },
            });
        }
        $(() => {
            detailList();
        });

        function PostCodeSearch() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('address').value = data.address;
                },
            }).open();
        }

        function fixDetail() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/detail/patch/' + $('#placeId').val(),
                method: 'patch',
                contentType: 'application/json',
                data: JSON.stringify({
                    address: $('#address').val(),
                    tel: $('#tel').val(),
                    openingHours: $('#openingHours').val(),
                    closingHours: $('#closingHours').val(),
                    dayOff: $('#dayOff').val(),
                    contact: $('#contact').val(),
                    parking: $('#parking option:selected').val(),
                }),
                success: (data) => {
                    console.log(data);
                    const list = [];
                },
            });
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <header class="row-1">
            <img src="<%=request.getContextPath()%>/attach/logo.jpg" style="width:100%; height:70px;"/>
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
                        <h1>장소 소개 수정</h1>
                    </div>
                    <div class="col mb-3">
                        <input type="hidden" id="placeId" name="placeId" value="${placeId}" />
                        <nav class="d-flex justify-content-end mt-4">
                            <button onclick="fixDetail()" type="button" class="btn btn-primary col-3" data-toggle="modal" data-target="#submitModal">
                                <span class="label">완료</span>
                            </button>
                        </nav>
                    </div>
                </div>
                <hr />
                <table class="table-borderless">
                    <tbody id="details"></tbody>
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
