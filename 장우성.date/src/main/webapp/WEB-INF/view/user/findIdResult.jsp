<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%> 
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../res/mobile.css" />
<style>
    header {
        margin-bottom: 40px;
    }
    
</style>
<script>

</script>
</head>
<body>
    <div class='container'>
        <header class=''>
            <nav class='row navbar bg-light text-center align-middle fixed-top'>
                <a href='javascript:window.history.back();' class='col btn'
                    ><i class='bi bi-chevron-left'></i
                ></a>
                <p class='col'></p>
                <h3 class='col-6 font-gamja-flower'>아이디 찾기</h3>
                <p class='col'></p>
                <p class='col'></p>
            </nav>
        </header>
        <div class='row pt-62'>
            <form class='d-grid col-11 mx-auto mt-5'>        
                <h5 class='info mb-3'>${infoMsg1}</h5>
                <div id='showId' class='shadow text-center mt-3'>
                	<p>
                		${id}
                	</p>
               	</div>   
                <h5 class='info mt-3'>${errMsg1} ${infoMsg2}</h5>                           
                <a href='login' type='button' class='btn btn-primary btn-lg col-12 mt-3'>로그인</a>
            </form>
        </div>
        <div class='navbar'>
            <ul
                class='navbar nav-item bg-light fixed-bottom mb-0 list-style-none'
            >
                <li>
                    <a href='/' class='btn w-auto' type='button'>
                        <i class='icon bi-house-door-fill fa-3x'></i>
                    </a>
                </li>
                <li>
                    <a href='./community/01.html' class='btn w-auto' type='button'>
                        <i class='icon bi-file-earmark-text fa-3x'></i>
                    </a>
                </li>
                <li>
                    <a href='./place/05.html' class='btn w-auto' type='button'>
                        <i class='icon bi-map fa-3x'></i>
                    </a>
                </li>
                <li>
                    <a href='./place/06.html' class='btn w-auto' type='button'>
                        <i class='icon bi-heart fa-3x'></i>
                    </a>
                </li>
                <li>
                    <a
                        href='./user/02.html'
                        class='btn w-auto'
                        type='button'
                    >
                        <i class='icon bi-person-circle fa-3x'></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>