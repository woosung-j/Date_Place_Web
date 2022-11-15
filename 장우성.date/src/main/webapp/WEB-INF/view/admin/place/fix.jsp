<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../res/admin.css" />
    <style>
        .img-style {
            border: 0.1rem solid;
            position: relative;
            width: 4rem;
            height: 4rem;
            font-size: 14px;
            margin-right: 1rem;
        }
    </style>
    <script>
        let areaSelectMaker = function (target) {
            if (target == null || $(target).length == 0) {
                console.warn('Unkwon Area Tag');
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

                    //초기화
                    init(a1, true);

                    //권역 기본 생성
                    let areaKeys1 = Object.keys(area);
                    areaKeys1.forEach(function (City) {
                        a1.append('<option value=' + City + '>' + City + '</option>');
                    });

                    //변경 이벤트
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

        function fix() {
            const data = {
                placeId: $('#placeId').val(),
                placeName: $('#placeName').val(),
                placeGroupId: $('#placeGroupId').val(),
                introduction: $('#introduction').val(),
            };

            const formData = new FormData($('#form')[0]);
            formData.append('files', $('#files'));
            formData.append('key', new Blob([JSON.stringify(data)], { type: 'application/json' }));

            $.ajax({
                url: '<%=request.getContextPath()%>/admin/place/fix/' + $('#si').val() + '/' + $('#gu').val(),
                method: 'post',
                processData: false,
                contentType: false,
                data: formData,
                success: (data) => {
                },
            });
        }

        function init() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/place/fix/' + $('#placeId').val(),
                method: 'get',
                success: (data) => {
                    console.log(data)
                    $('#placeName').val(data.placeName)
                    $('#placeGroupId').val(data.placeGroupId)
                    $('#introduction').val(data.introduction)
                    // $('#si').val(data.siName)
                    // $('#gu').val(data.guName)

                    // const imgArr = []

                    // if(data.placeImage.length > 0) {
                    //     $.each(data.placeImage, (i, image) => {
                    //         imgArr.push(
                    //             `div class="img-style"><img class="img-fluid" />장소이미지</div>`
                    //         )
                    //     })
                    // }
                    // <div class="img-style"><img class="img-fluid" />장소이미지</div>
                    // <div class="img-style"><img class="img-fluid" />장소이미지</div>
                    // <div class="img-style"><img class="img-fluid" />장소이미지</div>
                }
            })
        }

        $(() => {
            areaSelectMaker('select[name=si]');
            init()

            $('#fixBtn').click(() => {
                fix();
            });
        });
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
                <input type="hidden" id="placeId" name="${placeId}" value="${placeId}"/>
            </div>
            <div class="col">
                <form enctype="multipart/form-data" id="form" method="post" action="<%=request.getContextPath()%>/admin/place/add">
                    <div class="row d-flex justify-content-between">
                        <div class="ml-3">
                            <h1>장소수정</h1>
                        </div>
                        <div>
                            <button type="button" id="fixBtn" class="btn btn-secondary mr-4" data-toggle="modal" data-target="#enter">완료</button>
                        </div>
                    </div>
                    <table class="table text-justify-all">
                        <tbody>
                            <tr>
                                <td>
                                    <select id="placeGroupId" name="placeGroupId" style="width: 100%; height: 2.5rem">
                                        <option value="empty">장소 구분</option>
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
                    <a href="<%=request.getContextPath()%>/admin/place" class="close text-black">
                        <span>&times;</span>
                    </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>완료 되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="<%=request.getContextPath()%>/admin/place" class="btn btn-primary btn-lg col-12">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>