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
		<h1 class="my-4">Partner Login Page</h1>
		
		<c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

		<form action="./partnerLogin" method="post">
			<div class="mb-3">
  				<label for="id" class="form-label">ID</label>
  				<input type="text" name="id" class="form-control" id="id" value="id7" placeholder="ID를 입력하세요.">
			</div>
			<div class="mb-3">
  				<label for="password" class="form-label">PASSWORD</label>
  				<input type="password" name="password" class="form-control" id="password" value="123123" placeholder="PW를 입력하세요.">
			</div>

			<div class="mb-3">
				<button class="btn btn-primary">로그인</button>
			</div>			
		</form>

	</section>
</html>