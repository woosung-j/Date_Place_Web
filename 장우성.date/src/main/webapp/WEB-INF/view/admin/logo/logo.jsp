<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />
    <script>
        function logoUpload() {
            const formData = new FormData($('#form')[0]);
            formData.append('files', $('#files'));

            $.ajax({
                url: '<%=request.getContextPath()%>/admin/logo/upload',
                type: 'post',
                processData: false,
                contentType: false,
                data: formData,
                success: (data) => {

                },
            });
        }
        $(() => {

        })
    </script>
</head>
<body>
    <div class="container-fluid">
        <header class="row-1">
          <h1 class="text-center border"><img src="<%=request.getContextPath()%>/attach/logo.jpg"></h1>
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
                <div class="col">
                    <h3>로고 추가</h3>
                </div>
                <form enctype="multipart/form-data" id="form" method="post" action="<%=request.getContextPath()%>/admin/logo/upload">
                    <div>
                        <input type="file" id="files" name="files" multiple />
                    </div>
                    <div>
                        <button type="button" onclick="logoUpload()" class="btn btn-primary">로고 추가</button>
                    </div>
                <form/>
            </div>
        </div>
    </div>
</body>
