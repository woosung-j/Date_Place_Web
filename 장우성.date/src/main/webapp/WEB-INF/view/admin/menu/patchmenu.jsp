<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="../../../res/admin.css"/>
<script>
	function menuList() {
        $.ajax({
            url: 'menu/getMenus',
            method: 'get',
            contentType: 'application/json',
            success: (data) => {
                const list = [];

                if (data.length) {
                    $.each(data, (i, item) => {
                        list.unshift(
                        	`<tr>
	  							<td>\${item.menuId}</td>
	  							<td><input type='text' class='form-control' id='name' name='name' value='\${item.menuName}'/></td>
	  							<td><input type='text' class='form-control' id='price' name='price' value='\${item.price}원'/></td>
	  							<td><button type='button' class='btn btn-danger' onclick='tableDelete(this)' id='remove'>삭제</button></td>
	  						</tr>`
                    	);
                	});
                }
                $('#menus').empty();
            	$('#menus').append(list.join(''));
        	},
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
                    <li><a href="<%=request.getContextPath()%>/">회원 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/declare">신고 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/review">리뷰 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/place">장소 조회</a></li>
                    <li><a href="<%=request.getContextPath()%>/logo">로고 추가</a></li>
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
                            <button type="button" class="btn btn-info mr-2" data-toggle="modal" data-target="#addMenuOkModal">
                                <span class="label">완료</span>
                            </button>
                            <button type="button" class="btn btn-info mr-2">
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
            </div>
        </div>
    </div>
    <div class="modal" tabindex="-1" id="addMenuOkModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <a href="../place/02.html" class="close text-black">
                        <span>&times;</span>
                    </a>
                </div>
                <div class="modal-body text-center py-3">
                    <p>수정이 완료 되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <a href="../place/02.html" class="btn btn-primary btn-lg col-12">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>
