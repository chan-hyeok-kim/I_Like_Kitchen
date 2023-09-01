 
   $('#company-name').click(function(){
  let partnerNum = $('#permit').attr('data-permit')
  
   $.ajax({
       type:'GET',
       url:'/partner/detail?partnerNum='+partnerNum
       ,success:function(result){
        $('.li-table').html(result)
       },error:function(){
        console.log('불러오지 못했습니다') 
       }
      })

   })