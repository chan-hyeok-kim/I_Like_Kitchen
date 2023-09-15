





// 사업자등록번호 진위확인


let serviceKey = $('#businessNum').attr('data-serviceKey');
let bNo="";
let businessName="";
let businessDate="";



$('#businessNum').blur(function(){
    bNo = $('#businessNum').val();
    let data = {
        "b_no": [bNo], // 사업자번호 "xxxxxxx" 로 조회 시,
    }; 
       console.log(bNo)
       console.log(serviceKey)
    $.ajax({
      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="+serviceKey,  // serviceKey 값을 xxxxxx에 입력
      type: "POST",
      data: JSON.stringify(data), // json 을 string으로 변환하여 전송
      dataType: "JSON",
      contentType: "application/json",
      accept: "application/json",
      success: function(result) {
      let resultText="";
          console.log(result.status_code);
          if(result.status_code=="OK"){
          console.log('데이터 전송은 문제 없음')
           
          }
          console.log(result.data[0].tax_type)
          if(result.data[0].tax_type=="국세청에 등록되지 않은 사업자등록번호입니다."){
          resultText=result.data[0].tax_type;
          $('#resultText').css({ 
          "color":"red"
          })
          }else{
           resultText=result.data[0].tax_type+"입니다";
           $('#resultText').css({ 
          "color":"greenyellow"
          })
           }
          $('#resultText').empty();
          $('#resultText').append(resultText);
      },  
      error: function(result) {
          console.log(result.responseText); //responseText의 에러메세지 확인
      }
    })
})

$('#businessInfo').click(function(){
    bNo = $('#businessNum').val();
    businessName = $('#businessName').val();
    businessDate = $('#businessDate').val();
    console.log("클릭됨")
  let data = {
      "businesses":[{
      "b_no":bNo,
      "start_dt":businessDate,
      "p_nm":businessName
  }]
}
    $.ajax({
        url:"http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey="+serviceKey,
        type:"POST",
        data:JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success:function(result){
            console.log(result)
            console.log(result.data[0].valid)
            if(result.data[0].valid=="01"){
            swal("유효한 사업자입니다. 파트너 페이지로 이동합니다")
            }
        }
        ,error:function(){
            
            swal("검증 실패")
        }

  })
})