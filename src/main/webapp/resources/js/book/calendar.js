

		
let cho = document.getElementsByClassName("cho");

let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;  
let date = today.getDate();  

if(month<10){
   month = '0'+month; 
}
if(date<10){
	date = '0'+date;
}
today = year+'-'+month+'-'+date

console.log(today)


let setDate = new Date();


$('#selectTimeTitle').append(month+'월 '+date+'일')
          //  for(c of cho){
			document.addEventListener('DOMContentLoaded', function() { 
			  // c.addEventListener("click", function() {	

 
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					selectable : true,
					locale : 'ko',
				    events: [{ 
	                start: '0000-00-00',
				    end: today,
				    display: 'background',
				    backgroundColor:'gray',			
				    }],
					 dateClick : function(info) {
						console.log(info.date)
		          //    info.dayEl.style.backgroundColor = 'yellow';
					 	console.log(today)
					    if(info.dateStr<today){ 
						
						swal('알림',month+'월'+date+'일'+'부터 예약이 가능합니다')
						}else{
						console.log(typeof info.dateStr)
						let selectMonth = info.date.getMonth()+1;
					 	let selectDate = info.date.getDate();
						swal(
						   '알림','선택하신 날짜는 '+ selectMonth+'월'+selectDate+'일'+'입니다'
						)
						$('#setDate').val(info.dateStr);
                         console.log($('#setDate').val());
						 setDate = $('#setDate').val();
                        $('#selectTimeTitle').empty();
						$('#selectTimeTitle').append(selectMonth+'월 '+selectDate+'일')
						}
					 } 
				
				});
				calendar.render();
			});
			//}
			
	
			
let start="";
let end="";
let opt1= document.getElementsByClassName("opt-1");


bookNoticeEnd()
bookNoticeStart()
function bookNoticeStart(){
	 $('#selectTime').change(function(){
			   start=$('#selectStartTime option:selected').val();
			   console.log(start);
		      console.log(typeof start);
			   start=start.slice(0,2); 
			   console.log(start)
			  
	             if(end-start<4){ 
	        swal("알림","최소 4시간 이상만 예약 가능합니다.")	
	        
	        } 
			   })
			   }
	function bookNoticeEnd(){
	 $('#selectTime').change(function(){
			   end=$('#selectEndTime option:selected').val();
			   console.log(end);
		      console.log(typeof end);
			   end=end.slice(0,2); 
			   console.log(end)
			   console.log(end-start)
	        
			   })
	
	}
	
	$('.input-number-increment').click(function() {
  let $input = $(this).parents('.input-number-group').find('.input-number');
  let val = parseInt($input.val(), 10);
  $input.val(val + 1);
});

$('.input-number-decrement').click(function() {
  let $input = $(this).parents('.input-number-group').find('.input-number');
  let val = parseInt($input.val(), 10);
  if(val==1){
     val=1;
  }else{
  $input.val(val - 1);
  }
})

let productNum = $('#productNum').val();
console.log(productNum)
$('#book-close').click(function(){
	let productNum = $('#productNum').val();
	let headCount = $('#headCount').val();
	let purpose = $('#purpose').val();
	let contents = $('#contents').val();
	let startTime = $('#selectStartTime option:selected').val();
	let endTime = $('#selectEndTime option:selected').val();
	console.log(setDate)
   
	console.log(headCount)
	console.log(purpose)
	console.log(contents)
	console.log(startTime)
	console.log(endTime)
	$.ajax({
		type:'POST',
		 url:'add',
		data:{ 
	    productNum: productNum,
		headCount:headCount,
		purpose: purpose,
        contents: contents,
		bookDate: setDate,
		start: startTime,
		end: endTime
		},success:function(result){
			console.log(result)
           if(result.trim()>0){
			swal("예약이 성공적으로 완료되었습니다").then(function(){
              window.close();
			})
		   }else{
			swal("예약이 취소되었습니다").then(function(){
				window.close();
			  })
		   }
		   
		}
	})
})




