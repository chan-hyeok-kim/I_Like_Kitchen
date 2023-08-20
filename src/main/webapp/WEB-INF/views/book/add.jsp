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
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<c:import url="../temp/bootStrap.jsp"></c:import>
<style type="text/css">
  .border{
       border-bottom: solid gainsboro 1px;
  } 
  .f1{
       font-weight: bold;  
       margin-top: 10px;
       margin-bottom: 10px;
       padding-left: 20px;
  }
  .b1{
      border-bottom: solid gainsboro 10px;
  }
  .m2{
      margin-top:30px;
      margin-bottom:30px
  }
  

</style>
 
</head>
<body>
	<section>





		<form action="">
		<div class="b1">
		    <div style="position:relative" class="f1">상품 선택</div>
			
				<div class="form-check border">
					<input class="form-check-input" type="radio" name="choice" id="radio1"
						checked> <label class="form-check-label"
						for="radio1"> 일반 </label>
				</div>
				<div class="form-check border">
					<input class="form-check-input" type="radio" name="choice" id="radio2">
					<label class="form-check-label" for="radio2"> 1박
						이상 </label>
				</div>
			</div>

<div class="b1">
			<div id='calendar'></div>
</div>
<div class="b1">
           <div id="time" class="border f1">
           이용 시간 선택
           </div>
          
        <div class="">시작 시간<input type="text" class="timepicker" name="startTime"></div>
        <div class="">종료 시간<input type="text" class="timepicker" name="endTime"></div>
        </div> 
        
        
           <div class="b1">
        
        <div class="border f1">
			인원 선택 </div><input type="number" class="form-control m2" name="headCount">
	    </div>
	     </div>
	       <div class="b1">
		<div class="border f1">
            목적</div>	 
            <input type="text" class="form-control m2" name="purpose">
           </div>

  <div class="b1">
			<div class="border mb-3 f1">
				<label for="ta1" class="form-label">호스트 전달 내용</label>
				</div>
				<textarea class="form-control m2" id="ta1" rows="3" name="contents"></textarea>
			  </div>
			
			호스트 승인 후 예약이 가능합니다.<br>
			<button type="button" class="btn btn-primary">접수</button>
		</form>


		<script src="/resources/js/calendar.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function () {
            $('.timepicker').timepicker({
             timeFormat: 'h:mm p',
             interval: 60,
             minTime: '10',
             maxTime: '6:00pm',
             defaultTime: '11',
             startTime: '10:00',
             dynamic: false,
             dropdown: true,
             scrollbar: true
            });
         });
		</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	</section>
</body>
</html>