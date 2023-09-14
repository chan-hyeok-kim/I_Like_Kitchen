<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>사업자등록</title>
<link href="/resources/css/partner/partnerRegister.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="container-fluid page-content">
		<div class="row justify-content-center">
			<h2 class="col-md-7 my-5 text-center fw-bold">협력업체 사업자 등록</h2>
		</div>
		<div class = "row justify-content-center">
			<form class="col-md-6" id="partnerForm" action="./partnerRegister" method="post">
		
			<div class="mb-3">
			  <label for="partnerNum" class="form-label fw-bold">사업자번호</label>
			  <input type="text" name="partnerNum" class="form-control" id="partnerNum" data-serviceKey="${serviceKey}" value="4578500300" placeholder="사업자번호를 -를 제외하고 입력해주세요" required>
			  <div id="resultText"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerName" class="form-label fw-bold">대표자</label>
			  <input type="text" name="partnerName" class="form-control" id="partnerName" value="이승엽" placeholder="대표자이름을 입력해주세요." required>
			  <div id="partnerNameResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerDate" class="form-label fw-bold">개업일자</label>
			  <input type="date" name="partnerDate" class="form-control" id="partnerDate" placeholder="개업일자를 입력해주세요.">
			</div>
			
			<div class="mb-3">
			  <label for="companyName" class="form-label fw-bold">상호명</label>
			  <input type="text" name="companyName" class="form-control" id="companyName" placeholder="상호명을 입력해주세요.">
			  <div id="companyNameResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerPhone" class="form-label fw-bold">전화번호</label>
			  <input type="text" name="partnerPhone" class="form-control" id="partnerPhone" placeholder="전화번호를 입력해주세요.">
			  <div id="partnerPhoneResult"></div>
			</div>
			
			<div class="mb-3">
			    <label for="partnerEmail" class="form-label fw-bold">이메일</label>
			    <div class="input-group">
			        <input type="text" class="form-control" name="partnerEmail" id="partnerEmail" placeholder="이메일 입력" >
			    </div>
				<div id="partnerEmailResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="partnerAccount" class="form-label fw-bold">계좌번호</label>
			  <input type="text" name="partnerAccount" class="form-control" id="partnerAccount" placeholder="계좌번호를 입력해주세요.">
			  <div id="partnerAccountResult"></div>
			</div>
	
			<div class="mb-3 text-center">
				<button class="btn btn-outline-secondary fw-bold" id="partnerBtn" type="button">사업자 등록</button> 
			</div>
			</form>
		</div>
	</div>

	<script src="/resources/js/partner/partnerRegister.js"></script>
	
	<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>