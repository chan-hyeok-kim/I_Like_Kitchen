<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/bootStrap.jsp"></c:import>

<style type="text/css">
section{
     background: #F8F9FA;
     padding-top: 30px;
}


/* .menu-item,.top-nav{
     background: white;
}
 */
.room-booking button {
	font-size: 14px;
	border: 1px solid #dfa974;
	border-radius: 2px;
	color: #dfa974;
	font-weight: 500;
	background: transparent;
	height: 46px;
	margin-top: 30px;
}

table, td, th {
	border-collapse: collapse;
	empty-cells: show;
	background: white;
} /* bisque */

table{
    width: 65%;
}
td, th {
	/*   border-bottom: solid #fff1c4dc 1px; */
	line-height: 50px;
}

.table1 {
	border-top: solid black 4px;
	width: 800px;
	margin: auto;
	margin-top: 40px;
}

.table2 {
	width: 400px;
	font-size: 20px
}

/*  .tb1{
    border: solid blanchedalmond 1px;
  } */
.check1 {
	margin-left: 5%;
}

/*  input[class="check1"]{
     zoom: 2;
  } */
input[type="checkbox"]+label {
	display: inline;
	padding-left: 40px;
	zoom: 1.5;
	background: url('/resources/img/free-icon-check-box-9490039.png')
		no-repeat 0 0px/contain;
}

input[type='checkbox']:checked+label {
	background: url('/resources/img/free-icon-check-box-9490168.png')
		no-repeat 0 1px/contain;
}

input[type="checkbox"] {
	display: none;
}

th:first-child {
	padding-left: 60px;
}

#tbl1, #tbl2 {
	font-size: 20px;
}

#tbl1 td, #tbl2 td {
	text-align: center;
}

.modal-background{
    background: white;
}

.bi{
    width: 30px; height: 30px;
}

.caution-text{
   margin-left: 25px;
   margin-right: 25px;
}

@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
</style>


<!-- 아임포트  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
<div class="header-background">
<c:import url="../temp/header.jsp"></c:import>
</div>
	<!-- <div class="ri-text"> -->

<section>

	<table class="table1" id="tbl1">
		<thead>
			<tr>
				<th width="30%">호스트 정보</th>
				<th width="70%"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>상호명</td>
				<td>${kto.companyName}</td>
			</tr>
			<tr>
				<td>대표자명</td>
				<td>${kto.partnerName}</td>
			</tr>
			<tr>
				<td>소재지</td>
				<td>${kto.productDTO.address}</td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td>${kto.partnerNum}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${kto.productDTO.phone}</td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td>${kto.partnerEmail}</td>
			</tr>
		</tbody>


	</table>


	<table class="table1" id="tbl2">
		<thead>
			<tr>
				
				<th colspan="9">환불규정 안내</th>

			</tr>
		</thead>
		<tbody>
			<tr>
			<td colspan="2" style="padding-top: 30px">
			<p style="font-size: 20px"><em class="warn" style="color: rgb(255, 58, 72);">이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접
                문의하셔야 합니다.</em> <br>결제 후 2시간 이내에는 100% 환불이 가능합니다.(단,
              이용시간 전까지만 가능)
            </p></td>
			</tr>

			<tr>
				<td width="25%">이용 4일 전</td>
				<td width="75%">총 금액의 100%환불</td>
			</tr>
			<tr>
				<td>이용 2일 전</td>
				<td>총 금액의 70%환불</td>
			</tr>
			<tr>
				<td>기타</td>
				<td></td>
			</tr>
			<tr>
				<td>기타</td>
				<td></td>
			</tr>
			<tr>
				<td>기타</td>
				<td></td>
			</tr>

		</tbody>
	</table>

	


	


	<table class="table1" id="agree">
		<thead>
			<tr>

				<th width="70%" style="font-size: 25px">서비스 동의</th>
				<th width="30%" style="text-align: right;"><input
					class="form-check-input" type="checkbox" value="" id="checkedAll">
					<label class="form-check-label" for="checkedAll">전체
						동의</label></th>
			</tr>
		</thead>
		<tbody>
			<tr>


				<td><input class="form-check-input check1" type="checkbox"
					value="" id="checked1"> <label class="form-check-label"
					for="checked1"> 위 공간의 예약조건 확인 및 결제진행 동의 </label></td>
				<td></td>
			</tr>

			<tr>

				<td><input class="form-check-input check1" type="checkbox"
					value="" id="checked2"> <label class="form-check-label"
					for="checked2"> 환불 규정 안내에 대한 동의</label></td>
				<td></td>
			</tr>
			<tr>

				<td><input class="form-check-input check1" type="checkbox"
					value="" id="checked3"> <label class="form-check-label"
					for="checked3"> 개인정보 제3자 제공 동의 </label></td>
				<td></td>
			</tr>
			<tr>

				<td><input class="form-check-input check1" type="checkbox"
					value="" id="checked4"> <label class="form-check-label"
					for="checked4"> 개인정보 수집 및 이용 동의 </label></td>
				<td></td>
			</tr>
		</tbody>
	</table>


	<div>
		<button class="btn btn-primary" style="font-weight: bold; margin-top: 20px; margin-left: 75%"
			data-bs-toggle="modal" data-bs-target="reject" id="btnHome">결제하기</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-background">
					<h1 class="modal-title fs-5" id="exampleModalLabel"
						style="margin-left: 30px; font-family:'Jeju Gothic',sans-serif;">결제 확인</h1>

				</div>
				<div class="modal-body modal-background">
					<h4 style="font-weight: bold; font-family:sans-serif; text-align: center; margin-top: 30px; margin-bottom: 40px;">결제하시겠습니까?</h4>
					<table class="table2 table" style="">
						<tr>
							<td>예약공간</td>
							<td>${kto.productDTO.productName}</td>
						</tr>
						
						<tr>
							<td>예약날짜</td>
							<td>${book.bookDate}</td>
						</tr>
						<tr>
							<td>예약시간</td>
							<td id="bookTime" data-startTime="${book.startTime}" data-endTime="${book.endTime}"></td>
						</tr>
						<tr>
							<td>예약인원</td>
							<td>${book.headCount}</td>
						</tr>
						<tr>
							<td>결제예정금액</td>
							<td id="pay-info" data-phone="${member.phone}" data-email="${member.email}" data-name="${member.name}" data-book-num="${book.bookNum}"
							>${kto.productDTO.price}</td>
						</tr>
					</table>
				</div>

<p class="caution-text"><svg style="color: blue" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg> 결제 후 2시간이 지나 예약 취소 시, 파트너가 설정한 환불 기준에 따라 환불이 진행됩니다
</p>

<p class="caution-text" style="color: red;">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg> 결제 전에, 환불 기준과 예약내용을 반드시 확인해주세요!</p>

				<div class="modal-footer modal-background">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" style="width: 225px">닫기</button>
					<button type="button" class="btn btn-primary" id="btn"
						style="width: 225px">결제하기</button>
				</div>

			</div>
		</div>



	</div>


	
</section>
<script type="text/javascript">

start = $('#bookTime').attr('data-startTime');
end = $('#bookTime').attr('data-endTime')
console.log(typeof start);
console.log(start);
console.log(end);

start=start.substring(11,16);
end=end.substring(11,16);
console.log(start);

$('#bookTime').append(start)
$('#bookTime').append('~'+end)

</script>
<script src="/resources/js/pay/pay.js"></script>
</body>
</html>