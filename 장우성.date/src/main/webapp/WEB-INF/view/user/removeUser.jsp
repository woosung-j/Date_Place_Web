<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%> 
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../res/mobile.css" />
<style>
    header {
        margin-bottom: 40px;
    }
    
    form {
        height: 5;
        width: 5;
    }
</style>
<script>
	function isVal(field) {
	    let isGood = false
	    let errMsg
	    if(!field.length){
	          errMsg = '탈퇴 확인에 체크해주세요.'  
	    } else {
	        
             isGood = true	         
	    }
	    
	    if(!isGood) {
	        $('.modalMsg').text(errMsg).css('color', 'red')
	        $('#okBtn').hide()
	        $('.modal').modal()
	    }
	    
	    return isGood
	}

	function delUser() {
		$('#delUserBtn').click(() => {
			
			if(isVal($('#delIdCheck:checked'))) {                               
				$.ajax({
					url: 'removeuser/' + $('#delIdCheck').val(), 
                    method: 'post',
                    contentType: 'application/json', 
					success: function remove() {
						$('#removeUserModal').modal()
					}
				})			
			}
		
		})			
	}

	$(() => {
		delUser()
	})
</script>
</head>
<body>
<div class="container">
    <header class='mb-5'>
        <nav class="row navbar bg-light text-center align-middle">
            <a href="javascript:window.history.back();" class="col btn"
                ><i class="bi bi-chevron-left"></i
            ></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">회원 탈퇴</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="row">
        <div class='d-grid col-11 mx-auto mt-5 text-left'>        
            <h6 class='info mb-5'>
                회원 탈퇴전 확인하세요<br><br>
                회원 탈퇴시 모든 자료가 삭제 및 복구가 불가능 합니다.
            </h6>
            <form class='input-group'>                    
                <input id='delIdCheck' type='checkbox' name='check' class='mt-2' value='${userId}'/>                    	            	
	            <h6 class='ml-3 mt-3 p-1'>
                    안내사항을 모두 확인하였으며,<br>
                    이에 동의합니다.
	            </h6>                                     
	            <button id='delUserBtn' type='button' class='btn btn-primary btn-lg col-12 mt-3'>
	            	탈퇴 하기
	            </button>
            </form>
        </div>
    </div>
    <div class="navbar">
        <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
            <li>
                <a href="<%=request.getContextPath()%>/" class="btn w-auto" type="button">
                    <i class="icon main bi-house-door-fill fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/community" class="btn w-auto" type="button">
                    <i class="icon main bi-file-earmark-text fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/place/around" class="btn w-auto" type="button">
                    <i class="icon main bi-map fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/place/myplace" class="btn w-auto" type="button">
                    <i class="icon main bi-heart fa-3x"></i>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/user/login" class="btn w-auto" type="button">
                    <i class="icon main bi-person-fill fa-3x"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class='modal fade' id='removeUserModal' tabindex='-1'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content mx-5'>            
            <div class='modal-body text-center py-3'>
                <p class='modalMsg'>회원 탈퇴가<br>완료 되었습니다.</p> 
                <a id='okBtn' href="/" class="btn btn-primary btn-lg col-12">예</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>