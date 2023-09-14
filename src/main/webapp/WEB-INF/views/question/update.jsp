<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
 
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
<h3>문의수정하기</h3>
<form method="post" action="update">

<input type="hidden" name="questionNum" value="${kto.questionNum}"></input>

<div>문의유형
<select class="form-select w-75" aria-label="Default select example" name="questionKind" value="${kto.questionKind}">
  <option value="가격문의">가격문의</option>
  <option value="공간정보문의">공간정보문의</option>
  <option value="물품이용문의">물품이용문의</option>
  <option value="기타">기타</option>
</select>
 </div>
  <br>
  <p class="text-start fs-4">문의사항</p>
 <textarea name="questionContents" class="text-start shadow-sm p-3 w-100 mb-5 bg-body-tertiary rounded fs-6">${kto.questionContents}</textarea>



<br>
<br>
<div id="btn">
<button type="submit"  id="submit">문의수정</button>
<button type="button" onclick="location.href='/product/detail?productNum=${kto.productNum}'" id="cancel">취소</button>  
</div>
</form>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>