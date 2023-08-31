<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	
	<table>
	 <thead>
	  <table>
	  <tr>
	   <th>질문번호</th>
	   <th>상품번호</th>
	   <th>작성자</th>
	   <th>작성내용</th>
	   <th>질문날짜</th>
	   <th>질문종류</th>
	  </tr>
	  </table>
	 </thead>
	 
	 <tbody>
			  	<c:forEach items="${list}" var="list">
	 <table>
	 
		 <tr>
		  <td>${list.questionNum}</td>
		  <td>
    		<a href="/question/view?questionNum=${list.questionNum}">${list.id}</a>
			</td>
		  <td>${list.productNum}</td>
		  <td>${list.id}</td>
		  <td>${list.questionContents}</td>
		  <td>${list.questionDate}</td>
		   <td>${list.questionKind}</td>
		 </tr>
			
	</table>
		</c:forEach>
	 </tbody>
	
	</table>
			
</body>
</html>