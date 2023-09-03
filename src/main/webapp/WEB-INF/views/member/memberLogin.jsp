<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>로그인</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<section class="container mt-5">
		<h1 class="my-4">Login Page</h1>
		
		<c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

		<form action="./memberLogin" method="post">
			<div class="mb-3">
  				<label for="id" class="form-label">ID</label>
  				<input type="text" name="id" class="form-control" id="id" value="id1" placeholder="ID를 입력하세요.">
			</div>
			<div class="mb-3">
  				<label for="password" class="form-label">PASSWORD</label>
  				<input type="password" name="password" class="form-control" id="password" value="123123" placeholder="PW를 입력하세요.">
			</div>

			<div class="mb-3">
				<button class="btn btn-primary">로그인</button>
			</div>
			<div class="mb-3">
				<a href="/member/find/findID">아이디찾기</a>
				<a href="/member/find/findPW">비밀번호찾기</a> 
				<a href="/member/memberAgree">회원가입</a>

			</div>
		<!-- 	<div>
				<button type ="button" class = "btn" onclick="location.href='kakao_login'"><img src='/resources/icon/kakao.png'></button>
			</div>	 -->	
		</form>
		
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=ad31c6a5aaaa8e58d6a71df13e7a8cbd&redirect_uri=http://localhost:82/member/callbackKakao&response_type=code">  
		<img src = "/resources/icon/kakao.png">
	</a>
		
<div class="text-center">
		   <a href="${naverUrl}"><img width="300" alt="Naver Login" src="/resources/img/naverLogin.png"></a> 
		</div>
	

	</section>
</html>