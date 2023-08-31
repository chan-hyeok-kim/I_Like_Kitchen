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
<form method="post" action="/question/add">
<div class="mx-auto p-2" style="width: 600px;">
<h3>문의하기</h3>



<div>${com.productName}</div>
<a href="">${com.productName}</a>
<div>문의유형
<select class="form-select w-75" name="questionKind" aria-label="Default select example">
  <option disabled>문의유형을 선택하세요</option>
  <option value="일정문의">일정문의</option>
  <option value="가격문의">가격문의</option>
  <option value="공간정보문의">공간정보문의</option>
  <option value="물품이용문의">물품이용문의</option>
  <option value="기타">기타</option>
</select>
 </div>

  <br>
  <p class="text-start fs-4">문의사항</p>
 <textarea name="questionContents" class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6">문의사항을입력하세요</textarea>
	<input type="hidden" value="productNum"></input>

<div>이름
	<br>
		<input name="id" type="text" value="dnjy1945" name="id">${member.id}
	</div>
<br>
<div>
전화번호
	<br>
		<input name="phone" type="text">${member.phone}
	</div>

<br>
	<button type="submit" class="btn" style="background-color:rgb(251,255,182)">문의등록</button>
	<a class="btn" style="background-color:rgb(251,255,182)" href="../">취소</a>  
</div>
</form>
<c:import url="../temp/Footer.jsp"></c:import>
</body>
</html>

