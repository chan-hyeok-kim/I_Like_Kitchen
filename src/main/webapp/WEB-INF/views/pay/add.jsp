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
} /* bisque */
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
	font-size: 25px;
}

#tbl1 td, #tbl2 td {
	text-align: center;
}



@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);



</style>


<!-- 아임포트  -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>


	<!-- <div class="ri-text"> -->



	<table class="table1 table table-light" id="tbl1">
		<thead>
			<tr>
				<th width="30%">호스트 정보</th>
				<th width="70%"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>상호명</td>
				<td>kto.</td>
			</tr>
			<tr>
				<td>대표자명</td>
				<td>kto.partnerName</td>
			</tr>
			<tr>
				<td>소재지</td>
				<td>kto.address</td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td>kto.partnerNum</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>kto.phone</td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td>kto.email</td>
			</tr>
		</tbody>


	</table>



	<table class="table1 table table-light" id="tbl2">
		<thead>
			<tr>
				
				<th colspan="9">환불규정 안내</th>

			</tr>
		</thead>
		<tbody>
			<tr>
			<td colspan="2" style="text-align: left">&#42;&#42;&#42;이용당일(첫
					날)이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다 결제 후 2시간 이내에는 100%환불이 가능합니다.(단,
					이용시간 전까지만 가능)&#42;&#42;&#42;</td>
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

	


	


	<table class="table1 table table-light" id="agree">
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
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"
						style="margin-left: 30px">결제</h1>

				</div>
				<div class="modal-body">
					<h4 style="font-weight: bold; font-family:sans-serif; ">결제하시겠습니까?</h4>
					<table class="table2 table table-light">
						<tr>
							<td>예약공간</td>
							<td>kto.productName</td>
						</tr>
						<li>
						</li>
						<tr>
							<td>예약날짜</td>
							<td>kto.bookDate</td>
						</tr>
						<tr>
							<td>예약시간</td>
							<td>kto.startTime~kto.endTime</td>
						</tr>
						<tr>
							<td>예약인원</td>
							<td>kto.headCount</td>
						</tr>
						<tr>
							<td>결제예정금액</td>
							<td>kto.price</td>
						</tr>
					</table>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" style="width: 225px">닫기</button>
					<button type="button" class="btn btn-primary" id="btn"
						style="width: 225px">결제하기</button>
				</div>

			</div>
		</div>



	</div>


	<script src="/resources/js/pay.js"></script>
</body>
</html>