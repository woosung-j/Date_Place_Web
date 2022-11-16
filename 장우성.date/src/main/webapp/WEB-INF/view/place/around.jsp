<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../res/mobile.css" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ae0f4d8a7c4511de8de27cd0e165da0&libraries=services,clusterer,drawing"></script>
    <script>
        var map;
        var overlays = [];

        async function init() {
            await getMap();
        }
        function getXY(obj) {
            console.log(map);
            var geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch(obj.addr, (result, status) => {
                if (status === kakao.maps.services.Status.OK) {
                    getCustomOverlay(obj.name, obj.addr, result[0]);
                }
            });
        }

        function getCustomOverlay(title, addr, position) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(position.y, position.x),
            });

            var content = `<div class="wrap">
                                <div class="info">
                                    <div class="title">
                                        ${title}
                                    <div class="close" onclick="closeOverlay(${position.x}, ${position.y})" title="닫기"></div>
                                    <div class="infoBody mt-2" style='font-size:14px;'>
                                        ${addr}
                                    </div>
                                    <div class='infoFooter mt-4'>
                                        <a href="https://map.kakao.com/link/map/${title},${position.y},${position.x}" class='btn btn-primary' style="color:white" target="_self"><i class="bi bi-geo-alt-fill"></i>큰지도보기</a>
                                        <a href="https://map.kakao.com/link/to/${title},${position.y},${position.x}" class='btn btn-primary' style="color:white" target="_self"><i class="bi bi-arrow-90deg-right"></i>길찾기</a>
                                    </div>
                                </div>
                            </div>`;

            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition(),
            });

            overlay.id = position;

            overlays.push(overlay);

            kakao.maps.event.addListener(marker, 'click', function () {
                overlay.setMap(map);
            });
        }

        function closeOverlay(x, y) {
            console.log(x, y);
            overlays.map((overlay) => {
                if (overlay.id.x == x && overlay.id.y == y) {
                    overlay.setMap(null);
                }
            });
        }

        async function getMap() {
            navigator.geolocation.getCurrentPosition(async function(position) {
                var lat = position.coords.latitude,
                    lon = position.coords.longitude;

                var mapContainer = await document.getElementById('map'),
                    mapOption = {
                        center: new kakao.maps.LatLng(lat, lon),
                        level: 3,
                    };

                map = await new kakao.maps.Map(mapContainer, mapOption);
            });
        }

        $().ready(init);
    </script>
</head>
<body>
<div class="container">
    <header>
        <nav class="row navbar bg-light text-center align-middle fixed-top">
            <a href="javascript:window.history.back();" class="col btn"><i class="bi bi-chevron-left"></i></a>
            <p class="col"></p>
            <h3 class="col-6 font-gamja-flower">주변 조회</h3>
            <p class="col"></p>
            <p class="col"></p>
        </nav>
    </header>
    <div class="row" style="padding-top: 62px">
        <div id="map" class="col" style="height: calc(100vh - 124px)"></div>
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
</body>
</html>
