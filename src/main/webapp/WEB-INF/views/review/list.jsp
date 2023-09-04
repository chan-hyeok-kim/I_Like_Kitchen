<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	
	 
	<div>
		<a href="/review/add" class="btn btn-warning">리뷰등록</a>
	</div>
	 <tbody>
			  	<c:forEach items="${list}" var="list">
		 <tr class="grid gap-3">
		  <td type="hidden" ${list.reviewNum}></td>
		  <h4>${list.reviewRate}</h4>	  <td class="p-2 g-col-6 ">
    		<a href="/review/view?reviewNum=${list.reviewNum}">${list.id}</a>
			</td>|
		  <td class="p-2 g-col-6 border">${list.reviewDate}</td>
		 <br>
		  <td class="p-2 g-col-6 border" style="width:1000px">${list.reviewContents}</td>
		 </tr>
		</c:forEach>
		
	 </tbody>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>