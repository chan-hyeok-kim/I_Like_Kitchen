

$('#update-btn').click(function(){
         productNum=$('#del').attr("data-delete-num")
         location.href='update?productNum='+productNum
})

 $('#del').click(function(){
         productNum=$('#del').attr("data-delete-num")
        
     swal({
        text:'삭제하시겠습니까?',
        buttons:['취소','삭제'],
        confirmButtonText: "예",
		cancelButtonText: "아니요",
		closeOnConfirm: false,
		closeOnCancel : true,
        showCancelButton: true,
     }).then(function(isConfirm){
     if(isConfirm){
          $.ajax({
              type:'POST',
               url:'/product/delete',
              data:{
                  productNum:productNum       
              },success:function(result){
                  if(result>0){
                  swal('게시한 공간이 삭제되었습니다')
                  .then(function(){
                   location.href="/"
               })
                  } 
              },error:function(){
                  swal('삭제하는 도중 에러가 발생했습니다')   
               }
          })
          
          }
     })
     
 });