<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../res/admin.css" />
    <style>
        .table {
            margin-bottom: 0;
        }
    </style>
    <script>
        function toggleConfirm(declareId, confirm) {
            $.ajax({
                url: 'declare/toggleconfirm/' + declareId + '/' + confirm,
                method: 'patch',
                contentType: 'application/text',
                success: (data) => {
                    getDeclareList()
                },
            });
        }

        function getDeclareList() {
            $.ajax({
                url: 'declare/list',
                method: 'get',
                contentType: 'application/json',
                success: (data) => {
                    console.log(data)
                    const list = [];

                    if (data.length) {
                        $.each(data, (i, item) => {
                            list.push(
                                `<div type="button" class="row accordion text-center border-bottom mx-1 py-3" style="font-size: 14px" id="acco\${item.declareId}" data-toggle="collapse" data-target="#coll\${item.declareId}" aria-expanded="true" aria-controls="coll\${item.declareId}">
                                    <div class="col">\${item.declareId}</div>
                                    <div class="col">\${item.placeName}</div>
                                    <div class="col">\${item.confirm == 1 ? "완료" : "미완료"}</div>
                                </div>
                                <div id="coll\${item.declareId}" class="collapse" aria-labelledby="hea\${item.declareId}" data-parent="#acco\${item.declareId}">
                                    <div class="row">
                                        <div class="col mx-1">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">\${item.placeName}</h5>
                                                    <p class="card-text">주소 : \${item.address}</p>
                                                    <p class="card-text">신고자 아이디: \${item.id}</p>
                                                    <p class="card-text">날짜 : \${item.createdAt}</p>
                                                    <br />
                                                    <p class="card-text">
                                                        \${item.content}
                                                    </p>
                                                    <button id="confirmBtn" onClick="toggleConfirm(\${item.declareId}, \${item.confirm})" class="btn btn-primary">\${item.confirm == 1 ? "완료" : "미완료"}</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>`
                            );
                        });
                    }
                    $('#list').empty();
                    $('#list').append(list.join(''));
                },
            });
        }

        $(() => {
            getDeclareList();
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
                <h3>신고 조회</h3>
            </div>
            <table class="table mx-1">
                <thead class="" style="background-color: #7882a4; color: #d6e5fa">
                <tr>
                    <th class="col-4 text-center">No.</th>
                    <th class="col-4 text-center">장소</th>
                    <th class="col-4 text-center">처리여부</th>
                </tr>
                </thead>
            </table>
            <div id="list"></div>
        </div>
    </div>
</div>
</body>
