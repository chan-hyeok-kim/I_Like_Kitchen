


$('.enroll').click(function(){
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

$('.enroll-admin').click(function(){
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



// let partnerNum = $('#permit').attr('data-permit')

// $('#permit').click(function(){
//    $.ajax({
//        type:'POST',
//        url:'/partner/permit',
//        data:{
//           partnerNum:partnerNum,
//           partnerCheck:1
//        }
//    })
   
// })

// // let companyName = $('#company-name').attr('data-company')

// $('#company-name').click(function(){
//    $.ajax({
//        type:'GET',
//        url:'/partner/detail?partnerNum='+partnerNum
//    })
// })


