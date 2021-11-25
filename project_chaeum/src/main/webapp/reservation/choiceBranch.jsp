<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 350px;
	height: 144px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 350px;
	height: 144px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 13px;
	height: 50px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>


<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card" >
			<div class="card position-relative" >
				<div class="card-body" >



					<!-- 지도포함 내용물 묶 -->
					<div class="row">
						<!-- 좌측 지도 포지션 -->
						<div class="col-md-6 border-right mt-3">
							<div id="map" style="width: 100%; height: 900px;"></div>
						</div>
						<div class="col-md-6 mt-3">


							<p class="card-title mb-0">채움 스터디카페 지점찾기</p>
							<br>
							<div class="table-responsive">
								<table class="table table-borderless">
									<thead>
										<tr>
											<th class="pl-0  pb-2 border-bottom">  지점명</th>
											<th class="border-bottom pb-2">지점 전화번호</th>
											<th class="border-bottom pb-2"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="branch" items="${branchList }">
											<tr>
												<td class="pb-0"><p class="mb-0">
												<span class="font-weight-bold mr-2">${branch.branch_name }</span></p></td>
												<td class="pb-0"><p class="mb-0">${branch.branch_tel }
													</p>
												</td>
												<td class="pb-0">
												<button type="button" class="btn btn-outline-secondary btn-sm" 
												onclick="location.href='getBranch.do?branch_id=${branch.branch_id }'">상세보기</button>
												</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>

						</div>
					</div>


				</div>
			</div>
		</div>
	</div>



</div>





	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d813e873100c1c18c8e565a7a70eaf9"></script>

<script>
	let position_b;
	
	
	
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	mapOption = {
		center : new kakao.maps.LatLng(37.483953143582305, 126.89410293398274), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커를 표시할 위치와 title 객체 배열입니다 

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "resources/images/map_pointer_s.png";
	imageSize = new kakao.maps.Size(49, 46);
	var clickedOverlay = null;

	/*	
	var positions = [ 
		{
			title : '테스트0',
			latlng : new kakao.maps.LatLng(37.0, 126.0)
		}
		getJsonBranchListData();
	];
	 */
	 
	 /*
	 var list = new Array();
	 var size = ${branchList.size()};
	for(var x=0; x<size ; x++){
		console.log(${branchList[1].branch_name});
		console.log(temp);
	}
	 */
	 
	 /*
	var positions = [ {
		title : '테스트0',
		latlng : new kakao.maps.LatLng(37.0, 126.0)
	}, {
		title : '시흥동점',
		latlng : new kakao.maps.LatLng(37.45044111687359, 126.90948405908027)
	}, {
		title : '보라매점',
		latlng : new kakao.maps.LatLng(37.49003289436126, 126.9271166452897)
	}, {
		title : '고척점',
		latlng : new kakao.maps.LatLng(37.503122224664345, 126.85014100917697)
	}, {
		title : '난곡점',
		latlng : new kakao.maps.LatLng(37.48058171591476, 126.90945223680478)
	}, {
		title : '가산디지털역점',
		latlng : new kakao.maps.LatLng(37.4803938036867, 126.88412249700781)
	}, {
		title : '구로디지털점',
		latlng : new kakao.maps.LatLng(37.483953143582305, 126.89410293398274)
	} ];
	 */
		var positions = [
			
			
			{
			title : '테스트0',
			latlng : new kakao.maps.LatLng(37.0, 126.0)
		}, {
			title : '시흥동점',
			latlng : new kakao.maps.LatLng(37.45044111687359, 126.90948405908027)
		}, {
			title : '보라매점',
			latlng : new kakao.maps.LatLng(37.49003289436126, 126.9271166452897)
		}, {
			title : '고척점',
			latlng : new kakao.maps.LatLng(37.503122224664345, 126.85014100917697)
		}, {
			title : '난곡점',
			latlng : new kakao.maps.LatLng(37.48058171591476, 126.90945223680478)
		}, {
			title : '가산디지털역점',
			latlng : new kakao.maps.LatLng(37.4803938036867, 126.88412249700781)
		}, {
			title : '구로디지털점',
			latlng : new kakao.maps.LatLng(37.483953143582305, 126.89410293398274)
		} ];	 

	var content;
	for (var i = 1; i < positions.length; i++) {
		
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35);

		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		// 마커 이미지 
		});

		let vo = {};
		vo.branch_id = i;


	$
				.ajax(
						"getJsonBranch.do",
						{
							type : "post",
							data : JSON.stringify(vo), //'{"seq": 1}' //서버로 전달할 데이터(JSON문자열)
							async : false,
							//data: "seq=1", // key-value 형태
							dataType : "json", //서버로 부터 응답받을 데이터 형식
							contentType : "application/json", //서버로 전달하는 컨텐츠유형(JSON형식일때)
							success : function(data) {
								content = '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            채움 '
										+ data.branch_name
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="desc">'
										+ '                <div stlye="height:40px;"">'
										+ data.branch_addr
										+ '			</div>'
										+ '    </div>'
										+ ' <div style="text-align:right "><button type="button"  style="padding:4px 10px;margin-right:0px;" class="btn btn-outline-secondary btn-fw btn-md">'
										+ data.branch_tel
										+ '</button> <button type="button"  style="padding:4px 10px;margin-right:5px;" class="btn btn-outline-secondary btn-fw" onclick="location.href=\'getBranch.do?branch_id='
										+ data.branch_id
										+ '\'">상세보기</button></div> '
										+ '        </div>' + '    </div>'
							},
							error : function() {
								alert("Ajax 실행중 오류");
							}
						});

		console.log(content);
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var customOverlay = new kakao.maps.CustomOverlay({
			content : content,
			position : marker.getPosition()
		});

		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
				marker, customOverlay));

	}

	function makeOverListener(map, marker, customOverlay) {
		
		return function() {
			if (clickedOverlay) {
				clickedOverlay.setMap(null);
			}
			customOverlay.setMap(map);
			clickedOverlay = customOverlay;
		};
	}

	function makeOverListener(map, marker, customOverlay) {
		return function() {
			if (clickedOverlay) {
				clickedOverlay.setMap(null);
			}
			customOverlay.setMap(map);
			clickedOverlay = customOverlay;
		};
	}

	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		if (clickedOverlay) {
			clickedOverlay.setMap(null);
		}
	}
	/*	
	 function getJsonBranchListData() {
	 alert("getJsonBranchListData() 실행~~~");
	 $.ajax("getJsonBranchList.do", {
	 type: "get",
	 dataType: "json",
	 async:false,
	 success: function(data){
	 alert("성공~~~");
	 console.log(data);
	
	
	 $.each(data, function(index, obj){
	 position_b += ", {  title : "
	 position_b += this["branch_name"] + ",";
	 position_b += "latlng : new kakao.maps.LatLng(";
	 position_b +=this["branch_latitude"] + ",";
	 position_b +=this["branch_longitude" + "])}";
	 });
	 },
	 error: function(){
	 alert("실패~~~");
	 }
	 });
	 }
	 */
</script>