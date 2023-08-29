<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<section class="container mt-5">
		<h1 class="my-4">Login Page</h1>
		
		<form action="./login" method="post">
			<div class="mb-3">
  				<label for="id" class="form-label">ID</label>
  				<input type="text" name="id" class="form-control" id="id" value="id677" placeholder="ID를 입력하세요.">
			</div>
			<div class="mb-3">
  				<label for="password" class="form-label">PASSWORD</label>
  				<input type="password" name="password" class="form-control" id="password" value="123" placeholder="PW를 입력하세요.">
			</div>
			
			<div class="mb-3">
				<button class="btn btn-primary">로그인</button>
			</div>
			<div class="mb-3">
				<a href="/member/findId">아이디찾기</a>
			</div>
			<div class="mb-3">
				<a href="/member/join">회원가입</a>
			</div>
		</form>
		
		<div class="text-center">
		   <a href="${naverUrl}"><img width="300" alt="Naver Login" src="/resources/img/naverLogin.png"></a> 
		</div>
		
	</section>
</html>