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
	
	<table class="border mx-auto p-2" style="width: 1600px;">
	 <thead>
	  <tr class="grid gap-3 border bg-warning p-2 text-dark bg-opacity-10">
	   <th class="p-2 g-col-6 border">질문번호</th>
	   <th class="p-2 g-col-6 border">상품번호</th>
	   <th class="p-2 g-col-6 border">작성자</th>
	   <th class="p-2 g-col-6 border" style="width:1000px">작성내용</th>
	   <th class="p-2 g-col-6 border">질문날짜</th>
	   <th class="p-2 g-col-6 border">질문종류</th>
	  </tr>
	 </thead>
	 
	 <tbody>
			  	<c:forEach items="${list}" var="list">
	 
		 <tr class="grid gap-3">
		  <td class="p-2 g-col-6 border">${list.questionNum}</td>
		  <td class="p-2 g-col-6 border">${list.productNum}</td>
		  <td class="p-2 g-col-6 border">
    		<a href="/question/view?questionNum=${list.questionNum}">${list.id}</a>
			</td>
		  <td class="p-2 g-col-6 overflow-auto border">${list.questionContents}</td>
		  <td class="p-2 g-col-6 border">${list.questionDate}</td>
		   <td class="p-2 g-col-6 border">${list.questionKind}</td>
		 </tr>
			

		</c:forEach>
	 </tbody>
	
	</table>
			
			<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>