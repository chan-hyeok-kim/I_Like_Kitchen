<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>
<style>
	#submit{
	background-color:rgb(251,255,182);
	border-radius: 20px;
	width:100px;
	height:40px;
	}
	#cancel{
	background-color:rgb(251,255,182);
	border-radius: 20px;
	border:2px solid black;
	width:100px;
	height:40px;
	color:black;
	margin-left:10px;
	}
	
	#review-update-section{
	     padding-left: 600px;
	     padding-right: 600px;
	     
	}
	#review-update-wrap{
	     border: 1px solid gainsboro;
	     border-radius: 8px;
	     padding-left: 60px;
	     padding-right: 60px;
	}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section id="review-update-section">
<form method="post" action="update" enctype="multipart/form-data">
<div class="mx-auto p-2" >
<h3>후기수정</h3>
<input type="hidden" name="productNum" value="${kto.productNum}" >

<div id="review-update-wrap">
<div class="input-group mb-3">


	<input type="hidden" name="reviewNum" value="${kto.reviewNum}">

 </div>
  <br>
  <p class="text-start fs-4">후기작성</p>
 <textarea class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6" name="reviewContents">${kto.reviewContents}</textarea>


평점
<div class="form-check">
  <input class="form-check-input" type="radio" name="reviewRate" id="exampleRadios1" value="1" checked>
  <label class="form-check-label" for="exampleRadios1">
    1
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="reviewRate" id="exampleRadios2" value="2">
  <label class="form-check-label" for="exampleRadios2">
    2
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="reviewRate" id="exampleRadios2" value="3">
  <label class="form-check-label" for="exampleRadios2">
   3
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="reviewRate" id="exampleRadios2" value="4">
  <label class="form-check-label" for="exampleRadios2">
    4
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="reviewRate" id="exampleRadios2" value="5">
  <label class="form-check-label" for="exampleRadios2">
    5
  </label>
</div>


<div class="mb-3">
				<button type="button" class="btn btn-primary" id="fileAdd">File추가</button>
			</div>

			<div id="fileList" class="mb-3">
                 
				<c:forEach items="${kto.ktos}" var="b">
				<div>
					<div class="alert alert-warning" style="width:100%;">
						${b.originalName}
					</div>
					<button class="delets btn btn-danger" data-delete-num="${b.fileNum}">삭제</button>
					</div>
				</c:forEach>
				
				
				
</div>


<div id="btn">
<button type="submit"  id="submit">후기수정</button>
<button type="button" onclick="location.href='/product/detail?productNum=${kto.productNum}'" id="cancel">취소</button>  
</div>
</div>
</form>
</section>
<script src="/resources/js/file2.js"></script>
</body>
<footer>
<c:import url="../temp/footer.jsp"></c:import>
</footer> 
</html>
