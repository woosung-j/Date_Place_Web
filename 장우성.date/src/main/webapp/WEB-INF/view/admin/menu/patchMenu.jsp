<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../res/admin.css" />
    <script>
        function tableCreate() {
            var html = ' ';
            var menuName = $('#menuName').val();
            var price = $('#price').val();
            var remove = $('remove').val();

            html += '<tr>';
            html += '<td><input type="hidden" id="placeId" name="placeId" value="${placeId}" /></td>';
            html += '<td><input type="text" class="form-control" id="menuName" name="menuName" placeholder="메뉴를 입력해주세요"/></td>';
            html += '<td><input type="text" class="form-control" id="price" name="price" placeholder="가격을 입력해주세요"/></td>';
            html += '<td><button type="button" class="btn btn-danger" id="remove">삭제</button></td>';
            html += '</tr>';

            $('#menus').append(html);
        }
        
        function showModal(msg, isOk, menuId) {
            $('#cancelBtn').toggle(isOk);
            $('#okBtn').toggle(isOk);
            $('#onClickBtn').toggle(!isOk);
            $('#modalMsg').text(msg);
            $('#menuIdInput').val(menuId);
            $('#delCheckModal').modal();
        }

        function menuList() {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/getMenus',
                contentType: 'application/json',
                success: (menus) => {
                    const menuArr = [];

                    if (menus.length) {
                        $.each(menus, (i, menu) => {
                            menuArr.push(
                                `<tr>
                                    <td><input type='hidden' id='menuId' name='menuId' value='\${menu.menuId}'/>\${i+1}</td>
                                    <td><input type='text' class='form-control' id='fixMenuName' name='fixMenuName' value='\${menu.menuName}'/></td>
                                    <td><input type='text' class='form-control' id='fixPrice' name='fixPrice' value='\${menu.price}'/></td>
                                    <td><button type='button' class='delBtn btn btn-danger' id='delBtn' value='\${menu.menuId}'>삭제</button></td>
                                </tr>`
                            );
                        });
                    }
                    $('#menus').empty();
                    $('#menus').append(menuArr.join(''));
                    init();
                }, 
            });
        }

        function addMenu() {
            const arr = [];
            let length = $('input[name=menuName]').length;

            for (let i = 0; i < length; i++) {
                arr.push({ placeId: $('#placeId').val(), menuName: $('input[name=menuName]').eq(i).val(), price: $('input[name=price]').eq(i).val() });
            }

            $.ajax({
                url: 'addMenu',
                method: 'post',
                contentType: 'application/json',
                data: JSON.stringify(arr),
                success: (data) => {
                    if (data == arr.length) {
                        menuList();
                    } else {
                        console.log('fail');
                    }
                },
            });
            console.log(arr);
        }

        function fixMenu() {
            const arr = [];
            let length = $('input[name=menuId]').length;

            for (let i = 0; i < length; i++) {
                arr.push({ menuId: $('input[name=menuId]').eq(i).val(), menuName: $('input[name=fixMenuName]').eq(i).val(), price: $('input[name=fixPrice]').eq(i).val() });
            }

            $.ajax({
                url: 'fixMenu',
                method: 'patch',
                contentType: 'application/json',
                data: JSON.stringify(arr),
                success: menuList(),
            });
            console.log(arr);
        }
        
        function delMenu(menuId) {
       		$.ajax({
       			url: 'delMenu/' + menuId,
       			method: 'delete',
       			success: (data) => {
       					showModal('삭제가 완료되었습니다.', false);
       					menuList();
       			}
       		})
        }
        
        function init() {
            $('#okMenuBtn').click(() => {
                addMenu();
                fixMenu();
            });
            
            $('.delBtn').on('click', function (e) {
             	showModal('삭제하시겠습니까?', true, e.target.value);
             });
        }

        $(() => {
            menuList();
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
                        <h2>그림화원 메뉴</h2>
                    </div>
                    <div class="col mb-3">
                        <nav class="d-flex justify-content-end mt-4">
                            <button type="button" class="btn btn-info mr-2" id="okMenuBtn" data-toggle="modal" data-target="#addMenuOkModal">
                                <span class="label">완료</span>
                            </button>
                            <button type="button" class="btn btn-info mr-2" onclick="tableCreate()">
                                <span class="label">추가</span>
                            </button>
                        </nav>
                    </div>
                </div>
                <table class="table text-center">
                    <thead class="thead-light">
                        <tr>
                            <th>No</th>
                            <th>메뉴</th>
                            <th class="col-2">가격</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="menus"></tbody>
                </table>
                <input type="hidden" id="placeId" name="placeId" value="${placeId}" />
            </div>
        </div>
    </div>
    <div class="modal" id="delCheckModal" tabindex="-1">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content mx-5">
	            <div class="modal-body text-center py-3">
	                <p id="modalMsg"></p>
	                <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                <button type="button" onclick="delMenu($('#menuIdInput').val())" id="okBtn" class="btn btn-primary">확인</button>
	                <button type="button" id="onClickBtn" class="btn btn-primary btn-lg col-12" data-dismiss="modal">확인</button>
	                <input type="hidden" id="menuIdInput" name="menuIdInput" value="" />
	            </div>
	        </div>
	    </div>
	</div>
</body>