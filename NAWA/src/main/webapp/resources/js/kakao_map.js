
var map; //지도 객체
var marker=new kakao.maps.Marker(); //마커 객체

// 주소-좌표 변환 객체 생성
var geocoder=new kakao.maps.services.Geocoder();

/**
 * 초기 지도
 * @returns
 */
function setFristMap()
{
	var mapContainer =document.getElementById('map'),
		mapOption={
			center:new kakao.maps.LatLng(37.499983,127.035579), //지도의 중심 좌표
			level:6 //지도 확대 레벨 : 숫자가 클수록 축소된다.
		};
		
	map=new kakao.maps.Map(mapContainer,mapOption);	// 지도 생성
}

/**
 * 지도 생성
 * @param positionX 위도
 * @param positionY 경도
 * @param level 지도를 뿌려줄 레벨
 * @returns
 */
function setMap(positionX,positionY,level)
{
	//지도를 표출할 div검색 후 셋팅
	var mapContainer =document.getElementById('map'),
		mapOption={
			center:new kakao.maps.LatLng(positionX,positionY), //지도의 중심 좌표
			level:level //지도 확대 레벨 : 숫자가 클수록 축소된다.
		};
		
	map=new kakao.maps.Map(mapContainer,mapOption);	// 지도 생성
}

/**
 * 스크롤 확대와 더블클릭 확대를 막은 지도(event list출력 시 사용)
 * @param positionX
 * @param positionY
 * @returns
 */
function setOptionMap(positionX,positionY) {
	var mapContainer =document.getElementById('map'),
		mapOption={
			center:new kakao.maps.LatLng(positionX,positionY), //지도의 중심 좌표
			level:8,
			scrollwheel:false
		};
		
	map=new kakao.maps.Map(mapContainer,mapOption);	// 지도 생성
}

/**
 * 지도의 컨트롤러 생성
 * @param map
 * @returns
 */
function setMapControl(){
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
}

/**
 * 이벤트 상세 페이지에서 마커 표시
 * @param x 위도
 * @param y 경도
 * @returns
 */
function setMarker(x,y) {
	
    marker.setPosition(new kakao.maps.LatLng(x, y));
    marker.setMap(map);
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

/**
 * 주소 표출
 * @returns
 */
function getAddress() {
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	    	
	        if (status === kakao.maps.services.Status.OK) {
	        	var detailAddr = document.getElementById('listingAddress');
	        	//도로명 주소가 없는 곳이라면 구주소로 출력 있다면 도로명 주소로
	        	if(result[0].road_address == "undefined" || result[0].road_address ==null)
				{
					detailAddr.value=result[0].address.address_name;	//지번주소
				}else
				{
					detailAddr.value=result[0].road_address.address_name;	//도로명 주소
				}
	        	
        		
        		if(detailAddr.value.indexOf('서울') == -1)
        		{
        			alert("서비스 지역이 아닙니다(서울시에서만 가능).\n 지역분류에 미포함 됩니다.");
        		}
	        
        		for(var i=0;i<$("select[name^=ef_lc] option").size();i++)
        		{
        			if(detailAddr.value.match($("select[name^=ef_lc] option:eq("+i+")").text()))
        			{
        				$("select[name^=ef_lc] option:eq("+i+")").attr("selected","selected");
        				
        				$(".sbSelector").text($("select[name^=ef_lc] option:eq("+i+")").text());
        				break;
        			}
        		}

        		
	    		var LatLng = document.getElementById('latlng');
	    		LatLng.value=mouseEvent.latLng.getLat()+","+mouseEvent.latLng.getLng();
	    		
	    		// 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	        }   
	    });
	});
}

/**
 * 도로명 주소 반환
 * @param latLng 좌표값
 * @returns
 */
function printAddress(x,y){
	var detailAddr = document.getElementById('listingAddress'); // input
	
	searchDetailAddrFromCoords(new kakao.maps.LatLng(x, y), function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
			if(result[0].road_address == "undefined" || result[0].road_address ==null)
			{
				detailAddr.value=result[0].address.address_name;	//지번주소
			}else
			{
				detailAddr.value=result[0].road_address.address_name;	//도로명 주소
			}
        }   
    });
}

/**
 * 이벤트 리스트 출력 시 그 이벤트들의 주소를 마커로 표시
 * @param positions 컨트롤러에서 담아온 자바스크립트 배열형태가 들어있는 map
 * @returns
 */
function setMarkers(positions)
{
	for (var i = 0; i < positions.length; i ++) {
		
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커의 위치
	        clickable: true
	    });

	    // 마커에 표시할 인포윈도우를 생성
	    var infowindow= new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	    
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    
	    // 마커에 click 이벤트를 등록
	    kakao.maps.event.addListener(marker, 'click', function() {
	    	var input=document.getElementById("url").value;
	    	location.replace(input);
	    });
	}
	
}

//인포윈도우 표시
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
//인포윈도우 닫기
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
//--------------------------------------------------------------------
$("select[name^=ef_lc]").change(function() {
	jQuery.ajax({
		type: "get",
		url: "../moveMap.do",
		data: "uc_id="+$("#guiest_id19 option:selected").val(),
		asyn:true,
		success:function(data){
			map.setCenter(new kakao.maps.LatLng(data.positionX, data.positionY));
			map.setLevel(data.level);
			document.getElementById('listingAddress').value="";
		},
		error:function(data){
			alert("에러가 발생했습니다.");
		}
	});
});