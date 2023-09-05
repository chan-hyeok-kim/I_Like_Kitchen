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
		 <div>
	        <c:forEach items="${kto.ktos}" var="f">
		        <img src="/resources/upload/notice/${f.fileName}">
	        </c:forEach>
        </div>
		</c:forEach>
	 </tbody>
	
	
<div>
<c:if test="${page.prev}">
 <span>[ <a href="/reivew/listPage?num=${page.startPageNum - 1}">이전</a> ] 
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  <span>
   <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <span>
 
  <c:if test="${select != num}">
   <a href="/review/listPage?num=${num}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
  
</c:forEach>
</c:forEach>

<c:if test="${next}">
 <span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a> ] 
</c:if>
<%--  <c:forEach begin="1" end="${pageNum}" var="num">
    <span>
     <a href="/board/listPage?num=${num}">${num}</a>
   </span>
 </c:forEach> --%>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>