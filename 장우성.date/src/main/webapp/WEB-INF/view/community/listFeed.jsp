<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <script>
        function feedList() {
            $('#feedList').empty();

            $.ajax({
                url: '<%=request.getContextPath()%>/community/getFeeds',
                method: 'get',
                contentType: 'application/json',
                success: (feeds) => {
                    if (feeds.length) {
                        const feedList = [];
                        $.each(feeds, (i, item) => {
                            const tagList = [];
                            const likeList = [];
                            console.log(feeds)
                            if (item.hashtag.length != 0 && item.hashtag[0]?.tag != null) {
                                $.each(item.hashtag, (i, item) => {
                                    tagList.push(`<span class="badge badge-secondary badge-pill">\${item.tag}</span>`);
                                });
                            }

                            const profileImage = item.profileImage != null ?
                                `<img class="img-fluid" style="width:20px; height: 20px;" src="/attach/profileImage/\${item.profileImage}"/>` : `<i class="fas fa-user-circle fa-2x"></i>`


                            feedList.unshift(
                                `<a href="<%=request.getContextPath()%>/community/detail/\${item.feedId}" style="color: inherit; text-decoration: none">
                                    <div class="card mb-3">
                                    <div class="card-header row-11">
                                        <div class="text_output">
                                            <div class="row">
                                                <span class="col-7">\${profileImage}&nbsp;\${item.nickname}</span>
                                                <span class="col-5">\${item.createdAt}</span>
                                            </div>
                                            <h6 class="card-title"><br/>\${item.title}</h6>
                                            <p class="card-text">\${item.content}</p>
                                            \${tagList.join('')}
                                        </div>
                                        <hr/>
                                        <div class="checkLike">
                                            <div id="likeCnt">
                                                <i class="fas fa-heart" type="button">&nbsp;\${item.likeCnt}</i>&nbsp;&nbsp;
                                                <i class="fas fa-comment">\${item.commentCnt}</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>`
                            );
                        });
                        $('#feedList').append(feedList.join(''));
                    } else {
                        $('#feedList').append('<p class="text-center">게시글이 없습니다.</p>');
                    }
                },
            });
        }

        $(() => {
            feedList();
        });
    </script>
    <style>
        #top {
            margin-top: 80px;
        }

        .write {
            position: fixed;
            right: 5%;
            bottom: 15%;
        }

        .badge {
            margin-right: 10px;
        }

        .text_output {
            margin-bottom: 10px;
        }

        .icon.main:hover {
            color: #ff5858;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="row w-auto p-1 bg-light fixed-top shadow">
            <div class="col align-middle">
                <h4 class="text-center font-gamja-flower">커뮤니티</h4>
            </div>
        </header>
        <div class="list" id="top">
            <div class="commmunity row mt-4">
                <div class="col w-auto" id="feedList">
                    <div id="likeCnt"></div>
                </div>
            </div>
        </div>
        <input type="hidden" id="feedId" value="${feedId}" />
        <div class="write">
            <a href="<%=request.getContextPath()%>/community/add" class="btn w-auto" type="button">
                <i class="fas fa-pen-square fa-3x" style="color: #ff5858"></i>
            </a>
        </div>
    </div>
    <div class="pb-5 mb-3"></div>
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
</body>
