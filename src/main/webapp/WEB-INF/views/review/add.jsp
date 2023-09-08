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
	#btn button:hover{
	background-color: black;
	color:white;
	}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="mx-auto p-2" style="width: 600px;">
<h3>후기작성</h3>
<form method="post" action="/review/add" >
<div class="input-group mb-3">
  <input type="file" class="form-control" id="inputGroupFile02">
  <label class="input-group-text" for="inputGroupFile02">사진업로드</label>
</div>

<input type="hidden" id="productNum"/>
  <br>
  <p class="text-start fs-4">후기작성</p>
 <textarea class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6" name="reviewContents" placeholder="후기를 입력하세요"></textarea>
	<h3>평점</h3>
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



<div>ID
<br><input id="id" name="id" type="text">${com.name}
</div>
<br>
<div>
전화번호
<br><input name="phone" type="text">${com.phone}
</div>
<br>
<br>
<div id="btn">
	<button type="submit" id="submit">후기등록</button>
	<button type="button" onclick="location.href='../review/list'" id="cancel">취소</button>  
</div>
</form>
</div>

<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/file.js" type="text/javascript">
</script>

</body>
</html>

