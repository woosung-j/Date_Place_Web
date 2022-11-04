<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
    <head>
		<jsp:include page="../../include/head.jsp"></jsp:include>
		<link rel="stylesheet" href="../../../res/admin.css"/>
		
		<script>
	    	function tableCreate() {
	    		var html = " ";
	    		
	    		var name = $("#name").val();
	    		var price = $("#price").val();
	    		var remove = $("remove").val();
	    		
	    		html += '<tr>';
	    		html += '<td></td>'
	    		html += '<td><input type="text" class="form-control" id="name" name="name" placeholder="메뉴를 입력해주세요"/></td>';
	            html += '<td><input type="text" class="form-control" id="price" name="price" placeholder="가격을 입력해주세요"/></td>';
	            html += '<td><button type="button" class="btn btn-danger" onclick="tableDelete(this)" id="remove">삭제</button></td>';
	            html += '</tr>';
	            
	            $("#menus").append(html);
	    	}
	    	
	    	function tableDelete(obj) {
	    		var tr = $(obj).parent().parent();
	    		
	    		tr.remove();
	    	}
	    	
	    	function menuList() {
	            $.ajax({
	                url: 'menu/getMenus',
	                method: 'get',
	                contentType: 'application/json',
	                success: (data) => {
	                    console.log(data)
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
                        <li><a href="../main.html">회원 조회</a></li>
                        <li><a href="../declaration/01.html">신고 조회</a></li>
                        <li><a href="../review/01.html">리뷰 조회</a></li>
                        <li><a href="../place/01.html">장소 조회</a></li>
                        <li><a href="../logo/01.html">로고 추가</a></li>
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
</html>
