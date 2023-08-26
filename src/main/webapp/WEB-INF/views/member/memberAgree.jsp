<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>약관확인서</title>
<link href="/resources/css/member/memberAgree.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">약관 확인서</div>
                <div class="form-check">
                    <input class="form-check-input checks" type="checkbox" value="" id="checkAll">
                    <label class="form-check-label" for="checkAll">
                        전체동의
                    </label>
                </div>

                <div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check1">
				         <label class="form-check-label ml-2" for="check1">
				            만 14세이상 입니다(필수)
				         </label>
                	</div>
                </div>

                이용약관
                <div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check2">
				         <label class="form-check-label ml-2" for="check2">
				            이용약관 동의(필수)
				         </label>
                	</div>
                	<div class="card-body">
				        <div class="terms-content">
					        내용
				        </div>
				    </div>
				</div>

				개인정보 수집이용 동의
				<div class="card mb-4">
				    <div class="card-header">
				        <input class="form-check-input check checks ml-1" type="checkbox" value="" id="check3">
				        <label class="form-check-label ml-2" for="check3">
				            개인정보 수집이용 동의(필수)
				        </label>
				    </div>
				    <div class="card-body">
				        <div class="terms-content">
					        내용
				        </div>
				    </div>
				</div>

				마케팅 알림수신 동의
				<div class="card mb-4">
                	<div class="card-header">
                		 <input class="form-check-input check ml-1" type="checkbox" value="" id="check4">
				         <label class="form-check-label ml-2" for="check4">
				            마케팅 알림수신 동의(선택)
				         </label>
                	</div>
                </div>

                <div class="agree-btn">
                    <button id="agreeBtn" class="btn btn-outline-secondary">회원가입</button>
                </div>
                </div>
          	</div>
		</div>
	</div> 
	
	<script src="/resources/js/member/memberAgree.js"></script> 
</body>
</html>