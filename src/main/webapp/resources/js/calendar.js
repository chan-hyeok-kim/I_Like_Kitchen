
    
		
let cho = document.getElementsByClassName("cho");




          //  for(c of cho){
			document.addEventListener('DOMContentLoaded', function() { 
			  // c.addEventListener("click", function() {
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					selectable : true,
					locale : 'ko',
					showNonCurrentDates: false,
					validRange: function(nowDate){
						return{
						start: nowDate,
						end: nowDate+50
					}
					},
					 dateClick : function(info) {
					 	alert('예약하실 날짜는 ' + info.dateStr + '입니다')
					     $('#setDate').val(info.dateStr);
                         console.log($('#setDate').val());
                        
					 } 
				
				});
				calendar.render();
			});
			//}
			
	
			
let start="";
let end="";


			$('.opt-1').each(function(i,e){
			   $('#startTime').click(function(){
			   console.log($('#selectStartTime option:selected').val());
			   start=$('#selectStartTime option:selected').val();
			   start=start.slice(0,2); 
			   })
			})
				
		
		   
		$('.opt-2').each(function(j,e1){
			  $('#endTime').click(function(){
			  console.log($('#selectEndTime option:selected').val());
			  end=$('#selectEndTime option:selected').val();
		      console.log(end);
		      console.log(typeof end);
			   end=end.slice(0,2); 
			   console.log(end)
			    
				})
		  	})
		  
	//	 $('#endTime').mouseleave(function(){
	//	 console.log(end-start)
	//	 	 if(end-start<4){
	//		    alert("최소 4시간 이상만 예약 가능합니다.")
	//		 } 
     //  })
	
	$('.jdZFuX').each(function(i,e){
	    $(e).change(function(){
	         if(end-start<4){
			    alert("최소 4시간 이상만 예약 가능합니다.")
			 } 
	    })
	    })
		  