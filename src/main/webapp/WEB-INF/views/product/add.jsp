<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add</title>
<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">
	<c:import url="../temp/bootStrap.jsp" ></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

		<section class="container mt-5">
			<h1 class="my-4">Add Page</h1>
		
			<form action="./add" method="post" enctype="multipart/form-data">
		<div class="mb-3">
		  <label for="productName" class="form-label">상품명</label>
		  <input type="text" name="productName" class="form-control" id="productName" placeholder="상품명">
		</div>
		<div class="mb-3">
		  <label for="Contents" class="form-label">상품내용</label>
		  <textarea class="form-control" name="Contents" id="Contents" rows="3"></textarea>
		</div>	
		<div class="mb-3">
		  <label for="address" class="form-label">주소</label>
		  <input type="text" name="address" class="form-control" id="address" placeholder="주소를 입력해주세요">
		</div>
		<div class="mb-3">
		  <label for="price" class="form-label">상품가격</label>
		  <input type="text" name="price" class="form-control" id="price" placeholder="가격을 입력해주세요">
		</div>
		<div class="mb-3">
		  <label for="tell" class="form-label">연락처</label>
		  <input type="text" name="tell" class="form-control" id="tell" placeholder="'-'를 넣어서 입력해주세요">
		</div>

		
		<div class="mb-3">
		  <label for="pic" class="form-label">사진첨부</label>
		  <input type="file" name="files" class="form-control" id="pic" placeholder="PW를 입력하세요">
		</div>
		<div class="mb-3">
		  <label for="pic" class="form-label">사진첨부</label>
		  <input type="file" name="files" class="form-control" id="pic" placeholder="PW를 입력하세요">
		</div>
		<div class="mb-3">
		  <label for="pic" class="form-label">사진첨부</label>
		  <input type="file" name="files" class="form-control" id="pic" placeholder="PW를 입력하세요">
		</div>				

		<div class="my-3">
			<button type="submit" class="btn btn-success">상품등록</button>
		</div>

	</form>
		</section>

</body>
<footer>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>