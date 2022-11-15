<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
	<jsp:include page="../../include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../../res/admin.css" />
	<script>
		function isVal(field) {
			let isGood = false;
			let errMsg;

			if (!field.length) errMsg = '장소를 선택하세요.';
			else {
				if (!field.val()) errMsg = field.attr('placeholder') + ' 입력하세요';
				else isGood = true;
			}

			if (!isGood) {
				$('#modalMsg').text(errMsg).css('color', 'red');
				$('#modalBtn').hide();
				$('#modal').modal();
			}

			return isGood
		}
		
		function listPlace() {
			$('input').not(':radio').val('');
			$('#places').empty();

			$.ajax({
				url: '<%=request.getContextPath()%>/admin/place/getPlaceList',
				success: (placeList) => {
					console.log(placeList);
					if (placeList.length) {
						places = [];
						placeList.forEach((place) => {
							places.push(
								`<tr>
									<td><input type='radio' name='placeId' id='placeId'
											value='\${place.placeId}'/></td>
									<td><a href="<%=request.getContextPath()%>/admin/place/detail/\${place.placeId}">\${place.placeName}</a></td>
								</tr>`
							);
						});

						$('#places').append(places.join(''));
					} else
						$('#places').append('<tr><td colspan=4 class=text-center>등록된 장소가 없습니다.</td></tr>');
				},
			});
		}
		function init() {
			listPlace()
			
           $('#delPlaceBtn').click(() => {
            if (isVal($('#placeId:checked'))) {
                $('#modalMsg').text('장소를 삭제하시겠습니까?')
                $('#modalBtn').show()
                $('#modal').modal()
            }
        })

        $('#delPlaceOkBtn').click(() => {
            $.ajax({
                url: '<%=request.getContextPath()%>/admin/place/del/' + $('#placeId:checked').val(),
                method: 'delete',
                success: listPlace
            })

            function checkModal() {
                $('#modal').modal()
                $('#modalMsg').text('삭제되었습니다.').css('color', 'black')
                $('#modalBtn').hide()

            }
            $(checkModal)
        })
		}
		
		$(() => {
	        init()
	    })		
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
			<div class="row-1">
				<nav class="d-flex mb-4" style="float: right">
					<a href="<%=request.getContextPath()%>/admin/place/add" class="btn btn-primary mr-1"> <span class="label d-none d-sm-inline">장소추가</span> </a>
					<button type="button" class="btn btn-danger" data-toggle="modal" id='delPlaceBtn'>

						<span class="label d-none d-sm-inline">선택장소삭제</span>
					</button>
				</nav>
				<div class="row-1">
					<table class="table text-center border-bottom">
						<thead class="" style="background-color: #7882a4; color: #d6e5fa">
						<tr>
							<th>선택</th>
							<th>장소명</th>
						</tr>
						</thead>
						<tbody id="places"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button id='xBtn' type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id='modalMsg' class='text-center'></p>
                </div>
                <div id='modalBtn' class="modal-footer">
                    <button type='button' class='btn btn-secondary' data-dismiss='modal'>아니오</button>
                    <button type='button' class='btn btn-primary' id='delPlaceOkBtn'>예</button>
                </div>
            </div>
        </div>
    </div>
</body>