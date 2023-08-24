
$('#btn').click(
    
	pay
  )



  function pay(){
	$.ajax({
		url: "/pay/add", //cross-domain error가 발생하지 않도록 주의해주세요
		type: 'POST',
		data: {
		orderNum:"4",
		payAmount:34000,
		pay_method : 'card',
		}
			//기타 필요한 데이터가 있으면 추가 전달
		,success:function(result){
			console.log(result);
			swal('결제 성공!',"결제 완료 페이지로 이동합니다.","success").then(function(){	
            //결제완료 페이지로 이동
             location.replace('detail?payNum='+result);
			})
		},error:function(){
			alert("결제 실패");
		}
	})
  }

// 	let uid='';
//     IMP.init('imp27436400')
//     IMP.request_pay({
//     // pg : 'html5_inicis'
// 	pg: 'kicc',
//     pay_method : 'card',
//     merchant_uid: "4", // 상점에서 관리하는 주문 번호
//     name : '주문명:결제테스트',
//     amount : 34000,
//     buyer_email : 'test@naver.com',
//     buyer_name : '김찬혁',
//     buyer_tel : '010-2645-9730',
// }, function(rsp) {
// 	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
// 		uid = rsp.imp_uid;
// 	console.log(rsp);
// 			// 결제검증
// 			$.ajax({
// 	        	type : "POST",
// 	        	url : "/verifyIamport/" + rsp.imp_uid 
// 	        }).done(function(data) {
	        	
// 	        	console.log(data);
	        	
// 	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
// 	        	if(rsp.paid_amount == data.response.amount){

// 		        	$.ajax({
// 						url: "/pay/add", //cross-domain error가 발생하지 않도록 주의해주세요
// 						type: 'POST',
// 						data: {
// 						orderNum:"4",
// 						payAmount:34000
// 						}
							
// 							//기타 필요한 데이터가 있으면 추가 전달
// 						,success:function(result){
// 						  if(result.trim()>0){
// 							alert("주문정보 저장 성공");
// 						 }else{
// 							alert("주문정보 저장 실패");
// 						 }
// 						}
						
// 					})
					
// 					alert("결제 및 결제검증완료");
					
// 	        	} else {
// 	        		alert("결제 실패");
// 	        	}
// 	        });
// 	}
// }
// 	)
//   }

  // .done(function(res) {
                    //         if (res > 0) {
                    //             swal('주문정보 저장 성공')
                    //             createPayInfo(uid);
                    //         }
                    //         else {
                    //             swal('주문정보 저장 실패');
                    //         }
                    //     })





//   function createPayInfo(uid) {
//     // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
//     $.ajax({
//         type: 'get',
//         url: '/payInfo',
//         data: {
//             'imp_uid': uid,
//         },
//         success: function(data) {
            
//             swal('결제 성공 !',"결제완료 페이지로 이동합니다.","success").then(function(){
                
//                 // 결제완료 페이지로 이동
//                 location.replace('/order/complete?payNum='+data);

//             })
//         },
//         error: function() {
//             swal('결제정보 저장 통신 실패');
//         }
//     });
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

