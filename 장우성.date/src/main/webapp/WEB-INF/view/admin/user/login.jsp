<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../res/admin.css"/>
    <style>
        #centerPosition {
            margin-top: 13rem;
            top: 50%;
            left: 50%;
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="row-1 w-auto p-1 fixed-top">
            <h1 class="text-center border">로고이미지</h1>
            <hr />
        </header>
        <div id="centerPosition" class="row-2 pt-5">
            <form action="login" method="post" class="d-grid col-6 mx-auto">
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                    <input type="text" id="id" name="id" class="form-control" placeholder="id" aria-label="id" aria-describedby="addon-wrapping" />
                </div>
                <div class="input-group mt-3">
                    <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                    <input type="password" id="password" name="password" class="form-control" placeholder="password" aria-label="password" aria-describedby="addon-wrapping" />
                </div>
                <div class=" text-danger">${errMsg}</div>
                <button type="submit" class="btn btn-primary btn-lg col-12 mt-3">로그인</button>
            </form>
        </div>
    </div>
</body>
</html>
