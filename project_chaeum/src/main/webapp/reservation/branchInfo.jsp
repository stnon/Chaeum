<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body" align="left">
				<h1 align="center">${branch.branch_name }</h1>
				<br><br><br>
				
<div class="container-fluid d-flex justify-content-between">
                            <div class="col-lg-3 ps-0">
                              <img
								src="resources/images/branch/${branch.branch_id }_branch.jpg"
								width=500 height=320>
                            </div>
                            
                            <div class="col-lg-5 pr-0">
                              <p class="mt-5 mb-2 text-left">지점명 : 채움 ${branch.branch_name }<br><br></p>
                              <p class="text-left">전화번호 : ${branch.branch_tel }<br><br> 주소 : ${branch.branch_addr }<br><br> </p>
                              <button type="button" class="btn btn-outline-primary btn-fw" onclick="location.href='getStudyroomList.do'">예약하기</button>
					
                            </div>
                          </div>			
				
				<hr class="one">
				<br>
                 <p class="font-weight-500" >${branch.branch_info }</p>

<hr class="one">
				<br>
        <h3>찾아오시는 길 </h3>
        <div class="branch_map">
            <div id="map" style="width:100%;height:400px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d813e873100c1c18c8e565a7a70eaf9&libraries=services"></script>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d813e873100c1c18c8e565a7a70eaf9"></script>
			<style>
				.wrap {position: relative;left: 0;width: 300x;height: 132px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
				.wrap * {padding: 0;margin: 0;}
				.wrap .info {width: 300x;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
				.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
				.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
				.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
				.info .close:hover {cursor: pointer;}
				.info .body {position: relative;overflow: hidden;}
				.info .desc {position: relative;margin: 10px; }
				.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
				.info .link {color: #5085BB;}
	    </style>
<script>

		  	var lati = ${branch.branch_latitude};
		  	var longti = ${branch.branch_longitude};
		  	var add = "${branch.branch_addr}";
		  	var name ="${branch.branch_name}";
		  	
		  	
		  	
            var container = document.getElementById('map');
            var options = {
            	center: new kakao.maps.LatLng(lati, longti),
            	level: 3
            };

            var map = new kakao.maps.Map(container, options);


            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            
            var imageSrc = "resources/images/map_pointer_s.png",
            imageSize = new kakao.maps.Size(49, 46), // 마커이미지의 크기입니다
            imageOption = {
            	offset: new kakao.maps.Point(20, 69)}
            ;
            // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.


            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            //마커가 표시될 위치입니다
            markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);



            //주소 좌표 변환객체
            var geocoder = new kakao.maps.services.Geocoder();

            // aa('서울 금천구 벚꽃로 286 (가산동, 삼성리더스타워)','가산디지털단지역점');	
			

		var clickedOverlay = null;	
         // function aa(add,name)
          //{

           var over = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + name +
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 

            '            <div class="desc"><div style="height:40px;">'  +add+
            '                </div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';


          	// 주소로 좌표를 검색합니다
          	geocoder.addressSearch(add, function(result, status) {

          	// 정상적으로 검색이 완료됐으면
          	if (status === kakao.maps.services.Status.OK) {
			
			          	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			          	// 결과값으로 받은 위치를 마커로 표시합니다
          	var marker = new kakao.maps.Marker({
          	map: map,
          	position: coords,
          	image: markerImage
          	});

          	var customOverlay  = new kakao.maps.CustomOverlay({
				position: coords,
				content: over,
				xAnchor: 0.5,
				yAnchor: 1.5
			});

          	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          	map.setCenter(coords);
          	}

			kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, customOverlay));
          	});
          
			
		// }

		  // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, customOverlay) {
				return function() {
					if (clickedOverlay) {
						clickedOverlay.setMap(null);
					}
					customOverlay.setMap(map);
					clickedOverlay=customOverlay;
				};
			}	
		
			function closeOverlay() {
				if (clickedOverlay) {
					clickedOverlay.setMap(null);
				}
					
			}
</script>
        </div>
				
				
				
				
				
				





				</div>
			</div>
		</div>




	</div>







</div>






