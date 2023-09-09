<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../../temp/bootStrap.jsp"></c:import>
<title>비밀번호 찾기</title>
<link href="/resources/css/member/findPW.css" rel="stylesheet">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">
					<h3 class="my-4 text-center">비밀번호 찾기</h3>
				</div>

				<!-- 성공 메시지 출력 -->
				<c:if test="${not empty successMessage}">
					<div class="alert alert-success" role="alert">
						${successMessage}
					</div>
				</c:if>
			
				<!-- 에러 메시지 출력 -->
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger" role="alert">
						${errorMessage}
					</div>
				</c:if>

                <div class="card mb-4">
                	<div class="card-header">
						<form id="frm" action="./findPW" method="post">
							<div class="mb-3">
								<label for="id" class="form-label">아이디</label>
								<input type="text" id="id" name="id" required class="form-control" placeholder="아이디를 입력해주세요.">
								<div id="idResult"></div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label>
								<div class="input-group">
									<input type="text" id="email" name="email" required class="form-control" placeholder="이메일을 입력해주세요.">
								</div>
								<div id="emailResult"></div>
								<div class="input-group mt-3">
									<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
									<button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호 발송</button>
									<button type="button" class="btn btn-secondary d-none" id="mail-Confirm-Btn">인증번호 확인</button>
								</div>
								<span id="mail-check-warn"></span>
							</div>
							<div class="text-center">
								<button type="button" id="btn" class="btn btn-outline-secondary">임시 비밀번호 발급</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="/resources/js/member/findPW.js"></script>

</body>
</html>