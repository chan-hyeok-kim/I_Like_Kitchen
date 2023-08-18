<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>


<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<section class="ms-5">



		<form action="">
			<div id="choice">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="choice" id=""
						checked> <label class="form-check-label"
						for="flexRadioDefault1"> 일반 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="choice" id="">
					<label class="form-check-label" for="flexRadioDefault2"> 1박
						이상 </label>
				</div>
			</div>

			<div id='calendar'></div>

            <div class="container" id="time">
            이용시간  <input type="time" min="00:00">
            </div>
			인원선택 <input type="number" class="form-control" name="headCount">

			목적<input type="text" class="form-control" name="purpose">

			<div class="mb-3">
				<label for="ta1" class="form-label">호스트 전달 내용</label>
				<textarea class="form-control" id="ta1" rows="3" name=""></textarea>
			</div>
			<button type="button" class="btn btn-primary">접수</button>
		</form>


		<script>
			let cho = document.getElementById("choice")

			/* document.addEventListener('DOMContentLoaded', function() { */
			cho.addEventListener("click", function() {
				let calendarEl = document.getElementById('calendar');
				let calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					selectable : true,
					locale : 'ko',
					dateClick : function(info) {
						alert('예약하실 날짜는 ' + info.dateStr + '입니다')
					    
                        $('#time').append(calendar1);
					}

				});
				calendar.render();
			});
		</script>

	</section>
</body>
</html>