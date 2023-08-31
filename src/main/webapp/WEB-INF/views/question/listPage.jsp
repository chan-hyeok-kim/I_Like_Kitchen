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
	   <th>제목</th>
	   <th>작성일</th>
	   <th>작성자</th>
	   <th>조회수</th>
	  </tr>
	 </thead>
	 
	 <tbody>
			  	<c:forEach items="${list}" var="list">
		 <tr>
		  <td>${list.questionNum}</td>
		  <td>
    		<a href="/question/view?bno=${list.questionNum}">${list.id}</a>
			</td>
		  <td>${list.productNum}</td>
		  <td>${list.id}</td>
		  <td>${list.questionContents}</td>
		  <td>${list.questionDate}</td>
		  <td>${list.questionKind}</td>
		 </tr>
		</c:forEach>
	 </tbody>
	
	</table>
	<div>
 <c:if test="${page.prev}">
 <span>[ <a href="/question/listPage?num=${page.startPageNum - 1}">이전</a> ] 
</c:if>

  <span>
  <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <span>
 
  <c:if test="${select != num}">
   <a href="/question/listPage?num=${num}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
  
</span>
  
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/question/listPage?num=${page.endPageNum + 1}">다음</a> ] 
</c:if>
 
 </div>
</body>
</html>