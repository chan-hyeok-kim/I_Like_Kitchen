$('#identify').click(function(){
    
})




$('#bussinessNum').blur(function(){
    let bNo = $('#bussinessNum').val();
    let data = {
        "b_no": [bNo] // 사업자번호 "xxxxxxx" 로 조회 시,
       }; 
       
    $.ajax({
      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=xxxxxx",  // serviceKey 값을 xxxxxx에 입력
      type: "POST",
      data: JSON.stringify(data), // json 을 string으로 변환하여 전송
      dataType: "JSON",
      contentType: "application/json",
      accept: "application/json",
      success: function(result) {
          console.log(result);
      },
      error: function(result) {
          console.log(result.responseText); //responseText의 에러메세지 확인
      }
    })
})