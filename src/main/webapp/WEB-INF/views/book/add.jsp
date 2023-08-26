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
<!-- <link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> -->
<!-- swiper  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<c:import url="../temp/bootStrap.jsp"></c:import>
<style type="text/css">
html,body{
     width: 500px;
     margin: auto;
 }
 
html{
    background: rgba(250, 246, 223, 0.89);
}

section{
   background: white; 
}
.f1 {
	font-weight: bold;
	margin: 12px;
	/* margin-top: 10px;
	padding-left: 20px;
	line-height: 15px;
	height: 30px; */
}



.b1 {
    border-bottom: solid rgb(188, 206, 251) 4px;
	margin: auto;
	width: 90%;
}

.m2 {
	margin-top: 20px;
	margin-bottom: 30px;
	
}
.m21{
    
}

.room-booking button {
	font-size: 14px;
	
	border-radius: 2px;
	color: #dfa974;
	font-weight: 500;
	background: transparent;
	height: 46px;
	margin-top: 30px;
}
</style>

</head>
<body>
	<section>

		
	<!-- 	<div class="room-booking">
			<button type="button" style="font-weight: bold"
				class="btn btn-warning" data-bs-toggle="modal"
				data-bs-target="#exampleModal">예약</button>
		</div>


		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body"> -->

						<form action="./add" method="post">
						<input type="hidden" name="productNum" value="2">
							<div class="b1">
								<div class="f1">상품 선택</div>

								<div class="form-check cho">
									<input class="form-check-input" type="radio" name="choice"
										id="radio1" value="1"><label class="form-check-label"
										for="radio1"><div>일반</div></label>
								</div>
								<div class="form-check cho">
									<input class="form-check-input" type="radio" name="choice"
										id="radio2" value="2"><label class="form-check-label"
										for="radio2"><div>1박 이상</div></label>
								</div>
								
							</div>

							<div class="b1" id="date">
								<div class="f1">날짜 선택
								
								</div>
								
								<div id='calendar'>
								<input type="hidden" name="bookDate" id="setDate">
								</div>
							</div>
							<div class="b1" id="selectTime">
								<div class="f1">이용 시간 선택	&#40;<span id="selectTimeTitle"></span>&#41;</div>

								<div class="" id="startTime">
									시작 시간 : <select id="selectStartTime" name="start" class="SelectBoxstyle__Select-sc-1i9rrh1-0 jdZFuX">
        <option value="" class="TimeFormstyle__DefaultOption-sc-161sx5r-1 FTLFp">시작(세팅 포함)시간</option>
        <option value="00:00" class="opt-1">00:00</option>
        <option value="01:00">01:00</option>
        <option value="02:00">02:00</option>
        <option value="03:00">03:00</option>
        <option value="04:00">04:00</option>
        <option value="05:00">05:00</option>
        <option value="06:00">06:00</option>
        <option value="07:00">07:00</option>
        <option value="08:00">08:00</option>
        <option value="09:00">09:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
        <option value="17:00">17:00</option>
        <option value="18:00">18:00</option>
        <option value="19:00">19:00</option>
        <option value="20:00">20:00</option>
        <option value="21:00">21:00</option>
        <option value="22:00">22:00</option>
        <option value="23:00">23:00</option>
    </select>
								</div>
							<div class="" id="endTime">
									종료 시간 : <select id="selectEndTime" name="end" class="SelectBoxstyle__Select-sc-1i9rrh1-0 jdZFuX">
        <option value="" class="TimeFormstyle__DefaultOption-sc-161sx5r-1 FTLFp">종료(정리 포함)시간</option>
        <option value="00:00" class="opt-2">00:00</option>
        <option value="01:00">01:00</option>
        <option value="02:00">02:00</option>
        <option value="03:00">03:00</option>
        <option value="04:00">04:00</option>
        <option value="05:00">05:00</option>
        <option value="06:00">06:00</option>
        <option value="07:00">07:00</option>
        <option value="08:00">08:00</option>
        <option value="09:00">09:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
        <option value="17:00">17:00</option>
        <option value="18:00">18:00</option>
        <option value="19:00">19:00</option>
        <option value="20:00">20:00</option>
        <option value="21:00">21:00</option>
        <option value="22:00">22:00</option>
        <option value="23:00">23:00</option>
    </select>
								</div>
							</div>


							<div class="b1">

								<div class="f1">인원 선택</div>
								<input type="number" class="form-control m2" name="headCount">
							</div>
					
					<div class="b1">
						<div class="f1">목적</div>
						<input type="text" class="form-control m2" name="purpose">
					</div>

					<div class="b1">
						<div class="mb-3 f1">
							<label for="ta1" class="form-label">호스트 전달 내용</label>
						</div>
						<textarea class="form-control m2" id="ta1" rows="3" cols="7"
							name="contents"></textarea>
					</div>
<div class="b1">
					호스트 승인 후 예약이 가능합니다.<br>

					<button type="submit" class="btn btn-dark"
						style="width: 400px; margin: auto">접수</button>
</div>
					</form>


			
				<!--   <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
			






		<script src="/resources/js/calendar.js"></script>

		

		<script
			src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
		<!-- swiper -->
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	</section>
</body>
</html>