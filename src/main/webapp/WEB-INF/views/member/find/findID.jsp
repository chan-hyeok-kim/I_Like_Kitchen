<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../../temp/bootStrap.jsp"></c:import>
<title>아이디 찾기</title>
<link href="/resources/css/member/findID.css" rel="stylesheet">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">
					<h3 class="my-4 text-center">아이디 찾기</h3>
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
						<form id="frm" action="./findID" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">이름</label>
								<input type="text" class="form-control" id="name" name="name">
								<div id="nameResult"></div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label>
								<div class="input-group">
									<input type="text" class="form-control" name="email" id="email" placeholder="이메일 입력">
								</div>
								<div id="emailResult"></div>
							</div>
							<div class="text-center">
								<button type="button" id="btn" class="btn btn-outline-secondary">아이디 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- <button id="identify" class="btn btn-info">휴대폰 본인인증하기</button>
		<script src="/resources/js/member/identify.js"></script> -->
	<script src="/resources/js/member/findID.js"></script>

</body>
</html>