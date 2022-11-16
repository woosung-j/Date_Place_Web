<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../res/admin.css" />
    <style>
        .table {
            border-collapse: collapse;
        }

        th {
            text-align: center;
        }

        td {
            border: 1px solid #dbdbdb;
        }

        li {
            list-style: none;
        }

        .btnGroup {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }
    </style>
    <script>
        function getPlace() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/place/getDetail/' + $('#placeId').val(),
                method: 'get',
                success: (data) => {
                    const detail = data.detail;
                    const menus = data.menus;
                    let placegroup = data.placeGroupId == 1 ? '맛집' : data.placeGroupId == 2 ? '카페' : '놀거리';
                    $('#place_group').text(placegroup);
                    $('#introduction').text(data.introduction);
                    $('#place_like_count').text(data.placeLikeCount);
                    $('#created_at').text(data.createdAt);
                    $('#updated_at').text(data.updatedAt);

                    if (detail) {
                        $('#detailId').val(detail.detailId);
                        $('#address').text(detail.address);
                        $('#tel').text(detail.tel);
                        $('#time').text(detail.openingHours + ' - ' + detail.closingHours);
                        $('#day_off').text(detail.dayOff);
                        let park = detail.parking == 0 ? '주차불가' : '주차가능';
                        $('#parking').text(park);
                        $('#contact').text(detail.contact);
                    }

                    const menuTable = $('#menu_table');
                    const menuArr = [];

                    if (menus.length == 0) {
                        menuArr.push(`
                            <tr>
                                <td class="col-9"></td>
                                <td class="col-3 align-middle">
                                    <a href="<%=request.getContextPath()%>/admin/menu/${placeId}" class="btn btn-secondary">수정</a>
                                </td>
                            </tr>
                        `);
                    } else {
                        $.each(menus, (i, menu) => {
                            let result = menu.price.toLocaleString('ko-KR');
                            if (i == 0) {
                                let placeId = $('#placeId').val();
                                menuArr.push(`
                                <tr>
                                    <td class="col-7">\${menu.menuName}</td>
                                    <td class="col-2" id="address">\${result}원</td>
                                    <td class="col-3 align-middle" rowspan="\${menus.length}">
                                        <a href="<%=request.getContextPath()%>/admin/menu/${placeId}" class="btn btn-secondary">수정</a>
                                    </td>
                                </tr>
                            `);
                            } else {
                                menuArr.push(`
                                <tr>
                                    <td class="col-7">\${menu.menuName}</td>
                                    <td class="col-2" id="address">\${result}원</td>
                                </tr>
                            `);
                            }
                        });
                    }

                    menuTable.append(menuArr.join(''));
                },
            });
        }

        function init() {
            getPlace();
        }

        $(() => {
            init();
        });

        function delDetail() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/detail/del/' + $('#detailId').val(),
                method: 'delete',
                success: (data) => {
                    $('#infoModal').modal();
                },
            });
        }
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
            <div class="row">
                <div class="col-8">
                    <h2 id="placeName"></h2>
                </div>
            </div>
            <table class="table text-center">
                <thead>
                <tr>
                    <td colspan="3">장소</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="col-2">장소구분</td>
                    <td class="col-7" id="place_group"></td>
                    <td class="col-3 align-middle" rowspan="5">
                        <a href="<%=request.getContextPath()%>/admin/place/patch/${placeId}" class="btn btn-secondary">수정</a>
                    </td>
                </tr>
                <tr>
                    <td>소개</td>
                    <td id="introduction"></td>
                </tr>
                <tr>
                    <td>좋아요</td>
                    <td id="place_like_count"></td>
                </tr>
                <tr>
                    <td>생성일</td>
                    <td id="created_at"></td>
                </tr>
                <tr>
                    <td>최근 수정일</td>
                    <td id="updated_at"></td>
                </tr>
                </tbody>
            </table>
            <table class="table text-center">
                <thead>
                <tr>
                    <td colspan="3">소개</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="col-2">주소</td>
                    <td class="col-7" id="address"></td>
                    <td class="col-3 align-middle" rowspan="6">
                        <a href="<%=request.getContextPath()%>/admin/detail/add/${placeId}" class="btn btn-secondary">추가</a>
                        <a href="<%=request.getContextPath()%>/admin/detail/patch/${placeId}" class="btn btn-secondary">수정</a>
                        <button type="button" id="delCheckBtn" class="btn btn-secondary" data-toggle="modal" data-target="#delIntroModal">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td id="tel"></td>
                </tr>
                <tr>
                    <td>영업시간</td>
                    <td id="time"></td>
                </tr>
                <tr>
                    <td>휴무일</td>
                    <td id="day_off"></td>
                </tr>
                <tr>
                    <td>주차</td>
                    <td id="parking"></td>
                </tr>
                <tr>
                    <td>홈페이지</td>
                    <td id="contact"></td>
                </tr>
                </tbody>
            </table>

            <table class="table text-center mb-5">
                <thead>
                <tr>
                    <td colspan="3">메뉴</td>
                </tr>
                </thead>
                <tbody id="menu_table"></tbody>
            </table>
            <input type="hidden" id="placeId" name="placeId" value="${placeId}" />
            <input type="hidden" id="detailId" name="detailId" value="" />
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="delIntroModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>소개를 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" onclick="delDetail()" data-dismiss="modal" class="btn btn-primary" id="okBtn" class="btn btn-primary">확인</button>
                <a></a>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="infoModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a href="<%=request.getContextPath()%>/admin/place/detail/${placeId}" class="close text-black">
                    <span>&times;</span>
                </a>
            </div>
            <div class="modal-body text-center py-3">
                <p>삭제가 완료되었습니다.</p>
            </div>
            <div class="modal-footer">
                <a href="<%=request.getContextPath()%>/admin/place/detail/${placeId}" class="btn btn-primary btn-lg col-12">확인</a>
            </div>
        </div>
    </div>
</div>
</body>
