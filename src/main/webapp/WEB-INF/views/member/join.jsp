<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<style>
	.f {
		color: red;
	}
	
	.s {
		color: blue;
	}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<section class="container mt-5">
		<h1 class="my-4">회원가입</h1>
		
		<form action="./join" method="post" id="frm">
			<div class="mb-3">
  				<label for="id" class="form-label">ID</label>
  				<input type="text" name="id" class="form-control" id="id" style="width:300px;" placeholder="ID를 입력하세요.">
				<div id="idResult"></div>
			</div>
			<div class="mb-3">
  				<label for="password" class="form-label">PASSWORD</label>
  				<input type="password" name="password" class="form-control" id="password" style="width:300px;" placeholder="비밀번호를 입력하세요.">
				<div id="passwordResult"></div>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">PASSWORD확인</label>
				<input type="password" name="password2" class="form-control" id="password2" style="width:300px;" placeholder="다시 한번 비밀번호를 입력하세요.">
				<div id="password2Result"></div>
		  	</div>
			<div class="mb-3">
  				<label for="name" class="form-label">NAME</label>
  				<input type="text" name="name" class="form-control" id="name" style="width:300px;" placeholder="이름을 입력하세요.">
				<div id="nameResult"></div>
			</div>
			<div class="mb-3">
  				<label for="email" class="form-label">EMAIL</label>
  				<input type="email" name="email" class="form-control" id="email" style="width:300px;" placeholder="EMAIL를 입력하세요.(example@email.com)">
				<div id="emailResult"></div>
			</div>
			<!-- <div class="mb-3">
				<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
			</div>
			<div class="mail-check-box">
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<div>
				<span id="mail-check-warn"></span>
			</div> -->
			<div class="mb-3">
  				<label for="phone" class="form-label">PHONE</label>
  				<input type="phone" name="phone" class="form-control" id="phone" style="width:300px;" placeholder="전화번호를 입력하세요.">
				<div id="phoneResult"></div>
			</div>
			
			<div class="mb-3">
				<button type="submit" id="btn" class="btn btn-primary">회원가입</button>
			</div>
		</form>
		
	</section>
	
	<script src="/resources/js/member/join.js"></script>
</body>
</html>