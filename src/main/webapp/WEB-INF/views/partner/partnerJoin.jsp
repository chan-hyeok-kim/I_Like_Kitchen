<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>장소등록</title>
<!-- <link href="/resources/css/member/memberJoin.css" rel="stylesheet"> -->
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="container-fluid page-content">
		<div class="row justify-content-center">
			<h1 class="col-md-7 my-5 text-center fw-bold">장소등록</h1>
		</div>
		<div class = "row justify-content-center">
			<form class="col-md-6" id="frm" action="./partnerJoin" method="post">
		
			<div class="mb-3">
			  <label for="id" class="form-label fw-bold">아이디</label>
			  <input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력" required>
			  <div id="idResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerName" class="form-label fw-bold">장소이름</label>
			  <input type="text" name="partnerName" class="form-control" id="partnerName" placeholder="이름 입력" required>
			  <div id="nameResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerAddress" class="form-label fw-bold">주소</label>
			  <input type="text" name="partnerAddress" class="form-control" id="partnerAddress" placeholder="주소 입력">
			</div>
			
			<div class="mb-3">
			  <label for="partnerAccount" class="form-label fw-bold">계좌번호</label>
			  <input type="text" name="partnerAccount" class="form-control" id="partnerAccount" placeholder="계좌번호 입력">
			</div>
			
			<div class="mb-3">
			  <label for="partnerDate" class="form-label fw-bold">날짜</label>
			  <input type="date" name="partnerDate" class="form-control" id="partnerDate" placeholder="가입날짜 입력">
			</div>
			
			<div class="mb-3">
			    <label for="partnerEmail" class="form-label fw-bold">이메일</label>
			    <div class="input-group">
			        <input type="text" class="form-control" name="partnerEmail" id="partnerEmail" placeholder="이메일 입력" >
			        <select class="form-control" name="partnerEmailDomain" id="partnerEmailDomain" >
			        	<option value="" selected="selected">선택</option>
			            <option value="@naver.com">@naver.com</option>
			            <option value="@daum.net">@daum.net</option>
			            <option value="@gmail.com">@gmail.com</option>
			            <option value="@nate.com">@nate.com</option>
			        </select>
			    </div>
				<!-- <div id="partnerEmailResult"></div>
			    <div class="input-group mt-3">
			        <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			        <button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호 발송</button>
			        <button type="button" class="btn btn-secondary d-none" id="mail-Confirm-Btn">인증번호 확인</button>
			    </div>
			    <span id="mail-check-warn"></span> -->
			</div>
	
			<div class="mb-3">
				<button class="btn btn-outline-success fw-bold" id="btn" type="sumbit">공간대여등록</button> 
			</div>
			</form>
		</div>
	</div>

	<!-- <script src="/resources/js/member/memberJoin.js"></script> -->
</body>
</html>