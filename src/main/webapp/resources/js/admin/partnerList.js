count = $('.partner-permit').length
 
console.log(count)
for(let i=0; i<count; i++){
   
   $('.partner-permit').eq(i).click(function(){
      partnerNum = $('.partner-permit').eq(i).attr('data-permit')
      console.log(partnerNum)
         
      swal({
         text: '승인하시겠습니까?',
         buttons: ['취소', '승인']
     }).then(function (result) {
         if (result) {
            $.ajax({
               type:'POST',
                url:'partner/permitUpdate',
                data:{
                  partnerNum:partnerNum
                }
                ,success:function(result){
                       if(result>0){
                         swal('승인되었습니다')
                       }
                },error:function(){
                     swal('승인이 취소되었습니다')
                }


            })
         }

      })
   

   })
}


   
   