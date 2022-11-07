<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<head>
<jsp:include page="../../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="../../res/admin.css" />
<script>
	function detailList() {
		$.ajax({
			url:'detail/getDetails',
			method: 'get',
			contentType: 'application/json'
			succes: (data) => {
				const list = [];
				
				if (data.length) {
					$.each(data, (i, item) => {
						list.unshift(
								`<tr>
		  							<td><input type='text' class='form-control' id='address' name='address' value='\${detail.address}'/></td>
		  							<td><input type='text' class='form-control' id='tel' name='tel' value='\${detail.tel}'/></td>
		  							<td><input type='text' class='form-control' id='openingHours' name='openingHours' value='\${detail.openingHours}'/></td>
		  							<td><input type='text' class='form-control' id='closingHours' name='closingHours' value='\${detail.closingHours}'/></td>
		  							<td><input type='checkbox' class='form-control' id='dayoff' name='dayoff' value='\${detail.dayoff}'/></td>
		  							<td><select type='dropdown' class='dropdown-toggle text-dark' id='parkingLot' name='parkingLot' value='\${detail.parkingLot}'/></td>
		  							<td><input type='text' class='form-control' id='contact' name='contact' value='\${detail.contact}'/></td>
	  							</tr>`
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
<jsp:include page="../../include/head.jsp"></jsp:include>
<link rel="stylesheet" href="../res/admin.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    <form>
                        <div class="row">
                            <h1 class="col-6">
                                <p>장소 소개 수정</p>
                            </h1>
                            <div class="col mt-4">
                                <div class="button">
                                    <button type="button"
									class="btn btn-primary col-3" data-toggle="modal"
									data-target="#submitModal">완료</button>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="mb-3 row">
                            <label for="address"
							class="col-sm-2 col-form-label">주소:</label>
                            <div class="col-sm-6">
                              <input type="text" id="postcode"
								placeholder="우편번호">
								<input type="button" onclick="execDaumPostcode()"
								value="우편번호 찾기"><br>
								<input type="text" id="address" placeholder="주소"><br>
								<input type="text" id="detailAddress" placeholder="상세주소">
								<input type="text" id="extraAddress" placeholder="참고항목">
								
								<script>
								    function execDaumPostcode() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								
								                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
								                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								                var addr = ''; // 주소 변수
								                var extraAddr = ''; // 참고항목 변수
								
								                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								                    addr = data.roadAddress;
								                } else { // 사용자가 지번 주소를 선택했을 경우(J)
								                    addr = data.jibunAddress;
								                }
								
								                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								                if(data.userSelectedType === 'R'){
								                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
								                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								                        extraAddr += data.bname;
								                    }
								                    // 건물명이 있고, 공동주택일 경우 추가한다.
								                    if(data.buildingName !== '' && data.apartment === 'Y'){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								                    if(extraAddr !== ''){
								                        extraAddr = ' (' + extraAddr + ')';
								                    }
								                    // 조합된 참고항목을 해당 필드에 넣는다.
								                    document.getElementById("extraAddress").value = extraAddr;
								                
								                } else {
								                    document.getElementById("extraAddress").value = '';
								                }
								
								                // 우편번호와 주소 정보를 해당 필드에 넣는다.
								                document.getElementById('postcode').value = data.zonecode;
								                document.getElementById("address").value = addr;
								                // 커서를 상세주소 필드로 이동한다.
								                document.getElementById("detailAddress").focus();
								            }
								        }).open();
								    }
								</script> 
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="tel"
							class="col-sm-2 col-form-label">전화번호:</label>
                            <div class="col-sm-6">
                                <input type="tel" class="form-control"
								id="tel" value="01027970703" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="openingHours"
							class="col-sm-2 col-form-label">오픈 시간:</label>
                            <div class="col-sm-6">
                                <input type="openingHours"
								class="form-control" id="openingHours" value="11:00" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="closingHours"
							class="col-sm-2 col-form-label">마감 시간:</label>
                            <div class="col-sm-6">
                                <input type="closingHours"
								class="form-control" id="closingHours" value="18:00" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="dayoff"
							class="col-sm-2 col-form-label">휴무:</label>
                            <div class="col-sm-6">
                                <label><input type="checkbox"
								name="dayoff" value="월요일"> 월요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="화요일"> 화요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="수요일"> 수요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="목요일"> 목요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="금요일"> 금요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="토요일"> 토요일</label>
      							<label><input type="checkbox" name="dayoff"
								value="일요일"> 일요일</label>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="parkingLot"
							class="col-sm-2 col-form-label">주차:</label>
                            <div class="dropdown col d-inline-block">
                                <select id="parkingLot"
								class="dropdown-toggle text-dark" style="width: 15rem">
                                    <option>불가능</option>
                                    <option value="possible">가능</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="contact"
							class="col-sm-2 col-form-label">홈페이지:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control"
								id="contact" value="http://blog.nver.com.veo_wj" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal" tabindex="-1" id="submitModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="../place/02.html"
						class="close text-black">
                            <span>&times;</span>
                        </a>
                    </div>
                    <div class="modal-body text-center py-3">
                        <p>완료되었습니다.</p>
                    </div>
                    <div class="modal-footer">
                        <a href="../place/02.html"
						class="btn btn-primary btn-lg col-12">확인</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
