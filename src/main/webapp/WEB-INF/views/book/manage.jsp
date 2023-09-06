<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<c:import url="../temp/bootStrap.jsp"></c:import>

<style>
  #calendar{
       width:900px;
       margin-right:0px;
  }
  #move{
      margin-left: 100px;
      margin-top: 20px;
  }

  #calendar-manage{
      border-top: 1px solid #ece6cc;
  }
  #move:nth-child(2){
      width: 300px;
  }
</style>


</head>

<body>
<c:import url="../temp/header.jsp"></c:import>

<section id="calendar-manage">
<h3>예약 승인 페이지</h3>

<div style="display: flex">
<div id="move">
<div id='calendar'></div>
</div>
<div>글씨테스트2</div>
<c:if test="${empty list}">
진행 중인 예약 내역이 없습니다 
</c:if>

<c:if test="${not empty list}">
<div style="display: flex" id="book-date-info"> </div>
</c:if>
</div>
</div>

</section>
</body>

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
    let eventArr = getCalendarDataInDB();
    let calendarEl = document.getElementById('calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
    	headerToolbar: {
			start: 'today prev,next',
			center: 'title',
			end: 'dayGridMonth,timeGridWeek,timeGridDay'
		},
        initialView: 'dayGridMonth',
        selectable : true,
		locale : 'ko',
		navLinks: true, 
		editable: true,
		 dayMaxEventRows: true, // for all non-TimeGrid views
		  views: {
		    timeGrid: {
		      dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
		    }
		  },
	    events: eventArr,
      eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  },
		eventClick: function(info) {
			    console.log('Event: ' + info.event.title);
			    info.el.style.backgroundColor = 'yellowgreen'
    },
    dateClick:function(info){

    	console.log(info.jsEvent)
    	console.log(info.view)
    	$.ajax({
    		type: 'POST',
        url: 'checklist',
       data:{
          clickDay: info.dateStr
       },
         success:function(result){
            $('#book-date-info').html(result)
        }    	
    	})
    },
    
    })
  
    calendar.render();
  });




function getCalendarDataInDB(){
    let arr = [];
    
    $.ajax({
        url:'getAjaxEvent',
        type:'post',
        success:function(res){
            arr = res;
            console.log(res)
            
        },
        error:function(){
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
        }
    });
    return arr;
}

</script>
</html>