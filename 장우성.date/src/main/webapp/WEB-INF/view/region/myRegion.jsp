<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .bi-bookmark-fill {
            color: #ff5858;
        }
    </style>
    <script>
        function regionList() {
            $.ajax({
                url: '<%=request.getContextPath()%>/region/myRegionList',
                method: 'get',
                success: (data) => {
                    const list = [];
                    if (data.length) {
                        $.each(data, (i, item) => {
                            list.push(`
                                <div class="row mb-3">
                                    <div class="col">
                                        <a href="<%=request.getContextPath()%>/place/\${item.siName}/\${item.guName != "없음" ? item.guName : "없음"}" class="text-dark"><u>\${item.siName} \${item.guName != "없음" ? item.guName : ""}</u></a>
                                        <i class="bi bi-bookmark-fill icon"></i>
                                    </div>
                                </div>
                            `);
                        });
                    }

                    $('#regionList').empty();
                    $('#regionList').append(list.join(''));
                },
            });
        }

        function init() {
            regionList();
        }

        $(() => {
            init();
        });
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">관심지역</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div id="regionList" class="mt-4 mx-3 pt-62 pb-5 mb-3"></div>
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
</body>
