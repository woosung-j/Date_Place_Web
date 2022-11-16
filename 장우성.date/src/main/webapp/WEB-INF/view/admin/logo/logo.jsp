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
                    location.reload()
                },
            });
        }

        function adminLogoUpload() {
            const formData = new FormData($('#form2')[0]);
            formData.append('files2', $('#files2'));

            $.ajax({
                url: '<%=request.getContextPath()%>/admin/logo/admin/upload',
                type: 'post',
                processData: false,
                contentType: false,
                data: formData,
                success: (data) => {
                    location.reload()
                },
            });
        }
        $(() => {});
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
        <div class="col mt-4">
            <form class="mb-5" enctype="multipart/form-data" id="form" method="post" action="<%=request.getContextPath()%>/admin/logo/upload">
                <div class="mb-3">
                    <h3>유저 로고 추가</h3>
                </div>
                <div class="mb-3">
                    <input type="file" id="files" name="files" multiple />
                </div>
                <div class="mb-3">
                    <button type="button" onclick="logoUpload()" class="btn btn-primary">로고 추가</button>
                </div>
            </form>
            <form enctype="multipart/form-data" id="form2" method="post" action="<%=request.getContextPath()%>/admin/logo/upload">
                <div class="mb-3">
                    <h3>관리자 로고 추가</h3>
                </div>
                <div class="mb-3">
                    <input type="file" id="files2" name="files2" multiple />
                </div>
                <div class="mb-3">
                    <button type="button" onclick="adminLogoUpload()" class="btn btn-primary">로고 추가</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
