<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>로그인</title>
<link href="/resources/css/member/memberLogin.css" rel="stylesheet">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="row">
        <div class="col-md-8 mx-auto checkboxGroup">
            <div class="terms-container">
                <div class="terms-title">
					<h2 class="header-news text-center">Welcome I Like Kitchen</h2>
					<h3 class="my-4 text-center">Partner Login Page</h3>
				</div>

				<c:if test="${not empty errorMessage}">
            		<div class="alert alert-danger" role="alert">
               			${errorMessage}
            		</div>
       	 		</c:if>

                <div class="card mb-4">
                	<div class="card-header">
						<form action="./partnerLogin" method="post">
							<div class="mb-3">
								  <label for="id" class="form-label"></label>
								  <input type="text" name="id" class="form-control" id="id" value="" placeholder="ID를 입력해주세요.">
							</div>
							<div class="mb-3">
								  <label for="password" class="form-label"></label>
								  <input type="password" name="password" class="form-control" id="password" value="" placeholder="PW를 입력해주세요.">
							</div>
							<div class="mb-3 text-center">
								<button class="btn btn-outline-success fw-bold">로그인</button>
								<button class="btn btn-outline-success fw-bold" onclick="localtion.herf ='partnerRegister'">사업자등록</button>
							</div>	
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/partner/partnerRegister.js"></script>
</body>
</html>