<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <style>
        html,
            body {
                margin: 0;
                padding: 0;
                height: 100%;
                font-family: 'Noto Sans KR', sans-serif;
            }

            .reImg {
                height: 3rem;
                width: 3rem;
                border: 0.1rem solid;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 0.5rem;
                font-size: 12px;
            }

            .word-keep {
                word-break: keep-all;
            }

            .mt-80 {
                margin-top: 80px;
            }
            .mb-80 {
                margin-bottom: 80px;
            }

            .bi {
                font-size: 16px;
            }

            .icon {
                font-size: 24px;
            }

            .list-style-none {
                list-style: none;
            }

            .font-gamja-flower {
                font-family: 'Gamja Flower', cursive;
                font-size: 2rem;
            }
    </style>
    <script>
    	function 
    </script>
</head>
 <body>
        <div class="container">
            <header style="padding-top: 80px">
                <nav class="row navbar bg-light text-center align-middle fixed-top">
                    <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
                    <p class="col"></p>
                    <h3 class="col-6 font-gamja-flower">리뷰보기</h3>
                    <p class="col"></p>
                    <p class="col"></p>
                </nav>
            </header>
            <div class="row-1 mx-3">
                <p class="text-center">
                    <strong>그림화원 <span style="color: #fb3959">★ 4.5</span> </strong><br />
                    <span style="color: #fb3959">50</span> 개의 별점과 <span style="color: #fb3959">89</span> 개의 리뷰가 있어요.<br />
                </p>
            </div>

            <div class="row-1 border mx-3 rounded mb-3">
                <div class="col pt-2">
                    <div class="row text-start ml-1 mr-1">
                        <i class="icon bi-person-circle fa-3x mb-2"></i>
                        <p class="mt-1 ml-1">User1</p>
                        <p class="mt-1 ml-1" style="color: #fb3959">★★★★★</p>
                        <p class="mt-1 ml-1">22-10-12</p>
                    </div>
                    <a href="/review/03.html" style="color: inherit; text-decoration: none">
                        <div class="row reviewImg mb-2">
                            <div class="reImg ml-3">리뷰이미지1</div>
                            <div class="reImg">리뷰이미지2</div>
                            <div class="reImg">리뷰이미지3</div>
                        </div>
                        <div class="row text-start ml-1 mr-1" style="font-size: 14px">
                            <p>그림화원 진짜 채광도 좋고 너무 이쁜것같아요 대표님도 너무 친절하시고 이쁘게 그림도 그리고 왔어요!! 한번쯤 가보시는걸 추천드려요!!</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row-1 border mx-3 rounded mb-3">
                <div class="col pt-2">
                    <div class="row text-start ml-1 mr-1">
                        <i class="icon bi-person-circle fa-3x mb-2"></i>
                        <p class="mt-1 ml-1">User2</p>
                        <p class="mt-1 ml-1" style="color: #fb3959">★★★★★</p>
                        <p class="mt-1 ml-1">22-10-12</p>
                    </div>
                    <a href="/review/03.html" style="color: inherit; text-decoration: none">
                        <div class="row text-start ml-1 mr-1" style="font-size: 14px">
                            <p>분위기는 좋았지만 그알못인 저는 어렵긴 했습니다ㅠㅠ 그래도 같이간 제 여자친구는 잘하더라구요! 좋았습니다~</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row-1 border mx-3 rounded mb">
                <div class="col pt-2">
                    <div class="row text-start ml-1 mr-1">
                        <i class="icon bi-person-circle fa-3x mb-2"></i>
                        <p class="mt-1 ml-1">User3</p>
                        <p class="mt-1 ml-1" style="color: #fb3959">★★★★☆</p>
                        <p class="mt-1 ml-1">22-10-12</p>
                    </div>
                    <a href="/review/03.html" style="color: inherit; text-decoration: none">
                        <div class="row reviewImg mb-2">
                            <div class="reImg ml-3">리뷰이미지1</div>
                            <div class="reImg">리뷰이미지2</div>
                            <div class="reImg">리뷰이미지3</div>
                            <div class="reImg">리뷰이미지4</div>
                        </div>
                        <div class="row text-start ml-1 mr-1" style="font-size: 14px">
                            <p>여자친구랑 재밌게 그리다 왔어요 ㅎㅎ 선생님이 가이드도 잘해주시고 너무 좋았습니다!</p>
                        </div>
                    </a>
                </div>
            </div>

            <footer style="padding-top: 100px">
                <nav class="row navbar fixed-bottom text-center justify-content-center bg-light">
                    <a class="col-12 btn w-100 font-gamja-flower" href="/review/02.html" style="display: block">
                        다녀온 리뷰 쓰기
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </nav>
            </footer>
        </div>
    </body>
</html>