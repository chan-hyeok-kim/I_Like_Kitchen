
    
			


			let cho = document.getElementsByClassName("cho")

          //  for(c of cho){
			document.addEventListener('DOMContentLoaded', function() { 
			  // c.addEventListener("click", function() {
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					selectable : true,
					locale : 'ko',
					dateClick : function(info) {
						alert('예약하실 날짜는 ' + info.dateStr + '입니다')
					    console.log(info.dateStr)
					    $('#setDate').val(info.dateStr);
                        console.log($('#setDate').val());
					}

				});
				calendar.render();
			});
			//}