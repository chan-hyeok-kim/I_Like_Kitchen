<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
 
<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="mx-auto p-2" style="width: 600px;">
<h3>문의수정하기</h3>
<form method="post" action="update">

<input type="text" name="questionNum" value="${view.questionNum}" readonly></input>

<div>문의유형
<select class="form-select w-75" aria-label="Default select example" name="questionKind" value="${view.questionKind}">
  <option value="일정문의">일정문의</option>
  <option value="가격문의">가격문의</option>
  <option value="공간정보문의">공간정보문의</option>
  <option value="물품이용문의">물품이용문의</option>
  <option value="기타">기타</option>
</select>
 </div>
  <br>
  <p class="text-start fs-4">문의사항</p>
 <textarea name="questionContents" class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6">${view.questionContents}</textarea>


<div>ID
<br><input id="id" type="text" value="${view.id}" name="id"></input>
</div>
<br>
<div>
전화번호
<br><input type="text" value=""></input>
</div>
<br>
<br>
<button type="submit" class="btn btn-warning">문의수정</button>
<a class="btn" style="background-color:rgb(251,255,182)" href="../question/view?questionNum=${view.questionNum}">취소</a>  
</form>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>