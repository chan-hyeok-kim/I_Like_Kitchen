let amount = $('#pay-info').text();
let email = $('#pay-info').attr('data-email');
let buyer_name = $('#pay-info').attr('data-name');
let phone = $('#pay-info').attr('data-phone');
let bookNum = $('#pay-info').attr('data-book-num');
let productName=  $('#pay-info').attr('data-productName'); 
//시간 계산

let start = $('#bookTime').attr('data-startTime');
let end = $('#bookTime').attr('data-endTime')

start=start.substring(11,16);
end=end.substring(11,16);


$('#bookTime').append(start)
$('#bookTime').append('~'+end)

start =start.substring(0,2)
end=end.substring(0,2)

let useTime = end*1-start*1

amount = amount*useTime

$('#pay-info').text(amount);

$('#btn').click(function(){
	pay()
})


IMP.init('imp27436400')
  function pay(){
	let uid='';
    
    IMP.request_pay({
	pg: 'html5_inicis',
	pay_method: 'html5_inicis',
    merchant_uid: bookNum, // 상점에서 관리하는 주문 번호
    name : productName,
    amount : amount,
    buyer_email : email,
    buyer_name : buyer_name,
    buyer_tel : phone,
}, function(rsp) {
	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		uid = rsp.imp_uid;
	
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + uid
	        }).done(function(data) {
	        	
	        	
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
					
					
		        	$.ajax({
						url: "/pay/add", //cross-domain error가 발생하지 않도록 주의해주세요
						type: 'POST',
						data: {
						bookNum:bookNum,
						payAmount:amount,
						pay_method:'html5_inicis',
						payNum:uid
						}
							//기타 필요한 데이터가 있으면 추가 전달
						,success:function(result){
							
							swal('결제 성공!',"결제 완료 페이지로 이동합니다.","success").then(function(){	
							//결제완료 페이지로 이동
							 location.replace('/mypage/complete');
							})
						},error:function(){
							
						}
							
					})
					
	        	} else {
					swal("결제 실패","결제가 취소됩니다","error");
							let cancelReason = '결제 검증 실패'
							cancelPay(cancelReason)
							//금액이 맞지 않을 시, 스크립트에서 위변조되었을 시
	        		
	        	}
	        });
	}
}
	)
  }


function cancelPay(cancelReason) {
	$.ajax({
	  url: "/pay/refund", 
	  type: "POST",
	  data: {
		orderNum:orderNum, // 예: ORD20180131-0000011
		payAmount:amount, // 환불금액
		payNum:payNum,
		reason:cancelReason // 환불사유\
	    },
		success:function(){
              
		}
	})
}


let check1 = document.getElementsByClassName("check1")


$('#checkedAll').click(function(){
	
	$('.check1').each(function(i, e){
        $(e).prop("checked",$('#checkedAll').prop("checked"))
	})
    
})



	$('.check1').click(function(){
		let check = true;
	
		$('.check1').each(function(i,e){
		   if(!$(e).prop("checked")){
			  
			  check = $(e).prop("checked");
			  return check;
		   }
        })
        
	     $('#checkedAll').prop("checked",check);
	  	 	
		
		
	 })
 


$('#agree').mouseover(function(){
	if(!$('#checkedAll').prop("checked")){
		$('#btnHome').attr("data-bs-target","reject");
	}else{
		$('#btnHome').attr("data-bs-target","#exampleModal");
	}
})


$('#btnHome').click(function(){
	if(!$('#checkedAll').prop("checked")){
       alert("필수 서비스 사항에 전부 동의해주세요")
	}
})


