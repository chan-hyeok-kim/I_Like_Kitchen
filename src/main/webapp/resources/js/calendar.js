
			let cho = document.getElementById("choice")

        
			document.addEventListener('DOMContentLoaded', function() { 
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					selectable : true,
					locale : 'ko',
					dateClick : function(info) {
						alert('예약하실 날짜는 ' + info.dateStr + '입니다')
					    
     
					}

				});
				calendar.render();
			});
			
			
		