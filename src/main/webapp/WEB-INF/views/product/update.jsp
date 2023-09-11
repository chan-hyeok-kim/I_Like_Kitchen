<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
</head>
   <c:import url="../temp/bootStrap.jsp"></c:import>
<body>
   <c:import url="../temp/header.jsp"></c:import>
    
   <section class="container mt-5">
		<h3 class="my-4 text-center">상품 수정 페이지</h3>

		<form action="./update" method="post" id="productForm" enctype="multipart/form-data">

			<input type="hidden" name="productNum" value="${kto.productNum}">

			<div class="mb-3">
				<label for="productName" class="form-label">상품명</label>
				<input type="text" name="productName" class="form-control" id="productName" value="${kto.productName}" placeholder="상품명">
			</div>
			<div class="mb-3">
				<label for="contents" class="form-label">상품내용</label>
				<textarea type="text" name="contents" class="form-control" id="contents" placeholder="내용을 입력해주세요" >
				${kto.contents}
			</textarea>
			</div>
			<div class="mb-3">
				<label for="address" class="form-label">주소</label>
				<input type="text" name="address" class="form-control" id="address" value="${kto.address}" placeholder="주소를 입력해주세요">
			</div>
			<div class="mb-3">
				<label for="price" class="form-label">상품가격</label>
				<input type="text" name="price" class="form-control" id="price" value="${kto.price}" placeholder="','을 빼주세요 / 가격을 입력해주세요">
			</div>
			<div class="mb-3">
				<label for="tell" class="form-label">연락처</label>
				<input type="text" name="phone" class="form-control" id="phone" value="${kto.phone}" placeholder="'-'를 넣어서 입력해주세요">
			</div>
	
			<!-- <div class="mb-3">
				<label for="pic" class="form-label">사진첨부 (최대 5개)</label>
				<div id="fileUploadContainer">
					 동적으로 추가될 파일 업로드 필드와 삭제 버튼이 들어갈 곳입니다.
				<br>
				</div>
				<br>
				<button class="btn btn-primary" type="button" id="addFileField">파일 추가</button>
			</div> -->

			<div class="mb-3">
				<button type="button" class="btn btn-primary" id="fileAdd">File추가</button>
			</div>

			<div id="fileList" class="mb-3">
		 	
			</div>

			<div>
				<c:forEach items="${kto.productFileDTOs}" var="b">
					<div class="alert alert-warning" role="alert">
						${b.originalName}
					</div>
					<button class="deletes btn btn-danger" data-delete-num="${b.fileNum}">삭제</button>
					</div>
				</c:forEach>
			</div>
					

			<div class="mb-3 text-center">
				<button class="btn btn-outline-secondary fw-bold" id="productBtn" type="submit">수정</button> 
			</div>	
   		</form> 
    </section>
</body>
<script src="/resources/js/product/summernote.js"></script>
<script src="/resources/js/product/file.js"></script>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>