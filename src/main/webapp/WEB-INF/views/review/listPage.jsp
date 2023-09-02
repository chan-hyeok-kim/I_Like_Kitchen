<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	 <thead>
	  <tr>
	   <th>번호</th>
	   <th>작성자</th>
	   <th>후기평점</th>
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
		  <td>${list.reviewNum}</td>
		  <td>${list.id}</td>
		  <td>${list.reviewRate}</td>
		  <td>${list.reviewContents}</td>
		  <td>${list.reviewDate}</td>
		 </tr>
		</c:forEach>
	 </tbody>
	
	</table>
<c:if test="${prev}">
 <span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a> ] 
</c:if>

<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
  <span>
   <a href="/board/listPage?num=${num}">${num}</a> 
  
</c:forEach>

<c:if test="${next}">
 <span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a> ] 
</c:if>
 
 </div>
</body>
</html>