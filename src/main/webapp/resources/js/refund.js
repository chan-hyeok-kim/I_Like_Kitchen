let orderNum = $('#data-refund').attr("data-refund-orderNum");
let amount = $('#data-refund').attr("data-refund-amount");
let payNum = $('#data-refund').attr("data-refund-payNum");

$('#btnHome').click(function(){
  console.log(amount)
  console.log(orderNum) 
  console.log(payNum)
 
})



$('#btn').click(function(){
  
  let cancelReason = $('#reason').val();
  console.log(cancelReason)
  if(confirm("환불하시겠습니까?")){
     cancelPay(cancelReason)
  }
  

})


function cancelPay(cancelReason) {
  $.ajax({
    // 예: http://www.myservice.com/payments/cancel
    url: "/pay/refund", 
    type: "POST",
    data: {
      orderNum:orderNum, // 예: ORD20180131-0000011
      payAmount:amount, // 환불금액
      payNum:payNum,
      reason:cancelReason // 환불사유
      // // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
      // refund_holder: "홍길동", 
      // // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
      // refund_bank: "88", 
      // // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      // refund_account: "56211105948400" 
    },success:function(result) { // 환불 성공시 로직 
    $.ajax({
      url: "https://api.iamport.kr/payments/cancel",
      method: "post",
      headers: {
        "Content-Type": "application/json",
        "Authorization": access_token // 포트원 서버로부터 발급받은 엑세스 토큰
      },
      data: {
        reason, // 가맹점 클라이언트로부터 받은 환불사유
        imp_uid, // imp_uid를 환불 `unique key`로 입력
        amount: cancel_request_amount, // 가맹점 클라이언트로부터 받은 환불금액
        checksum: cancelableAmount // [권장] 환불 가능 금액 입력
      }
    ,success:function(result){

    
      alert("환불 성공");
    },error:function{
      alert("환불 실패")
    }
  })
    },error:function(error) { // 환불 실패시 로직
      alert("환불 정보 입력 실패");
    }
  })
    
  }
//주문번호 , 환불 금액, 환불 사유는 입력, 

// confirm도넣으면되겠네