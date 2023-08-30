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
    background: rgb(250, 250, 236);
}

section{
   background: white; 
}
.f1 {
	font-weight: bold;
	margin: 12px;
	border-bottom: solid gainsboro 1px;
	/* margin-top: 10px;
	padding-left: 20px;
	line-height: 15px;
	height: 30px; */
}



.b1 {
    border-bottom: solid rgb(188, 206, 251) 4px;
	margin: auto;
	width: 90%;
	padding-top: 20px;
}

.b1Last{ 
	margin: auto;
	width: 90%;
	padding-top: 20px;
	margin-bottom: 20px;
}


.m2 {
	margin-top: 20px;
	margin-bottom: 30px;
	margin-left: 20px;
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


.input-number-group {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.input-number-group input[type=number]::-webkit-inner-spin-button,
.input-number-group input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
          appearance: none;
}

.input-number-group .input-group-button {
  line-height: calc(80px/2 - 5px);
}

.input-number-group .input-number {
  width: 80px;
  padding: 0 12px;
  vertical-align: top;
  text-align: center;
  outline: none;
  display: block;
  margin: 0;
}

.input-number-group .input-number,
.input-number-group .input-number-decrement,
.input-number-group .input-number-increment {
  border: 1px solid #cacaca;
  height: 40px;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  border-radius: 0;
}

.input-number-group .input-number-decrement,
.input-number-group .input-number-increment {
  display: inline-block;
  width: 40px;
  background: #e6e6e6;
  color: #0a0a0a;
  text-align: center;
  font-weight: bold;
  cursor: pointer;
  font-size: 2rem;
  font-weight: 400;
}

.input-number-group .input-number-decrement {
  margin-right: 0.3rem;
}

.input-number-group .input-number-increment {
  margin-left: 0.3rem;
}

</style>

</head>
<body>
	<section>


						<form action="./add" method="post">
						<input type="hidden" name="productNum" value="2">
							<div class="b1">
								<div class="f1"><label for="radio1">상품 선택</label></div>

								<div class="form-check cho" style="margin-left: 20px">
									<input class="form-check-input" type="radio" name="choice"
										id="radio1" value="1">
										<label class="form-check-label"
										for="radio1"><div>일반</div></label>
								</div>
								<div class="form-check cho" style="margin-left: 20px">
									<input class="form-check-input" type="radio" name="choice"
										id="radio2" value="2"><label class="form-check-label"
										for="radio2"><div>종일 대관</div></label>
								</div>
								
							</div>

							<div class="b1" id="date">
								<div class="f1"><label for="calendar">날짜 선택</label>
								
								</div>
								
								<div id='calendar'>
								<input type="hidden" name="bookDate" id="setDate">
								</div>
							</div>
							<div class="b1" id="selectTime">
								<div class="f1"><label>이용 시간 선택	&#40;<span id="selectTimeTitle"></span>&#41;</label></div>

								<div class="" id="startTime" style="margin-left: 20px">
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
							<div class="" id="endTime" style="margin-left: 20px">
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
                       <div class="f1"><label for="headCount">인원 선택</label></div>
<div class="input-group input-number-group">
  <div class="input-group-button">
    <span class="input-number-decrement">-</span>
  </div>
  <input class="input-number" type="number" style="width: 40%" value="1" class="form-control m2" name="headCount" id="headCount">
  <div class="input-group-button">
    <span class="input-number-increment">+</span>
  </div>
</div>
<div style="margin-left: 30%;">
<button>+5</button><button>+10</button><button>+50</button><button>+100</button>
</div>
								<!-- <div class="f1"><label for="headCount">인원 선택</label></div>
								<input type="number" min="1" style="width: 30%" class="form-control m2" name="headCount" id="headCount" value="1"> -->
							<div class="f1"><label for="purpose">목적</label></div>
						<input type="text" class="form-control m2" name="purpose" id="purpose" style="width: 90%">
							</div>
					
					

					<div class="b1">
						<div class="mb-3 f1">
							<label for="ta1" class="form-label">호스트 전달 내용</label>
						</div>
						<textarea class="form-control m2" id="ta1" rows="6" cols="7"
							name="contents" style="width: 90%" placeholder="호스트에게 전달하고 싶은 내용을 적어주세요.&#13;&#10;호스트와 긴밀한 질의 응답이 필요할 경우 상세페이지의 '문의하기'버튼을 이용해주세요"></textarea>
					</div>
<div class="b1Last">
<div>
					<p style="color:red">호스트 승인 후 예약이 가능합니다.</p>
					</div>
<div style="margin-bottom: 20px">
					<button type="submit" class="btn btn-light"
						style="width: 300px; margin-left: 70px; background-color: rgb(188, 206, 251); color: white">접수</button>
</div>
</div>
					</form>
<div style="height: 20px">
</div>

			
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