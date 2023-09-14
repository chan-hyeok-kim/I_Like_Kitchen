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
	#questionContents{
	width:1600px;
	height:160px;
	}
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
<form method="post" action="/question/add" class="border-top">
<input type="hidden" name="productNum" value="${kto.productNum}">

<div class="mx-auto p-2" style="width: 600px;">
<h3>문의하기</h3>



<div>${com.productName}</div>
<a href="">${com.productName}</a>
<div>문의유형
<select class="form-select w-75" name="questionKind" aria-label="Default select example">
  <option disabled>문의유형을 선택하세요</option>
  <option value="가격문의">가격문의</option>
  <option value="공간문의">공간정보문의</option>
  <option value="기타">기타</option>
</select>
 </div>

  <br>
  <p class="text-start fs-4">문의사항</p>
 <textarea id="questionContents" name="questionContents" class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6" placeholder="문의사항을입력하세요"></textarea>
	<input type="hidden" value="${kto.productNum}" name="productNum"></input>



<br>
<div id="btn">
	<button type="submit" id="submit">문의등록</button>
	<button type="button" onclick="location.href='/product/detail?productNum=${kto.productNum}'" id="cancel">취소</button>  
</div>
</div>
</form>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>

