<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<form method="post" action="update">
<div class="mx-auto p-2" style="width: 600px;">
<h3>후기수정</h3>
<input type="text" name="reviewNum" value="${view.productNum}" readonly >
<div class="input-group mb-3">
  <input type="file" class="form-control" id="inputGroupFile02">
  <label class="input-group-text" for="inputGroupFile02">사진업로드</label>


<div>${com.productName}</div>
<a href="">${com.productName}</a>
 </div>
  <br>
  <p class="text-start fs-4">후기작성</p>
 <textarea class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6" name="reviewContents">후기를 입력하세요</textarea>

<input type="hidden" value="productNum">
<div>이름
<br><input type="text" name="id" value="${view.id}">
</div>
<br>
<div>
전화번호
<br><input type="text" value="">
</div>
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
<br>
<br>
<button type="submit" class="btn btn-warning">후기수정</button>
<button type="button" class="btn btn-light">취소</button>  
</div>

</form>
<c:import url="../temp/Footer.jsp"></c:import>
</body>
</html>
