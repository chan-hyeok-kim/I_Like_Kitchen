count = $('.partner-permit').length
 

for(let i=0; i<count; i++){
   
   $('.partner-permit').eq(i).click(function(){
      id = $('.partner-permit').eq(i).attr('data-permit')
      partnerNum = $('.partner-permit').eq(i).attr('data-permit-num')
      console.log(partnerNum)
         
      swal({
         text: '승인하시겠습니까?',
         buttons: ['취소', '승인']
     }).then(function (result) {
         if (result) {
            $.ajax({
               type:'POST',
                url:'/partner/permitUpdate',
                data:{
                  partnerNum:partnerNum,
                  id:id
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

delCount = $('.partner-delete').length

for(let i=0; i<delCount; i++){
    $('.partner-delete').eq(i).click(function(){
      id = $('.partner-delete').eq(i).attr('data-delete')
      partnerNum = $('.partner-delete').eq(i).attr('data-delete-num')
      console.log(id)
      console.log(partnerNum)
         
      swal({
         text: '해제하시겠습니까?',
         buttons: ['취소', '해제']
     }).then(function (result) {
         if (result) {
            $.ajax({
               type:'POST',
                url:'/partner/deleteUpdate',
                data:{
                   partnerNum:partnerNum,
                   id:id
                }
                ,success:function(result){
                       if(result>0){
                         swal('파트너가 해제되었습니다')
                       }
                },error:function(){
                     swal('파트너 해제가 취소되었습니다')
                }


            })
         }

      })
   })
   
}
   
   