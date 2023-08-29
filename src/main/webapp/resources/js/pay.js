
$('#btn').click(function(){
	pay()
})



  function pay(){
	let uid='';
    IMP.init('imp27436400')
    IMP.request_pay({
    // pg : 'html5_inicis'
	pg: 'nice',
    pay_method : 'card',
    merchant_uid: "4", // 상점에서 관리하는 주문 번호
    name : '주문명:결제테스트',
    amount : 34000,
    buyer_email : 'test@naver.com',
    buyer_name : '김찬혁',
    buyer_tel : '010-2645-9730',
}, function(rsp) {
	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		uid = rsp.imp_uid;
	console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + uid
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
					console.log("결제 및 결제검증완료");
					
		        	$.ajax({
						url: "/pay/add", //cross-domain error가 발생하지 않도록 주의해주세요
						type: 'POST',
						data: {
						orderNum:"4",
						payAmount:34000,
						pay_method : 'card',
						sid: uid
						}
							//기타 필요한 데이터가 있으면 추가 전달
						,success:function(result){
							console.log(result);
							swal('결제 성공!',"결제 완료 페이지로 이동합니다.","success").then(function(){	
							//결제완료 페이지로 이동
							 location.replace('detail?payNum='+result);
							})
						},error:function(){
							
						}
							
					})
					
	        	} else {
					swal("결제 실패","결제가 취소됩니다","error");
							let cancelReason = '결제 검증 실패'
						//	cancelPay(cancelReason)
							//금액이 맞지 않을 시, 스크립트에서 위변조되었을 시
	        		console.log("결제 실패");
	        	}
	        });
	}
}
	)
  }


// function cancelPay(cancelReason) {
// 	$.ajax({
// 	  url: "/pay/refund", 
// 	  type: "POST",
// 	  data: {
// 		orderNum:orderNum, // 예: ORD20180131-0000011
// 		payAmount:amount, // 환불금액
// 		payNum:payNum,
// 		reason:cancelReason // 환불사유\
// 	    },
// 		success:function(){
//                 console.log("결제 취소 완료")
// 		}
// 	})
// }


let check1 = document.getElementsByClassName("check1")

// function btnCheck(){
// if($('#checkedAll').prop("checked")){
// 	  $('#btn1').prop("disabled",false);
// 	}else{
// 	$('#btn1').prop("disabled",true);
// 	}
// }

$('#checkedAll').click(function(){
	
	$('.check1').each(function(i, e){
        $(e).prop("checked",$('#checkedAll').prop("checked"))
	})
    // btnCheck();
	
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
	  	 	
		
		// btnCheck(); 
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

