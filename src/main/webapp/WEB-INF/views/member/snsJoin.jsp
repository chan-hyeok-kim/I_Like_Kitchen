<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>추가</title>
<link href="/resources/css/member/memberJoin.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">
					<h2 class="header-news text-center"></h2>
					<h3 class="my-4 text-center">Login</h3>
				</div>

                <div class="card mb-4">
                	<div class="card-header">
						<form action="./snsJoin" id="frm" method="post">
							<div class="mb-3">
                                <label for="password" class="form-label fw-bold">비밀번호</label>
                                <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호 입력" minlength="6" maxlength="12" required>
                                <div id="passwordResult"></div>
                            </div>
                              
                            <div class="mb-3">
                                <label for="pwCheck" class="form-label fw-bold">비밀번호 확인</label>
                                <input type="password" name="pwCheck" class="form-control" id="pwCheck" placeholder="비밀번호 확인" minlength="6" maxlength="12" required>
                                <div id="pwCheckResult"></div>
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label fw-bold">전화번호</label>
                                <input type="text" name="phone" class="form-control" id="phone" placeholder="전화번호 입력" maxlength="11" required>
                                <div id="phoneResult"></div>
                            </div>

                            <div class="mb-3 text-center">
                                <button class="btn btn-outline-secondary fw-bold" id="btn" type="button">추가</button> 
                            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

    <script src="/resources/js/member/snsJoin.js"></script>

</body>
</html>