
$('#btn').click(
    pay
  )

  function pay(){
    IMP.init('imp27436400')
    IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
}, function(rsp) {
    	console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}

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


$('.check1').each(function(i,e){
	$(e).click(function(){
		let check = true;
		$('.check1').each(function(i,e1){
		   if(!$(e1).prop("checked")){
			  check=false;
			  $('#checkedAll').prop("checked",check);
		   }
		})

		if(check){
			 $('#checkedAll').prop("checked", true);
			 
		} 
		// btnCheck(); 
		
	   })
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

