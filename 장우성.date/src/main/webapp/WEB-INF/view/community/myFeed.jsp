<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        .text_output {
            margin-bottom: 10px;
        }

        .badge {
            margin-right: 10px;
        }

        a {
            color: black;
            text-decoration: none !important;
        }

        a:hover {
            color: black;
            text-decoration: none !important;
        }
    </style>
    <script>
        function checkWish() {
            let checkWish = $('.fa-heart').hasClass('on');

            if (checkWish) {
                $('.fa-heart').css('color', 'red');
            } else {
                $('.fa-heart').css('color', 'black');
            }
        }

        $(() => {
            $('#likeBtn').click(() => {
                $('.fa-heart').toggleClass('on', 'off');
                checkWish();
            });
        });

        function myFeeds() {
            $.ajax({
                url: 'community/myFeed',
                method: 'get',
                contentType: 'application/json',
                success: (feeds) => {
                    const myFeeds = [];

                    $('.myFeeds').empty();

                    if (feeds.length) {
                        $.each(feeds, (i, feed) => {
                            const hashtagArr = [];

                            if (feed.hashtag.length != 0 && feed.hashtag[0]?.tag != null) {
                                $.each(feed.hashtag, (i, item) => {
                                    hashtagArr.push(`<span class="badge badge-secondary badge-pill">\${item.tag}</span>`);
                                });
                            }

                            const profileImage = feed.profileImage != null ? '/attach/profileImage/' + feed.profileImage : '';
                            myFeeds.unshift(
                                `<div class="col w-auto">
                                    <div class="card mb-4">
                                        <div class="card-header row-11">
                                            <div class="text_output">
                                                <div class="row">
                                                   <img class="profile ml-3" src="\${profileImage}"/>
                                                   <span class="col-5">\${feed.nickname}</span>
                                                   <span class="col-5">\${feed.createdAt}</span>
                                                </div>
                                                <a href="<%=request.getContextPath()%>/community/detail/\${feed.feedId}">
                                                    <h6 class="card-title"><br />\${feed.title}</h6>
                                                    <p class="card-text">\${feed.content}</p>
                                                </a>
                                                \${hashtagArr.join('')}
                                            </div>
                                            <hr/>
                                            <button id="likeBtn" type="button" class="btn">
                                                <i class="fas fa-heart"></i></button>\${feed.likeCnt} &nbsp;&nbsp;
                                            <i class="fas fa-comment">&nbsp;0</i>
                                        </div>
                                    </div>
                                </div>`
                            );
                        });
                        $('.myFeeds').append(myFeeds.join(''));
                    }
                },
            });
        }
        $(myFeeds);
    </script>
</head>
<body>
<div class="container-1">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">나의 게시글</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="myFeeds row-1 mt-4 pt-62 mx-2"></div>
</div>
<div class="pb-5 mb-3"></div>
<div class="navbar">
    <ul class="navbar nav-item bg-light fixed-bottom mb-0 list-style-none">
        <li>
            <a href="<%=request.getContextPath()%>/" class="btn w-auto" type="button"> <i class="icon main bi-house-door-fill fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/community" class="btn w-auto" type="button"> <i class="icon main bi-file-earmark-text fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/place/around" class="btn w-auto" type="button"> <i class="icon main bi-map fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/place/myplace" class="btn w-auto" type="button"> <i class="icon main bi-heart fa-3x"></i> </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/user/login" class="btn w-auto" type="button"> <i class="icon main bi-person-fill fa-3x"></i> </a>
        </li>
    </ul>
</div>
</body>
