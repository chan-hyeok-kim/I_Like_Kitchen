<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add</title>

<c:import url="../temp/bootStrap.jsp" ></c:import>
<link rel="icon" href="/resources/img/window.png" type="image/x-icon" sizes="16x16">

 
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
		  <label for="contents" class="form-label">상품내용</label>
		  <textarea type="text" name="contents" class="form-control" id="contents" placeholder="내용을 입력해주세요" >
		  </textarea>
		</div>
		<div class="mb-3">
		  <label for="address" class="form-label">주소</label>
		  <input type="text" name="address" class="form-control" id="address" placeholder="주소를 입력해주세요">
		</div>
		<div class="mb-3">
		  <label for="price" class="form-label">상품가격</label>
		  <input type="text" name="price" class="form-control" id="price" placeholder="','을 빼주세요 / 가격을 입력해주세요">
		</div>
		<div class="mb-3">
		  <label for="tell" class="form-label">연락처</label>
		  <input type="text" name="phone" class="form-control" id="phone" placeholder="'-'를 넣어서 입력해주세요">
		</div>
  
<div class="mb-3">
  <label for="pic" class="form-label">사진첨부 (최대 5개)</label>
  <div id="fileUploadContainer">
    <!-- 동적으로 추가될 파일 업로드 필드와 삭제 버튼이 들어갈 곳입니다. -->
  <br>
  </div>
  <br>
  <button class="btn btn-primary" type="button" id="addFileField">파일 추가</button>
</div>

		

		<div class="my-3">
			<button type="submit" id="submitButton" class="btn btn-success">상품등록</button>
		</div>

	</form>
	<script src="/resources/js/product/summernote.js"></script>
	<script>
	
	 document.getElementById('submitButton').addEventListener('click', function(event) {
		  // 필수 정보를 확인합니다.
		  var productName = document.getElementById('productName').value;
		  var contents = document.getElementById('contents').value;
		  var address = document.getElementById('address').value;
		  var price = document.getElementById('price').value;
		  var phone = document.getElementById('phone').value;

		  // 필수 정보 중 하나라도 누락된 경우 알림을 표시하고 폼 제출을 막습니다.
		  if (!productName || !contents || !address || !price || !phone) {
		    alert('모든 필수 정보를 입력하세요.');
		    event.preventDefault(); // 폼 제출을 막음
		  }
		});

	  document.addEventListener("DOMContentLoaded", function () {
	        const fileUploadContainer = document.getElementById("fileUploadContainer");
	        const addFileFieldButton = document.getElementById("addFileField");
	        const maxFileFields = 5;
	        let fileFieldCount = 0;

	        // 파일 필드를 동적으로 추가하는 함수
	        function addFileField() {
	          if (fileFieldCount < maxFileFields) {
	            const fileField = document.createElement("input");
	            fileField.type = "file";
	            fileField.name = "pic[]"; // 필요한 이름을 지정하세요.
	            fileField.className = "form-control mb-2";

	            const deleteButton = document.createElement("button");
	            deleteButton.innerHTML = "삭제";
	            deleteButton.className = "btn btn-danger mb-2";
	            deleteButton.addEventListener("click", function () {
	              // 파일 필드 삭제 버튼을 눌렀을 때 해당 필드를 제거합니다.
	              fileUploadContainer.removeChild(fileField);
	              fileUploadContainer.removeChild(deleteButton);
	              fileFieldCount--;
	            });

	            fileUploadContainer.appendChild(fileField);
	            fileUploadContainer.appendChild(deleteButton);
	            fileFieldCount++;
	          } else {
	            // 최대 파일 개수에 도달한 경우 알림을 표시합니다.
	            alert("더 이상 파일을 추가할 수 없습니다 (최대 5개).");
	          }
	        }

	        // "파일 추가" 버튼 클릭 시 파일 필드를 추가합니다.
	        addFileFieldButton.addEventListener("click", addFileField);
	      });

	
</script>

		</section>




</body>
<footer>

<c:import url="../temp/footer.jsp"></c:import>
</footer>
</html>