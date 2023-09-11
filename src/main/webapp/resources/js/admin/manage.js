


$('.div-enroll-partner').click(function(){
   $.ajax({
     type:'GET',
     url:'/admin/partnerList'
   ,success:function(result) {
    $('main').html(result)
   },error:function(){
    console.log("불러오지 못했습니다")
   }
})
})

$('.div-enroll-admin').click(function(){
   $.ajax({
     type:'GET',
     url:'adminAuth'
   ,success:function(result) {
    $('main').html(result)
   },error:function(){
    console.log("불러오지 못했습니다")
   }
})
})

$('.div-delete-partner').click(function(){
   $.ajax({
     type:'GET',
     url:'/admin/partnerPermitList'
   ,success:function(result) {
    $('main').html(result)
   },error:function(){
    console.log("불러오지 못했습니다")
   }
})
})

$('.div-notice-admin').click(function(){
    location.href='/notice/list'

})
