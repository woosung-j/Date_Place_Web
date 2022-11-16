<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../res/admin.css" />
    <script>
        function isVal(field) {
            let isGood = false;
            let errMsg;

            if (!field.val()) {
                errMsg = field.attr('placeholder');
            } else {
                isGood = true;
            }

            if (!isGood) {
                $('#modalMsg').text(errMsg);
                $('#modalCloseBtn').show();
                $('#modalOkBtn').hide();
                $('#modal').modal();
            }

            return isGood;
        }

        let areaSelectMaker = function (target) {
            if (target == null || $(target).length == 0) {
                return;
            }

            let area = {
                서울시: ['강남구', '서초구', '송파구', '강동구'],
                경기: ['수원시', '안양시', '용인시', '고양시'],
                인천시: ['계양구', '남동구'],
            };

            for (i = 0; i < $(target).length; i++) {
                (function (z) {
                    let a1 = $(target).eq(z);
                    let a2 = a1.next();

                    init(a1, true);

                    let areaKeys1 = Object.keys(area);
                    areaKeys1.forEach(function (City) {
                        a1.append('<option value=' + City + '>' + City + '</option>');
                    });

                    $(a1).on('change', function () {
                        init($(this), false);
                        let City = $(this).val();
                        let keys = Object.keys(area[City]);
                        keys.forEach(function (District) {
                            a2.append('<option value=' + area[City][District] + '>' + area[City][District] + '</option>');
                        });
                    });
                })(i);

                function init(t, first) {
                    first ? t.empty().append("<option value=''>선택</option>") : '';
                    t.next().empty().append("<option value=''>선택</option>");
                }
            }
        };

        function add() {
            const data = {
                placeName: $('#placeName').val(),
                placeGroupId: $('#placeGroupId').val(),
                introduction: $('#introduction').val(),
            };

            const formData = new FormData($('#form')[0]);
            formData.append('files', $('#files'));
            formData.append('key', new Blob([JSON.stringify(data)], { type: 'application/json' }));

            $.ajax({
                url: '<%=request.getContextPath()%>/admin/place/add/' + $('#si').val() + '/' + $('#gu').val(),
                type: 'post',
                processData: false,
                contentType: false,
                data: formData,
                success: (data) => {},
            });
        }

        $(() => {
            areaSelectMaker('select[name=si]');

            $('#addBtn').click(() => {
                if (isVal($('#placeGroupId')) && isVal($('#placeName')) && isVal($('#si')) && isVal($('#gu')) && isVal($('#introduction'))) {
                    $('#modalMsg').text('장소를 등록하겠습니다.');
                    $('#modalCloseBtn').hide();
                    $('#modalOkBtn').show();
                    $('#modal').modal();
                    add();
                } else if (!$('#placeGroupId').val()) {
                    $('#modalMsg').text('장소구분을 선택하세요');
                    $('#modalCloseBtn').show();
                    $('#modalOkBtn').hide();
                    $('#modal').modal();
                } else if (!$('#si').val()) {
                    $('#modalMsg').text('시를 선택하세요');
                    $('#modalCloseBtn').show();
                    $('#modalOkBtn').hide();
                    $('#modal').modal();
                } else if (!$('#gu').val()) {
                    $('#modalMsg').text('구를 선택하세요');
                    $('#modalCloseBtn').show();
                    $('#modalOkBtn').hide();
                    $('#modal').modal();
                }
            });
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <header class="row-1">
        <img src="<%=request.getContextPath()%>/attach/logo_admin.jpg" style="width: 100%; height: 70px" />
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
        <div class="col">
            <form enctype="multipart/form-data" id="form" method="post" action="<%=request.getContextPath()%>/admin/place/add">
                <div class="row d-flex justify-content-between">
                    <div class="ml-3">
                        <h1>장소추가</h1>
                    </div>
                    <div>
                        <button type="button" id="addBtn" class="btn btn-secondary mr-4" data-toggle="modal" data-target="#enter">완료</button>
                    </div>
                </div>
                <table class="table text-justify-all">
                    <tbody>
                    <tr>
                        <td>
                            <select id="placeGroupId" name="placeGroupId" style="width: 100%; height: 2.5rem">
                                <option value="">장소 구분</option>
                                <option value="1">맛집</option>
                                <option value="2">카페</option>
                                <option value="3">놀거리</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="placeName" name="placeName" type="text" style="width: 59%; height: 2.5rem" placeholder="장소이름을 입력해주세요" />
                            <select id="si" name="si" id="city1" style="width: 20%; height: 2.5rem"></select>
                            <select id="gu" name="gu" id="district1" style="width: 20%; height: 2.5rem"></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="introduction" name="introduction" style="width: 100%; height: 40rem" placeholder="장소소개말을 입력해주세요"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="pl-2 pb-4">
                    <input type="file" id="files" name="files" multiple />
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="enter">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id="xBtn" type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body text-center py-3">
                <p id="modalMsg" class="text-center"></p>
            </div>
            <div id="modalOkBtn" class="modal-footer">
                <a href="<%=request.getContextPath()%>/admin/place" class="btn btn-primary btn-lg col-12">확인</a>
            </div>
            <div id="modalCloseBtn" class="modal-footer">
                <button type="button" class="btn btn-secondary text-center" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
