<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	<table>
	 <thead>
	  <tr>
	   <th>후기번호</th>
	   <th>작성자</th>
	   <th>평점</th>
	   <th>후기내용</th>
	   <th>후기날짜</th>
	  </tr>
	 </thead>
	 
	 <tbody>
			  	<c:forEach items="${list}" var="list">
		 <tr>
		  <td>${list.reviewNum}</td>
		  <td>
    		<a href="/review/view?reviewNum=${list.reviewNum}">${list.id}</a>
			</td>
		 
		  <td>${list.reviewRate}</td>
		  <td>${list.reviewContents}</td>
		  <td>${list.reviewDate}</td>
		 </tr>
		</c:forEach>
	 </tbody>
	
	</table>
</body>
</html>