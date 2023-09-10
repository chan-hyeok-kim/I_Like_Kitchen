let container = document.getElementById('map');
let xl = 33.450701
let yl = 126.570667
// let x = 35.9766482774579
// let y = 126.99597495347
let mapAddress=$('#address').text();

 kakao.maps.load(function(){
    let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapCenter = new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심 좌표
    mapOption = {
        center: mapCenter, // 지도의 중심 좌표
        level: 4 // 지도의 확대 레벨
    };
   

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption);

// 지도에 올릴 마커를 생성합니다.
let mMarker = new kakao.maps.Marker({
    position: mapCenter, // 지도의 중심좌표에 올립니다.
    map: map // 생성하면서 지도에 올립니다.
});


 
 
// 주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();


// 주소로 좌표를 검색합니다
geocoder.addressSearch(mapAddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        }); 
    map.setCenter(coords);
    }
    
  })
  
 
   })