$("#btn").click(function(){
   $.ajax({
       type:"get",
       url:"pay/add?productNum="+productNum,
       success:function(){
          console.log("예약 승인 완료")
       },
       error:function(){
          console.log("안넘어갔음")
       }
   })
})